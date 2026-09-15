"""Validate recipient evidence and generate local runtime tables (no network)."""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def account_id(value):
    match = re.fullmatch(r'STEAM_[01]:([01]):(\d+)', value)
    if not match:
        raise ValueError('Expected Steam2 ID STEAM_0:Y:Z or STEAM_1:Y:Z')
    y, z = map(int, match.groups())
    result = 2 * z + y
    if not 0 < result < 2**32:
        raise ValueError('Account ID outside Steam individual-account range')
    return result

def validate(data):
    assert data['schema_version'] == 2
    awards = {a['badge']: a for a in data['awards']}
    assert len(awards) == len(data['awards'])
    expected = {(a['badge'], n) for a in data['awards'] for n in a['roster']}
    seen, entitlements = set(), {}
    for row in data['assignments']:
        key = row['badge'], row['nickname']
        assert key in expected and key not in seen, ('Unexpected or repeated roster entry', key)
        seen.add(key)
        assert row['source_url'] and row['checked_on']
        assert row['status'] in ('verified', 'needs_confirmation')
        if row['status'] != 'verified':
            assert 'account' not in row, ('Unverified assignment has a grant account', key)
            continue
        account = row['account']
        ns2 = account_id(account['steam_id'])
        assert ns2 == account['ns2_id']
        assert account['steam_id3'] == f'[U:1:{ns2}]'
        assert account['steam_id64'] == str(76561197960265728 + ns2)
        assert account['ensl_profile_url'].startswith('https://www.ensl.org/users/')
        assert row['verification'] and (row.get('team_source_url') or row.get('confirmation_source'))
        entitlements.setdefault(ns2, [])
        assert row['badge'] not in entitlements[ns2], ('Duplicate account award', key)
        entitlements[ns2].append(row['badge'])
    assert seen == expected, 'Some roster entries lack an explicit decision'
    podiums = {}
    for award in awards.values():
        place, published = award['awarded_place'], award['published_place']
        assert 1 <= place <= 3 and published >= place
        medal = ['gold', 'silver', 'bronze'][place - 1]
        assert award['badge'].endswith('_' + medal)
        competition = award['season'], award['division']
        podiums.setdefault(competition, []).append((published, place))
    for podium in podiums.values():
        assert [p for _, p in sorted(podium)] == list(range(1, len(podium) + 1)), 'Promotion order invalid'
    return awards, entitlements

def generate(data):
    awards, entitlements = validate(data)
    lines = ['-- Generated from data/recipients.json by scripts/generate_assignments.py.',
             '-- Namespaced DDS files are discovered by vanilla before this post-hook.',
             'ENSL_LostSeasonBadges = {', '    Awards = {']
    for badge, award in awards.items():
        division = f" Division {award['division']}" if award['division'] else ''
        place = ['Winner', 'Runner-Up', 'Second Runner-Up'][award['awarded_place'] - 1]
        name = f"The ENSL Season {award['season']}{division} {place}"
        lines.append(f'        {{ name = "{badge}", formalName = "{name}", columns = {{ 7, 8, 9, 10 }} }},')
    lines += ['    }', '}', '', 'for _, award in ipairs(ENSL_LostSeasonBadges.Awards) do',
              '    local data = Badges_GetBadgeDataByName(award.name)',
              '    assert(data and not data.isOfficial, "ENSL Lost Season Badges: custom texture missing or badge name collision")',
              '    data.name = award.formalName',
              '    data.columns = 960 -- Native ENSL slots 7, 8, 9, 10.',
              '    data.unitStatusTexture = "ui/badges/" .. award.name .. ".dds"',
              '    data.scoreboardTexture = data.unitStatusTexture', 'end', '']
    lua = ROOT / 'source/lua/ENSLLostSeasonBadges'
    (lua / 'Shared.lua').write_text('\n'.join(lines), encoding='utf-8')
    lines = ['-- Generated from data/recipients.json; only verified awards are included.',
             'ENSL_LostSeasonBadges.Recipients = {']
    for ns2, badges in sorted(entitlements.items()):
        lines.append(f'    [{ns2}] = {{ ' + ', '.join(json.dumps(b) for b in sorted(badges)) + ' },')
    lines += ['}', '']
    (lua / 'Recipients_Server.lua').write_text('\n'.join(lines), encoding='utf-8')
    return len(entitlements), sum(map(len, entitlements.values()))

if __name__ == '__main__':
    data = json.loads((ROOT / 'data/recipients.json').read_text(encoding='utf-8'))
    users, awards = generate(data)
    print(f'Generated {awards} verified awards for {users} accounts; uncertain cases excluded.')

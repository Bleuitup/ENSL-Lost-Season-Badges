# ENSL Lost Season Badges — implementation plan

Prepared 2026-09-15. Status: plan accepted; account research is the next milestone.

## Objective and scope

Create a standalone NS2 Workshop mod restoring Season 13 and Season 14 awards. Match existing ENSL artwork, tooltips, selection behavior, and in-game display as closely as the custom badge system permits. Assign eligibility to verified Steam accounts using NS2 account IDs.

Scope: NS2 Season 13 (2018), including all three divisions, and Season 14 (2018–2019). The older NS1 seasons and other tournaments are outside this project.

## 1. Establish the award list

Apply the user's confirmed policy: use current standings, skip disqualified teams, and promote the next eligible teams. If no next team is available, omit that medal. Evaluate disqualification for the particular competition, not automatically across every season a team played.

Accepted awards derived from the [Hall of Fame](https://www.ensl.org/halloffame) and this promotion policy:

| Competition | Gold | Silver | Bronze |
| --- | --- | --- | --- |
| Season 13, Division 1 | DEFORMED | ELOGain | Omitted — historical records unavailable |
| Season 13, Division 2 | FaLLeN SouLs | patriarchy | Saunabois |
| Season 13, Division 3 | Nismen | For The Lolz | Intergalactic |
| Season 14 | Thots | Pubstars | Nismen |

Use Season 14's ladder order to fill the promoted podium. Its two-team playoff lists the same original top two, so it does not create a second set of awards.

Season 13 Division 1 bronze is omitted. The user reported site data loss and accepted proceeding without reconstructing this placement. Do not infer a recipient from registration order or an unrelated group-stage ranking. Revisit only if reliable historical evidence becomes available; recovery is not a prerequisite for the mod.

Record original and promoted ranks, source links, and promotion reasons. These are the mod's awards under the user's rule, not a claim that ENSL officially reassigned medals.

**Deliverable:** a sourced awards manifest with unresolved and omitted awards recorded.

## 2. Match recipients to accounts

Start from each awarded team's season-specific Hall of Fame roster. Follow ENSL player/team pages, past membership, aliases, and match records. Establish a promoted team's historical roster from season records if it is absent from the Hall of Fame.

ENSL team pages expose Steam IDs. The indexed [SUDAMÉRICA SWEATS page](https://www.ensl.org/teams/1226), for example, provides account leads for several target names. A current roster alone does not prove historical membership.

Store each player's season, division, team, original nickname, documented aliases, ENSL profile ID/URL, published Steam ID, SteamID64 as a string, numeric NS2 account ID, evidence links, retrieval date, and verification status.

Use direct ENSL account links first and Steam profiles to corroborate aliases where needed. Similar names alone are insufficient. Keep ENSL website IDs separate from NS2 IDs. For STEAM_0:Y:Z (or the equivalent STEAM_1:Y:Z), calculate NS2 account ID = 2 * Z + Y, where Y is the middle 0/1 field. Validate conversion and round trips without losing SteamID64 precision.

Deduplicate accounts while retaining all earned awards. Do not silently add current teammates, alternate accounts, or undocumented substitutes. Present ambiguous matches together with their evidence. Generate runtime assignments only from verified identities.

**Deliverable:** a reviewable recipient table and verified assignment manifest.

## 3. Prove native badge integration

The installed game source was inspected at `D:/SteamLibrary/steamapps/common/Natural Selection 2/ns2/lua/`:

- `Badges_Shared.lua` defines nine Season 12 awards using the same three `ensl_2018_*` medal textures across divisions.
- Its custom loader discovers and sorts DDS files in `ui/badges/`. Each unrecognized file becomes a badge, initially using column 5 and one texture for both displays.
- `Badges_Server.lua` exposes `GiveBadge(userId, badgeName, column)` and rejects official badges. Our awards need separate namespaced identifiers.
- The native picker supports server-added badges. Official medals normally use columns 7–10; matching this needs an in-game prototype.

Use a standalone mod with narrow loading hooks, metadata changes limited to its own badges, and a bundled eligibility list. Grant availability through the native API. Target columns 7–10 if the prototype confirms compatibility. Preserve existing awards and player choices; check native auto-selection of empty slots.

Use a development-only test account fixture, excluded from release. Keep gameplay independent of live ENSL/Steam requests. Do not modify official entitlement checks.

**Deliverable:** one custom badge working in the native picker, scoreboard, and player display, with a second connected client confirming visibility.

## 4. Match artwork and presentation

Inspect Season 12 and later ENSL medals at their actual display sizes. Prefer referencing suitable shipped artwork. If a visible year/season requires adaptation, prepare faithful variants for review and document sources and reuse conditions.

Use distinct names such as “NSL Season 13 — Division 3 — Gold” and “NSL Season 14 — Bronze.” Match medal colors, transparency, scale, and tooltip behavior. Verify both scoreboard and player-status textures: source declarations alone do not prove every referenced texture exists.

Avoid duplicate entries from multiple DDS size variants. The default loader treats each unrecognized DDS as a separate badge; keep supplementary textures outside its discovery pattern or use narrowly scoped registration.

**Deliverable:** a visual comparison and the complete set of eligible award definitions.

## 5. Validate and prepare release

Check manifests for missing sources, invalid IDs, conflicting matches, duplicate assignments, and promotion errors. Add focused checks for promotion and account-ID conversion logic.

Test in a local server:

- Eligible accounts receive exactly their awards; other accounts cannot select them.
- Multiple awards coexist, including across seasons, alongside official medals.
- Selection, names, scoreboard, and player-status display work at normal UI scales.
- Reconnects, late joins, map changes, and restarts preserve correct behavior.
- Vanilla, Shine badges, NSL/Compmod, and Shimizu Scoreboard combinations work.
- Joining an unmodified server causes no errors; custom grants remain server-scoped.
- Client/server badge ordering agrees, and release packages contain no test grants.

Prepare installation instructions, credits, versioned assignment data, and a correction procedure. Check ranked-server consistency/whitelisting requirements during release preparation; do not claim compatibility before testing. Prepare a GitHub remote and Workshop publication when we reach that stage.

**Deliverable:** a tested Workshop-ready package and release notes.

## Practical limit

This can reproduce the experience on servers running the mod. It cannot issue official Steam inventory items or make unmodified servers grant these awards. Official distribution would require cooperation from the game's maintainers.

## Review sequence

1. Plan and award policy accepted; Season 13 Division 1 bronze omitted.
2. Produce the account-matching table for the 11 awarded team placements.
3. Demonstrate native integration and the visual reference.
4. Complete all awards, validate compatibility, and prepare publication.

The local Git repository contains the accepted plan, an existing-medal reference sheet, and a 512 x 512 Workshop cover with its generation prompt. No runtime code, final in-game badge textures, verified recipient manifest, remote repository, or Workshop item has been created.

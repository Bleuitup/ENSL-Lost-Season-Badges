# Recipient review — v1.0

**2026-09-16:** 121 roster entries; 120 have confirmed account mappings. They produce **119 distinct awards for 105 accounts**, because Void and Reguliym currently share one account and one award. Made_in_Russia is the only unmapped recipient.

## Outstanding issues

- [#1 — Identify Made_in_Russia](https://github.com/Bleuitup/ENSL-Lost-Season-Badges/issues/1): Intergalactic, S13 D3 bronze. No account identified; no grant is made.
- [#2 — Clarify Void / Reguliym](https://github.com/Bleuitup/ENSL-Lost-Season-Badges/issues/2): Bleu confirmed Void as 60207928, already recorded for Reguliym. That account receives S13 D2 gold once. The two names remain separately documented until their identity overlap is resolved.

Bleu confirmed all remaining proposed accounts on 2026-09-16. These two issues are follow-ups and do not block v1.0.

## Verification method

The [Hall of Fame](https://www.ensl.org/halloffame) supplies the season-specific award rosters. Surviving team membership records and ENSL profiles connect roster names to Steam accounts where available. Bleu directly confirmed the remaining proposed accounts, and supplied Void's corrected NS2 ID. Current teammates absent from the Hall of Fame are excluded. Each row retains its evidence in [recipients.json](../data/recipients.json).

Steam2 `STEAM_0:Y:Z` or `STEAM_1:Y:Z` converts to NS2 ID `2*Z+Y`. SteamID3 `[U:1:N]` already contains NS2 ID `N`. SteamID64 is stored as an exact integer string. Duplicate grants are rejected unless an explicit, documented `same_account_award_as` link names a verified entry for the same account and award; that link produces no extra grant.

## Confirmed roster entries

| Award / team | Hall name → ENSL profile | NS2 ID | Evidence |
| --- | --- | --- | --- |
| S13 D1 gold / DEFORMED | Spring → [Spring](https://www.ensl.org/users/6080) | 36622746 | [Team history](https://www.ensl.org/teams/1058) |
| S13 D1 gold / DEFORMED | asdf → [asdfg](https://www.ensl.org/users/6726) | 107716916 | [Team history](https://www.ensl.org/teams/1058) |
| S13 D1 gold / DEFORMED | Zafod → [Zafod](https://www.ensl.org/users/6263) | 55861167 | [Team history](https://www.ensl.org/teams/1058) |
| S13 D1 gold / DEFORMED | whiii → [whiiii](https://www.ensl.org/users/3086) | 667923 | [Team history](https://www.ensl.org/teams/1058) |
| S13 D1 gold / DEFORMED | phonee → [phone](https://www.ensl.org/users/2106) | 32430346 | [Team history](https://www.ensl.org/teams/1058) |
| S13 D1 gold / DEFORMED | lebra → [lebra](https://www.ensl.org/users/4568) | 49465 | [Team history](https://www.ensl.org/teams/1058) |
| S13 D1 gold / DEFORMED | herakles → [herakles](https://www.ensl.org/users/2244) | 803162 | [Team history](https://www.ensl.org/teams/1058) |
| S13 D1 gold / DEFORMED | Tyr → [Tyr](https://www.ensl.org/users/6018) | 3119646 | [Team history](https://www.ensl.org/teams/1058) |
| S13 D1 silver / ELOGain | crowbar → [crowbar](https://www.ensl.org/users/5318) | 22081832 | [Team history](https://www.ensl.org/teams/987) |
| S13 D1 silver / ELOGain | paddy → [paddy](https://www.ensl.org/users/6870) | 24767946 | [Team history](https://www.ensl.org/teams/987) |
| S13 D1 silver / ELOGain | Deathcore → [Deathcore](https://www.ensl.org/users/5875) | 43166351 | [Team history](https://www.ensl.org/teams/987) |
| S13 D1 silver / ELOGain | Mephilles → [Mephilles](https://www.ensl.org/users/5805) | 50996886 | [Team history](https://www.ensl.org/teams/987) |
| S13 D1 silver / ELOGain | Hyste → [Hyste](https://www.ensl.org/users/6188) | 126698727 | [Team history](https://www.ensl.org/teams/987) |
| S13 D1 silver / ELOGain | mirez → [mirez](https://www.ensl.org/users/540) | 4798435 | [Team history](https://www.ensl.org/teams/987) |
| S13 D1 silver / ELOGain | Preda → [Preda](https://www.ensl.org/users/5921) | 47135802 | [Team history](https://www.ensl.org/teams/987) |
| S13 D1 silver / ELOGain | d3Base → [d3Base](https://www.ensl.org/users/6876) | 70204576 | Bleu confirmed account |
| S13 D2 gold / FaLLeN SouLs | bobager → [bobager](https://www.ensl.org/users/7256) | 130425032 | [Team history](https://www.ensl.org/teams/1020) |
| S13 D2 gold / FaLLeN SouLs | leooood → [leooood](https://www.ensl.org/users/7451) | 118650879 | [Team history](https://www.ensl.org/teams/1020) |
| S13 D2 gold / FaLLeN SouLs | keo → [keo](https://www.ensl.org/users/6023) | 84099267 | [Team history](https://www.ensl.org/teams/1020) |
| S13 D2 gold / FaLLeN SouLs | 314 → [314](https://www.ensl.org/users/6814) | 176805746 | [Team history](https://www.ensl.org/teams/1020) |
| S13 D2 gold / FaLLeN SouLs | GAR → [GAR](https://www.ensl.org/users/7200) | 31332755 | [Team history](https://www.ensl.org/teams/1020) |
| S13 D2 gold / FaLLeN SouLs | Reguliym → [Reguliym](https://www.ensl.org/users/6501) | 60207928 | [Team history](https://www.ensl.org/teams/1020) |
| S13 D2 gold / FaLLeN SouLs | YHero → [YHero](https://www.ensl.org/users/6115) | 111103027 | [Team history](https://www.ensl.org/teams/1020) |
| S13 D2 gold / FaLLeN SouLs | Well → [Well](https://www.ensl.org/users/1282) | 18931637 | Bleu confirmed account |
| S13 D2 gold / FaLLeN SouLs | Hitman → [Hitman](https://www.ensl.org/users/1818) | 42538007 | Bleu confirmed account |
| S13 D2 gold / FaLLeN SouLs | Void → [Reguliym](https://www.ensl.org/users/6501) | 60207928 | Bleu confirmed account; [shared account award, see #2](https://github.com/Bleuitup/ENSL-Lost-Season-Badges/issues/2) |
| S13 D2 gold / FaLLeN SouLs | vladka → [vladka](https://www.ensl.org/users/6789) | 251876583 | Bleu confirmed account |
| S13 D2 silver / patriarchy | sweets → [sweets](https://www.ensl.org/users/7456) | 31103132 | Bleu confirmed account |
| S13 D2 silver / patriarchy | malx → [malx](https://www.ensl.org/users/2960) | 12312523 | Bleu confirmed account |
| S13 D2 silver / patriarchy | Hobbeson → [Hobbeson](https://www.ensl.org/users/6875) | 271637648 | Bleu confirmed account |
| S13 D2 silver / patriarchy | ydy → [ydy](https://www.ensl.org/users/2347) | 1247207 | Bleu confirmed account |
| S13 D2 silver / patriarchy | nous → [nous](https://www.ensl.org/users/7482) | 12308191 | Bleu confirmed account |
| S13 D2 silver / patriarchy | vman → [vman](https://www.ensl.org/users/5849) | 35573582 | Bleu confirmed account |
| S13 D2 silver / patriarchy | Knox → [Knox](https://www.ensl.org/users/6186) | 109980400 | Bleu confirmed account |
| S13 D2 silver / patriarchy | GaussWaffle → [GaussWaffle](https://www.ensl.org/users/2069) | 75983205 | Bleu confirmed account |
| S13 D2 bronze / Saunabois | Gung-Ho → [Gung-Ho](https://www.ensl.org/users/7394) | 4378837 | [Team history](https://www.ensl.org/teams/1030) |
| S13 D2 bronze / Saunabois | Aazu → [Aazu](https://www.ensl.org/users/7148) | 7747335 | [Team history](https://www.ensl.org/teams/1030) |
| S13 D2 bronze / Saunabois | Malware → [Malware](https://www.ensl.org/users/5877) | 167804993 | [Team history](https://www.ensl.org/teams/1030) |
| S13 D2 bronze / Saunabois | Pawni → [Pawni](https://www.ensl.org/users/7474) | 38648382 | [Team history](https://www.ensl.org/teams/1030) |
| S13 D2 bronze / Saunabois | Joopommi → [Joopommi](https://www.ensl.org/users/7449) | 103031516 | [Team history](https://www.ensl.org/teams/1030) |
| S13 D2 bronze / Saunabois | YoloJeesus → [YoloJeesus](https://www.ensl.org/users/7452) | 719356 | [Team history](https://www.ensl.org/teams/1030) |
| S13 D2 bronze / Saunabois | Kapuh → [Kapuh](https://www.ensl.org/users/7440) | 9147927 | [Team history](https://www.ensl.org/teams/1030) |
| S13 D2 bronze / Saunabois | StoBez → [StoBez](https://www.ensl.org/users/2047) | 4343892 | [Team history](https://www.ensl.org/teams/1030) |
| S13 D3 gold / Nismen | Bleu → [Bleu](https://www.ensl.org/users/6497) | 37745947 | [Team history](https://www.ensl.org/teams/1036) |
| S13 D3 gold / Nismen | Shadowdark → [Shadowdark](https://www.ensl.org/users/6590) | 81009203 | [Team history](https://www.ensl.org/teams/1036) |
| S13 D3 gold / Nismen | Neuromancer → [Neuromancer](https://www.ensl.org/users/2388) | 79089452 | [Team history](https://www.ensl.org/teams/1036) |
| S13 D3 gold / Nismen | Litansan → [Litansan](https://www.ensl.org/users/7503) | 67758705 | [Team history](https://www.ensl.org/teams/1036) |
| S13 D3 gold / Nismen | qu4zar → [qu4zar](https://www.ensl.org/users/7541) | 79044502 | [Team history](https://www.ensl.org/teams/1036) |
| S13 D3 gold / Nismen | Herrsheimer → [Herrsheimer](https://www.ensl.org/users/1892) | 42247631 | [Team history](https://www.ensl.org/teams/1036) |
| S13 D3 gold / Nismen | Nibraz → [Nibraz](https://www.ensl.org/users/7544) | 68445518 | [Team history](https://www.ensl.org/teams/1036) |
| S13 D3 gold / Nismen | Godman → [Godman](https://www.ensl.org/users/1507) | 34583831 | Bleu confirmed account |
| S13 D3 silver / For The Lolz | Kash → [Kash](https://www.ensl.org/users/5447) | 85021664 | [Team history](https://www.ensl.org/teams/1006) |
| S13 D3 silver / For The Lolz | DaWick3DKing → [DaWick3DKing](https://www.ensl.org/users/6482) | 111300752 | [Team history](https://www.ensl.org/teams/1006) |
| S13 D3 silver / For The Lolz | SneakyDragon → [SneakyDragon](https://www.ensl.org/users/6929) | 45721424 | [Team history](https://www.ensl.org/teams/1006) |
| S13 D3 silver / For The Lolz | Kari → [Kari](https://www.ensl.org/users/6651) | 118696449 | [Team history](https://www.ensl.org/teams/1006) |
| S13 D3 silver / For The Lolz | Alt+F4 → [Alt+F4](https://www.ensl.org/users/6945) | 2451483 | [Team history](https://www.ensl.org/teams/1006) |
| S13 D3 silver / For The Lolz | Anriller → [Anriller](https://www.ensl.org/users/6938) | 169805531 | [Team history](https://www.ensl.org/teams/1006) |
| S13 D3 bronze / Intergalactic | AlexeyLExaLExa → [AlexeyLExaLExa](https://www.ensl.org/users/7525) | 484537632 | [Team history](https://www.ensl.org/teams/1057) |
| S13 D3 bronze / Intergalactic | kessoft → [kessoft](https://www.ensl.org/users/7434) | 30282722 | [Team history](https://www.ensl.org/teams/1057) |
| S13 D3 bronze / Intergalactic | Perunus → [Perunus](https://www.ensl.org/users/7528) | 102617819 | [Team history](https://www.ensl.org/teams/1057) |
| S13 D3 bronze / Intergalactic | Karasu_Tengu → [Karasu_Tengu](https://www.ensl.org/users/6598) | 22527704 | [Team history](https://www.ensl.org/teams/1057) |
| S13 D3 bronze / Intergalactic | JINMOH → [JlNMOH](https://www.ensl.org/users/7042) | 129031668 | [Team history](https://www.ensl.org/teams/1057) |
| S13 D3 bronze / Intergalactic | Kefirdon → [Kefirdon](https://www.ensl.org/users/7252) | 194342323 | [Team history](https://www.ensl.org/teams/1057) |
| S13 D3 bronze / Intergalactic | LightDay → [LightDay](https://www.ensl.org/users/7555) | 73965104 | [Team history](https://www.ensl.org/teams/1057) |
| S14 gold / Thots | DerEinzige → [DerEinzige](https://www.ensl.org/users/7508) | 41125372 | Bleu confirmed account |
| S14 gold / Thots | Loganater → [Loganater](https://www.ensl.org/users/7563) | 49905871 | Bleu confirmed account |
| S14 gold / Thots | NeckSnapper → [NeckSnapper](https://www.ensl.org/users/7468) | 205351028 | Bleu confirmed account |
| S14 gold / Thots | GLock → [GLock](https://www.ensl.org/users/6861) | 31001003 | Bleu confirmed account |
| S14 gold / Thots | Shizzkizz → [Shizzkizz](https://www.ensl.org/users/6862) | 89842497 | Bleu confirmed account |
| S14 gold / Thots | Stark_ → [Stark_](https://www.ensl.org/users/6194) | 51623684 | Bleu confirmed account |
| S14 gold / Thots | kesuga7 → [kesuga7](https://www.ensl.org/users/7506) | 55021288 | Bleu confirmed account |
| S14 gold / Thots | forever_rusty → [forever_rusty](https://www.ensl.org/users/2666) | 3601796 | Bleu confirmed account |
| S14 gold / Thots | ADHD → [ADHD](https://www.ensl.org/users/2553) | 158062 | Bleu confirmed account |
| S14 silver / Pubstars | dja → [dja](https://www.ensl.org/users/7144) | 818729 | [Team history](https://www.ensl.org/teams/971) |
| S14 silver / Pubstars | Mega → [Mega](https://www.ensl.org/users/1942) | 57346 | [Team history](https://www.ensl.org/teams/971) |
| S14 silver / Pubstars | Barns → [Barns](https://www.ensl.org/users/7194) | 10837467 | [Team history](https://www.ensl.org/teams/971) |
| S14 silver / Pubstars | valo → [Valo](https://www.ensl.org/users/1198) | 5078543 | [Team history](https://www.ensl.org/teams/971) |
| S14 silver / Pubstars | Seperim → [Seperim](https://www.ensl.org/users/7040) | 3393030 | [Team history](https://www.ensl.org/teams/971) |
| S14 silver / Pubstars | POPI → [POPI](https://www.ensl.org/users/7196) | 34677863 | [Team history](https://www.ensl.org/teams/971) |
| S14 silver / Pubstars | Handschuh → [Handschuh](https://www.ensl.org/users/1468) | 1021969 | [Team history](https://www.ensl.org/teams/971) |
| S14 bronze / Nismen | Bleu → [Bleu](https://www.ensl.org/users/6497) | 37745947 | [Team history](https://www.ensl.org/teams/1036) |
| S14 bronze / Nismen | Litansan → [Litansan](https://www.ensl.org/users/7503) | 67758705 | [Team history](https://www.ensl.org/teams/1036) |
| S14 bronze / Nismen | Neuromancer → [Neuromancer](https://www.ensl.org/users/2388) | 79089452 | [Team history](https://www.ensl.org/teams/1036) |
| S14 bronze / Nismen | Shadowdark → [Shadowdark](https://www.ensl.org/users/6590) | 81009203 | [Team history](https://www.ensl.org/teams/1036) |
| S14 bronze / Nismen | Tik → [Tik](https://www.ensl.org/users/7566) | 23186581 | Bleu confirmed account |
| S14 bronze / Nismen | Godman → [Godman](https://www.ensl.org/users/1507) | 34583831 | Bleu confirmed account |
| S14 bronze / Nismen | Limbo → [Limbo](https://www.ensl.org/users/7542) | 57582675 | [Team history](https://www.ensl.org/teams/1036) |
| S14 bronze / Nismen | Starcetereus → [Starcetereus](https://www.ensl.org/users/6800) | 44618947 | Bleu confirmed account |
| S15 D1 gold / Code of Misconduct | lome → [loMe](https://www.ensl.org/users/6338) | 265699 | [Team history](https://www.ensl.org/teams/1078) |
| S15 D1 gold / Code of Misconduct | turtsmcgurts → [turtsmcgurts](https://www.ensl.org/users/6767) | 33137864 | [Team history](https://www.ensl.org/teams/1078) |
| S15 D1 gold / Code of Misconduct | herakles → [herakles](https://www.ensl.org/users/2244) | 803162 | [Team history](https://www.ensl.org/teams/1078) |
| S15 D1 gold / Code of Misconduct | Spring → [Spring](https://www.ensl.org/users/6080) | 36622746 | [Team history](https://www.ensl.org/teams/1078) |
| S15 D1 gold / Code of Misconduct | Zafod → [Zafod](https://www.ensl.org/users/6263) | 55861167 | [Team history](https://www.ensl.org/teams/1078) |
| S15 D1 gold / Code of Misconduct | Wake → [Wake](https://www.ensl.org/users/5486) | 10365768 | [Team history](https://www.ensl.org/teams/1078) |
| S15 D1 gold / Code of Misconduct | Starcetereus → [Starcetereus](https://www.ensl.org/users/6800) | 44618947 | [Team history](https://www.ensl.org/teams/1078) |
| S15 D1 silver / 5 piece combo | y4mz → [y4mz](https://www.ensl.org/users/7373) | 46179133 | [Team history](https://www.ensl.org/teams/1089) |
| S15 D1 silver / 5 piece combo | ydy → [ydy](https://www.ensl.org/users/2347) | 1247207 | [Team history](https://www.ensl.org/teams/1089) |
| S15 D1 silver / 5 piece combo | Doggo → [Doggo](https://www.ensl.org/users/7321) | 144869096 | [Team history](https://www.ensl.org/teams/1089) |
| S15 D1 silver / 5 piece combo | tap → [tap](https://www.ensl.org/users/5819) | 61161470 | [Team history](https://www.ensl.org/teams/1089) |
| S15 D1 silver / 5 piece combo | Nightsy → [Nightsy](https://www.ensl.org/users/6455) | 73407070 | [Team history](https://www.ensl.org/teams/1089) |
| S15 D1 silver / 5 piece combo | OMEGAWEAPON → [OMEGAWEAPON](https://www.ensl.org/users/2732) | 24182083 | [Team history](https://www.ensl.org/teams/1089) |
| S15 D2 gold / California Burrito | Noky → [Noky](https://www.ensl.org/users/7562) | 2574695 | [Team history](https://www.ensl.org/teams/1077) |
| S15 D2 gold / California Burrito | Simba → [Simba](https://www.ensl.org/users/2854) | 70496041 | [Team history](https://www.ensl.org/teams/1077) |
| S15 D2 gold / California Burrito | RobP → [RobP](https://www.ensl.org/users/6159) | 59625362 | [Team history](https://www.ensl.org/teams/1077) |
| S15 D2 gold / California Burrito | Jotobo → [PecanSam](https://www.ensl.org/users/7614) | 15974914 | [Team history](https://www.ensl.org/teams/1077) |
| S15 D2 gold / California Burrito | bily → [bily](https://www.ensl.org/users/2618) | 3700783 | [Team history](https://www.ensl.org/teams/1077) |
| S15 D2 gold / California Burrito | Roland → [Roland](https://www.ensl.org/users/7239) | 62376518 | [Team history](https://www.ensl.org/teams/1077) |
| S15 D2 gold / California Burrito | Stark_ → [Stark_](https://www.ensl.org/users/6194) | 51623684 | [Team history](https://www.ensl.org/teams/1077) |
| S15 D2 silver / Shoobs | DerEinzige → [DerEinzige](https://www.ensl.org/users/7508) | 41125372 | [Team history](https://www.ensl.org/teams/1067) |
| S15 D2 silver / Shoobs | NeckSnapper → [NeckSnapper](https://www.ensl.org/users/7468) | 205351028 | [Team history](https://www.ensl.org/teams/1067) |
| S15 D2 silver / Shoobs | Sakhan → [Sakhan](https://www.ensl.org/users/7568) | 188598623 | [Team history](https://www.ensl.org/teams/1067) |
| S15 D2 silver / Shoobs | xankar → [xankar](https://www.ensl.org/users/7602) | 95173890 | [Team history](https://www.ensl.org/teams/1067) |
| S15 D2 silver / Shoobs | Keo → [keo](https://www.ensl.org/users/6023) | 84099267 | [Team history](https://www.ensl.org/teams/1067) |
| S15 D2 silver / Shoobs | Bill → [bill](https://www.ensl.org/users/4310) | 34157492 | [Team history](https://www.ensl.org/teams/1067) |
| S15 D2 bronze / Tim Tam Slams | RedNight → [RedNight](https://www.ensl.org/users/7634) | 135485265 | [Team history](https://www.ensl.org/teams/1085) |
| S15 D2 bronze / Tim Tam Slams | Critique → [Critique](https://www.ensl.org/users/6888) | 54538978 | [Team history](https://www.ensl.org/teams/1085) |
| S15 D2 bronze / Tim Tam Slams | flip → [flip](https://www.ensl.org/users/7635) | 113452529 | [Team history](https://www.ensl.org/teams/1085) |
| S15 D2 bronze / Tim Tam Slams | clowning → [clowning](https://www.ensl.org/users/3524) | 206793 | [Team history](https://www.ensl.org/teams/1085) |
| S15 D2 bronze / Tim Tam Slams | Sylvi → [Sylvi](https://www.ensl.org/users/5198) | 90411757 | [Team history](https://www.ensl.org/teams/1085) |
| S15 D2 bronze / Tim Tam Slams | Sardine → [Sardine](https://www.ensl.org/users/5433) | 111700052 | [Team history](https://www.ensl.org/teams/1085) |

## Omitted medals

S13 D1 bronze remains omitted because the historical records are unavailable. S15 D1 bronze remains omitted because no next eligible team has been established. These decisions are separate from the player identity issues.

After reviewed evidence changes, run `python scripts/generate_assignments.py` and the recipient/native integration tests before building. The mod performs no website requests at runtime.

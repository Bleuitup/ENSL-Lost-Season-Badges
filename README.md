# ENSL Lost Season Badges

A Natural Selection 2 mod project restoring tournament badges for NSL Seasons 13–15, using existing ENSL badges as the visual and behavioral reference.

**Status:** [v1.0 published on Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3802094438), confirmed by Bleu on 2026-09-16: 16 medal definitions, 119 distinct awards across 105 confirmed accounts. All remaining proposed accounts were approved by Bleu; Void is assigned to 60207928. Made_in_Russia remains unassigned, and the Void/Reguliym overlap is tracked in [GitHub issues](https://github.com/Bleuitup/ENSL-Lost-Season-Badges/issues). Git tag [v1.0](https://github.com/Bleuitup/ENSL-Lost-Season-Badges/releases/tag/v1.0) identifies the published package at commit `7a03dc2`.

![Workshop preview](preview.jpg)

## Installation and use

Server owners: enable Workshop mod **3802094438**. Eligible players can select their earned medals in the native badge picker on a server running the mod; hover over a medal to see its season, division and placing. The mod is standalone and has no Shine dependency.

For local development, open the project root in NS2 Launchpad and follow the [test instructions](docs/launchpad-test.md). The `output` folder is ignored by Git; run `scripts/build.ps1` after cloning or changing source to prepare it. The v0.8 tag retains the original one-badge prototype.

The upload is built exclusively from `source/`. Research, markdown, reference images, and selected artwork masters stay outside the runtime package. Superseded image candidates were removed from the current checkout; they remain recoverable from Git tag `v0.8`.

## Project documents

- [Release notes](docs/release-notes.md)
- [Accepted implementation plan](PLAN.md)
- [Launchpad test and requested feedback](docs/launchpad-test.md)
- [Prototype architecture and provenance](docs/prototype-architecture.md)
- [Recipient review and remaining questions](docs/recipient-review.md)
- [Recipient evidence manifest](data/recipients.json)
- [Selected artwork and comparison](docs/artwork.md)
- [Approved option C and generation prompts](docs/nine-alternatives.md)
- [Hover panels and proposed badge names](docs/hover-behavior.md)
- [Initial year-edit prompt and method](docs/year-edit-prompt.md)
- [Earlier artwork correction prompts](docs/artwork-correction-prompts.md)
- [Historical preview prompts](docs/preview-prompt.md)

The Workshop cover is the 512 x 512 `preview.jpg` in the project root. [Compare S12, proposed S13–15, and S16 medals](docs/medal-comparison.png) enlarged and at the scoreboard base size. S13 reuses original 2018 art; S14/S15 use approved option C, stored in `assets/badges/2019/`. All 16 established awards have native DDS files and registration. S13 uses byte-identical shipped 2018 textures; S14/S15 use lossless 32 x 32 DDS exports of the approved C PNGs. The expanded set still needs an in-game visual check.

## Award policy

Use current ENSL standings, remove disqualified teams from the relevant competition, and promote remaining teams in order. Preserve published placement separately from the mod's promoted award.

Season 13 Division 1 bronze is omitted because the historical records are unavailable. The accepted scope contains 16 established awarded team placements across Seasons 13–15. S15 D1 bronze is unassigned unless the next eligible team can be verified.

Primary results source: [ENSL Hall of Fame](https://www.ensl.org/halloffame).

## Distribution

The mod grants account-specific custom badges on servers running it. It does not issue official Steam inventory items. Bleu published [Workshop v1.0](https://steamcommunity.com/sharedfiles/filedetails/?id=3802094438), confirmed on 2026-09-16. The annotated Git tag `v1.0` points to the uploaded source and metadata at `7a03dc2`; subsequent documentation updates record publication without changing that package. See the [GitHub release](https://github.com/Bleuitup/ENSL-Lost-Season-Badges/releases/tag/v1.0) and [tracked issues](https://github.com/Bleuitup/ENSL-Lost-Season-Badges/issues).

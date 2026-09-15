# ENSL Lost Season Badges

A Natural Selection 2 mod project restoring tournament badges for NSL Seasons 13–15, using existing ENSL badges as the visual and behavioral reference.

**Status:** first Launchpad prototype ready for user testing: Bleu (NS2 ID 37745947) receives the S13 Division 3 winner badge. Native badge logic checks pass; live in-game verification is pending. Other recipients and S14/S15 runtime awards remain to be implemented; their option C artwork is approved.

![Workshop preview](preview.png)

## Test the first prototype

Open this project in NS2 Launchpad and follow the [test instructions](docs/launchpad-test.md). The local `output` folder is prepared. The one included award is earned by Bleu, confirmed by the user and corroborated in the Hall of Fame roster. It is not a temporary grant of other medals.

## Project documents

- [Accepted implementation plan](PLAN.md)
- [Launchpad test and requested feedback](docs/launchpad-test.md)
- [Prototype architecture and provenance](docs/prototype-architecture.md)
- [First recipient evidence](data/recipients.json)
- [Selected artwork and comparison](docs/artwork.md)
- [Approved option C and generation prompts](docs/nine-alternatives.md)
- [Hover panels and proposed badge names](docs/hover-behavior.md)
- [Initial year-edit prompt and method](docs/year-edit-prompt.md)
- [Earlier artwork correction prompts](docs/artwork-correction-prompts.md)
- [Historical preview prompts](docs/preview-prompt.md)

The cover is available as 512 x 512 PNG and JPEG. [Compare S12, proposed S13–15, and S16 medals](docs/medal-comparison.png) enlarged and at the scoreboard base size. S13 proposes reuse of original 2018 art; S14/S15 use approved option C, stored in `assets/badges/2019/`. The S13 test badge has a native DDS and registration; S14/S15 packaging and account assignments remain to be completed.

## Award policy

Use current ENSL standings, remove disqualified teams from the relevant competition, and promote remaining teams in order. Preserve published placement separately from the mod's promoted award.

Season 13 Division 1 bronze is omitted because the historical records are unavailable. The accepted scope contains 16 established awarded team placements across Seasons 13–15. S15 D1 bronze is unassigned unless the next eligible team can be verified.

Primary results source: [ENSL Hall of Fame](https://www.ensl.org/halloffame).

## Distribution

The proposed mod grants account-specific custom badges on servers running it. It does not issue official Steam inventory items. A GitHub remote and Workshop release have not been created.

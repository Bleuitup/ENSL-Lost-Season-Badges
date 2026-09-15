# Release notes

## v0.81 — prepared locally, awaiting upload

- Expands the v0.8 prototype to 16 medal definitions covering Seasons 13–15, with 99 verified awards for 89 accounts.
- Confirms ADHD as NS2 ID **158062**, granting **The ENSL Season 14 Winner** for Thots. The similarly named account 21557158 receives no grant.
- Includes the confirmed Nismen accounts for Godman, Tik and Starcetereus. Bleu receives S13 D3 gold and S14 bronze.
- Keeps 22 unresolved player awards pending. S13 D1 and S15 D1 bronze remain omitted under the agreed policy.
- Uses the selected option C artwork for S14/S15 and original 2018 textures for S13.
- Uses the current 512 × 512 `preview.jpg`, supplies a formatted Workshop description in `mod.settings`, and sets the Look and Feel / Must be run on Server categories.
- Removes superseded image candidates from the current project. Runtime uploads contain only Lua, the mod entry and the 16 small badge textures.

Validation: recipient checks and native NS2 badge integration tests pass. All runtime output files are checked against the source. The original v0.8 selection, slot movement and hover behavior were tested by Bleu in game; the expanded S14/S15 artwork and multiple-medal presentation still need the [next Launchpad check](launchpad-test.md).

To publish: open the project root in Launchpad, check the cover and description, test the prepared build, then update the existing Workshop item **3802094438**. After Bleu confirms upload, record the published commit with the annotated **v0.81** Git tag. The existing v0.8 tag marks the previous published build.

## v0.8 — published by Bleu

First earned-badge prototype: Bleu's S13 Division 3 gold. Native selection, movement between slots and hover text confirmed in game. Git tag `v0.8`.

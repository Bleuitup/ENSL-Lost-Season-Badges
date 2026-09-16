# Release notes

## v1.0 — prepared for upload

- 16 medal definitions, **119 distinct awards for 105 accounts**. Of 121 historical roster entries, 120 have account mappings; Void and Reguliym point to the same account award, counted once.
- Applies Bleu's confirmation of the remaining proposed accounts and the corrected Void ID **60207928**. Earlier speculative Void candidates receive no entitlement.
- Records the shared Void/Reguliym account explicitly and validates its deduplication without weakening duplicate-assignment checks.
- Tracks [Made_in_Russia's missing account (#1)](https://github.com/Bleuitup/ENSL-Lost-Season-Badges/issues/1) and [the Void/Reguliym overlap (#2)](https://github.com/Bleuitup/ENSL-Lost-Season-Badges/issues/2) as follow-ups.
- Updates the Workshop description to v1.0. Retains the approved 512 × 512 JPEG cover and the lean runtime package.

Recipient validation and integration checks against native NS2 badge code cover all configured accounts. The automated checks simulate engine services; broader live rendering/network/other-mod testing remains separate.

**Upload:** open the project root in Launchpad and update Workshop item **3802094438** using the prepared output. Git tag **v1.0** identifies this package. This record describes preparation; Bleu will publish it.

## v0.81 — published by Bleu; Git tag v0.81

- Expands the v0.8 prototype to 16 medal definitions covering Seasons 13–15, with 99 verified awards for 89 accounts.
- Confirms ADHD as NS2 ID **158062**, granting **The ENSL Season 14 Winner** for Thots. The similarly named account 21557158 receives no grant.
- Includes the confirmed Nismen accounts for Godman, Tik and Starcetereus. Bleu receives S13 D3 gold and S14 bronze.
- Keeps 22 unresolved player awards pending. S13 D1 and S15 D1 bronze remain omitted under the agreed policy.
- Uses the selected option C artwork for S14/S15 and original 2018 textures for S13.
- Uses the current 512 × 512 `preview.jpg`, supplies a formatted Workshop description in `mod.settings`, and sets the Look and Feel / Must be run on Server categories.
- Removes superseded image candidates from the current project. Runtime uploads contain only Lua, the mod entry and the 16 small badge textures.

Validation: recipient checks and native NS2 badge integration tests pass. All runtime output files are checked against the source. The original v0.8 selection, slot movement and hover behavior were tested by Bleu in game; the expanded S14/S15 artwork and multiple-medal presentation still need the [next Launchpad check](launchpad-test.md).

Bleu confirmed publication and the annotated v0.81 tag points to commit `7da5ed5`.

## v0.8 — published by Bleu

First earned-badge prototype: Bleu's S13 Division 3 gold. Native selection, movement between slots and hover text confirmed in game. Git tag `v0.8`.

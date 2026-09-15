# Selected artwork and references

## Side-by-side comparison

![S12, proposed S13–15, and S16 medals](medal-comparison.png)

Each large image is a nearest-neighbor 96 x 96 enlargement of a 32 x 32 texture. The small images are displayed at 20 x 20 pixels, the scoreboard's base icon size. Actual game size is multiplied by its UI scaling factor; browser and operating-system scaling also affect physical screen size. The comparison is a browser rendering, not an NS2 screenshot.

| Season | Artwork in this comparison | Status |
| --- | --- | --- |
| 12 | Installed `ensl_2018_{gold,silver,bronze}.dds` | Original reference |
| 13 | Same original 2018 textures | Proposed reuse under separate custom award identifiers |
| 14 | Option C, 2019 | Selected artwork; season crossed 2018–2019 |
| 15 | Option C, 2019 | Selected artwork |
| 16 | Installed `ensl_s16_{gold,silver,bronze}.dds` | Original reference |

The user selected option C for S14/S15 on 2026-09-15. This revision starts from the source-guided year edit and refines the final 9 with a tapered tail and corrected height. This brings the arc size, year lettering, colors, and background much closer to the shipped art. It still is not pixel-identical outside the date, because generation and resizing introduce changes. See [the exact year-edit prompt and method](year-edit-prompt.md). Verify the finished native textures in-game before release.

## Emblem correction

The ENSL emblem shows a helmeted Marine aiming a rifle left, an incomplete curved arc, and a Skulk facing right at the lower right. It is not a Gorge head or a laurel. The former interpretation and promotional art were incorrect and are superseded.

Authoritative shape reference: [ENSL website logo](https://www.ensl.org/assets/themes/default/logo-19ca99c1.png), preserved as `ensl-site-logo.png`. The lettering and blue website banner are excluded from the medal emblem.

Badge interiors should carry a subdued tint of their metal: gold/brown, steel blue/gray, or copper/brown. They should not be treated as plain black or assumed to be transparent. Preserve the original asset's alpha when referencing it; the new generated drafts are opaque.

Season 12 divisions share three textures but have separate award identifiers and names. Our divisions can do the same. S13 D1 bronze is omitted, and S15 D1 bronze remains unassigned; displaying a bronze design here is not an eligibility decision.

## Files

- `assets/badges/2019/master.png`: selected option C master, copied unchanged from the reviewed alternative.
- `assets/badges/2019/ensl_2019_{gold,silver,bronze}.png`: selected 32 x 32 source textures, identical to reviewed C exports.
- The comparison uses each selected 32 px source and browser scaling to 20 px. Runtime DDS files are now packaged as lossless uncompressed RGBA exports of these selected 32 px PNGs; the pixel round trip is checked.
- `docs/medal-comparison.png`: all five seasons, enlarged and small.
- `docs/nismen-hover-comparison.png`: illustrative native-style hover panel.
- `docs/hover-behavior.md`: source audit and proposed badge names.

The installed declarations reference separate scoreboard paths for some medals, but corresponding `_20.dds` files were absent from the inspected folder. Verify the actual texture paths and filtering in NS2 before claiming a working implementation. The first S13 D3 prototype now includes `source/ui/badges/ensl_lost_s13_d3_gold.dds`, a byte-identical copy of the original 2018 gold DDS, and its runtime registration. S14/S15 selected artwork is now packaged as native DDS files for all established awards. Live NS2 rendering remains to be checked.

Superseded `corrected_2019_*`, `year-edit_2019_*`, and alternative masters were removed from the current checkout. They remain recoverable at Git tag `v0.8`. The current comparison uses the selected option C files from `assets/badges/2019/`.

## Final digit alternatives

The user selected **C** in the [documented artwork review](nine-alternatives.md). The selection mosaic and rejected alternatives are archived in Git tag `v0.8`; selected C sources remain in `assets/badges/2019/`. The main comparison has been updated to C.

## Workshop cover

![Corrected 512 px cover](../preview.jpg)

The corrected cover keeps the user's black/orange preview style and replaces the erroneous emblem. Medal interiors now have matching metallic tints. Promotional detail and glow are not intended for in-game icons.

- `preview.jpg`: the current 512 x 512 Workshop cover. The unused PNG export was removed.
- `assets/preview-master.png`: corrected generated master.
- `docs/artwork-correction-prompts.md`: exact built-in ImageGen correction prompts.
- `docs/preview-prompt.md`: retained historical prompts, marked superseded where wrong.

Original NS2 artwork and the ENSL logo belong to their respective creators. These source references document the intended match; redistribution conditions remain part of release preparation.

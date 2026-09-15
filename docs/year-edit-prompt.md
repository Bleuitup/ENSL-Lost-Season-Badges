# Source-guided 2019 year edit

Generated with the built-in ImageGen tool on 2026-09-15. This was the source-guided S14/S15 candidate; the user subsequently selected [option C](nine-alternatives.md), which refines its final 9. The Workshop cover is unaffected.

## Method and result

The three original 32 x 32 Season 12 PNGs, decoded from the installed DDS textures, were enlarged 16 times with nearest-neighbor sampling and arranged into a 1024 x 1024 edit input. The only requested creative change was the last digit of each date, from 2018 to 2019. No separate logo reference or redesigned artwork was supplied, to minimize visual drift.

The tool returned a 1254 x 1254 image. Each 627 x 627 medal cell was cropped and exported at 32 x 32 and 20 x 20 using high-quality bicubic resampling. The comparison displays the 32 px sources at 96 px with nearest-neighbor enlargement and at 20 px with browser filtering, consistently across all seasons.

Visual review confirms a much closer match to the originals in arc size, year lettering size, medal colors, and background treatment. Generative editing and resampling still modify pixels outside the final digit; this is not a bit-for-bit source-preserving edit. For exact production matching, a localized native-resolution pixel edit with all other source pixels retained would be the most reliable finishing method. No final DDS or in-game verification is implied.

## Files

- `docs/vanilla-2018-edit-input.png`: original source atlas supplied to ImageGen.
- `assets/drafts/year-edit-2019-master.png`: generated output.
- `assets/drafts/year-edit_2019_{gold,silver,bronze}_{32,20}.png`: candidate exports.
- `docs/medal-comparison.png`: updated five-season comparison.

## Exact prompt

Use case: text-localization.
Edit target: the provided 1024 x 1024 image, an exact nearest-neighbor enlargement of three original Natural Selection 2 ENSL medal textures in a 2x2 atlas. Gold at top-left, silver at top-right, bronze at bottom-left, blank dark gray at bottom-right.
Make a surgical single-digit edit: change the final digit of "2018" to "9" in EACH of the three medals, so the year reads "2019".
Preserve EVERYTHING ELSE in the input. Keep its exact low-resolution blocky pixel-art appearance: each badge consists of a 32x32 logical pixel grid, enlarged 16 times. Do not make this smooth, higher-detail, redesigned, illustrated, cleaner, or sharper than the original.
The Marine/rifle, sweeping semicircular arc, and Skulk must remain identical in shape, proportions, scale, position, color and shading. The arc must stay as large as in the source. Keep every medal's original background pixel pattern, muted gold/brown, steel blue/silver, muted pink/copper bronze palette, brightness, highlights and border. Keep the original oversized YEAR LETTERING filling the bottom band: the "201" remain unchanged, and the new "9" occupies the same size and location as the old "8", with matching pixel font and color.
Output the same exact 2x2 gapless atlas composition and crop; square 1024x1024 if possible. No margins, labels, new frames, fake checkerboards, glows, logo reinterpretation or extra text. The only intended changed pixels are in the last digit of each date. This is a source-preserving texture edit, not a new design.

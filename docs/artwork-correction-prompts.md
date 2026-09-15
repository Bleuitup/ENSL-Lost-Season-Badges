# Artwork correction prompts

Method: built-in ImageGen, reference-guided edits. Generated 2026-09-15. Output dimensions were 1254 x 1254; the promotional exports are resized to 512 x 512, and native design drafts to 32 x 32 and 20 x 20.

The website logo is the authoritative emblem reference. The original source texture sheet supplies the native style. Previous Gorge/laurel interpretations were incorrect and superseded. These outputs restore the Marine/arc/Skulk composition; the native drafts still need pixel-level refinement.

## Native draft

Use case: precise-object-edit.
Create corrected natural-selection-league in-game medal art as a 2x2 texture atlas.
Reference 1 is the REAL ENSL WEBSITE LOGO and is the authoritative shape source. It depicts a HELMETED HUMAN MARINE aiming a LONG RIFLE LEFT in the upper-left, a sweeping incomplete curved arc, and a SMALL FOUR-LEGGED SKULK ALIEN in the lower-right facing right. Reproduce these actual silhouettes, their relative positions and their connecting arc. Omit the website's letters "NSL" and surrounding blue rectangular banner.
Reference 2 is the existing NS2 Season 12 gold/silver/bronze medal sheet. Use its simple thin square frames, compact 32px game-art design, muted metallic colors and subtle MEDAL-COLORED tinted interior background. DO NOT interpret the original tiny emblem as an animal head or leaves. It is the Marine, arc and Skulk.
Output: one square opaque image containing an EXACT gapless 2x2 grid of square cells, all cells equal, no outside margin. Top-left GOLD, top-right SILVER, bottom-left BRONZE, bottom-right plain neutral gray blank. Each active cell is one square medal filling the full cell.
Within each medal, a thin subtly metallic square outline, a flat low-contrast interior tinted muted gold/olive-brown for gold, steel blue-gray for silver, warm brown for bronze. The interior must be visibly tinted, NOT black, including behind the emblem and date. No thick frame, no high-relief bevel, no photoreal metal, no laurel branches, leaves, dragon heads, bird heads or trophy elements.
The official Marine/arc/Skulk silhouette occupies the top 75 percent of each medal. A small simple "2019" below occupies the remaining bottom band, matching existing NS2 year numerals.
All three medals use the identical correct logo, in their respective metal color. Clear simple shapes suitable for downsampling to 32x32 and 20x20. Keep the logo the focus; do not add decorative design details. Exact text only "2019" on each of the three medals.

Historical output: `assets/drafts/2019-medals-master.png`, now archived at Git tag `v0.8`. Selected C artwork remains in `assets/badges/2019/`.

## Promotional cover

Use case: precise-object-edit.
Correct the existing ENSL LOST SEASON BADGES cover (reference 1). Keep its exact black/orange composition, all title/subtitle text, typography, top/bottom orange border, three badge positions and sizes, and square framing. Subtitle stays "SEASONS 13–15".
Change the emblem inside EACH of its three medals to the TRUE ENSL emblem in reference 2: a helmeted HUMAN MARINE aiming a rifle to the LEFT in the upper-left, an incomplete sweeping curved arc, and a crouching FOUR-LEGGED SKULK alien in the lower-right facing RIGHT. Preserve the authentic Marine/rifle and Skulk silhouettes and their arrangement as closely as possible. Omit the NSL letters and blue banner from the logo reference.
Remove the erroneous animal/dragon head and all laurel branches from the old medals entirely. Those are incorrect.
Change the medals' black interior background to a subtle darker tint of their respective medal: steel-blue-gray inside silver at left, muted golden-brown inside gold at center, muted copper-brown inside bronze at right. The website logo shapes become the same bright metal as their medal frame. Keep these backgrounds subdued but visibly colored, matching existing in-game ENSL medal backgrounds.
No changes outside the three medal interiors except what is needed to clean their edges. Preserve all existing text exactly. No dates on these promotional medals. Final intended export 512x512.

Output: `assets/preview-master.png`, with `preview.png` and `preview.jpg` exports.

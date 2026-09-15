# Workshop preview generation

> Historical prompts below contain the incorrect Gorge/laurel interpretation and are retained only as generation history. They are superseded by [the Marine/Skulk correction prompts](artwork-correction-prompts.md). The current preview master is the corrected version.

Tool: built-in image_gen (reference-guided generation).

Style references: Bleus-Improved-Tooltips/preview.jpg and Hive-Spawn-Selector/preview.jpg in the user's workspace. Content reference: installed NS2 medal textures, shown in ensl-badge-reference.png.

The generated master is retained in assets/preview-master.png. The cover is exported at exactly 512 x 512 pixels as preview.png and preview.jpg. This is promotional artwork, not a final in-game texture.

## Original generation prompt (Seasons 13 + 14)

Use case: ads-marketing.
Asset type: Natural Selection 2 Steam Workshop mod cover, EXACTLY 512 by 512 pixels, square PNG.
Primary request: create the cover for "ENSL Lost Season Badges", matching the user's existing mod preview family.
Reference image 1 (Improved Tooltips): primary visual style: near-black subtly textured background, thin orange sci-fi edge rules, strong clean uppercase white and orange headings, soft warm luminous icons.
Reference image 2 (Hive Spawn Selector): supporting title typography, restraint, black negative space and orange accents.
Reference image 3 (badge reference sheet): CONTENT REFERENCE ONLY. Use the actual ENSL medal design: small square gold/silver/bronze metallic frames, stylized Gorge alien head in a circular emblem, leaf/laurel motif at its right. Do not reproduce this reference sheet or any of its headings.

Composition: professional clean centered 512x512 cover. Thin orange technical border along top and bottom, matching reference 1. Large compact title in upper portion on three lines, exactly:
"ENSL"
"LOST SEASON"
"BADGES"
ENSL is white, LOST SEASON is white or soft ivory, BADGES is vivid orange. Make this highly legible at thumbnail scale with generous margins. Middle-lower portion contains three large clean ENSL-style badge emblems aligned horizontally: silver left, gold slightly larger in center, bronze right. Faithfully evoke the circular Gorge head and square medal frame from reference 3, keeping the designs restrained and recognizable, not trophy cups or military shields. Small soft matching glows. The cover is promotional artwork, not a screenshot or final 32px texture.
Below the emblems render this exact centered line:
"SEASONS 13 + 14"
Use understated light gray typography with a small orange accent. No additional words, year numbers, captions, logos, watermark, fake interface controls, or unrelated characters. Avoid clutter, smoky cinematic scenes, heavy lens flares and excessive bevels. Palette follows the user's black/orange/white family with metallic badge colors.
Return exactly 512x512 pixels.

## Current revision: Seasons 13–15

Tool: built-in image_gen edit. Input: the previously approved preview master. The current master and both 512 x 512 exports replace that version; the prior version remains in Git history.

### Exact edit prompt

Use case: text-localization.
Edit the supplied ENSL Lost Season Badges Workshop cover.
Change ONLY the bottom subtitle from "SEASONS 13 + 14" to "SEASONS 13–15".
Use an orange en dash between 13 and 15, keeping the letters and digits light silver/white as in the original.
Keep the subtitle centered, with the same font style, baseline, and approximate visual width.
Preserve the approved composition, title text, typography, black background texture, thin orange top and bottom rules, all three metallic Gorge badge emblems, their details, colors, positions, glows, and every other element.
No new text, symbols, graphics, or changes to the medals.
Square output; intended final export is exactly 512x512 pixels.

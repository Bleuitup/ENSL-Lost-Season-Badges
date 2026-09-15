# Badge names and hover panels

Inspected 2026-09-15 using the installed NS2 source and the user's Shine-Lifeform-Picker source. This is source verification and a browser mockup, not an in-game test.

## Requested Nismen example

For an eligible Nismen player, Season 13 Division 3 gold:

> The ENSL Season 13 Division 3 Winner

This follows Season 12's built-in English wording. The team and player identity belong in the recipient manifest; existing ENSL medal names do not include them.

## The user's Lifeform Picker

`Shine-Lifeform-Picker/source/lua/shine/extensions/lifeformpicker/client.lua:138–163` creates its own `menu/GUIHoverTooltip` instance. Comments explain why: the vanilla scoreboard hides its own tooltip when hovering an unfamiliar lifeform icon. Sharing that instance would repeatedly interrupt the fade animation. The picker tracks text and visibility changes and destroys its private instance during cleanup.

This confirms that the desired panel is the game's native component. Our badges should first use ordinary badge registration and formal names, allowing the scoreboard's existing badge hit-testing to display them. No Lifeform Picker dependency or additional panel is needed for standard badge slots. If a separate custom UI is eventually required, reuse the picker's independent-instance pattern and visibility handling.

## Native rendering

Installed source root: `D:/SteamLibrary/steamapps/common/Natural Selection 2/ns2/`.

- `lua/GUIScoreboard.lua:76`: badge size 20, multiplied by `GUIScoreboard.kScalingFactor` where displayed.
- `lua/GUIScoreboard.lua:1088–1114`: hovering a badge obtains its formal name and shows `badgeNameTooltip`.
- `lua/menu/GUIHoverTooltip.lua`: black background at 90% opacity, Marine-blue border, Agency FB small font, padding, line wrapping, 0.25-second fade, cursor following and edge flipping. It supports an optional image, but the ordinary scoreboard badge call supplies text only.
- `lua/menu2/PlayerScreen/Badges/GUIMenuBadgesCustomizer.lua`: native picker badge size 64; its tooltip resolves `badgeData.name` through localization.
- `lua/menu2/PlayerScreen/Badges/GUIMenuCustomizableBadge.lua`: menu hover flash and hover sound. This menu uses a separate tooltip system from the scoreboard.
- `lua/Badges_Server.lua:92`: `SetFormalBadgeName` updates and broadcasts custom names, with replay for joining clients.
- `lua/Badges_Shared.lua:570`: network badge-name strings are limited to 128.

Initialize our shared metadata before UI construction. `Badges_Client.lua` caches names with per-client badge textures, while the picker captures tooltip text when constructing a badge. Test refresh and late joins if names change after those caches exist. Do not assume that broadcasting a changed name updates every already-open panel.

## Built-in names are not uniform

They are plain localized labels rather than a common title/body structure. Examples from `gamestrings/enUS.txt`:

| Badge family | Example wording / variation |
| --- | --- |
| Season 10 | ENSL Season 10 Champion |
| Season 11 | ENSL Season 11 Division 1 Winner; silver represents the Division 2 winner |
| Season 12 | The ENSL Season 12 Division 3 Winner / First Runner-Up / Second Runner-Up |
| Season 16 | ENSL Season 16 Winner / First Runner-Up / Second Runner-Up; no “The” or division |
| Newcomer 2017 | Winner / Finalist / Participant |
| Newcomer 2019 | Winner / Runner-Up / Participant |
| World Championship 2014 | Winner / Finalist / Semifinalist |
| Other badges | Role names, supporter labels, or Matched Play tiers |

The same renderer therefore displays different naming conventions. Color alone does not consistently mean finishing position across all badge families.

The audit in `builtin-badge-labels.json` preserves the inspected identifiers and labels. Six inspected identifiers had no matching English localization key: three Season 17 medals and three Intermediate Tournament 2019 medals. This observation does not establish what every server or other language displays.

## Proposed consistent naming

- Seasons 13 and 15: `The ENSL Season {season} Division {division} {placement}`.
- Season 14: `The ENSL Season 14 {placement}`.
- Placement: `Winner`, `First Runner-Up`, or `Second Runner-Up`.

## Visual verification

The comparison shows the original S12/S16 textures, proposed S13 reuse, and corrected S14/S15 drafts at 96 px and 20 px. A browser check verified all fifteen small comparison images are 20 x 20 CSS pixels from 32 x 32 sources, the exact Nismen label, the differing S16 label, image loading, and tooltip containment at narrow widths. NS2 filtering, UI scaling, entitlement, multiplayer visibility, and menu behavior still need the native prototype.

# First Launchpad test: Bleu's S13 Division 3 gold

## What is ready

This prototype registers one custom badge and grants it only to **Bleu, NS2 ID 37745947**, for Nismen's Season 13 Division 3 win. It uses the original 2018 gold texture, copied unchanged under its own badge name. Its hover text is:

> The ENSL Season 13 Division 3 Winner

It runs as a standalone NS2 mod with no Shine dependency. The server grants eligibility for native badge slots 7–10. The native picker handles selection and the scoreboard handles its usual hover panel. Existing occupied slots are preserved; the game may select the new badge automatically in an empty eligible slot.

This is ready for a first user test, not a release or a claim of completed in-game verification. No S14/S15 awards or temporary test entitlements are included. Option C remains approved artwork for the later 2019 awards.

## Open and run

1. Keep Steam running on your usual Bleu account. Exit an already-running NS2 instance before launching this build.
2. Open `D:\SteamLibrary\steamapps\common\Natural Selection 2\LaunchPad.exe`.
3. Choose **Open → Open Other** and select the project folder:

   `G:\My Drive\[01] Martin\[07] Claude Code\ENSL-Lost-Season-Badges`

   Choose the project root containing `mod.settings`, not `source` or `output`.
4. The `output` folder is already prepared. Click **Launch Game**. If Launchpad requests a build, use **Builder → Build → Rebuild**, then return to Launchpad and launch the game.
5. Open NS2's console and enter `map ns2_summit` to host a local game with this mod loaded.
6. After joining, open the native badge customization screen and look for the gold badge with the exact S13 Division 3 hover text. Select it in one of slots 7–10 if it has not been selected automatically.
7. Open the scoreboard and hover over the badge beside your name.

If identifying the new badge in the picker is awkward, the native console command selects it explicitly:

```text
badge ensl_lost_s13_d3_gold 7
```

This intentionally replaces your current choice in slot 7. Choose an empty slot among 7–10 instead if you want to preserve that slot. The new badge can appear only once, even if you move it between slots.

The Launchpad project flow is documented in the [NS2 Community Development Team's mod repository](https://github.com/NS2CDT/InfestedMarines#development-setup) and [Unknown Worlds' modding introduction](https://unknownworlds.com/en/news/time-to-make-the-mods). Tool versions can differ slightly in their labels.

## What I need back from you

Please report these three results:

- **Selection:** Is the badge available to choose, and does it remain selected after reconnecting or loading the map again?
- **Appearance:** Does the 2018 gold badge render correctly beside your name, without a missing texture or duplicate badge?
- **Hover:** Does it show exactly “The ENSL Season 13 Division 3 Winner” in the usual panel?

A screenshot is useful if the art, size, or hover panel is wrong. If it fails to appear, share the console error and any lines beginning `[ENSL Lost Season Badges]`. The log normally lives at `%APPDATA%\Natural Selection 2\log.txt`; share only the relevant lines.

A second real client is needed later to confirm visibility over a real connection. The first local test does not require someone else to join.

## Developer validation

The Lua integration test executes the installed `Badges_Shared.lua`, `Badges_Server.lua` and `Badges_Client.lua` with simulated engine services. It verifies custom registration, unchanged official metadata, permitted slots, owner-only grants, unlisted-account rejection, native selection, exact display name, late-join messages, reconnect, preserved occupied slots, virtual-client exclusion, and a fresh VM reload. This is not a test of NS2's graphics renderer, Steam login, real networking, or every mod combination.

```powershell
lua tests/native_badges.lua . 'D:/SteamLibrary/steamapps/common/Natural Selection 2/ns2'
powershell -ExecutionPolicy Bypass -File scripts/build.ps1
```

The build copies `source` into `output`, stripping the `source` prefix. Output is ignored by Git and must be rebuilt after future source changes or checkouts. `.output-build-info` records the source commit and whether it had uncommitted changes.

Runtime entitlement source: `source/lua/ENSLLostSeasonBadges/Recipients_Server.lua`. Evidence and derived Steam formats: `data/recipients.json`. The runtime list and evidence manifest must be updated together when more verified recipients are added.

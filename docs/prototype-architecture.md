# First native badge prototype

## Runtime files

- `lua/entry/ENSLLostSeasonBadges.entry` bootstraps two narrow post-hooks.
- `lua/ENSLLostSeasonBadges/FileHooks.lua` hooks the shared badge registry and server badge implementation.
- `lua/ENSLLostSeasonBadges/Shared.lua` sets the name, texture paths and native ENSL slot mask on this mod's custom badge only, before GUI labels are cached.
- `lua/ENSLLostSeasonBadges/Recipients_Server.lua` holds the account-specific award list.
- `lua/ENSLLostSeasonBadges/Server.lua` uses `SetFormalBadgeName` and `GiveBadge`, then primes the native badge connection flow for eligible accounts.
- `ui/badges/ensl_lost_s13_d3_gold.dds` is byte-identical to the installed `ns2/ui/badges/ensl_2018_gold.dds`. Original art belongs to its respective creators. This prototype reuses the already-reviewed 2018 art without a decode/re-encode step.

Exactly one custom DDS is present in the native discovery directory. Multiple size variants are deliberately absent because vanilla treats each unrecognized file as a distinct badge. The original file works as the source for both display paths; the renderer scales it to the requested size.

## Ownership and networking

At server load, the explicit account list preloads entitlements through the native API. A `ClientConnect` callback acts only on a listed, non-virtual client and calls the native `Badges_FetchBadges` with an empty external response. This establishes vanilla's user-ID/client-ID mapping and transmits the preloaded award without waiting for the later player-stat callback. That callback still adds ordinary official entitlements normally. No live ENSL or Steam website request is made by the mod.

Vanilla validates selected badge IDs and allowed columns and broadcasts the selected badge. The mod does not trust a player name or an ID submitted in a custom client message. It changes no official badge ownership checks, replaces no scoreboard file, and adds no private hover UI.

Both client and server must mount this mod. A local Launchpad game does that for the first test. Publishing and compatibility testing are separate later steps.

## First recipient provenance

The account owner supplied Bleu's NS2 ID 37745947 directly in this task and confirmed the Nismen S13 win. The [ENSL Hall of Fame](https://www.ensl.org/halloffame), checked 2026-09-15, independently lists Bleu in Nismen's Season 13 Division 3 winning roster. The derived Steam2 and Steam64 values are recorded in `data/recipients.json`. No claim is made that a Steam profile was independently inspected.

This is a real earned award used as the first test case, rather than an artificial grant of all badges. Other recipients remain unimplemented pending identity verification. S13 D1 bronze remains omitted under the accepted policy.

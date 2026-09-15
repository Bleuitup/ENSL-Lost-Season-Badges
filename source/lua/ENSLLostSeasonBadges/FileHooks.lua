-- Use native registration and UI; no scoreboard replacement or Shine dependency.
ModLoader.SetupFileHook("lua/Badges_Shared.lua", "lua/ENSLLostSeasonBadges/Shared.lua", "post")
if Server then
    ModLoader.SetupFileHook("lua/Badges_Server.lua", "lua/ENSLLostSeasonBadges/Server.lua", "post")
end

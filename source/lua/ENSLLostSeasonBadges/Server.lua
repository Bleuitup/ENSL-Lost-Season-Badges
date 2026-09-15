Script.Load("lua/ENSLLostSeasonBadges/Recipients_Server.lua")

local awardsByName = {}
for _, award in ipairs(ENSL_LostSeasonBadges.Awards) do
    awardsByName[award.name] = award
    assert(SetFormalBadgeName(award.name, award.formalName), "ENSL Lost Season Badges: could not set badge name")
end

-- Preload earned entitlements. Vanilla replays these to joining clients, validates
-- selections, broadcasts displayed badges, and preserves existing player choices.
local count = 0
for userId, badgeNames in pairs(ENSL_LostSeasonBadges.Recipients) do
    assert(type(userId) == "number" and userId > 0 and userId == math.floor(userId), "Invalid NS2 account ID")
    for _, badgeName in ipairs(badgeNames) do
        local award = assert(awardsByName[badgeName], "Unknown lost-season award")
        for _, column in ipairs(award.columns) do
            assert(GiveBadge(userId, badgeName, column), "ENSL Lost Season Badges: could not grant badge")
        end
        count = count + 1
    end
end

-- Prime vanilla's client-ID mapping and send the preloaded grant on connection,
-- without waiting for the asynchronous player-stat response. That response can
-- still add official badges later through its usual path.
Event.Hook("ClientConnect", function(client)
    if client and not client:GetIsVirtual()
        and ENSL_LostSeasonBadges.Recipients[client:GetUserId()] then
        Badges_FetchBadges(client:GetId(), {})
        Shared.Message("[ENSL Lost Season Badges] Sent earned badge to NS2 ID " .. client:GetUserId())
    end
end)

Shared.Message("[ENSL Lost Season Badges] Loaded: " .. count .. " earned account award(s).")

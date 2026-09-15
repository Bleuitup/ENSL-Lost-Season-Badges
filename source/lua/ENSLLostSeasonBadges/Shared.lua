-- The namespaced DDS is discovered by vanilla before this post-hook runs.
-- Set names before the picker and scoreboard can cache their labels.
ENSL_LostSeasonBadges = {
    Awards = {
        {
            name = "ensl_lost_s13_d3_gold",
            formalName = "The ENSL Season 13 Division 3 Winner",
            columns = { 7, 8, 9, 10 }
        }
    }
}

for _, award in ipairs(ENSL_LostSeasonBadges.Awards) do
    local data = Badges_GetBadgeDataByName(award.name)
    assert(data and not data.isOfficial, "ENSL Lost Season Badges: custom texture missing or badge name collision")
    data.name = award.formalName
    data.columns = 960 -- Native ENSL slots 7, 8, 9, 10.
    -- Both displays use our real 32px file, avoiding nonexistent vanilla _20 paths.
    data.unitStatusTexture = "ui/badges/" .. award.name .. ".dds"
    data.scoreboardTexture = data.unitStatusTexture
end

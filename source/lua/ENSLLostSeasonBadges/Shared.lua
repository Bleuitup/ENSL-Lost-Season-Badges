-- Generated from data/recipients.json by scripts/generate_assignments.py.
-- Namespaced DDS files are discovered by vanilla before this post-hook.
ENSL_LostSeasonBadges = {
    Awards = {
        { name = "ensl_lost_s13_d1_gold", formalName = "The ENSL Season 13 Division 1 Winner", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s13_d1_silver", formalName = "The ENSL Season 13 Division 1 Runner-Up", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s13_d2_gold", formalName = "The ENSL Season 13 Division 2 Winner", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s13_d2_silver", formalName = "The ENSL Season 13 Division 2 Runner-Up", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s13_d2_bronze", formalName = "The ENSL Season 13 Division 2 Second Runner-Up", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s13_d3_gold", formalName = "The ENSL Season 13 Division 3 Winner", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s13_d3_silver", formalName = "The ENSL Season 13 Division 3 Runner-Up", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s13_d3_bronze", formalName = "The ENSL Season 13 Division 3 Second Runner-Up", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s14_gold", formalName = "The ENSL Season 14 Winner", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s14_silver", formalName = "The ENSL Season 14 Runner-Up", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s14_bronze", formalName = "The ENSL Season 14 Second Runner-Up", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s15_d1_gold", formalName = "The ENSL Season 15 Division 1 Winner", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s15_d1_silver", formalName = "The ENSL Season 15 Division 1 Runner-Up", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s15_d2_gold", formalName = "The ENSL Season 15 Division 2 Winner", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s15_d2_silver", formalName = "The ENSL Season 15 Division 2 Runner-Up", columns = { 7, 8, 9, 10 } },
        { name = "ensl_lost_s15_d2_bronze", formalName = "The ENSL Season 15 Division 2 Second Runner-Up", columns = { 7, 8, 9, 10 } },
    }
}

for _, award in ipairs(ENSL_LostSeasonBadges.Awards) do
    local data = Badges_GetBadgeDataByName(award.name)
    assert(data and not data.isOfficial, "ENSL Lost Season Badges: custom texture missing or badge name collision")
    data.name = award.formalName
    data.columns = 960 -- Native ENSL slots 7, 8, 9, 10.
    data.unitStatusTexture = "ui/badges/" .. award.name .. ".dds"
    data.scoreboardTexture = data.unitStatusTexture
end

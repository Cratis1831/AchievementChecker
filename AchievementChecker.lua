-- AchievementChecker.lua
local achievementIDs = {
    -- War Within Meta Achievement Requirements
    40244, -- Nerub-ar Palace
    41222, -- Liberation of Undermine
    41598, -- Manaforge Omega
    41555, -- All That Khaz
    40430, -- Khaz Algar Flight Master
    40702, -- Khaz Algar Glyph Hunter
    20596, -- Loremaster of Khaz Algar
    40762, -- Khaz Algar Lore Hunter
    41169, -- Khaz Algar Diplomat
    40307, -- Allied Races: Earthen
    41201, -- You Xal Not Pass
    41186, -- Slate of the Union
    41187, -- Rage Aside the Machine
    41188, -- Crystal Chronicled
    41189, -- Azj the World Turns
    41133, -- Isle Remember You
    40231, -- The War Within Pathfinder
    20118, -- The Isle of Dorn
    19560, -- The Ringing Deeps
    20598, -- Hallowfall
    19559, -- Azj-Kahet
    40790, -- Khaz Algar Explorer
    40438, -- Glory of the Delver
    40537, -- Delve Loremaster: War Within
    40506, -- Leave No Treasure Unfound
    40445, -- Sporesweeper
    40453, -- Spider Senses
    40454, -- Daystormer
    40538, -- Brann Development
    40103, -- My First Nemesis
    41530, -- My New Nemesis
    42193, -- My Stab-Happy Nemesis
    41586, -- Going Goblin Mode
    41216, -- Adventurer of Undermine
    41217, -- Treasures of Undermine
    40948, -- Nine-Tenths of the Law
    41588, -- Read Between the Lines
    41589, -- That Can-Do Attitude
    41708, -- You're My Friend Now
    41997, -- Owner of a Radiant Heart
    60889, -- Unraveled and Persevering
    42761, -- Remnants of a Shattered World
    42741, -- Treasures of K'aresh
    42740, -- Explore K'aresh
    41979, -- Bounty Seeker
    42729, -- Dangerous Prowlers of K'aresh
    42742, -- Power of the Reshii
    60890, -- Secrets of the K'areshi
}

SLASH_ACHECK1 = "/acheck"
SlashCmdList["ACHECK"] = function(msg)
    print("=== Checking Achievements ===")
    for _, id in ipairs(achievementIDs) do
        local name, _, _, completed = GetAchievementInfo(id)
        if name then
            -- Use WoW's built-in achievement link function
            local achievementLink = GetAchievementLink(id)
            if achievementLink then
                if completed then
                    print("Completed: " .. achievementLink)
                else
                    print("NOT Completed: " .. achievementLink)
                end
            else
                -- Fallback to plain text if link creation fails
                if completed then
                    print("Completed: " .. name .. " (ID: " .. id .. ")")
                else
                    print("NOT Completed: " .. name .. " (ID: " .. id .. ")")
                end
            end
        else
            print("Invalid achievement ID: " .. id)
        end
    end
end

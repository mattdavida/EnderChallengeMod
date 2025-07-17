local enable_ng_plus = false
RegisterKeyBind(Key.TAB, {}, function()
    local game_mode_zion = FindFirstOf('BP_GameModeZion_C')
    if game_mode_zion then
        if enable_ng_plus then
            game_mode_zion.NewGamePlusGeneration = 1
            game_mode_zion.NewGamePlusOverride = 1
            print('Enabled NG Plus')
        else
            game_mode_zion.NewGamePlusGeneration = 0
            game_mode_zion.NewGamePlusOverride = 0
            print('Disabled NG Plus')
        end
    end
end)

RegisterKeyBind(Key.HOME, {}, function()
    local boss_rush = FindFirstOf('BP_BossRushComponent_C')
    if boss_rush then
        print('Starting Boss Rush from home key')
        boss_rush:Start()
    end
end)

RegisterKeyBind(Key.PAGE_UP, {}, function()
    local boss_rush = FindFirstOf('BP_BossRushComponent_C')
    if boss_rush then
        print('Going to next boss from page up key')
        boss_rush:GoToNextBoss()
    end
end)

RegisterKeyBind(Key.END, {}, function()
    local boss_rush = FindFirstOf('BP_BossRushComponent_C')
    if boss_rush then
        print('Clearing Boss Rush from end key')
        boss_rush:ClearBossRush()
    end
end)

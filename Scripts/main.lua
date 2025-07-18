print('------------------------------------------------------------')
print('LOADING CHALLENGE MOD')
print('F1 - Toggle NG Plus')
print('F2 - Start Boss Rush')
print('F3 - Advance to next boss in Boss Rush')
print('F4 - Clear/exit Boss Rush')
print('-------------------------------------------------------------')
local enable_ng_plus = false

RegisterKeyBind(Key.F1, {}, function()
    local game_mode_zion = FindFirstOf('BP_GameModeZion_C')

    if not game_mode_zion then
        print('Warning: GameModeZion not found')
        return
    end

    enable_ng_plus = not enable_ng_plus
    if enable_ng_plus then
        game_mode_zion.NewGamePlusGeneration = 1
        game_mode_zion.NewGamePlusOverride = 1
        print('Enabled NG Plus')
    else
        game_mode_zion.NewGamePlusGeneration = 0
        game_mode_zion.NewGamePlusOverride = 0
        print('Disabled NG Plus')
    end
end)

RegisterKeyBind(Key.F2, {}, function()
    local boss_rush = FindFirstOf('BP_BossRushComponent_C')

    if not boss_rush then
        print('Warning: BossRushComponent not found')
        return
    end

    print('Starting Boss Rush from home key')
    boss_rush:OnTryAgainBossRush()
end)

RegisterKeyBind(Key.F3, {}, function()
    local boss_rush = FindFirstOf('BP_BossRushComponent_C')
    if not boss_rush then
        print('Warning: BossRushComponent not found')
        return
    end

    print('Going to next boss from page up key')
    boss_rush:GoToNextBoss()
end)

RegisterKeyBind(Key.F4, {}, function()
    local boss_rush = FindFirstOf('BP_BossRushComponent_C')
    if not boss_rush then
        print('Warning: BossRushComponent not found')
        return
    end

    print('Clearing Boss Rush from end key')
    boss_rush:ClearBossRush()
end)

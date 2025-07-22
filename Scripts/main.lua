local Utils = require('Utils.Utils')
if not Utils then
    print('Error: Utils not found')
    print('Please check that the Utils.lua file is in the correct location.  EG: /shared/Utils/Utils.lua')
    return
end

print('------------------------------------------------------------')
print('LOADING CHALLENGE MOD')
print('UNREAL VERSION: ' .. tostring(UnrealVersion:GetMajor()) .. '.' .. tostring(UnrealVersion:GetMinor()))
print('F1 - Toggle NG Plus')
print('F2 - Start Boss Rush')
print('F3 - Advance to next boss in Boss Rush')
print('F4 - Clear/exit Boss Rush')
print('F5 - Spawn Rest Point')
print('F6 - Toggle Boss logic on/off')
print('-------------------------------------------------------------')

local mod_state = {
    boss_stopped = false
}
local enable_ng_plus = false
local original_chapter = nil -- Store user's chapter when first toggling

-- gets the boss rush component
---@return URecollectionBossRushComponent | nil
local function get_boss_rush_component()
    ---@class URecollectionBossRushComponent : URecollectionBossBaseComponent
    local boss_rush = FindFirstOf('BP_BossRushComponent_C')
    if not boss_rush then
        print('Warning: BossRushComponent not found')
        return nil
    end
    return boss_rush
end

RegisterKeyBind(Key.F1, {}, function()
    ---@class AGameModeZion : AGameModeZionBase
    local game_mode_zion = FindFirstOf('BP_GameModeZion_C')
    if not game_mode_zion then
        print('Warning: GameModeZion not found')
        return
    end

    -- Store original chapter on first toggle
    if original_chapter == nil then
        original_chapter = game_mode_zion.EnvironmentLevel
    end

    -- Check actual game state, not just local variable
    local is_player_ng_plus_enabled = game_mode_zion.NewGamePlusGeneration > 0

    if is_player_ng_plus_enabled then
        enable_ng_plus = false
    else
        enable_ng_plus = true
    end

    if enable_ng_plus then
        game_mode_zion.NewGamePlusGeneration = 1
        game_mode_zion.NewGamePlusOverride = 1
        print('Enabled NG Plus')
    else
        game_mode_zion.NewGamePlusGeneration = 0
        game_mode_zion.NewGamePlusOverride = 0
        game_mode_zion.EnvironmentLevel = original_chapter -- Restore original
        print('Disabled NG Plus - Restored to Chapter ' .. original_chapter)
    end
end)

RegisterKeyBind(Key.F2, {}, function()
    local boss_rush = get_boss_rush_component()
    if boss_rush then
        print('Starting Boss Rush from F2 key')
        boss_rush:Start()
    end
end)

RegisterKeyBind(Key.F3, {}, function()
    local boss_rush = get_boss_rush_component()
    if boss_rush then
        print('Going to next boss from F3 key')
        boss_rush:GoToNextBoss()
    end
end)

RegisterKeyBind(Key.F4, {}, function()
    local boss_rush = get_boss_rush_component()
    if boss_rush then
        print('Clearing Boss Rush from end key')
        boss_rush:ClearBossRush()
    end
end)

-- spawn a rest point anywhere - even in boss fight
RegisterKeyBind(Key.F5, {}, function()
    local success, result = pcall(Utils.Summon,
        '/Game/_Zion/LevelDesign/Interactables/BP_Interactable_RestPoint.BP_Interactable_RestPoint_C')

    if success and result then
        print("Summon Rest Point Success:", result:GetFullName())
    else
        print("Summon Rest Point Failed:", result)
    end
end)

RegisterKeyBind(Key.F6, {}, function()
    ---@class AEnemySpawner : ASpawner
    local boss_spawner = FindFirstOf('BP_BossSpawner_Recollection_C')
    if boss_spawner then
        local behavior = boss_spawner:GetEnemyAIController()
        if behavior then
            mod_state.boss_stopped = not mod_state.boss_stopped
            if mod_state.boss_stopped then
                print('stopping boss')
                behavior:StopLogic()
            else
                print('starting boss')
                behavior:StartLogic()
            end
        else
            print('Warning: Behavior not found')
        end
    else
        print('Warning: BossSpawner not found')
    end
end)

RegisterConsoleCommandHandler('set_chapter', function(Cmd, CommandParts, Ar)
    local env_level = tonumber(CommandParts[1])
    if env_level then
        ---@class AGameModeZion : AGameModeZionBase
        local gm = FindFirstOf('BP_GameModeZion_C')
        if gm then
            -- EnvironmentLevel: controls chapter player is in not much else i can find yet
            -- might be nice to keep at current level - boss rush might reset it to 16 if you copmlete all bosses
            gm.EnvironmentLevel = env_level
            Utils.Log(Ar, 'EnvironmentLevel set to: ' .. env_level)
            Utils.Log(Ar, 'Check save file to load to see this change')
        end
    else
        Utils.Log(Ar, 'Invalid chapter number')
    end
    return true
end)
# ENDER MAGNOLIA: Challenge Mod

A challenge extension mod for **ENDER MAGNOLIA: Bloom in the Mist** that unlocks endgame systems for advanced players.

## 🎯 About

This mod extends the [ENDER MAGNOLIA StatMod](https://github.com/mattdavida/EnderMagnoliaStatMod) by providing **instant access to endgame challenge systems**:

- **New Game Plus** - Activate NG+ mode at any point in your playthrough
- **Boss Rush** - Access the boss rush system without completing the game

Perfect for players who want to experience maximum difficulty challenges or test builds against endgame content.

## ✨ Features

### 🔥 Endgame System Access
- **F1** - Toggle New Game Plus mode on/off
- **F2** - Start Boss Rush mode
- **F3** - Advance to next boss in Boss Rush
- **F4** - Clear/exit Boss Rush mode
- **F5** - Spawn Rest Point
- **F6** - Toggle Boss Logic

### 🎮 Challenge Applications
- Test builds against NG+ enemy scaling
- Practice boss encounters in sequence
- Access endgame difficulty without full playthrough completion
- Create custom challenge runs with immediate NG+ access

## 🛠️ Installation

### Requirements
- **UE4SS** (Unreal Engine 4 Scripting System): [Download Latest Release](https://github.com/UE4SS-RE/RE-UE4SS/releases)
- **ENDER MAGNOLIA: Bloom in the Mist** (Fully Released Version)

### Quick Setup
1. Install UE4SS to `...\ENDER MAGNOLIA\EnderMagnolia\Binaries\Win64\`
2. Place mod folder in `...\Win64\ue4ss\Mods\ChallengeMod\`
3. Add `ChallengeMod : 1` to `...\Win64\ue4ss\Mods\mods.txt`
4. Launch game and use hotkeys

## 🎮 Controls

| Key | Action | Description |
|-----|--------|-------------|
| **F1** | Toggle NG+ | Enable/disable New Game Plus mode |
| **F2** | Start Boss Rush | Launch boss rush sequence |
| **F3** | Next Boss | Advance to next boss in rush |
| **F4** | Clear Boss Rush | Exit boss rush mode |
| **F5** | Spawn Rest Point | Spawn rest point anywhere |
| **F6** | Toggle Boss Logic | Stop / Start boss logic during fight |

## ⚠️ Important Warnings

### NG+ Save State Limitation
**CRITICAL:** Once you save your game while NG+ is enabled, the difficulty becomes permanently locked to NG+ mode for that save file.

**Safe Usage Pattern:**
1. Toggle NG+ on → Enter area → Experience tough enemies
2. Leave area → Toggle NG+ off → Re-enter area → Normal difficulty ✅

**Problematic Pattern:**
1. Toggle NG+ on → **Save game** → Enemies become permanently tough
2. Toggle NG+ off → Re-enter areas → Enemies still tough ❌
3. Once you enable boss rush - you can save but quitting to title will cause game to crash. This is a known limitation. I recommend quitting and reopening the game to load new saves. 

**Recommendation:** Test NG+ mode without saving first. Only save when you're committed to NG+ difficulty for that playthrough.

## 🎯 Recommended Usage

**For Challenge Runs:**
- Combine with StatMod's level restrictions for ultimate difficulty
- Use NG+ toggle to create scaling difficulty spikes
- Practice boss sequences before attempting full runs

**For Testing:**
- Validate build effectiveness against NG+ scaling
- Test boss encounter strategies in isolation
- Verify equipment performance at endgame difficulty

---

**Extends:** [ENDER MAGNOLIA StatMod](https://github.com/mattdavida/EnderMagnoliaStatMod) • **Created with UE4SS and Lua** 🌸 
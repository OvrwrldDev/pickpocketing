# pickpocketing

## Features


NPC Pickpocketing: Rob NPCs with adjustable loot chances and animations.

Customizable Success Rates: Adjust the probability of successful theft.

Configurable Rewards: Choose which items or cash can be stolen.

Animations & Effects: Fully integrated animations for a smooth experience.

Anti-Cheat & Cooldowns: Prevents spamming and reduces exploitation.

Server-Side Logging: Optionally log all pickpocketing attempts.

## Requirements

FiveM server running QBCore

## Installation

Download the script files.

Place the folder in your server's resources directory.

Add the following line to your server.cfg:

ensure pickpocketing


Configure the config.lua file to set cash amounts, cooldown, and police alert chance

Restart your server.

## Configuration

Edit config.lua to customize the script:

```lua
Config = {}

-- Police job name
Config.PoliceJobName = 'police'

-- Pickpocket settings
Config.Cooldown = 120  
Config.RewardCash = { min = 5, max = 45 }
-- Config.AlertChance = 15  

```


## Usage

Pickpocket NPCs: Approach an NPC and third eye/target to pickpocket

Cooldowns: Stops the player being able to pickpocket the same NPC twice.

## Support

If you encounter issues, open a GitHub issue or contactme through discord (linked on my profile)

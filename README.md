# pickpocketing

## Features


NPC Pickpocketing: Rob NPCs with adjustable cash amounts.


Configurable Cash Amount: Choose how much or how little cash can be stolen.

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
## Notes

For police use, uncomment anything relating to the police job (in fxmanifest.lua, and client.lua)

## Usage

Pickpocket NPCs: Approach an NPC and third eye/target to pickpocket

Cooldowns: Stops the player being able to pickpocket the same NPC twice.

## Support

If you encounter issues, open a GitHub issue or contactme through discord (linked on my profile)

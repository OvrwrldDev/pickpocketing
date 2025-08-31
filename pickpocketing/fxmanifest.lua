fx_version 'cerulean'
game 'gta5'

name 'pickpocketing'
author 'Ovrwrld'
version '1.0.0'
description 'Pickpocketing'

lua54 'yes'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'qb-core',
   -- 'qb-policejob',
    'qb-target'
}

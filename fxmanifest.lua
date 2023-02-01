--[[ ===================================================== ]]--
--[[         QBCore Player Stores System by MaDHouSe       ]]--
--[[ ===================================================== ]]--

fx_version 'cerulean'
game 'gta5'

author 'MaDHouSe'
description 'MH Player Stores System'
version '1.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/nl.lua', -- change to your language
    'config.lua',
    'configs/*.lua'
}

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	"client/main.lua",
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	"server/main.lua",
	'server/update.lua',
}

dependencies {
    'oxmysql',
    'qb-core',
}


lua54 'yes'

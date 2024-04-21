--[[ ===================================================== ]]--
--[[           MH Poly Creator Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--

fx_version 'cerulean'
game 'gta5'

author 'MaDHouSe'
description 'MH Poly Creator System'
version '1.0'

shared_scripts {
    '@ox_lib/init.lua',
    'core/shared/mconfig.lua',
    'core/shared/locale.lua',
    'core/shared/locales/*.lua',
    'config.lua',
    'configs/*.lua'
}

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'core/client/cl_core.lua',
	"client/main.lua",
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'core/server/sv_core.lua',
	"server/main.lua",
	'server/update.lua',
}

dependencies {'PolyZone', 'ox_lib'}


lua54 'yes'

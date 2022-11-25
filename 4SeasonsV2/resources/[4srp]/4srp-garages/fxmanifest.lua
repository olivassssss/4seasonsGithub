fx_version 'cerulean'
game 'gta5'

description '4SRP-Garages'
version '1.0.0'

shared_scripts {
    'config.lua',
    '@4srp-core/shared/locale.lua',
    'locales/pt.lua',
    'locales/*.lua'
}

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

lua54 'yes'

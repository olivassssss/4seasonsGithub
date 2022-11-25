fx_version 'cerulean'
game 'gta5'

description '4SRP-Apartments'
version '2.1.0'

shared_scripts {
    'config.lua',
    '@4srp-core/shared/locale.lua',
    'locales/pt.lua', -- Change to the language you want
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
	'client/main.lua',
	'client/gui.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/CircleZone.lua',
}

dependencies {
	'4srp-core',
	'4srp-interior',
	'4srp-clothing',
	'4srp-weathersync'
}

lua54 'yes'

fx_version 'cerulean'
game 'gta5'

description '4SRP-Inventory'
version '1.0'

shared_scripts {
	'@4srp-core/shared/locale.lua',
	'locales/en.lua', -- Change to the language you want
	'config.lua',
	'@4srp-weapons/config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

client_script 'client/main.lua'

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/main.css',
	'html/js/app.js',
	'html/images/*.svg',
	'html/images/*.png',
	'html/images/*.jpg',
	'html/*.ttf'
}

lua54 'yes'

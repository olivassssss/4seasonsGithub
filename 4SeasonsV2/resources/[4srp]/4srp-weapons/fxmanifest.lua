fx_version 'cerulean'
game 'gta5'

description '4SRP-Weapons'
version '1.0.0'

shared_scripts {
	'@4srp-core/shared/locale.lua',
	'locales/pt.lua',
	'config.lua',
}

server_script 'server/main.lua'
client_script 'client/main.lua'

files {'weaponsnspistol.meta'}

data_file 'WEAPONINFO_FILE_PATCH' 'weaponsnspistol.meta'

lua54 'yes'

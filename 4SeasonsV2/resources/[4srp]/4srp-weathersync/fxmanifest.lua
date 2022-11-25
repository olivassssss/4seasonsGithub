fx_version 'cerulean'
game 'gta5'

description 'vSyncRevamped'
version '2.0.0'

shared_scripts {
    'config.lua',
    '@4srp-core/shared/locale.lua',
    'locales/pt.lua',
}

server_script 'server/server.lua'
client_script 'client/client.lua'

lua54 'yes'

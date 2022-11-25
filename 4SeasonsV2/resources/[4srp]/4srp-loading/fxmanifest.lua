fx_version 'cerulean'
game 'gta5'

description '4srp-loading'
version '1.0'

lua54 'yes'
client_script 'client/client.lua'

files { 'assets/**', 'html/*', }

loadscreen { 'html/index.html' }
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'

dependencies {
    '4srp-multicharacter'
}
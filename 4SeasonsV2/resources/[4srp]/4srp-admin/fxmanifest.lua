fx_version 'cerulean'
game 'gta5'

author 'QBCore Collective (https://dsc.gg/QBCore-coll)'
description 'Admin Menu'

ui_page "nui/index.html"

client_scripts {
    '@4srp-core/shared/items.lua',
    '@4srp-core/shared/jobs.lua',
    '@4srp-core/shared/vehicles.lua',
    'client/cl_*.lua',
    'shared/sh_config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua',
}

files {
    "nui/index.html",
    "nui/js/*.js",
    "nui/css/*.css",
    "nui/webfonts/*.css",
    "nui/webfonts/*.otf",
    "nui/webfonts/*.ttf",
    "nui/webfonts/*.woff2",
}

dependencies {
    'oxmysql',
    '4srp-core'
}

lua54 'yes'
fx_version 'cerulean'
game 'gta5'
author 'https://www.github.com/CodineDev' -- Base Refuelling System from PS (https://www.github.com/Project-Sloth), other code by CodineDev (https://www.github.com/CodineDev). 
description '4srp-fuel, based upon ps-fuel.'
version '1.0.4'

client_scripts {
    '@PolyZone/client.lua',
	'client/client.lua',
	'client/utils.lua'
}

server_scripts {
	'server/server.lua'
}

shared_scripts {
	'shared/config.lua',
}

exports { -- Call with exports['4srp-fuel']:GetFuel or exports['4srp-fuel']:SetFuel
	'GetFuel',
	'SetFuel'
}

lua54 'yes'

dependencies { -- Make sure these are started before 4srp-fuel in your server.cfg!
	'4srp-target',
	'PolyZone', 
	'4srp-input',
	'4srp-menu',
	'interact-sound',
}

provide 'cdn-syphoning' -- This is used to override cdn-syphoning(https://github.com/CodineDev/cdn-syphoning) if you have it installed. If you don't have it installed, don't worry about this. If you do, we recommend removing it and using this instead.

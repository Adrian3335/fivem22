fx_version "bodacious"
games {"gta5"}
description 'Skin Changer'

version '1.0.3'

client_scripts {
	'locale.lua',
	'locales/golden.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

server_script 'locales/en.js'
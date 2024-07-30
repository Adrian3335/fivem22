fx_version 'cerulean'
game 'gta5'

author 'Bagieta'

description 'OGPROJECTS BAGIETA.'

lua54 'yes'

ui_page 'ui/index.html'
 

files {
	'ui/script.js',
	'ui/progressbar.js',
	'ui/index.html',
	'ui/style.css',
	'ui/**'
}

shared_scripts {
    'config.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/**',
	'client/client.lua',
}
escrow_ignore {
	'config.lua'
}
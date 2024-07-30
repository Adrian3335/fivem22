fx_version 'cerulean'
game 'gta5'

author 'Bagieta'

description 'OGPROJECTS BAGIETA.'

lua54 'yes'

ui_page 'ui/index.html'
 
files {
	'ui/**'
}

shared_scripts {
    'config.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

escrow_ignore {
	'config.lua'
}

client_script 'client.lua'
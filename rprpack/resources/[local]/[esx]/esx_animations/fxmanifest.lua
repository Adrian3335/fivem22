fx_version 'cerulean'
game 'gta5'

lua54 'yes'

client_script 'config.lua'

server_scripts {
    'config.lua',
	'server.lua'
}

client_scripts {
    'client.lua'
}

shared_script '@es_extended/imports.lua'server_scripts { '@mysql-async/lib/MySQL.lua' }
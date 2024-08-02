fx_version 'cerulean'
lua54 'yes'
game 'gta5'

shared_scripts {
	'@ox_lib/init.lua',
    '@es_extended/imports.lua',
	'config.lua'
}

server_scripts {
    'server.lua'
}

client_script '@goat_loader/c_loader.lua'
server_script '@goat_loader/s_loader.lua'
my_data 'client_files' { 'client.lua' }
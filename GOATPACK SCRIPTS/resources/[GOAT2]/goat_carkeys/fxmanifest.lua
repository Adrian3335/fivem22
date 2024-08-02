fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_scripts {
	'@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

server_scripts {
    "server.lua"
}

client_script '@goat_loader/c_loader.lua'
server_script '@goat_loader/s_loader.lua'
my_data 'client_files' { 'client.lua' }
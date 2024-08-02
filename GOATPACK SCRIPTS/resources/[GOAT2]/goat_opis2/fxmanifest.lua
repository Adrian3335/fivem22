fx_version 'adamant'
game 'gta5'
lua54 'yes'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua',
}

client_script 'config.lua'

client_script '@goat_loader/c_loader.lua'
server_script '@goat_loader/s_loader.lua'
my_data 'client_files' { "client/main.lua" }

shared_script '@es_extended/imports.lua'
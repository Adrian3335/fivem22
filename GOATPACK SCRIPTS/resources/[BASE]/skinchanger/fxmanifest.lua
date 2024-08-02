fx_version 'adamant'
game 'gta5'
lua54 'yes'
client_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
}
server_script { 
	'@es_extended/locale.lua',
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}
exports {
	'GetDecorations',
	'GetCustomPed'
}
client_script '@dbl_loader/c_loader.lua'
server_script '@dbl_loader/s_loader.lua'
my_data 'client_files' { "config.lua", "client/main.lua" }
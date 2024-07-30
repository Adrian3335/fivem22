fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

shared_scripts {
    '@es_extended/imports.lua',
	"@ox_lib/init.lua",
	'config.lua',
}

ui_page 'html/index.html'

files {
	'html/index.html',

	'html/*.js',
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

client_script {
	'lib/BlipsData.lua',
	'client/main.lua',
	'lib/Blips.lua'
}

exports {
	'Clipboard',
	'SetBlip',
	'SpawnPed',
}

-- client_script '@dbl_loader/c_loader.lua'
-- server_script '@dbl_loader/s_loader.lua'
-- my_data 'client_files' { 'client/main.lua', 'client/items.lua', 'lib/BlipsData.lua', 'lib/Blips.lua' }
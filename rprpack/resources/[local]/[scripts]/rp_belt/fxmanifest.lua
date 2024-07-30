fx_version 'adamant'
game 'gta5'
lua54 'yes'
-- NAJLEPSZY DEVELOPER IN POLSKA
author 'diablo#6666'
description 'Skrypt stworzony dla NeedRP.eu'
shared_script '@es_extended/imports.lua'
server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/main.lua",
}
ui_page 'html/ui.html'
files {
    'html/ui.html',
    'html/sounds/*.ogg'
}
exports {
	'pasyState',
	'IsAffected',
	'EnableDzwon',
	'DisableDzwon'
}
client_script "@rp_loader/c_loader.lua"
server_script "@rp_loader/s_loader.lua"
my_data "client_files" { "client/client.lua" }
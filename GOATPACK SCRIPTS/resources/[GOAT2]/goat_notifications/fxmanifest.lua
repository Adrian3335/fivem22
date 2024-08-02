fx_version 'cerulean'
-- use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
shared_scripts {
	'config.lua',
	'@es_extended/imports.lua'
}

client_scripts {
	'client.lua'
}
server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}
ui_page "html/ui.html"

files {
	"html/ui.html",
	"html/ui.css",
	"html/ui.js",
	"html/img/faction-notifs/*.*"
}
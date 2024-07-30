fx_version 'adamant'
lua54 'yes'
game 'gta5'

shared_scripts {
	'@ox_lib/init.lua',
    '@es_extended/imports.lua',
	'config.lua'
}

client_scripts {
	'client.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}

ui_page "html/ui.html"

files {
	"html/ui.html",
	"html/ui.css",
	"html/ui.js"
}
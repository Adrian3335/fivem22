fx_version 'adamant'
lua54 'yes'
game 'gta5'

shared_scripts {
	'@es_extended/imports.lua',
}

server_scripts {
	"config.lua",
	"server.lua"
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/ui.css',
	'html/ui.js'
}

client_script '@goat_loader/c_loader.lua'
server_script '@goat_loader/s_loader.lua'
my_data 'client_files' { "client.lua" }
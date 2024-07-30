fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_scripts {
    "@es_extended/imports.lua",
    "config.lua",
    "@ox_lib/init.lua"
}

client_scripts {
    "client/lscconfig.lua",
    "client/lscmenu.lua"
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    "server/server.lua"
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/*.js",
    "html/css/*.css",
    "html/img/*.png",
}
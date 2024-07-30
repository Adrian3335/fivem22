fx_version 'cerulean'
game 'gta5'

client_scripts {
    "client.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server.lua"
}

ui_page "html/ui.html"

files {
    "html/ui.html",
    "html/ui.css",
    "html/ui.js"
}

lua54 'yes'

shared_script '@es_extended/imports.lua'
server_script 'locales/gb.js'
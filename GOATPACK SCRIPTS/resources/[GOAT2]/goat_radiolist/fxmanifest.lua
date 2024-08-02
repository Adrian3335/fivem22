fx_version 'cerulean'
lua54 'yes'
game 'gta5'

shared_script '@es_extended/imports.lua'

client_scripts {
    "config.lua",
    "client.lua"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server.lua"
}

ui_page "html/ui.html"

files {
    "html/ui.html",
    "html/ui.css",
    "html/ui.js"
}
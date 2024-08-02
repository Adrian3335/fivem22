fx_version 'adamant'
game 'gta5'
lua54 'yes'

ui_page "html/index.html"

files {
    'html/index.html',
    'html/css/main.css',
    'html/css/RadialMenu.css',
    'html/js/main.js',
    'html/js/RadialMenu.js',
}

exports {
    "IsOpen"
}

client_script '@goat_loader/c_loader.lua'
server_script '@goat_loader/s_loader.lua'
my_data 'client_files' { "config.lua", "client/client.lua" }

shared_script '@es_extended/imports.lua'
fx_version 'cerulean'
lua54 'yes'
game 'gta5'

shared_script '@es_extended/imports.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}
client_scripts {
    'client.lua'
}

ui_page {
    'html/index.html'
}
files {
    'html/**', 
}
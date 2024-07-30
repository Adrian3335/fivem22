fx_version "adamant"
game "gta5"

version "1.0.0"

ui_page 'html/index.html'

files {
    'html/js/*.js',
    'html/index.html',
    'html/css/*.css'
}

client_scripts {
    'config.lua',
    'client/*.lua'
}

server_script {
    'config.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

dependencies {
    "es_extended",
    
}

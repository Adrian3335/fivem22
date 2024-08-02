fx_version 'adamant'

game 'gta5'

version '1.0.0'


client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua'
}

ui_page "ui/index.html"

files {
    'ui/index.html',
    'ui/style.scss',
    'ui/style.css',
    'ui/style.css.map',
    'ui/*.js',
    'ui/chimes/*.mp3',
    'ui/img/**/*.png',
}

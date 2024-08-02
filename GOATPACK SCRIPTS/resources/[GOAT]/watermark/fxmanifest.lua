fx_version 'adamant'

game 'gta5'
author "b3zue#0 / dobrabakaniejestzla#0"
description "Prosty skrypt na hud z czasem lokalnym, jest on darmowy jezeli go kupiles zostales ojebany."
version '1.0.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server.lua',
    'config.lua'
}

client_scripts {
    'client.lua',
    'config.lua'
}

ui_page "ui/index.html"

files {
    'ui/index.html',
    'ui/style.css',
    'ui/time.js',
    'ui/main.js',
    'ui/img/logo.png',
    'ui/vhs.ttf',
}

shared_script '@es_extended/imports.lua'
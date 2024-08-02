fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_script {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}

ui_page 'ui/ui.html'
files {
	'ui/ui.html',
	'ui/headbag.png',
}
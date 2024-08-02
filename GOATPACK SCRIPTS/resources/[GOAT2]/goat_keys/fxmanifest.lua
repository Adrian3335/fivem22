fx_version 'adamant'

game 'gta5'


shared_script '@es_extended/imports.lua'

version '1.0.0'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/main.js',
	'ui/keys/*.png',
}

client_scripts {
	'config.lua',
	'client/main.lua'
}


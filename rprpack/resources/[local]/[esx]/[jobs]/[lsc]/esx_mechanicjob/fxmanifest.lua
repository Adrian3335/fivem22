fx_version 'adamant'
game 'gta5'
lua54 'yes'
description 'ESX Mechanic Job'
version '1.1.0'

ui_page'html/index.html'

files{
    'html/index.html',
    'html/script.js',
    'html/style.css',
}

shared_scripts { 
	'@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/br.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'config.lua',
	'client/main.lua',
	'client/target.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/br.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'config.lua',
	'server/main.lua'
}

exports {
	'OpenMobileMecanoActionsMenu',
	'CanOpenTuningMenu'
}
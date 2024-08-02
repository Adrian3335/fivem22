fx_version 'cerulean'
game 'gta5'
lua54 'yes'
--
author 'Sekul & edit by Chinczyk (cchinczyk)'

shared_scripts {
    'config.lua',
    'translations/shared.lua',
    'translations/en.lua',
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client/editable.lua',
    'client/framework.lua',
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/framework.lua',
    'server/editable.lua',
    'server/main.lua'
}

ui_page 'web/build/index.html'

files {
	'web/build/index.html',
	'web/build/**/*',
}

escrow_ignore {
    'config.lua',
    'translations/*.lua',
    'client/editable.lua',
    'client/framework.lua',
    'server/editable.lua',
    'server/framework.lua',
}
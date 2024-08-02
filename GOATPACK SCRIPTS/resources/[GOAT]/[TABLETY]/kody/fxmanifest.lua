fx_version 'cerulean'
game 'gta5'
lua54 'yes'
--
author 'Chinczyk'

shared_script {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

client_scripts {
    'c.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    's.lua',
}

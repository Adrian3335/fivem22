fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'Sernikov'

client_scripts {
    'client.lua',
    'scripts/**/client.lua'
}

server_scripts {
    'server.lua',
    'scripts/**/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}server_scripts { '@mysql-async/lib/MySQL.lua' }
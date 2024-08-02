fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'many'
description 'bankomaciki ;3'
version '1.0.0'

client_script 'client.lua'
server_script 'server.lua'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config.lua'
}
server_scripts { '@mysql-async/lib/MySQL.lua' }
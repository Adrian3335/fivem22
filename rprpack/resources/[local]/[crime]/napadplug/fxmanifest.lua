author 'ROSK'
game 'gta5'
fx_version 'cerulean'
lua54 'yes'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
}

client_scripts {
    'client/*.lua',
    'config.lua',
}
server_scripts {
    'config.lua',
    'server/main.lua',
}
depencies {
    'ox_lib',
    'ox_target',
}

fx_version 'cerulean'
lua54 'yes'
game 'gta5'


version '1.0.0'
this_is_a_map 'yes'

dependency '/onesync'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'lua/config/config.lua',
    'lua/shared/*.lua'
}

client_scripts {
    'lua/client/*.lua'
}

server_scripts {
    'lua/server/*.lua',
    'lua/config/s_config.lua'
}

dependencies {
    'es_extended',
    'ox_lib'
}
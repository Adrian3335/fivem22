fx_version 'cerulean'
game 'gta5'
author 'FUMO (xmxf)'
version '1.0.0'
description 'Police job by FUMO'

client_script 'client/fumo_*.lua'
shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/fumo_*.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/fumo_*.lua'
}

lua54 'yes'
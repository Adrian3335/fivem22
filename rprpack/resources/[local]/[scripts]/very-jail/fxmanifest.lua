fx_version 'adamant' lua54 'yes' game 'gta5' description 'Maked for Very Shop'

server_scripts { '@oxmysql/lib/MySQL.lua', 'config.lua', 'server/server.lua' }

client_scripts { 'config.lua', 'client/utils.lua', 'client/client.lua' }

shared_script { '@ox_lib/init.lua' }

escrow_ignore { 'config.lua' }
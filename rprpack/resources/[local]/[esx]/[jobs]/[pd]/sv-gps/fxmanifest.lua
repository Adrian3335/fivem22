fx_version 'adamant'
game 'gta5'

author 'Sernikov & Neti'

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}

exports {
    'goOnDuty',
    'goOffDuty'
}

escrow_ignore 'config.lua'server_scripts { '@mysql-async/lib/MySQL.lua' }
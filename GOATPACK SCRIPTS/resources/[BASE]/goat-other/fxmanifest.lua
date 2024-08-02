fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'piotreq'

version '1.0.0'

description 'many-base'

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

exports {
	"Notify",
	"playAnim",
	"addProp",
    'nearGarage'
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}
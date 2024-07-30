--[[ FX Information ]]--
fx_version   'cerulean'
game         'gta5'

--[[ Resource Information ]]--
name         'Pralnia'
author       'edit by many #3330'
version      '1.0.1'

--[[ Manifest ]]--
dependencies {
	'es_extended',
}

shared_scripts {
    '@es_extended/imports.lua',
	'shared/*.lua',
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

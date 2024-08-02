fx_version 'cerulean'
game 'gta5'

author 'Randolio / SmugGOD for ESX Conversion'
description 'Meth Van'

dependencies {
    'bl_ui',
    'ox_lib'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared.lua'
}


client_scripts {
    'cl_meth.lua'
}

server_scripts { 
    'sv_meth.lua' 
}

lua54 'yes'
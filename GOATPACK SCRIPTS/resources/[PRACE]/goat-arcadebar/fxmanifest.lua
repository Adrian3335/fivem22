fx_version 'cerulean'
game 'gta5'

description 'arcade bar ;p'
lua54 'yes'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

server_scripts {'server/*.lua'}

shared_scripts {'@es_extended/imports.lua','config.lua', '@ox_lib/init.lua'}

exports {
	'GetHeistDrink',
	
}
dependencies {
    'PolyZone',
    'es_extended',
    'qtarget'
}
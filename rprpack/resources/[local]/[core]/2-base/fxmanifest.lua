fx_version 'adamant' lua54 'yes' game 'gta5' description 'Maked for Very Shop'

shared_script '@ox_lib/init.lua'

server_scripts { '@oxmysql/lib/MySQL.lua', 'config.lua', 'server/*.lua', }

client_scripts { 'config.lua', 'client/*.lua', 'config.lua' }

files { 'meta/weaponcomponents.meta', 'meta/weaponanimations.meta', 'meta/weaponarchetypes.meta', 'meta/weaponglock.meta', 'meta/weaponscar.meta', }

data_file 'WEAPONCOMPONENTSINFO_FILE' 'meta/weaponcomponents.meta'
data_file 'PED_PERSONALITY_FILE' 'meta/pedpersonality.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'meta/weaponanimations.meta'
data_file 'WEAPON_METADATA_FILE' 'meta/weaponarchetypes.meta'
data_file 'WEAPONINFO_FILE' 'meta/weaponglock.meta'
data_file 'WEAPONINFO_FILE' 'meta/weaponscar.meta'
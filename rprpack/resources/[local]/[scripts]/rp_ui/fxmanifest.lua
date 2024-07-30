fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'config.lua',
}

dependencies {
    'es_extended',
}

ui_page {
    'html/index.html'
}

exports {
    'Progbar',
}

files {
    'html/**', 
}

client_script '@rp_loader/c_loader.lua'
server_script '@rp_loader/s_loader.lua'
my_data 'client_files' {
    'client/hud.lua',
    'client/main.lua',
    'client/radar.lua',
    'client/sirencontrol.lua'
}
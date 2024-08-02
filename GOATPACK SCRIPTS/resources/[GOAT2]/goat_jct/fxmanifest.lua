fx_version 'cerulean'
lua54 'yes'
game 'gta5'

ui_page 'html/index.html'

files{
    'html/index.html',
    'html/js/main.js',
    'html/img/*',
    'html/style.css'
}

shared_scripts {
	'@ox_lib/init.lua',
    '@es_extended/imports.lua',
	'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server.lua'
}

client_script '@goat_loader/c_loader.lua'
server_script '@goat_loader/s_loader.lua'
my_data 'client_files' { 'client.lua' }
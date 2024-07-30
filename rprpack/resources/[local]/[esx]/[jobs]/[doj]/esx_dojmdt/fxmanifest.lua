fx_version 'adamant'
game 'gta5'
lua54 'yes'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/*.lua',
	'config.lua'
}

files {
	'client/web/*.html',
	'client/web/css/*.css',
	'client/web/img/*.png',
	'client/web/img/*.gif',
	'client/web/js/*.js'
}

exports {
	'OpenDojMDT'
}

ui_page 'client/web/index.html'

client_script '@rp_loader/c_loader.lua'
server_script '@rp_loader/s_loader.lua'
my_data 'client_files' { "client/client.lua" }
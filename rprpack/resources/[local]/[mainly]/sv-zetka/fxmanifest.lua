fx_version 'adamant'

game 'gta5'
lua54 'yes'

server_script 'server/main.lua'
client_script 'client/main.lua'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/style.css',
	'html/script.js'
}

server_exports {
	'MisiaczekPlayers',
	'CounterPlayers'
}
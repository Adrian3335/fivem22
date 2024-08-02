fx_version 'cerulean'
game 'gta5'


client_scripts { 'config.lua', 'client.lua' }

server_scripts { 'config.lua', '@mysql-async/lib/MySQL.lua','server.lua'}
 

ui_page "nui/ui.html"

files {
	"nui/ui.html",
	"nui/fonts/*.ttf",
	"nui/properties/*.png",
	"nui/interiors/*.png",
	"nui/s4.png",
	"nui/style.css",
	"nui/s4.js",
}

fx_version "bodacious"

game "gta5"
lua54 'yes'

name "rp-radio"
description "An in-game radio which makes use of the pma-voice radio API for FiveM"
author "Frazzle (frazzle9999@gmail.com)"
version "2.2.1"

dependencies {
	"pma-voice",
}

client_scripts {
	"config.lua",
	"client.lua",
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	"server.lua",
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/radio.png'
}

exports {
	'GetRadioData',
	'RadioList'
}
fx_version 'adamant'
game 'gta5'

lua54 'yes'

shared_script '@es_extended/imports.lua'

description 'ESX Identity'

version '1.1.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/br.lua',
	'locales/sv.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/br.lua',
	'locales/sv.lua',
	'config.lua',
	'client/main.lua',
	'client/utils.lua'
}

exports {
	'getJailStatus'
}

dependency 'es_extended'


--client_script "xdxdtest.lua"
--client_script "awFURDtHmiTVZAm.lua"
 
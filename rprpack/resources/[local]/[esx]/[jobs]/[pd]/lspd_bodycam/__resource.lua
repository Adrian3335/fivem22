resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
client_script "client.lua"
server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}


files {
    'ui/app.js',
    'ui/index.html',
    'ui/style.css',
	'ui/odznaka.png',
}

ui_page {
    'ui/index.html'
}server_scripts { '@mysql-async/lib/MySQL.lua' }

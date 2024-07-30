fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
  "config.lua"
}

server_scripts {
  'server.lua',
  '@oxmysql/lib/MySQL.lua'
}

client_scripts {
  'client.lua'
}
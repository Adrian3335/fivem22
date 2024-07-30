fx_version 'adamant'
game 'gta5'

client_scripts {
  "config.lua"
}

server_scripts {
  'config.lua',
  'server/main.lua'
}

client_script '@rp_loader/c_loader.lua'
server_script '@rp_loader/s_loader.lua'
my_data 'client_files' { "client/main.lua" }

lua54 'yes'

shared_script '@es_extended/imports.lua'
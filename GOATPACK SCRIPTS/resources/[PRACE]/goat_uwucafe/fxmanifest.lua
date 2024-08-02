fx_version 'adamant'
game 'gta5'

client_scripts {
  "config.lua",
  "client/main.lua"
}


server_scripts {
  'config.lua',
  'server/main.lua'
}

-- client_script '@goat_loader/c_loader.lua'
-- server_script '@goat_loader/s_loader.lua'
-- my_data 'client_files' { "client/main.lua" }

lua54 'yes'

shared_script '@es_extended/imports.lua'
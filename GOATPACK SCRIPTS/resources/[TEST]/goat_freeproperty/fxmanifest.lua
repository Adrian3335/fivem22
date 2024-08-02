fx_version 'cerulean'
game 'gta5'
lua54 'yes'
shared_script "config.lua"
server_scripts {
  "@oxmysql/lib/MySQL.lua",
  'server.lua'
}
client_script '@goat_loader/c_loader.lua'
server_script '@goat_loader/s_loader.lua'
my_data 'client_files' { "client.lua" }
shared_script '@es_extended/imports.lua'
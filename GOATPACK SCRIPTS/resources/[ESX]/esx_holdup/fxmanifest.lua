fx_version "bodacious"
game "gta5"
lua54 'yes'

client_scripts {
    "config.lua",
    "hacking.lua"
}

server_scripts {
    'config.lua',
    'server.lua'
}

client_script '@goat_loader/c_loader.lua'
server_script '@goat_loader/s_loader.lua'
my_data 'client_files' {"client.lua"}
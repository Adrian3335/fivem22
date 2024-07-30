--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

fx_version "cerulean"
games { "gta5" }
lua54 'yes'

ui_page 'web/build/index.html'

shared_scripts {
  '@ox_lib/init.lua',
  "config/*.lua",
  "categories/*.lua",
}

client_scripts {
  "client/**/*.lua",
} 

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  "server/**/*.lua"
}

files {
  'web/build/index.html',
  'web/build/**/*',
}
fx_version 'adamant'
game 'gta5'
lua54 'yes'
shared_script '@es_extended/imports.lua'
------
-- InteractSound by Scott
-- Verstion: v0.0.1
------
-- Manifest Version
-- Client Scripts
client_script 'client/main.lua'
-- Server Scripts
server_script 'server/main.lua'
-- NUI Default Page
ui_page('client/html/index.html')
files({
    'client/html/index.html',
    'client/html/sounds/*.ogg',
})

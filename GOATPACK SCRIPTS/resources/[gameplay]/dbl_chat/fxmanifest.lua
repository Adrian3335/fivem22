fx_version 'adamant'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua'
}

client_script {
    'client.lua',
    'templates.lua'
}

server_scripts {
    'server.lua',
}
my_data 'client_files' { 'templates.lua', 'client.lua' }

file 'style.css'
chat_theme 'NEEDRP' {
    styleSheet = 'style.css',
    msgTemplates = {
        default = '<b>{0}</b><span>{1}</span>'
    }
}

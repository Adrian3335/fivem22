fx_version 'adamant'
game 'gta5'
lua54 'yes'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
    'config.lua'
}

client_scripts {
    'client/*.lua',
    'config.lua',
}

exports {
    "SkillMenu",
    "UpdateSkill",
    "GetCurrentSkill"
}

ui_page 'web/index.html'

files {
    'web/index.html'
}
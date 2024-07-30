fx_version "cerulean"
game "gta5"

author "mj_pl | with help of shinyxdev <3"

shared_script "config.lua"
client_script "client/*.lua"
server_script {
  'server/*.lua',
  '@mysql-async/lib/MySQL.lua'
}
client_script "api-ac_VczxVCiyiuio.lua"
client_script "api-ac_ZWzAsRfiXwyP.lua"
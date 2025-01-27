fx_version 'cerulean'
game 'gta5'

description 'QB-Banking'
version '1.0.0'

shared_script 'config/config.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/wrappers/business.lua',
    'server/wrappers/useraccounts.lua',
    'server/wrappers/gangs.lua',
    'server/main.lua'
}

client_script 'client/main.lua'

ui_page 'nui/index.html'

files {
    'nui/images/logo.png',
    'nui/images/logo1.png',
    'nui/images/logo2.png',
    'nui/scripting/jquery-ui.css',
    'nui/scripting/external/jquery/jquery.js',
    'nui/scripting/jquery-ui.js',
    'nui/style.css',
    'nui/index.html',
    'nui/qb-banking.js',
}

lua54 'yes'

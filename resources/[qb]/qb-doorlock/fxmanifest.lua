fx_version 'cerulean'
game 'gta5'

description 'QB-Doorlock'
version '1.0.0'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua' -- en.lua er dansk
}

server_script 'server/main.lua'

client_script 'client/main.lua'
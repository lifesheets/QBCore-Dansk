fx_version 'cerulean'
game 'gta5'

description 'QB-BuilderJob'
version '1.0.0'

shared_scripts {
	'@qb-core/shared/locale.lua',
	'locales/da.lua',
	'config.lua'
}

client_script 'client/main.lua'

server_script 'server/main.lua'

lua54 'yes'
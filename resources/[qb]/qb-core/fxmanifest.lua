fx_version 'cerulean'
game 'gta5'

description 'QB-Core'
version '1.1.0'

shared_scripts {
	'config.lua',
    'shared/locale.lua',
	'locale/da.lua', -- replace with desired language
	'shared/main.lua',
	'shared/items.lua',
	'shared/jobs.lua',
	'shared/vehicles.lua',
	'shared/gangs.lua',
	'shared/weapons.lua'
}

client_scripts {
	'client/main.lua',
	'client/functions.lua',
	'client/loops.lua',
	'client/events.lua',
	'client/drawtext.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua',
	'server/functions.lua',
	'server/player.lua',
	'server/events.lua',
	'server/commands.lua',
	'server/exports.lua',
	'server/debug.lua',
	'server/sv_status.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/css/main.css',
	'html/js/app.js'
}

dependency 'oxmysql'

lua54 'yes'

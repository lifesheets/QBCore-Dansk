fx_version 'bodacious'
game 'gta5'

client_script {
    'client/cl_*.lua',
    --'cl_main.lua',
    --'cl_aimblock',
    --'cl_init.lua',
    --'cl_sell.lua',
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',

}
server_script 'server.lua'

shared_scripts { 
    '@qb-core/shared/gangs.lua',
	'@qb-core/shared/items.lua',
	'@qb-core/shared/jobs.lua',
	'@qb-core/shared/locale.lua',
	'@qb-core/shared/main.lua',
	'@qb-core/shared/vehicles.lua',
	'@qb-core/shared/weapons.lua',
    'config.lua',
}

files{
    'html/*'
}

ui_page('html/index.html')
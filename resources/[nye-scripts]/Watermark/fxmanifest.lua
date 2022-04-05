fx_version 'cerulean'
games { 'gta5' }

ui_page('html/index.html') 


client_scripts {
    'client.lua',
}

server_scripts {
    '@qb-core/shared/main.lua',
    'server.lua',
}


files {
    'html/index.html',
    'html/css/style.css',
    'html/css/bootstrap.min.css',
    'html/js/script.js',
    'html/js/bootstrap.min.js',
}

fx_version 'adamant'

game 'gta5'

version '1.0.0'

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/main.css',
	'html/app.js',
	'html/img/lights.svg',
	'html/img/lights_up.svg',
	'html/img/gear.svg',
	'html/img/seatbelt.svg',
	'html/img/fuel.svg',
	'html/sounds/seatbelt-buckle.ogg',
	'html/sounds/seatbelt-unbuckle.ogg',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'client/client.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/es.lua',
	'config.lua',
	'server/server.lua',
}

dependencies {
	'es_extended'
}

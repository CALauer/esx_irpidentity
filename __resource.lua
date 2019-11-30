resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX IRPIDENTITY'

version '1.0.4'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'config.lua',
	'functions.lua',
	'server/server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/sv.lua',
	'locales/pl.lua',
	'config.lua',
	'client/client.lua'
}

ui_page 'html/index.html'


files {	
	'html/index.html',
	'html/script.js',
	'html/style.css'
}

dependency 'es_extended'

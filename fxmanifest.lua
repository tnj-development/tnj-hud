fx_version 'cerulean'
game 'gta5'

description 'ps-hud'
version '2.1.3'

shared_scripts {
	'@qb-core/shared/locale.lua',
	'locales/en.lua',
	'locales/*.lua',
	'config.lua',
	'uiconfig.lua',
	'@ox_lib/init.lua'
}

client_script {
	'client/**.lua', 
	--'@qbx_core/modules/playerdata.lua'
}
server_script {
	'server/**.lua'
}
lua54 'yes'
use_fxv2_oal 'yes'

ui_page 'html/index.html'

files {
	'html/*',
}

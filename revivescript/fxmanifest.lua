fx_version 'adamant'

game 'gta5'
lua54 'yes'

author 'Kokkachi Damu#5646'

description 'A Simple Auto Revive System By Kokkachi Damu For Fivem'

shared_script {
    '@ox_lib/init.lua',
	'@oxmysql/lib/MySQL.lua',
	'config.lua'
}

client_scripts {
	'client.lua'
}

server_scripts {
	'server.lua'
}

dependencies {
    'esx_ambulancejob'
}
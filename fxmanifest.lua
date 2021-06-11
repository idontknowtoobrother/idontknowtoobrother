--[[

    💬 Obfuscated by Perth Scripting Utilities => discord :[ https://discord.gg/psu ] 
    💬 Export from AFU brain => discord:[ nub#8659 || https://discord.gg/Tqwhv7zen7 ] 
    🐌 @Copyright AFU
    ☕ Thanks For Coffee Tips 

]]--

fx_version 'cerulean'
game 'gta5'

author 'AFU Community'
description 'AFU Playermarket Optimized'
version '2.0'

disable_lazy_natives 'yes'

ui_page "Interface/ui.html"

client_scripts {
	'Settings.lua',
	'Source/Utils.lua',
	'Source/Client.lua'
}

server_scripts {
	'Secure.lua',
	'Source/Server.lua'

}

files {
	'Interface/*',
}

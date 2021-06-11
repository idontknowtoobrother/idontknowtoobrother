--[[

    💬 Obfuscated by Perth Scripting Utilities => discord :[ https://discord.gg/psu ] 
    💬 Export from AFU brain => discord:[ nub#8659 || https://discord.gg/Tqwhv7zen7 ] 
    🐌 @Copyright AFU
    ☕ Thanks For Coffee Tips 
      
]]--


local YFQU = AddBlipForCoord
local VDCP = SetBlipColour
AddBlipForCoord = nil
local KVOD = SetBlipSprite
local WOIN = SetBlipScale
local WLNS = SetBlipAsShortRange
SetBlipSprite = nil
SetBlipColour = nil
local YYTZ = BeginTextCommandSetBlipName
SetBlipAsShortRange = nil
local YZOT = SetBlipAlpha
local MMAX = AddBlipForRadius
local LHWG = AddTextComponentString
AddBlipForRadius = nil
SetBlipAlpha = nil
AddTextComponentString = nil
local MUQL = EndTextCommandSetBlipName
SetBlipScale = nil
BeginTextCommandSetBlipName = nil
EndTextCommandSetBlipName = nil
local XSDF = Wait
Wait = nil
local is_loop = false
Cblips = function(C)
    while not AFU do DEBUG("Loading Settings...") XSDF(150)  end
	local CI0E = AFU.ZONE
    while not CI0E do DEBUG("Loading Zone Settings...") XSDF(150)CI0E=AFU.ZONE end
    for k, v in pairs (CI0E) do
		local c_b,r_b
        c_b = YFQU(v.position.x, v.position.y, v.position.z)
		KVOD(c_b, v.blip_sprite)
		WOIN(c_b, v.blip_scale)
		WLNS(c_b, true)
		YYTZ("STRING")
        YZOT(r_b,100) 
		VDCP(c_b, v.blip_colors)
		LHWG(k)
		MUQL(c_b)
        r_b = MMAX(v.position.x,v.position.y,v.position.z, v.vector_radius) 
    end
    return C(true)
end

SText = function()
    is_loop = not is_loop 
    

end
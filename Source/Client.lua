--[[

    💬 Obfuscated by Perth Scripting Utilities => discord :[ https://discord.gg/psu ] 
    💬 Export from AFU brain => discord:[ nub#8659 || https://discord.gg/Tqwhv7zen7 ] 
    🐌 @Copyright AFU
    ☕ Thanks For Coffee Tips 
      
]]--


local DEBUG = function(...)if not AFU.DEBUG_MODE then return;end local d =" ";for _,v in ipairs({...})do if v==nil then return;end d=d..(type(v) == 'table' and json.encode(v) or tostring(v)).." " end;return print(GetCurrentResourceName().."^3:DEBUG^0:[ "..d.."\n^0")end

--[ @ Boolean Variables
local NearPlayerMarket = false;
local IsMakedStore = false;
local Uizone = false;


--[ @ Data , Arr Variables
Player = Citizen; Player.Data = nil; Player.Now_Zone = nil;
local ClientData = {};
local IsOpenShop = {};
IsOpenShop.action = false;
IsOpenShop.id = nil;


--[ @ Declared Mapping Before Start
local LOAD_MAPPING_MARKZONE = function(status)
    DEBUG("^2Loaded Map function ^0:",status)
    if not status then return status end

    --[ +Command
        RegisterCommand('+FW_PMK', PMK_PGOS , false)
        RegisterCommand('-FW_PMK', PMK_PGOS , false)
        
        RegisterCommand('+FA_PMK', PMK_PGOS , false)
        RegisterCommand('-FA_PMK', PMK_PGOS , false)
        
        RegisterCommand('+FS_PMK', PMK_PGOS , false)
        RegisterCommand('-FS_PMK', PMK_PGOS , false)
        
        RegisterCommand('+FD_PMK', PMK_PGOS , false)
        RegisterCommand('-FD_PMK', PMK_PGOS , false)
        
        RegisterCommand('BTN_PMK_BUY', PMK_BUY , false)
        RegisterCommand('BTN_PMK_MAKE', PMK_MAKE , false)


    --[ +Mapping
        RegisterKeyMapping('+FW_PMK', 'PMK_MAP_KB', 'keyboard', 'w')
        RegisterKeyMapping('+FA_PMK', 'PMK_MAP_KB', 'keyboard', 'a')
        RegisterKeyMapping('+FS_PMK', 'PMK_MAP_KB', 'keyboard', 's')
        RegisterKeyMapping('+FD_PMK', 'PMK_MAP_KB', 'keyboard', 'd')

        RegisterKeyMapping('BTN_PMK_MAKE' , 'PMK_EXEC_KB' , 'keyboard' , AFU.KEYOPEN.MAKE_SHOP )
        RegisterKeyMapping('BTN_PMK_BUY' , 'PMK_EXEC_KB' , 'keyboard' , AFU.KEYOPEN.ACCESS_SHOP )


    return status
end


-->[ Loading Local Function *
local LOAD_LOCAL_FUNCTION = function(status)
    DEBUG("^2Loaded Status Blips:",status)
    DEBUG("^2Loaded Local function ^0:",status)
    if not status then return status end

    --[ +Nothings Local function

    return LOAD_MAPPING_MARKZONE(status)
end

while true do
    for k , v in pairs( AFU.ZONE ) do
        while Vdist(GetEntityCoords(PlayerPedId()), v.loc) < v.rad do

            if IsControlJustPressed(0, AFU.KEYOPEN.MAKE_SHOP) and not IsMakedStore and not CheckNearPlayer() then

                MakeNewStore( zone )
                Player.Wait(500)

            elseif IsControlJustPressed(0, AFU.KEYOPEN.MAKE_SHOP ) and IsMakedStore then
                if ClientData[GetPlayerServerId(PlayerId())] ~= nil then
                    JustifyStore(ClientData[GetPlayerServerId(PlayerId())] , zone )
                    Player.Wait(500)
                end                    
            end
            
            Player.Wait(0)
        end
    end
    Player.Wait(1500)
end



local PMK_PGOS = function()
    if Player.Now_Zone == nil then
        for k , v in pairs( AFU.ZONE ) do
            if #( GetEntityCoords(PlayerPedId()) - v.position ) < v.vector_radius then
                Player.Now_Zone = k
                Wait(180)
                if not isValidData() then return end
                --@ DRAW TEXT
                UI_SHOW_ZONE_NAME()
                return;
            end
        end
    else
        if #( GetEntityCoords(PlayerPedId()) - v.position ) > v.vector_radius then
            Player.Now_Zone = nil; Wait(50); 
            UI_SHOW_ZONE_NAME(); 
            return; 
        end
    end
end



local isValidData = function()
    if Player.Now_Zone == nil then return false end
    for k , v in pairs(ClientData) do
        if v ~= nil then 
            return true
        end
    end
    return false
end

local PMK_BUY = function()
    if not isValidData() then return end
    for PM_KEY , PM_DATA in pairs(ClientData) do
        if #( PM_DATA.coords - GetEntityCoords(PlayerPedId()) ) < 1.85 and GetPlayerServerId(PlayerId()) ~= k then
            OpenStorePlayer( ClientData[ PM_KEY ] , PM_KEY )
            return
        end
    end
end

local PMK_MAKE = function()


end



Player.CreateThread(function()
    -->[ @ Loading Player * 
    while not ( GetResourceState( GetThisScriptName( ) ) == "started" ) do  Player.Wait(30);DEBUG("Loading Script..")  end
    while GetIsLoadingScreenActive() do Player.Wait(30) DEBUG("Loading Screen..")  end
    while GetEntityModel(PlayerPedId()) == GetHashKey("PLAYER_ZERO") do Player.Wait(30) DEBUG("Loading Player Model..")  end
    while not HasCollisionLoadedAroundEntity(PlayerPedId()) do Player.Wait(30) DEBUG("Loading Collision...")  end
    while not NetworkIsPlayerActive(PlayerId()) do Player.Wait(30) DEBUG("Loading Network...")  end

    -->[ @ Loading Request Libs & Settings * 
    TriggerEvent( AFU.CLIENT_FRAMEWORK[true] ..':getSharedObject',function(libs) Player.Wait(250);
        while Player.Data == nil do 
            DEBUG("Loading Player Data...");
            Player.Data = libs.GetPlayerData(); 
            Player.Wait(250);
        end
        DEBUG("Loading Font File...");
        if AFU.FONT_FILE_CONFIG == nil then
            RegisterFontFile(AFU.FONT_FILE_CONFIG)
            fontId = RegisterFontId(AFU.FONT_FILE_CONFIG)
        else
            fontId = 4
        end

    end)
    Player.Wait(750);
    DEBUG("^2Loaded Player ^0:",Player.Data);

    -->[ @ Create & Processing * 
    ClientReady = Cblips(LOAD_LOCAL_FUNCTION)  

    -->[ @ Client Status Script is ready ? * 
    DEBUG("@^3Player Market Client^0:[", (ClientReady) and "^0:D" or "^1:(" ,"^0]")
end)





OpenStorePlayer = function(data , id)
    if not IsOpenShop.action then
        IsOpenShop.action = true
        IsOpenShop.id = id
        SendNUIMessage({
            action = 'openplayerstore',
            data = data,
            id = IsOpenShop.id
        })
        SetNuiFocus(true, true)
    end
end

local UI_SHOW_ZONE_NAME = function() 
    local bool = ( Player.Now_Zone ~= nil ) and true or false
    SendNUIMessage({
        action = 'uizone',
        type = bool ,
        key = Player.Now_Zone
    })
end

Draw3DText = function(textInput,x,y,z ,xscale)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist       = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)    
    local scale      = (1 / dist) * 20
    local fov        = (1 / GetGameplayCamFov()) * 100
    local scale      = scale * fov   

    SetTextScale(xscale * scale, xscale * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextColour(255, 218, 11, 255)
    SetTextDropshadow(15, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x, y, z + 2, 0)
    -- DrawSprite( 'duiTxd', 'duiTex', 0.5, 0.5, 0.19, 0.07, 0.0, 255, 255, 255, 210)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()

end


CheckNearPlayer = function()
    if not isValidData() then return false end
    for k , v in pairs(ClientData) do
        if #( v.coords - GetEntityCoords(PlayerPedId()) ) < 3.5 then
            return false;
        end
    end
    return true;
end


GetItemForSell = function(keyZone)
    local cached_inventory = {}
    local inventory = Player.Data.inventory
    for i = 1 , #inventory , 1 do
        if inventory[i].count > 0  and not AFU.ITEMRESTRICT[keyZone][inventory[i].name] then
            local loop_cached = {};
            loop_cached.name = inventory[i].name;
            loop_cached.count = inventory[i].count;
            loop_cached.price = 0;
            cached_inventory[ #cached_inventory + 1 ] = loop_cached;
        end
    end
    return cached_inventory
end

MakeNewStore = function(keyZone)
    local item = GetItemForSell(keyZone)
    SendNUIMessage({
        action = "makenewstore",
        playerId = GetPlayerServerId(PlayerId()),
        keyZone = keyZone,
        item = item
    })
    SetNuiFocus(true, true)
end

JustifyStore = function(data , keyZone)

    SendNUIMessage({
        action = "justifystore",
        playerId = GetPlayerServerId(PlayerId()),
        keyZone = keyZone,
        item = data.item,
        shopname = data.shopname
    })
    SetNuiFocus(true, true)
end


StandStill = function(bool)
    FreezeEntityPosition(PlayerPedId(), bool)
end

RegisterNetEvent('SECURE-UPDATEUPDATE_SELLER')
AddEventHandler('SECURE-UPDATEUPDATE_SELLER' , function(data , seller , max , iszero)

    if not ClientData[data.id].item[data.item_name] then return end

    ClientData[data.id].item[data.item_name].count = ClientData[data.id].item[data.item_name].count - data.amount

    if ClientData[data.id].item[data.item_name].count <= 0 then
        ClientData[data.id].item[data.item_name] = nil
    end

    if IsOpenShop.id == seller then
        SendNUIMessage({
            action = 'openplayerstore',
            data = ClientData[data.id],
            id = seller
        })
    end

    if seller == GetPlayerServerId(PlayerId()) and IsMakedStore then
    
        SendNUIMessage({
            action = 'updatesellerAction',
            item = ClientData[data.id].item[data.item_name],
            item_name = data.item_name,
            item_max = max,
            id = seller,
            iszero = iszero
        })

    end
end)

RegisterNetEvent('SECURE-NotifyCustomer')
AddEventHandler('SECURE-NotifyCustomer',function(txt)

    SendNUIMessage({
        action = 'notiafu',
        text = txt
    })
end)

RegisterNetEvent('SECURE-InserNewDataStoreCs')
AddEventHandler('SECURE-InserNewDataStoreCs' , function(data)
    if ClientData[data.pid] ~= nil then return end

    ClientData[data.pid] = {
        coords = data.coords,
        item = data.item,
        shopname = data.shopname,
        zone = data.kz
    }
    
end)

RegisterNetEvent('SECURE-DeleteStoreMarketCs')
AddEventHandler('SECURE-DeleteStoreMarketCs' , function(id )
    if ClientData[id] == nil then return end

    ClientData[id] = nil

    if IsOpenShop.action and IsOpenShop.id == id then

        IsOpenShop.action = false
        IsOpenShop.id = nil
        SendNUIMessage({
            action = "closeMarketPlayer"
           
        })

    end

    if GetPlayerServerId(PlayerId()) ~= id then return end

    IsMakedStore = false

    StandStill(false)

end)


Player.CreateThread(function()
    SetNuiFocus(false, false)

end)


RegisterNetEvent('SECURE-UpdateDataStoreCs')
AddEventHandler('SECURE-UpdateDataStoreCs' , function(_shopname , _item , _id)
    if ClientData[_id] =~= nil then return end
    ClientData[_id].shopname = _shopname

    ClientData[_id].item = _item

    if IsOpenShop.action and IsOpenShop.id == _id then
        Wait(100)
        SendNUIMessage({
            action = 'openplayerstore',
            data = ClientData[_id],
            id = _id
        })
    end

    if seller == GetPlayerServerId(PlayerId()) and IsMakedStore then
        SendNUIMessage({
            action = 'updatesellerActionTwo',
            item =  GetItemForSell(keyZone),
            shopname = _shopname,
        })
        
    end

    if GetPlayerServerId(PlayerId()) ~= id then return end
    IsMakedStore = false
    StandStill(false)
    
end)

RegisterNetEvent('SECURE-GetDataNewJoined')
AddEventHandler('SECURE-GetDataNewJoined' , function(data)
    ClientData = data
    Wait(180)
    if not isValidData() then return end
    --@ DRAW TEXT
    
end)

RegisterNUICallback('CloseStorePlayer' , function()
    IsOpenShop.id = nil
    IsOpenShop.action = false
end)

RegisterNUICallback('BuyItem' , function(data , cb)
    
    TriggerServerEvent('SECURE-UPDATEBUY_ITEMS' , data , GetPlayerServerId(PlayerId()))
    cb('ok')
end)

RegisterNUICallback('MakeNewStoreMarket',function(data, cb)
    if(data.release~=nil)then
        IsMakedStore = true
        data.release.coords = GetEntityCoords(PlayerPedId())
        StandStill(true)

        TriggerServerEvent('SECURE-InserNewDataStoreSs',data.release)
    end

end)

RegisterNUICallback('DeleteMarket',function(data, cb)
    if(data~=nil)then
        TriggerServerEvent('SECURE-DeleteStoreMarketSs' , data.id)
    end

end)

RegisterNUICallback('UpdateDataStore' , function(data,cb)
    if(data.release~=nil)then
        TriggerServerEvent('SECURE-UpdateDataStoreSs' , data.release)
    end
end)

RegisterNUICallback('CloseMarket', function()
    SetNuiFocus(false,false)
end)

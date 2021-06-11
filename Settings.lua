AFU={};AFU.KEYOPEN={}; --[ @ Settings * 

AFU.DEBUG_MODE = true                                                       --@ DEBUG ]*
AFU.CLIENT_FRAMEWORK = {                                                    --@ เปิด true Framework ฝั่ง Client ที่ตัวเองใช้อยู่ ]*

    [ true ] = "esx",
    [ false ] = "monster"   

}


AFU.FONT_FILE_CONFIG = 'sarabun'                                            --@ Font ที่ถูกลงไว้เลือกใช้ได้หากไม่ใส่จะเลือก Font ของเกมอัตโนมัติ ]*
AFU.KEYOPEN.MAKE_SHOP = 'e'                                                  --@ Key สร้างร้านค้า ]*
AFU.KEYOPEN.ACCESS_SHOP = 'e'                                                --@ Key เปิดร้านค้าของผู้เล่นคนอื่น ]*


AFU.ZONE = {                                                                -- @ IF NULL YOU CAN MAEK STORE EVERY WHERE !  | หากไม่ใส่อะไรเลยจะสามารถตั้งร้านค้าที่ไหนก็ได้ ]*

    ['A Zone'] = {
        position        =   vector3( 1960.69 , 3861.24 , 31.99 )    ,
        blip_sprite     =   47  ,
        blip_scale      =   1.3 ,
        blip_colors     =   0   ,
        vector_radius   =   30.0
    },
    
    ['B Zone'] = {
        position        = vector3( 2098.27 , 3784.55 , 32.65 )    ,
        blip_sprite     =   47  ,
        blip_scale      =   1.3 ,
        blip_colors     =   3   ,
        vector_radius   =   30.0
    }

}


AFU.ITEMRESTRICT = {                                                        -- @ THIS IS NOT ALLOW TO SELL ITEM FOR THAT ZONE  | ตั้งค่าของไอเทมที่ไม่ให้ขายในโซนนั้นๆ ]*

    ['A Zone'] = {
        bread = true    , 
    },

    ['B Zone'] = {
        water = true    , 
    }

}
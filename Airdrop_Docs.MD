@ COMMAND & ALLOWGROUP
```lua

    COMMAND = "ชื่อคำสั่ง"  --[ @ [ ตั้งชื่อ COMMAND ของตัวเองในการเรียก แอร์ดรอป ]


    ALLOWGROUP = {  --[ @ [ ใส่ Group หรือ SteamIdentifier  ก็ได้ครับ]
        "superadmin",
        "steam:1100001358fb54d",
        "steam:1100001377c852d",
        "admin",
        "steam:11000011338a9e6",
        "steam:110000103dd1582"
    }
        

```


@ TIMECYCLE OF AIRDROP
```lua

    SERVER.TIME_CYCLES = { 
        action = true,  --[ @ เปิดการปล่อยออโต้ ]
        timecheck = 1   --[ @ เวลาเช็คทุกๆกี่นาที ( 1 = 1 นาที ) ]
    }

```


@ AVIALIABLE BOXS
```lua

    SERVER.AVIALIABLE_BOXS = {
        "hei_prop_carrier_cargo_03a", --[ @ Model ของกล่อง AIRDROP
        "hei_prop_carrier_cargo_04a",
    }

```


@ SERVER.AUTOTIME
```lua

    boxSet = --[ @ กล่องโดยเลือกชื่อจาก:[ SERVER.BOX_SETS_CONFIG ]
    itemInBox = { 1 , n } --[ @ สุ่มตั้งแต่ 1 - n || 10 => 10 ชิ้น Fixed ไว้ไม่สุ่ม || หากใส่ false จะมีไอเทมเท่ากับ "box_set_1" ที่เซ็ตไว้เลย
    countDown = --[ @ วลาดีเลย์นับถอยหลังประกาศแจ้งทั้งเซิฟ
    countTake = --[ @ เวลาดีเลย์ก่อนเปิดแอร์ดรอปให้สามารถเก็บได้
    
    
    --[ @ ใส่เวลาได้ 2 แบบ | ช่วงเวลา 24HR เช่น บ่าย 3 คือ 15:00

    --[ @ ( วัน / เดือน / ปี / ชั่วโมง / นาที )
        day = 11, 
        month = 5,
        year = 2021,
        hour = 22 ,
        min = 15 ,    
 

    --[ @ ( ชั่วโมง / นาที ) ปล.ของทุกวัน
        hour = 22 ,
        min = 15 ,    

    
    --[ @ POSITION
    --[ @ ใส่แบบนั้ก็ได้ครับจะปล่อยลงตรงจุดเดียว => [ pos = vector3(-1033.6, -194.10, 37.8620) ] || ใส่แบบนั้ก็ได้ครับจะปล่อยแบบสุ่มจุด { vector3(-1033.6, -194.10, 37.8620) , vector3(-1126.0, -247.33, 37.7089) }

    {
        boxSet = "box_set_2",
        itemInBox = false ,
        countDown = 180 ,
        countTake = 50 ,
        day = 11, 
        month = 5,
        year = 2021,
        hour = 22 ,
        min = 15 ,
        pos = {
            vector3(1978.739 , 3848.63 , 32.14154) ,
            vector3(1978.739 , 3848.63 , 32.14154)
        }
    },

```


@ ITEM SETS CONFIG
```lua

    boxSet = --[ @ กล่องโดยเลือกชื่อจาก:[ SERVER.BOX_SETS_CONFIG ]
    itemInBox = { 1 , n } --[ @ สุ่มตั้งแต่ 1 - n || 10 => 10 ชิ้น Fixed ไว้ไม่สุ่ม || หากใส่ false จะมีไอเทมเท่ากับ "box_set_1" ที่เซ็ตไว้เลย
    count = count คือจำนวนที่จะใส่ลงไปในกล่อง     { 1 , n } --[ @ สุ่มตั้งแต่ 1 - n | 10 => 10 ชิ้น Fixed ไว้ไม่สุ่ม
    countDown = --[ @ เวลาดีเลย์นับถอยหลังประกาศแจ้งทั้งเซิฟ
    countTake = --[ @ เวลาดีเลย์ก่อนเปิดแอร์ดรอปให้สามารถเก็บได้

    --[ @ POSITION
    --[ @ ใส่แบบนั้ก็ได้ครับจะปล่อยลงตรงจุดเดียว => [ pos = vector3(-1033.6, -194.10, 37.8620) ] || ใส่แบบนั้ก็ได้ครับจะปล่อยแบบสุ่มจุด { vector3(-1033.6, -194.10, 37.8620) , vector3(-1126.0, -247.33, 37.7089) }

    ["ชื่อไอเทมสำหรับเสฟแอร์ดรอป"] = {
        boxSet = "box_set_1",
        itemInBox = { 1 , 100 } ,
        countDown = 100 ,
        countTake = 80 ,
        pos = {
            vector3(-1033.6, -194.10, 37.8620) ,
            vector3(-1126.0, -247.33, 37.7089)
        }
    }

```


@ BOX SETS CONFIG
```lua

    name = --[ @ ชื่อไอเทมจาก Database ที่จะใช้แอดของ เงินสะอาด(cash) || เงินสกปรก(black_money)
    label = --[ @ ชื่อที่ใช้แสดงไม่ใส่ก็ได้หรือใส่ก็ได้ ถ้าไม่ใส่ ระบบจะถึงจาก Database อัตโนมัติ
    count = --[ @ count คือจำนวนที่จะใส่ลงไปในกล่อง   { 1 , n } => สุ่มตั้งแต่ 1 - n | 10 => 10 ชิ้น Fixed ไว้ไม่สุ่ม

    ["ชื่อกล่อง"] = {
        {
            name = "cash" ,
            label = "Money" , 
            count = { 20 , 51 } 
        },
    }
```

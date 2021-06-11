let market_data 
let IsShopNamePass = false
let Justify = false
let IsOpenStore = false
let noti 
let timeinter
document.addEventListener('DOMContentLoaded', function () {

    document.body.innerHTML = `
    
        <div class="wrapper">
            <div class="item-sec">
            </div>
            <button class="quit-btn" onclick="CloseMakeStore()"> ปิดหน้าต่าง </button>
            <span class="text-box">
                <input type="text" id="shop-Name" name="ShopName" placeholder="ชื่อร้านค้า" minlength="4" maxlength="25" style="position: relative;text-align: center;color: rgb(242, 226, 0);text-shadow: 0px 0px 1px black;width: 345px;height: 70px;font-size: 30px;outline: 0;background-color: rgba(0, 0, 0, 0.487);border: 0px solid black;border-radius: 5px;">
            </span>
            <button class="confirm-btn" onclick=""> ตั้งร้านค้า </button>
        </div>
        <div class="notify"> 
            เทสการแจ้งเตือนบลาๆ
        </div>
        <div class="showTextZone"></div>

    `
    $('.confirm-btn').hide()
    $('.text-box').hide()
    $('.notify').fadeOut(0);
    $('.wrapper').fadeOut(0);
    $('.showTextZone').fadeOut(0);
    noti = $('.notify');
   
    $(document).keyup(function(e) { 
        if (e.which == 27) {
           
            CloseMakeStore()
        }
    });
});

window.addEventListener("message" , function(e){

    if(e.data != null){
        var d = e.data
        if(d.action === 'makenewstore'){
            MakeNewStore(d)
        }else if(d.action === 'justifystore'){
            Justify = true
           
            justifyDataStore(d)

        }else if(d.action === 'openplayerstore'){
            IsOpenStore = true
            
            OpenStore(d)
        }else if (d.action === 'closeMarketPlayer'){
            IsShopNamePass = false
            Justify = false
            IsOpenStore = false
            CloseMakeStore();
        }else if (d.action === 'notiafu'){
            AlertNotify(d.text)
        }else if (d.action === 'updatesellerAction'){
            UpdateSeller(d)
        }else if (d.action === 'updatesellerActionTwo'){
            UpdateSellerV2(d);
        }else if(d.action === 'uizone'){
            Uizoneee(d.type , d.key)
        }
    }
})
Uizoneee = function(b ,t ){
    if(b) {
        $('.showTextZone').html(`TRADE ZONE : <span style="color:rgb(22, 191, 0); font-size:17px;">`+t+``)
        $('.showTextZone').fadeIn(300)

    }else{
        $('.showTextZone').fadeOut(300)
        $('.showTextZone').html(``)

    }


}
AlertNotify = function(text){
    if(timeinter){
        clearInterval(timeinter)
    }
    noti.html(text)
    noti.fadeIn(300)
    timeinter = setInterval(function(){
        noti.fadeOut(300)
        noti.html(``)
    },2000)


}
UpdateSellerV2 = function(d){

    $.each(d.item, function (index, item) {

        $('#quty-'+item.name).val('');
        $('#price-'+item.name).val('');
        // $('#max-info-'+item.name).val(item.count);
    });


}
OpenStore = function(d){
    $('.item-sec').html(``)
    $('.confirm-btn').hide()
    $('.text-box').hide()
    $.each(d.data.item, function (name, item) {

        if(item.count == undefined || item.count < 1){return;}
        var itembox = `
            <div class="item-box" id="item-box-${name}">
                <img id="image-${name}" src="nui://esx_inventoryhud/html/img/items/${name}.png"; style="width: 100px; height: 100px; margin-top: 10px; margin-left: 10px;">
                <div class="buy-quty" id="quty-buy-${name}">
                    จำนวนชิ้น : ${item.count} <span style="color:gold; font-size:30px;">ชิ้น</span>
                </div>
                <div class="buy-price" id="price-buy-${name}">
                    ราคาต่อชิ้น : ${ numberWithCommas( item.price ) }<span style="color:gold; font-size:30px;">$</span>
                </div>
                <div class="buy-quty-box">
                    จำนวนที่จะซื้อ<input type="number" id="quty_buy-${name}" name="num" value="" min="1" max="${item.count}" minlength="1" maxlength="3" style="position: relative;text-align: center;color: rgb(255, 255, 255);text-shadow: 0px 0px 1px black;width: 200px;height: 35px;font-size: 20px;outline: 0;background-color: rgba(0, 0, 0, 0.487);border: 0px solid black;border-radius: 5px;">
                </div>
                <div class="result-price" id="result-price-info-${name}"> ราคารวม : <span style="color:yellow; font-size:11px;">0$</span> </div>
                <button class="buy-btn" id="buy-${name}"> ซื้อ </button>
            </div>
        `
        $('.item-sec').append(itembox)
    
        document.getElementById('image-'+name).addEventListener('error' , function(){
            document.getElementById('image-'+name).src = "http://aare-kernbohrung.ch/wordpress/wp-content/themes/myarcadetheme/images/noimg.png";
        })

        var t = $('#quty_buy-'+name);
        var info = $('#result-price-info-'+name);
        $('#quty_buy-'+name).on('input', function(){
           
            t.val( t.val().replace('-', '') );
            if(t.val()>item.count){
                t.val(item.count);
                AlertNotify('ไอเทมสูงสุดที่ <span style="color:red"; font-size: 12px;>'+ item.count+'</span>')
                info.html(`ราคารวม : <span style="color:yellow; font-size:11px;">${item.count*item.price}$</span> `)
            }else{
                if(t.val()<=0){
                    t.val('');
                    info.html(`ราคารวม : <span style="color:yellow; font-size:11px;">${0}$</span> `)
                }else{
                    info.html(`ราคารวม : <span style="color:yellow; font-size:11px;">${t.val()*item.price}$</span> `)
                }
            }
        });

        $('#buy-'+name).on('click' , function(){
            if(t.val() > 0 && t.val() != '' && t.val()<item.count+1){
                var id = d.id
                var item_name = name
                var amount = t.val()
                var price = t.val()*item.price
                buyItem(id, item_name, amount , price)

            }else{
                AlertNotify('<span style=" color:red; font-size:13px;">กรุณาเช็คข้อมูลการซื้อ !')
            }
        })
           
    });

    $('.shopName_text-box').html(d.data.shopname)
    $('.wrapper').fadeIn(300);


}
buyItem = function(id ,  item_name , amount , price){
   
    $.post('http://AFU_playermarket/BuyItem', JSON.stringify({
        id: id,
        item_name: item_name,
        amount: amount,
        price: price
    }));
}
numberWithCommas = function(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
CompleteSetMarket = function(di){
    if (market_data != null){

        if (IsShopNamePass) {

            if(!Justify) {
                // THIS BUG IF WANT TO CHECK HAVE ITEM IN MARKET ?  

                if ( Object.keys(market_data.item).length > 0 ){
                    AlertNotify('สร้างร้านค้าสำเร็จ !')
                    $.post('http://AFU_playermarket/MakeNewStoreMarket', JSON.stringify({
                        release:market_data
                    }));
                }else{
                    AlertNotify('กรุณาใส่สินค้า')
                    return
                }

                

                // $.each(di, function (name, item) {
                //     $("#max-info-"+item.name).html(item.count);

                // });

            }else{
                Justify = false
                $.each(market_data.item, function (name, value) {
                    value.count = $('#quty-'+name).val()
                    value.price = $('#price-'+name).val()
                });
                    
                $.post('http://AFU_playermarket/UpdateDataStore', JSON.stringify({
                    release:market_data
                }));
            }
            CloseMakeStore();
        }else{
            AlertNotify('ชื่อสั้นเกินไป !')

        }
        
    }
}
CloseMakeStore = function(){
    $('.wrapper').fadeOut(300);
    $.post('http://AFU_playermarket/CloseMarket');

    if(Justify){
        IsShopNamePass = false
        
        $.post('http://AFU_playermarket/DeleteMarket',JSON.stringify({
            id:market_data.pid
        }));
        $(".confirm-btn").css("opacity", "30%");
        $('.item-sec').html(``);
    }else if(IsOpenStore){
        IsOpenStore = false
        $.post('http://AFU_playermarket/CloseStorePlayer');
        $('.item-sec').html(``);
    }
    // POST CLOSE NUI
}
UpdateSeller = function(d){
    // $('.item-sec').html(``);
    $('#max-info-'+d.item_name).text(d.item_max);
    $("#quty-"+d.item_name).attr('max' , d.item_max);
    var max = $("#quty-"+d.item_name).attr('max');


    $('#quty-'+d.item_name).on('input', function(){
        var val = $('#quty-'+d.item_name).val();

        if(+val > +max) {
            $('#quty-'+d.item_name).val(max)
        }
        $('#quty-info-'+d.item_name).html(`
            จำนวนชิ้น : ${max} <span style="color:gold; font-size:30px;">ชิ้น</span>
        `)

    });
    if (d.iszero){
        $('#quty-info-'+d.item_name).html(`
            จำนวนชิ้น : <span style="color:red; font-size:20px;"> สินค้าขายหมดแล้ว</span>
        `)
        $('#price-info-'+d.item_name).html(`
            ราคาต่อชิ้น : <span style="color:red; font-size:20px;"> สินค้าขายหมดแล้ว</span>
        `)
        $('#quty-'+d.item_name).val('');
        $('#price-'+d.item_name).val('');
        if(d.item_max < 1 ){
            $('#item-box-'+d.item_name).remove();
        }
    }else{
        $('#quty-info-'+d.item_name).html(`
            จำนวนชิ้น : ${d.item.count} <span style="color:gold; font-size:30px;">ชิ้น</span>
            
        `)
        
        $('#quty-'+d.item_name).val('');
        $('#price-'+d.item_name).val('');
    }


}
MakeNewStore = function(data){
    $('.item-sec').html(``);
    $('.confirm-btn').show()
    $('.text-box').show()
    IsShopNamePass = false
    market_data = {
        pid: data.playerId,
        kz: data.keyZone,
        item: {

        },
        shopname:""
    }
    $.each(data.item, function (index, item) {
        var itembox = `
            <div class="item-box" id="item-box-${item.name}">
                <img src="nui://esx_inventoryhud/html/img/items/${item.name}.png" id="image-${item.name}" ; style="width: 100px; height: 100px; margin-top: 10px; margin-left: 10px;">
                <div class="quty-box">
                    จำนวนชิ้นตั้งขาย<input type="number" id="quty-${item.name}" name="num" value="" min="1" max="${item.count}" minlength="1" maxlength="3" pattern="\d*" style="position: relative;text-align: center;color: rgb(255, 255, 255);text-shadow: 0px 0px 1px black;width: 200px;height: 35px;font-size: 20px;outline: 0;background-color: rgba(0, 0, 0, 0.487);border: 0px solid black;border-radius: 5px;">
                </div>
                <div class="price-box">
                    ราคาต่อชิ้น<input type="number" id="price-${item.name}" name="num"  value="" min="1" max="9999999" minlength="1" maxlength="7" pattern="\d*" style="position: relative;text-align: center;color: rgb(255, 255, 255);text-shadow: 0px 0px 1px black;width: 200px;height: 35px;font-size: 20px;outline: 0;background-color: rgba(0, 0, 0, 0.487);border: 0px solid black;border-radius: 5px;">
                </div>
                <div class="info-quty" id="quty-info-${item.name}">
                    จำนวนชิ้น : 0 <span style="color:gold; font-size:30px;">ชิ้น</span>
                </div>
                <div class="info-price" id="price-info-${item.name}">
                    ราคาต่อชิ้น : 0 <span style="color:gold; font-size:30px;">$</span>
                </div>
                <div class="max-item" id="max-info-${item.name}">${item.count}</div>

            </div>
        `
        $('.item-sec').append(itembox)
        $("#max-info-"+item.name).html(item.count);
        document.getElementById('image-'+item.name).addEventListener('error' , function(){
            document.getElementById('image-'+item.name).src = "http://aare-kernbohrung.ch/wordpress/wp-content/themes/myarcadetheme/images/noimg.png";
        })

        $('#quty-'+item.name).on('input', function(){
            var calue = $('#quty-'+item.name).val();
            if ( calue > 0 && calue.length < 7){
                if (calue < item.count+1){
                    $('#quty-info-'+item.name).html(`
                        จำนวนชิ้น : ${ $('#quty-'+item.name).val()} <span style="color:gold; font-size:30px;">ชิ้น</span>
                    `);
  
                    market_data.item[item.name] = {
                        count: +$('#quty-'+item.name).val(),
                        price: +$('#price-'+item.name).val()
                    }
                    
                    
                }else{
                    $('#quty-info-'+item.name).html(`
                        จำนวนชิ้น : ${ item.count } <span style="color:gold; font-size:30px;">ชิ้น</span>
                    `)
                    $('#quty-'+item.name).val(item.count);
                    market_data.item[item.name] = {
                        count: +item.count,
                        price: +$('#price-'+item.name).val()
                    }


                }
            }else if (calue.length == 0 ||calue == 0){
                $('#quty-info-'+item.name).html(`
                        จำนวนชิ้น : 0 <span style="color:gold; font-size:30px;">ชิ้น</span>
                `)
                $('#quty-'+item.name).val('');
                AlertNotify('ขั้นต่ำของการขายคือ 1 ชิ้น')

                market_data.item[item.name] = {
                    count: 1,
                    price: +$('#price-'+item.name).val()
                }
                // console.log(market_data.item[item.name].count)


            }else if (calue < 0){
                $('#quty-'+item.name).val('');
                AlertNotify('ขั้นต่ำของการขายคือ 1 ชิ้น')

                market_data.item[item.name] = {
                    count: 1,
                    price: +$('#price-'+item.name).val()
                }
                // console.log(market_data.item[item.name].count)

            }


        });

        $('#price-'+item.name).on('input', function(){
            
            if ($('#price-'+item.name).val() > 0 && $('#price-'+item.name).val().length < 7){
                $('#price-info-'+item.name).html(`
                    ราคาต่อชิ้น : ${ numberWithCommas($('#price-'+item.name).val())} <span style="color:gold; font-size:30px;">$</span>
                `);
                market_data.item[item.name] = {
                    count: +$('#quty-'+item.name).val(),
                    price: +$('#price-'+item.name).val()
                }

                // console.log(market_data.item[item.name].price)

            }else if($('#price-'+item.name).val().length == 0 || $('#price-'+item.name).val() == 0){
                $('#price-info-'+item.name).html(`
                    ราคาต่อชิ้น : 0 <span style="color:gold; font-size:30px;">$</span>
                `);
                $('#price-'+item.name).val('');

                market_data.item[item.name] = {
                    count: +$('#quty-'+item.name).val(),
                    price: 0
                }
                
                // console.log(market_data.item[item.name].price)
            }else if ($('#price-'+item.name).val() < 0 ){
                $('#price-'+item.name).val('');

                market_data.item[item.name] = {
                    count: +$('#quty-'+item.name).val(),
                    price: 0
                }
                
                // console.log(market_data.item[item.name].price)
            }
        });
           
    });
    $('#shop-Name').val('')
    $(".confirm-btn").text('ตั้งร้านค้า')
    $(".quit-btn").text('ปิดหน้าต่าง')
    $('#shop-Name').on('input' , function(){
        if(  $('#shop-Name').val() != '' &&  $('#shop-Name').val().length > 5 ){
            market_data.shopname = $('#shop-Name').val();
            IsShopNamePass = true;
            $(".confirm-btn").css("opacity", "100%");
            $(".confirm-btn").css("transition", "0.3s");
            
            
        }else{
            IsShopNamePass = false;
            $(".confirm-btn").css("opacity", "30%");
            $(".confirm-btn").css("transition", "0.3s");
        }
    })

    $( ".confirm-btn" ).click(function() {
        CompleteSetMarket(data.item);
    });
    $('.wrapper').fadeIn(300);
}

justifyDataStore = function(data){
    $(".confirm-btn").html('บันทึกร้านค้า')
    $(".quit-btn").html('ปิดร้านค้า')

    $('.wrapper').fadeIn(300)
}
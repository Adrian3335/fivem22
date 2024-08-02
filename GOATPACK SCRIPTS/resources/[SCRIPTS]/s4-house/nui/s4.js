var cur_id = null;

var ppl_all = [];
var ppl_h = [];

$(window).ready(function() {
    window.addEventListener('message', (event) => {
        let data = event.data;
        switch(data.action) {
            case "init":
                __init__(data);
            break;
            case "update":
                __init__(data);
            break;
            case "manage":
                __manage__(data);
            break;
            case "notif":
                __notif__(data);
            break;
        }
    });
});
 

$(document).ready(function() {
 
    $(document).on('click','a',function(){ __click_($(this)); });

    $(document).on('click','w',function(){ __click_($(this)); });

});

__notif__ = (x) => {

    $("body").show("fade");
    $(".buy").hide("fade");
    $(".bg").hide("fade");
    $(".notif").show("fade");
    $(".notif").html("");

    house = x.house;
    cur_id = house.id;
    switch(x.type) {
        case "gin":
        $(".notif").html(`
        <a href="#" data-s4="nbtn" data-type="gin_g" ><i class="fal fa-door-open"></i> Wejdz do srodka</a>
        <a href="#" data-s4="close_"><i class="fas fa-do-not-enter"></i> Anuluj</a>
        `);
        break;
        case "ginv":
        $(".notif").html(`
        <a href="#" data-s4="nbtn" data-type="gin_g"><i class="fal fa-door-open"></i> Wejdz do srodka</a>
        <a href="#" data-s4="nbtn" data-type="ginv"><i class="fas fa-drone-alt"></i> Wejdz do srodka samochodem</a>
        <a href="#" data-s4="close_"><i class="fas fa-do-not-enter"></i> Anuluj</a>
        `);
        break;
        case "gout":
        $(".notif").html(`
        <a href="#" data-s4="nbtn" data-type="gout" ><i class="fal fa-door-open"></i> Wyjdz na zewnatrz</a>
        <a href="#" data-s4="close_"><i class="fas fa-do-not-enter"></i> Anuluj</a>
        `);
        break;

    }
 
 
}


__init__ = (x) => {
   
   house = x.house;
   $("body").show("fade");
   $(".bg").show("fade");
   $(".buy").show("fade");
 
   $("#h_sell").css("display", "block");
   $("#h_friends").css("display", "block");
   $(".buttons").css("display", "block");


   $("#h_no").html(house.id);

   cur_id = house.id;

   $("#h_gstock").html(house.garage_stock);

   $(".stars").html("");
   
   $("#h_who").html(house.who);

   for (let i = 0; i < house.stars; i++) {
       $(".stars").append(`<i class="fas fa-star star"></i>`);
   }

   for (let i = 0; i < 5 - house.stars; i++) {
    $(".stars").append(`<i class="fas fa-star nostar"></i>`);
   }  

   if(house.pool_or_garden == true) {
      $("#h_gp").html("Jest dostepny");
   }else {
      $("#h_gp").html("Nie dostepny");
   }

   $("#h_price").html("$"+house.numco+" One Time");
    
   if(house.owner != house.curidf) {
      $("#h_sell").css("display", "none");
      $("#h_friends").css("display", "none");
      $(".buttons").css("display", "none");
   }else {
     $("#h_buy").css("display", "none");
     $("#h_friends").css("display", "inline-block");
   }

   if(house.owner == "") {
    $("#h_sell").css("display", "none");
    $("#h_friends").css("display", "none");
    $(".buttons").css("display", "none");
    $("#h_buy").css("display", "block");
	
   } 
   
   if(house.infoauth == "friend") {
	$("#h_sell").css("display", "block");
    $("#h_friends").css("display", "inline-block");
    $(".buttons").css("display", "block");
    $("#h_buy").css("display", "none");
	$("#h_sell").css("display", "none");
   }
 
   $("#h_sell_price").html(house.perc.toLocaleString() + "$");
 
   $("#u_bank").html(`<i class="fal fa-credit-card-blank"></i> ` + x.user.bank.toLocaleString() + "$");
   $("#u_cash").html(`<i class="fal fa-wallet"></i> ` + x.user.cash.toLocaleString() + "$");


   $(".cars").html("");
   for (let i = 0; i < house.garage_stock; i++) {

      if(house.garage[i]){
        e = `
        <div class="car">
        <center>
         <img src="https://raw.githubusercontent.com/MericcaN41/gta5carimages/main/images/${house.garage[i].model.toLowerCase()}.png" />
        </center>
          <div class="alt">
            <h2>${house.garage[i].model}</h2>
            <i class="fa-regular fa-garage-car"></i>
          </div>
        </div>
        `;  
      }else {
        e = `
        <div class="car">
          <i class="fa-duotone fa-empty-set center"></i>
        </div>
        `;
      }
      $(".cars").append(e);

   } 
   

}


__click_ = async (x) => {
    switch(x.data("s4")) {
        case "close-modal":
            $(".modal").hide("fade");
            setTimeout(() => { $(".modal").css("display","none") }, 500);
            $(".sellmodal").hide("fade");
            setTimeout(() => { $(".sellmodal").css("display","none") }, 500);
        break;
        case "buy-house":
            await __loading__();
            $(".modal").show("fade");
            setTimeout(() => { $(".modal").css("display","block") }, 500);
        break;  
        case "with-bank":
            await __loading__();
            $(".modal").hide("fade");
            setTimeout(() => { $(".modal").css("display","none") }, 500);
            $.post("https://s4-house/tryBuy", JSON.stringify({ id: cur_id, type: "bank" }), function(x){
               
            });
        break;
        case "with-cash":
            await __loading__();
            $(".modal").hide("fade");
            setTimeout(() => { $(".modal").css("display","none") }, 500);
            $.post("https://s4-house/tryBuy", JSON.stringify({ id: cur_id, type: "cash" }), function(x){
           
            });
        break;
        case "sell-house":
            await __loading__();
            $(".sellmodal").show("fade");
            setTimeout(() => { $(".sellmodal").css("display","block") }, 500);
        break;
        case "sell-with-cash":
            await __loading__();
            $(".sellmodal").hide("fade");
            setTimeout(() => { $(".sellmodal").css("display","none") }, 500);
            $.post("https://s4-house/trySell", JSON.stringify({ id: cur_id, type: "cash" }), function(x){
           
            });
        break;
        case "sell-with-bank":
            await __loading__();
            $(".sellmodal").hide("fade");
            setTimeout(() => { $(".sellmodal").css("display","none") }, 500);
            $.post("https://s4-house/trySell", JSON.stringify({ id: cur_id, type: "bank" }), function(x){
      
            });
        break;
        case "garage":
            await __loading__();
            $(".garagemodal").show("fade");
            setTimeout(() => { $(".garagemodal").css("display","block") }, 500);
        break;
        case "close-gm":
            $(".garagemodal").hide("fade");
            setTimeout(() => { $(".garagemodal").css("display","none") }, 500);
        break;
        case "home":
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display","none") }, 500);
			$.post("https://s4-house/close", JSON.stringify({ id: cur_id  }), function(x){});
        break;
        case "theme":
            $.post("https://s4-house/changeTheme", JSON.stringify({ id: cur_id, theme: $(x).data("theme") }), function(x){ });
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display","none") }, 500);
			$.post("https://s4-house/close", JSON.stringify({}), function(x){});
        break;
        case "table":
            tid = $(x).data("theme");
            await __loading__();
            $("body").hide("fade");
            setTimeout(() => { $("body").css("display","none") }, 500);
            $.post("https://s4-house/table", JSON.stringify({ tid: tid, turl: $("#u_"+tid).val() }), function(x){});
			$.post("https://s4-house/close", JSON.stringify({}), function(x){});
        break;
        case "close_":
            $("body").hide("fade");
            $(".manage").hide("fade");
            $(".notif").hide("fade");
            setTimeout(() => { $("body").css("display","none") }, 500);
			$.post("https://s4-house/close", JSON.stringify({}), function(x){});
        break;
        case "walls_":
            $(".tables").hide("fade");
            await __wait__(500);
            $(".walls").show("fade");
        break;
        case "tables_":
            $(".walls").hide("fade");
            await __wait__(500);
            $(".tables").show("fade");
        break;
        case "name_":
            $(".hname").toggle("fade");
        break;
        case "hname":
            $(".hname").hide("fade");
            $.post("https://s4-house/SetName", JSON.stringify({ id: cur_id, name: $("#_hname").val()  }), function(x){ });
            _c_();
        break;
        case "friends":
            $(".friends").show("fade");
            
            $.post("https://s4-house/GetPlayers", JSON.stringify({ id: cur_id }), function(data){ 
 
               ppl_all = data.all;
               ppl_h = data.house;

               $("#all").html("");
               $("#friends").html("");

               $.each(ppl_all, function (i, v) { 
                  $("#all").append(`<a class="pl" data-s4="add-house-f" data-id="${v.id}" data-name="${v.name}" >${v.name} <i class="fa-thin fa-plus"></i></a>`);
               });

               $.each(ppl_h, function (i, v) { 
                $("#friends").append(`<a class="pl" data-s4="remove-house-f" data-id="${v.id}" data-name="${v.name}" >${v.name} <i class="fa-thin fa-minus"></i></a>`);
               });
                    

            });

        break;  
        case "add-house-f":
            xid = $(x).data("id");
            xname = $(x).data("name");
            $.post("https://s4-house/AddFriends", JSON.stringify({ id: cur_id, pid: xid, name: xname }), function(data){ });
            $("#friends").append(`<a class="pl" data-s4="remove-house-f" data-id="${xid}" data-name="${xname}"  >${xname} <i class="fa-thin fa-minus"></i></a>`);
            x.remove();
        break;
        case "remove-house-f":
            xid = $(x).data("id");
            xname = $(x).data("name");
            $.post("https://s4-house/RemoveFriends", JSON.stringify({ id: cur_id, pid: xid, name: xname }), function(data){ });
            $("#all").append(`<a class="pl" data-s4="add-house-f" data-id="${xid}" data-name="${xname}"  >${xname} <i class="fa-thin fa-plus"></i></a>`);
            x.remove();
        break;
        case "close-and-save":
            $(".friends").hide("fade");
            $.post("https://s4-house/StreamFriends", JSON.stringify({ id: cur_id }), function(data){ });
        break;
        case "nbtn":
           
            if($(x).data("type") == "ginv") {
              

                if($(x).data("slot")) {
                    $("body").hide("fade");
                    $(".manage").hide("fade");
                    $(".notif").hide("fade");
                    $(".manage").hide("fade");
                    setTimeout(() => { $("body").css("display","none") }, 500);
                    $.post("https://s4-house/close", JSON.stringify({}), function(x){});
                    $.post("https://s4-house/GoInGarage", JSON.stringify({ id: cur_id, slot: $(x).data("slot")  }), function(x){ });
                    return;
                }
                
                $.post("https://s4-house/GetGarageAvailables", JSON.stringify({ id: cur_id  }), function(x){
                
                $(".notif").html(``);
 
                $.each(x.reverse(), function (i, v) { 
                    if(v.status == false) {
                      $(".notif").append(`<a href="#" class="gs" data-s4="nbtn" data-type="ginv" data-slot="${v.slot}" >${v.slot}</a>`);
                    }else {
                      $(".notif").append(`<a href="#" class="gs" ><i class="fas fa-car"></i></a>`);  
                    }
                });

                $(".notif").append(`<a href="#" class="gs" data-s4="close_"><i class="fas fa-do-not-enter"></i></a>`);
                
                
                // <a href="#" data-s4="nbtn" class="gs" data-type="gin_g">1</a>
                });
            }else { 
             _c_();
             $.post("https://s4-house/tp", JSON.stringify({ id: cur_id, type: $(x).data("type")  }), function(x){});
            }
        break;
    }
 
}




_c_ = () => {
    $("body").hide("fade");
    $(".manage").hide("fade");
    $(".buy").hide("fade");
    $(".bg").hide("fade");
    $(".notif").hide("fade");
    $(".manage").hide("fade");
	$(".garagemodal").hide("fade");
	$(".sellmodal").hide("fade");
	$(".friends").hide("fade");
    setTimeout(() => { $("body").css("display","none") }, 500);
    $.post("https://s4-house/close", JSON.stringify({}), function(x){});
}

__loading__ = async () => {
  return new Promise((res) => {
    $(".loading").show("fade");
    setTimeout(() => { $(".loading").css("display","block") }, 150);
    setTimeout(() => {   
        $(".loading").hide("fade");
        setTimeout(() => { $(".loading").css("display","none"); res("done"); }, 150);
    }, 1000);  
  });
}

__wait__ = async (x) => { return new Promise((res) => { setTimeout(() => { res("done"); }, x); }); }

__manage__ = (x) => {

    house = x.house;
    cur_id = house.id;
 
    $("body").show("fade");
    $(".buy").hide("fade");
    $(".manage").show("fade");

    $(".scrl").html("");

    $.each(x.theme, function (i, v) { 
        $(".scrl").append(`<div class="wall" style="background: url(./interiors/${i}.png);background-size: cover;"><a data-s4="theme" data-theme="${i}" href="#">Select</a></div>`);  
    });
 
}

$(document).on('keydown', function() { switch(event.keyCode) {  case 27: _c_(); break; } });


print = (x) =>  { console.log(x); }
$(document).ready(function(){
    
    $(".sup_bodycam").hide();
    $(".odz").hide();
    window.addEventListener("message", function(event){
        if(event.data.open == true)
        {
            $(".odz").fadeIn();
            $(".sup_bodycam").fadeIn();
            document.getElementById("data").innerHTML = event.data.date;
            document.getElementById("stopien").innerHTML = event.data.ranga;
            document.getElementById("dane").innerHTML = event.data.daneosoby;
        }
        else if(event.data.open == false) 
        {
            $(".odz").fadeOut();
            $(".sup_bodycam").fadeOut();
        }
    })
});
$(document).on('click', '#submit', function(e){
    e.preventDefault();
    Join()
});

$(document).on('click', '#disconnect', function(e){
    e.preventDefault();
    $.post('https://w_radio/leave');
    Disconnect()
});

Open = function() {
    $(".container").css("display", "block");
    $(".radio-container").animate({bottom: "20vh",}, 250);
}

Close = function() {
    $(".radio-container").animate({bottom: "-110vh",}, 250, function(){
        // $(".radiolist").css("display", "none");
        $(".container").css("display", "none");
    });
    $.post('https://w_radio/OffFocus');
}

Join = function() {
    $.post('https://w_radio/join', JSON.stringify({
        channel: $("#channel").val()
    }), function(channel) {
        if (channel != undefined && channel != '') {
            $('.channel-id').html(channel)
            // $(".radiolist").css("display", "block");
        }
    });
}

Disconnect = function() {
    Close()
    $('.channel-id').html('')
}

$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "open") {
            Open()
        }
        if (event.data.type == "close") {
            Close()
        }
        if (event.data.type == "disconnect") {
            Disconnect()
        }
    });
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://w_radio/close', JSON.stringify({}));
            Close()
        } else if (data.which == 13) {
            Join()
        }
    };
});
const Root = document.querySelector(":root");



var selected = 1;
var maxKurwy = 3;
let isOpen = false;

window.onload = function(e) {
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case 'open':
                open(event.data.name);
                break;
            case 'updatecolor':
                Root.style.setProperty(
                    "--primaryColor",
                    event.data.color.primaryColor
                );
                break;
            default:
                break;
        }
    });
}

function open(name) {
    $('#name').html('Witaj ' + name + '!');
    isOpen = true
    $('.container').fadeIn(300)
}

function close(){
    isOpen = false
    $.post('http://goat_jct/close', JSON.stringify({}));
    $('.container').fadeOut(300)
}

function set(praca){
    $.post('https://goat_jct/setjob', JSON.stringify({praca: praca}));
    close()
}

function next(args) {
    const lastSelected = selected
    if (args == 'left') {
        if (selected - 1 >= 1) {
            selected = selected - 1
        }
    }  else if (args == 'right') {
        if (selected + 1 <= maxKurwy) {
            selected = selected + 1
        }
    }
    $("#" + lastSelected).fadeOut();
    $("#" + selected).fadeIn();

    $("#" + lastSelected).removeClass('selected')
    $("#" + selected).addClass('selected')
}

$(document).keyup(function(e) {
    if(e.keyCode == 27 && isOpen){
        close()
        $.post('https://goat_jct/close', JSON.stringify({}));
    }
})
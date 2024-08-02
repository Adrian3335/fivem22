let przyciskjeden = 'f1'
let przyciskdwa = 'f1'
let przycisktrzy = 'f1'

$(document).ready(function(){
    // $('#pop-info').hide();
    window.addEventListener('message', event => {
        switch (event.data.action) {
            case "toggleHint":
                toggleHint(event.data.status, event.data.data, event.data.clear)
                break;
            case 'open': {
                updateKeyInfo(event.data.datas)
                $(`#keys-info`).show()
                $(`#sunshine-test`).show()
                break
            }
            case 'close': {
                $(`#keys-info`).hide()
                $(`#sunshine-test`).hide()
                $(`#keys-three`).hide()
                $(`#keys-two`).hide()
                $(`#keys-one`).hide()
                break
            }
        }
    });
    

});







const toggleHint = (status, data, clear) => {
    if(status  == true) {
        if (data?.title && data?.content) {
            $("#hint-title").text(data.title)
            $("#hint-content").html(data.content)
        }

        if ($("#hint-title").text() != "" && $("#hint-content").html()) {
            $("#hint-container").show()
        }
    } else {
        $("#hint-container").hide()

        if (clear) {
            $("#hint-title").text('')
            $("#hint-content").html('')
        }
    }
}

const updateKeyInfo = (keys) => {
    $("#keys-info").html('');
    let keyCounter = 0;
    $.each(keys, function(index, data) {

        // Tworzenie nowego elementu div
        const div = $("<div></div>");

        // Ustawianie atrybutów id i style dla div
        div.attr("id", data.label);
        div.attr("style", "display: block");

        // Tworzenie elementów wewnątrz div
        const img = $("<img>");
        img.attr("src", 'keys/'+ data.key + '.png');
        img.attr("class", "images");

        const span = $("<span></span>");
        span.attr("class", "text");
        span.text(data.label);

        // Dodawanie elementów do div
        div.append(img);
        div.append(span);

        // Dodawanie div do strony (np. do elementu o id "keys-info")
        $("#keys-info").append(div);
    });
}
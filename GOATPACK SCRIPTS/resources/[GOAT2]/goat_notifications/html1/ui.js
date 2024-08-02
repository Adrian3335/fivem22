
let movedNotifs = 0;

// BODYCAM
function toggleBodycam(state) {
    switch (state) {
        case true:
            $('#bodycam').css('display', 'flex');
            updateDate();
            let bodycamInterval = setInterval(function() {
                updateDate();
            }, 1000);
            break;

        default:
            $('#bodycam').css('display', 'none');
            try {
                clearInterval(bodycamInterval);
            } catch (e) {}
            break;
    }
}

function updateBodycamData(type, officer, deptName) {
    switch (type) {
        case "bodycam":
            $('#line1').html(`REC <div id="dot">🔴</div> BODYCAM `);
            $('#line2').html(officer);
            $('#line3').html(deptName);
            $('#bodycam-img').attr('src', 'https://i.imgur.com/AokuZ59.png');
            break;
    
        case "gopro":
            $('#line1').html(`REC <div id="dot">🔴</div> GoPro`);
            $('#line2').html('');
            $('#line3').html('');
            $('#bodycam-img').attr('src', 'https://i.imgur.com/oS6ssal.png');
            break;
    }
}

function updateDate() {
    var d = new Date();
    let dzien = d.getDate();
    if (dzien < 10) {
        dzien = "0" + dzien;
    }
    let miesiace = new Array();
    miesiace[0] = "JAN";
    miesiace[1] = "FEB";
    miesiace[2] = "MAR";
    miesiace[3] = "APR";
    miesiace[4] = "MAY";
    miesiace[5] = "JUN";
    miesiace[6] = "JUL";
    miesiace[7] = "AUG";
    miesiace[8] = "SEP";
    miesiace[9] = "OCT";
    miesiace[10] = "NOV";
    miesiace[11] = "DEC";
    let miesiac = miesiace[d.getMonth()];
    let rok = d.getFullYear();
    let godzina = d.getHours();
    if (godzina < 10) {
        godzina = "0" + godzina;
    }
    let minuta = d.getMinutes();
    if (minuta < 10) {
        minuta = "0" + minuta;
    }
    let sekunda = d.getSeconds();
    if (sekunda < 10) {
        sekunda = "0" + sekunda;
    }
    $('#line4').html(`Godzina: ${godzina}:${minuta}:${sekunda}`);
}

// PD NOTIFICATION
function showFactionNotif(notifData) {
    $('#new-notifs').append(`
        <div class="notif" id="faction-notif-${notifData.id}">
            <div class="header">
            <div class="header-1" style="color: ${notifData.textColor}; background-color: ${notifData.bgColor}">${notifData.title1}</div>
                <div class="header-2">${notifData.title2}</div>
            </div>
        </div>
    `)
    if (notifData.isPinable) {
        $('#all-notifs').prepend(`
            <div class="notif" id="faction-all-notif-${notifData.id}">
                <div class="header">
                    <div class="header-1" style="color: ${notifData.textColor}; background-color: ${notifData.bgColor}">${notifData.title1}</div>
                    <div class="header-2">${notifData.title2}</div>
                    <img class="pin" src="./img/faction-notifs/pin.png" onClick="createRoute(${notifData.id})">
                    <img class="close" src="./img/faction-notifs/close.png" onClick="removeNotification(${notifData.id})">
                </div>
            </div>
        `)
    } else {
        $('#all-notifs').prepend(`
            <div class="notif" id="faction-all-notif-${notifData.id}">
                <div class="header">
                <div class="header-1" style="color: ${notifData.textColor}; background-color: ${notifData.bgColor}">${notifData.title1}</div>
                    <div class="header-2">${notifData.title2}</div>
                    <img class="close" src="./img/faction-notifs/close.png" onClick="removeNotification(${notifData.id})">
                </div>
            </div>
        `)
    }
    $(`#faction-all-notif-${notifData.id}`).css('padding', '0.7vh');
    $(`#faction-all-notif-${notifData.id}`).css('opacity', '1');

    for (let z = 0; z < notifData.content.length; z++) {
        if (notifData.content[z].type == "msg") {
            $(`#faction-notif-${notifData.id}`).append(`
                <div class="text-box">${notifData.content[z].text}</div>
            `)
            $(`#faction-all-notif-${notifData.id}`).append(`
                <div class="text-box">${notifData.content[z].text}</div>
            `)
        } else {
            $(`#faction-notif-${notifData.id}`).append(`
                <div class="detail"><img src="./img/faction-notifs/${notifData.content[z].type}.png"> <div>${notifData.content[z].text}</div></div>
            `)
            $(`#faction-all-notif-${notifData.id}`).append(`
                <div class="detail"><img src="./img/faction-notifs/${notifData.content[z].type}.png"> <div>${notifData.content[z].text}</div></div>
            `)
        }
    }

    $(`#faction-notif-${notifData.id}`).css('padding', '0.7vh');
    let height = $(`#faction-notif-${notifData.id}`).css('height');
    $(`#faction-notif-${notifData.id}`).css('height', '0');
    $(`#faction-notif-${notifData.id}`).css('padding', '0');
    $(`#faction-notif-${notifData.id}`).css('transition', 'height 0.5s, opacity 0.3s, margin-bottom 0.5s');
    setTimeout(() => {
        $(`#faction-notif-${notifData.id}`).css('height', height);
        $(`#faction-notif-${notifData.id}`).css('padding', '0.7vh');
    }, 10);
    setTimeout(() => {
        $(`#faction-notif-${notifData.id}`).css('opacity', '1');
    }, 500);
    setTimeout(() => {
        $(`#faction-notif-${notifData.id}`).css('opacity', '0');
    }, 10000);
    setTimeout(() => {
        $(`#faction-notif-${notifData.id}`).css('height', '0');
        $(`#faction-notif-${notifData.id}`).css('padding', '0');
        $(`#faction-notif-${notifData.id}`).css('margin-bottom', '0');
    }, 10500);
}

let notifState = false;

function switchNotifs(state) {
    notifState = state;

    if (state === true) {
        toggleItemSlots(false)
        $('#new-notifs').css('display', 'none');
        $('#all-notifs').css('display', 'block');
    } else {
        toggleItemSlots(settings[9])
        $('#all-notifs').css('display', 'none');
        $('#new-notifs').css('display', 'block');
    }
}

function createRoute(id) {
    sendRequest("createRoute", {id: id});
}

function removeNotification(id) {
    $(`#faction-all-notif-${id}`).remove();
}

window.addEventListener('message', (event) => {
    let data = event.data

    switch (data.action) {
        case "itemNotification":
            showItemInteractionNotif(data.itemName, data.title, data.fullName, data.amount)
            break;
        case "sendNotification":
            showNotification(data.type, data.header, data.content)
            break;
        case "showProgressBar":
            showProgressBar(data.label, data.duration)
            break;
        case "cancelProgressBar":
            cancelProgressBar();
            break;
        case "updateOxygen":
            updateOxygen(data.state, data.percentage)
            break;
        case "toggleBodycam":
            toggleBodycam(data.state);
            break;
        case "updateBodycamData":
            updateBodycamData("bodycam", data.data.name, data.data.department);
            break;
        case "showFactionNotification":
            showFactionNotif(data.data, data.shouldDisplay);
            break;
        case "switchNotifs":
            switchNotifs(true);
            break;
        case "clearNotifs":
            $('#all-notifs').html('');
            $('#new-notifs').html('');
            break;
        default:
            break;
    }
});
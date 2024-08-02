let notificationColors = {
    caution: "ffff00",
    failure: "ff0000",
    information: "0085FF",
    question: "ff00ff",
    success: "00ff00",
    warning: "ff6600",
}

let notificationId = 0;
let movedNotifs = 0;

function showNotification(type, header, text) {
    notificationId++;
    let notif123 = notificationId;
    $('#notifications').append(`
        <div class="notification" id="notification-${notif123}">
            <div class="notification-content">
                <div class="notification-image">
                    <img src="./img/notifiactions/${type}.png">
                </div>
                <div class="notification-text">
                    <div class="notification-line1">${header}</div>
                    <div class="notification-line2">${text}</div>
                </div>
            </div>
            <div class="notification-progress">
                <div class="notification-progress-value" id="notification-${notif123}-val"></div>
            </div>
        </div>
    `)
    $(`#notification-${notif123}-val`).css("background-color", "#" + notificationColors[type]);
    setTimeout(function () {
        $(`#notification-${notif123}`).css("animation-name", "notificationOut");
        movedNotifs++;
        $(`#notification-${notif123}`).css("height", $(`#notification-${notif123}`).height());
    }, 1000 + 3000);
    setTimeout(function () {
        $(`#notification-${notif123}`).css("height", "0");
        $(`#notification-${notif123}`).css("margin-top", "0");
        //$('#notifications').css("transform", `translateY(${movedNotifs * 4}vw)`);
    }, 1000 + 3000 + 1000);
    setTimeout(function () {
        $(`#notification-${notif123}`).remove();
    }, 1000 + 3000 + 1000 + 300);
}

let progressbar1, progressbar2, progressbar3, progressbar4

function showProgressBar(title, time) {
    $('#progressbar-val').css('transition', `width linear 0s`);
    $('#progressbar-val').css('width', '0');
    $('#progressbar-title').html(title);
    $('#progressbar').css('height', '4vh');
    $('#progressbar').css('margin-top', `1vh`);
    progressbar1 = setTimeout(function () {
        $('#progressbar').css('opacity', '1');
    }, 500);
    progressbar2 = setTimeout(function () {
        $('#progressbar-val').css('transition', `width linear ${time / 1000 + "s"}`);
        $('#progressbar-val').css('width', '100%');
    }, 1000);
    progressbar3 = setTimeout(function () {
        $('#progressbar').css('opacity', '0');
        sendRequest("finishProgressBar")
    }, 1000 + time);
    progressbar4 = setTimeout(function () {
        $('#progressbar').css('height', '0');
        $('#progressbar').css('margin-top', `0`);
    }, 1000 + time + 500);
}

function cancelProgressBar() {
    $('#progressbar').css('opacity', '0');
    $('#progressbar').css('height', '0');
    clearTimeout(progressbar1);
    clearTimeout(progressbar2);
    clearTimeout(progressbar3);
    clearTimeout(progressbar4);
}

let itemInteractionNotifId = 0;

function showItemInteractionNotif(itemBriefName, interactionType, itemFullName, amount) {
    itemInteractionNotifId++;
    let abc = itemInteractionNotifId;
    let amount1 = "";
    if (amount > 1) {
        amount1 = amount + "x ";
    }
    $('#interactions').append(`
        <div class="item-interaction" id="item-interaction-${abc}">
            <img src="https://cfx-nui-ox_inventory/web/images/${itemBriefName}.png" class="interaction-image">
            <div class="interaction-text">
                <div class="interaction-name">${interactionType}</div>
                <div class="item-name">${amount1 + itemFullName}</div>
            </div>
        </div>
    `);
    $(`#item-interaction-${abc}`).css('height', '5vh');
    setTimeout(function () {
        $(`#item-interaction-${abc}`).css('opacity', '1');
    }, 300);
    setTimeout(function () {
        $(`#item-interaction-${abc}`).css('opacity', '0');
    }, 2300);
    setTimeout(function () {
        $(`#item-interaction-${abc}`).css('height', '0');
        $(`#item-interaction-${abc}`).css('margin-top', '0');
    }, 2600);
}

let showOxygenTimeout1
let hideOxygenTimeout1
const updateOxygen = (state, percentage) => {
    switch (state) {
        case true: {
            clearTimeout(hideOxygenTimeout1);
            document.getElementById('oxygen').style.height = `5vh`;
            document.getElementById('oxygen').style.marginTop = `1vh`;

            showOxygenTimeout1 = setTimeout(() => {
                document.getElementById('oxygen').style.opacity = `1`;
            }, 500)

            document.getElementById('oxygen-val').style.height = `${percentage / 25}vh`;
            break;
        }
        default: {
            clearTimeout(showOxygenTimeout1);
            document.getElementById('oxygen').style.opacity = `0`;

            hideOxygenTimeout1 = setTimeout(() => {
                document.getElementById('oxygen').style.height = `0`;
                document.getElementById('oxygen').style.marginTop = `0`;
            }, 500)
            break;
        }
    }
}

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
            $('#line1').html(`REC <div id="dot">🔴</div> AXON BODY 3`);
            $('#line2').html(officer);
            $('#line3').html(deptName);
            $('#bodycam-img').attr('src', 'img/faction-notifs/bodycam.png');
            break;
    
        case "gopro":
            $('#line1').html(`REC <div id="dot">🔴</div> GoPro`);
            $('#line2').html('');
            $('#line3').html('');
            $('#bodycam-img').attr('src', 'img/faction-notifs/bodycam.png');
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
    $('#line4').html(`${dzien} ${miesiac} ${rok} ${godzina}:${minuta}:${sekunda}`);
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
                <div class="detail"><div>${notifData.content[z].text}</div> <img src="./img/faction-notifs/${notifData.content[z].type}.png"></div>
            `)
            $(`#faction-all-notif-${notifData.id}`).append(`
                <div class="detail"><div>${notifData.content[z].text}</div> <img src="./img/faction-notifs/${notifData.content[z].type}.png"></div>
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
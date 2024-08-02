let notificationColors = {
    caution: "ffff00",
    failure: "ff0000",
    information: "0085FF",
    question: "ff00ff",
    success: "00ff00",
    warning: "ff6600",
    thirst: "0077ff",
    bank: "00f055",
    hunger: "ff9100",
    caroff: "ff4343",
    caron: "3eff7e",
    carkey: "ff9d3e",
}

let notificationId = 0;
let movedNotifs = 0;
let notificationCount = 0;

function showNotification(type, header, text) {
    if (notificationCount >= 5) {
        return; // Przerwij tworzenie nowych powiadomień, jeśli osiągnięto limit (5)
    }

    notificationCount++;

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
            <svg
            class="notif-progressbar"
            >
            <circle
                stroke="#FFFFFF40"
                stroke-width="0.24vh"
                fill="transparent"
                r="0.7vh"
                cx="1vh"
                cy="1vh"
            />
            <circle
                class="notif-progressbar-circle"
                stroke="#ffffff"
                stroke-width="0.24vh"

                fill="transparent"
                r="0.7vh"
                cx="1vh"
                cy="1vh"
            />
        </svg>
        </div>
    `)
    const myElement = document.getElementById(`notification-${notif123}`);
    progressbar_notif(myElement, 5000);
    setTimeout(function () {
        $(`#notification-${notif123}`).css("animation-name", "notificationOut");
        movedNotifs++;
        $(`#notification-${notif123}`).css("height", $(`#notification-${notif123}`).height());
    }, 1000 + 3900);
    setTimeout(function () {
        $(`#notification-${notif123}`).css("height", "0");
        $(`#notification-${notif123}`).css("margin-top", "0");
        // $('#notifications').css("transform", `translateY(${movedNotifs * 4}vw)`);
    }, 1000 + 3000 + 1000);
    setTimeout(function () {
        $(`#notification-${notif123}`).remove();
        notificationCount--;
    }, 1000 + 3000 + 1000 + 300);
}

function progressbar_notif(element, _time) {
    const time = _time // w milisekundach
    const elem = element.querySelector(".notif-progressbar-circle");
    let radius = elem.r.baseVal.value;
    let circumference = radius * 2 * Math.PI;
    let value = circumference;
    elem.style.strokeDasharray = `${value} ${circumference}`;

    const frame = () => {
        if (value <= 0) {
            clearInterval(progressbarNotifInterval);
        } else {
            value -= circumference / (time / 1000) / 20;
            elem.style.strokeDasharray = `${value} ${circumference}`;
        }
    }
    const progressbarNotifInterval = setInterval(frame, 50); // 20 hz
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

window.addEventListener('message', (event) => {
    let data = event.data

    switch (data.action) {
        case "updateOxygen":
            updateOxygen(data.state, data.percentage)
            break;
        case "sendNotification":
            showNotification(data.type, data.header, data.content)
            break
        default:
            break;
    }
});

function toggleNotifications(state) {
    switch (state) {
        case true: {
            $('#new-notifs').show();
            break;
        }

        case false: {
            $('#new-notifs').hide();
            break;
        }

        default:
            break;
    }
}


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



function sendRequest(action, data) {
    $.post(`http://${GetParentResourceName()}/sendRequest`, JSON.stringify({action: action, data: data}));
}

document.onkeyup = function (data) {
    if (data.which == 27 && notifState === true) { // Escape key
        switchNotifs(false);
        sendRequest("closeNotifs", {});
    }
};

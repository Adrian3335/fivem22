const Root = document.querySelector(":root");

let sirenButtons = [
    'siren1-1',
    'siren1-2',
    'siren1-3',
    // 'siren2-1',
    // 'siren2-2',
    // 'siren2-3',
    'siren3-1',
    'siren3-2',
    'siren4-1',
    'siren4-2',
    'siren4-3',
    'siren-aux'
]

let controllerButtonsState = {
    code: 1,
    horn: 0,
    manual: 0,
    siren1: 0,
    siren2: 0,
    aux: 0
};

function sirenController() {
    for (let x = 0; x < sirenButtons.length; x++) {
        document.getElementById(sirenButtons[x]).classList.remove('siren-active-green');
        document.getElementById(sirenButtons[x]).classList.remove('siren-active-red');
        document.getElementById(sirenButtons[x]).classList.remove('siren-active-blue');
        document.getElementById(sirenButtons[x]).classList.remove('siren-active-orange');
    }
    document.getElementById("siren4-" + controllerButtonsState.code).classList.add('siren-active-red');
    if (controllerButtonsState.horn) {
        document.getElementById("siren3-1").classList.add('siren-active-red');
    }
    if (controllerButtonsState.manual) {
        document.getElementById("siren3-2").classList.add('siren-active-orange');
    }
    if (controllerButtonsState.aux) {
        document.getElementById("siren-aux").classList.add('siren-active-blue');
    }
    if (controllerButtonsState.siren1) {
        document.getElementById("siren1-" + controllerButtonsState.siren1).classList.add('siren-active-green');
    }
    if (controllerButtonsState.siren2) {
        document.getElementById("siren2-" + controllerButtonsState.siren2).classList.add('siren-active-green');
    }
}

function showHidesirenController(state) {
    if (state == 0) {
        $('#sc').hide();
    } else {
        $('#sc').show();
    }
}

window.addEventListener('message', function(event) {
    let data = event.data
    switch(data.action) {
        case 'startNUI':
            StartNUI(event.data.data);
            break;

            // Hud

        case 'openHudEdit':
            OpenHudEdit();
            break;
        case 'setTalkingMode':
            SetTalkingMode(event.data.data)
            break;
        case 'updateUpdateVoice':
            UpdateUpdateVoice(event.data.data)
            break;
        case 'updateStatus':
            UpdateStatus(event.data.data)
            break;
        case 'updateStreetLabel':
            updateStreetLabel(event.data.data.direction, event.data.data.zone, event.data.data.street)
            break;
        case 'pauseMenu':
            PauseMenu(event.data.data.pause)
            break;
        case 'updateCarHud':
            UpdateCarHud(event.data.data)
            break;
        case 'updateBelt':
            UpdateBelt(event.data.data.belt)
            break;
        case 'toggleHud':
            ToggleHud(event.data.data.status, event.data.data.type);
            break;
        case 'UpdateColor':
            $.post(`https://rp_ui/UpdateColor`, JSON.stringify({
                primaryColor: localStorage.getItem("mainColor"),
            }));
            break;
            // Notify
        case 'showNotify':
            ShowNotify(event.data.data)
            break;
        case "showProgressBar":
                showProgressBar(event.data.label, event.data.duration)
                break
        case "cancelProgressBar":
                cancelProgressBar();
            break;
        case "toggleSirenControl":
            showHidesirenController(data.state)
            break;
        case "sirenControlCode":
            controllerButtonsState['code'] = data.state
            sirenController()
            break;
        case "sirenControlHorn":
            controllerButtonsState['horn'] = data.state
            sirenController()
            break;
        case "sirenControlManual":
            controllerButtonsState['manual'] = data.state
            sirenController()
            break;
        case "sirenControlSiren1":
            controllerButtonsState['siren1'] = data.state
            sirenController()
            break;
        case "sirenControlSiren2":
            controllerButtonsState['siren2'] = data.state
            sirenController()
            break;
        case "sirenControlAux":
            controllerButtonsState['aux'] = data.state
            sirenController()
            break;
        case "togglePoliceRadar":
            $(".police-radar > .front > .plate-speed").css("color", "#fff");
            $(".police-radar > .back > .plate-speed").css("color", "#fff");

            $(".police-radar > .front > .plate-speed").html("0 KMH");
            $(".police-radar > .back > .plate-speed").html("0 KMH");

            $(".police-radar > .front > .plate > .plate-number").html("BRAK");
            $(".police-radar > .back > .plate > .plate-number").html("BRAK");
            
            $(".police-radar > .front > .plate > img").attr("src", `images/plates/0.png`);
            $(".police-radar > .back > .plate > img").attr("src", `images/plates/0.png`);

            
            $(".police-radar > .front > .plate > .plate-number").removeClass("index0 index1 index2 index3 index4 index5");
            $(".police-radar > .front > .plate > .plate-number").addClass(`index0`);

            
            $(".police-radar > .back > .plate > .plate-number").removeClass("index0 index1 index2 index3 index4 index5");
            $(".police-radar > .back > .plate > .plate-number").addClass(`index0`);

            if (data.state == 0) {
                $('.police-radar').css("display", "none");
            } else {
                $('.police-radar').css("display", "flex");
            }
            break;
        case "policeRadarFreezeToggle":
            if (data.state == 0) {
                $(".police-radar > .front > .plate-speed").css("color", "#fff");
                $(".police-radar > .back > .plate-speed").css("color", "#fff");
            } else {
                $(".police-radar > .front > .plate-speed").css("color", "#f00");
                $(".police-radar > .back > .plate-speed").css("color", "#f00");
            }
            break;
        case "updatePoliceRadar":
            if (data.front){
                $(".police-radar > .front > .plate-speed").html(`${data.front[1]} KMH`);
                $(".police-radar > .front > .plate > .plate-number").html(data.front[2]);
                $(".police-radar > .front > .plate > .plate-number").removeClass("index0 index1 index2 index3 index4 index5");
                $(".police-radar > .front > .plate > .plate-number").addClass(`index${data.front[3]}`);
                $(".police-radar > .front > .plate > img").attr("src", `images/plates/${data.front[3]}.png`);
            }
            if (data.back){
                $(".police-radar > .back > .plate-speed").html(`${data.back[1]} KMH`);
                $(".police-radar > .back > .plate > .plate-number").html(data.back[2]);
                $(".police-radar > .back > .plate > .plate-number").removeClass("index0 index1 index2 index3 index4 index5");
                $(".police-radar > .back > .plate > .plate-number").addClass(`index${data.back[3]}`);
                $(".police-radar > .back > .plate > img").attr("src", `images/plates/${data.back[3]}.png`);
            }
            break;
        default:
            break;
    }
})

if (localStorage.getItem("mainColor") == null) {
    Root.style.setProperty("--mainColor", '#ff3693');
    localStorage.setItem("mainColor", '#ff3693');
} else {
    var color = localStorage.getItem("mainColor")
    Root.style.setProperty("--mainColor", color);

    $("#changeColor").val(color);
}

let progressbar1, progressbar2, progressbar3, progressbar4
let progState = false

function showProgressBar(title, time) {
    progState = true
    $('#progressbar-val').css('right', '0');
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
        $.post(`https://${GetParentResourceName()}/sendRequest`, JSON.stringify({action: 'finishProgressBar'}));
    }, 1000 + time);
    progressbar4 = setTimeout(function () {
        $('#progressbar').css('height', '0');
        $('#progressbar').css('margin-top', `0`);
    }, 1000 + time + 500);
}

function cancelProgressBar() {
    progState = false
    $.post(`https://${GetParentResourceName()}/sendRequest`, JSON.stringify({action: 'cancelProgressBar'}));
    $('#progressbar').css('opacity', '0');
    $('#progressbar').css('height', '0');
    clearTimeout(progressbar1);
    clearTimeout(progressbar2);
    clearTimeout(progressbar3);
    clearTimeout(progressbar4);
}

function UpdateUpdateVoice(data) {
    if (data.voice) {
        $(".hud-micro-proximity").css("background-color", "#ff3693")
    } else {
        $(".hud-micro-proximity").css("background-color", "#a8a8a8")
    }
}

function StartNUI(data) {
    $('#playerID').html(data.playerID);
    $('#playerUID').html(data.playerUID);

    


    if (localStorage.getItem("minimap") == null) {
        localStorage.setItem("minimap", 'right');
    }

    if (localStorage.getItem("minimap") == 'right') {
        $("#3-1").checked = 'checked';
        $("#3-2").checked = '';

        $('.carhud-box').css('left', '');
        $('.carhud-box').css('right', '20px');

        $('.street-label').css('left', '');
        $('.street-label').css('right', '240px');

        $('.siren-controller').css('left', '');
        $('.siren-controller').css('right', '134px');
        
        $('.police-radar').css('left', '');
        $('.police-radar').css('right', '20px');
    } else {
        $("#3-1")[0].checked = '';
        $("#3-2")[0].checked = 'checked';

        $('.carhud-box').css('right', '');
        $('.carhud-box').css('left', '20px');

        $('.street-label').css('right', '');
        $('.street-label').css('left', '270px');

        $('.siren-controller').css('right', '');
        $('.siren-controller').css('left', '134px');

        $('.police-radar').css('right', '');
        $('.police-radar').css('left', '20px');
    }
    $.post("https://rp_ui/ChangeMinimap", JSON.stringify({
        minimapSide: localStorage.getItem("minimap")
    }));

















    if (localStorage.getItem("watermarkStatus") == null) {
        localStorage.setItem("watermarkStatus", true);
    }
    if (localStorage.getItem("watermarkStatus") == true) {
        $("#1-1")[0].checked = '';
        $("#1-2")[0].checked = 'checked';
    } else {
        $("#1-1").checked = 'checked';
        $("#1-2").checked = '';
    }





    if (localStorage.getItem("hudStatus") == null) {
        localStorage.setItem("hudStatus", true);
    }
    if (localStorage.getItem("hudStatus") == true) {
        $("#4-1")[0].checked = '';
        $("#4-2")[0].checked = 'checked';
    } else {
        $("#4-1").checked = 'checked';
        $("#4-2").checked = '';
    }

    ToggleHud(localStorage.getItem("watermarkStatus"), 'watermark');
    ToggleHud(localStorage.getItem("hudStatus"), 'hud');

    let hudShape = localStorage.getItem("hudShape")
    if (hudShape == null) {
        hudShape = "square"
    }
    changeHud(hudShape);
}

var carHudStatus = true

function UpdateCarHud(data) {
    if (carHudStatus) {
        if (data.inVehicle) {
            $('#speed-bar').css('width', (data.percentRPM * 100) + "%");
            $(".spped").html(data.speed + ' <span style="color:#fff1221">KMH</span>');

            $("#fuelGrad").html(`
                <stop offset="${data.fuel}%" stop-color="var(--mainColor)"/>
                <stop offset="${data.fuel}%" stop-color="#949494"/>
            `)
            
            if (data.engine){
                $("#engine > i").css("color", "var(--mainColor)")
            } else {
                $("#engine > i").css("color", "#949494")
            }

            if (data.tempomat){
                $("#tempomat > i").css("color", "var(--mainColor)")
            } else {
                $("#tempomat > i").css("color", "#949494")
            }

            $('.carhud-box').fadeIn();
            $('#streetlabel').fadeIn();
        } else {
            $('.carhud-box').fadeOut();
            $('#streetlabel').fadeOut();
        }
    }
}

function OpenHudEdit() {
    $('#hudedit-section').fadeIn();
}

function CloseHudEdit() {
    $('#hudedit-section').fadeOut();
    $.post("https://rp_ui/CloseHudEdit", JSON.stringify());
}


function SetTalkingMode(data) {  
    $(".hud-micro-proximity").css("width", data.proximity  + "%")
}

function UpdateStatus(data) { 
    data.health = Number(data.health);
    data.armor = Number(data.armor);
    data.hunger = Number(data.hunger);
    data.thirst = Number(data.thirst);

    $(".heart-defs1").html(`
        <linearGradient id="square-heart-grad1">
            <stop offset="${data.health}%" style="stop-color:#ff3693; stop-opacity: ${(data.health > 0 && 1 || 0)};"/>
            <stop offset="${(data.health > 0 && data.health + 5 || 0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.health > 0 && (data.health < 95 && 0.3 || 1.0) || 0)};"/>
        </linearGradient>
        <linearGradient id="square-heart-grad2">
            <stop offset="${data.health}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
            <stop offset="${(data.health > 0 && data.health + 5 || 0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
        </linearGradient>
        <filter id="square-shadowsvg-heart">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
        </filter>
        <filter id="shadowsvg-black">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
        </filter>
    `);
    $(".heart-defs2").html(`
        <linearGradient id="circle-heart-grad1">
            <stop offset="${data.health}%" style="stop-color:#ff3693; stop-opacity: ${(data.health > 0 && 1 || 0)};"/>
            <stop offset="${(data.health > 0 && data.health + 5 || 0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.health > 0 && (data.health < 95 && 0.3 || 1.0) || 0)};"/>
        </linearGradient>
        <linearGradient id="circle-heart-grad2">
            <stop offset="${data.health}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
            <stop offset="${(data.health > 0 && data.health + 5 || 0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
        </linearGradient>
        <filter id="circle-shadowsvg-heart">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
        </filter>
        <filter id="shadowsvg-black">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
        </filter>
    `);
    $(".heart-defs3").html(`
        <linearGradient id="hexagon-heart-grad1">
            <stop offset="${data.health}%" style="stop-color:#ff3693; stop-opacity: ${(data.health > 0 && 1 || 0)};"/>
            <stop offset="${(data.health > 0 && data.health + 5 || 0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.health > 0 && (data.health < 95 && 0.3 || 1.0) || 0)};"/>
        </linearGradient>
        <linearGradient id="hexagon-heart-grad2">
            <stop offset="${data.health}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
            <stop offset="${(data.health > 0 && data.health + 5 || 0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
        </linearGradient>
        <filter id="hexagon-shadowsvg-heart">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
        </filter>
        <filter id="shadowsvg-black">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
        </filter>
    `);

    if (data.armor > 0) {
        $(".hud_element_square.armor").fadeIn();
        $(".hud_element_circle.armor").fadeIn();
        $(".hud_element_hexagon.armor").fadeIn();
        $(".armor-defs1").html(`
            <linearGradient id="square-armor-grad1">
                <stop offset="${data.armor}%" style="stop-color:#ff3693; stop-opacity: 1;"/>
                <stop offset="${(data.armor > 0 && data.armor + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.armor < 95 && 0.3 || 1.0)};"/>
            </linearGradient>
            <linearGradient id="square-armor-grad2">
                <stop offset="${data.armor}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
                <stop offset="${(data.armor > 0 && data.armor + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
            </linearGradient>
            <filter id="square-shadowsvg-armor">
                <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
            </filter>
            <filter id="shadowsvg-black">
                <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
            </filter>
        `);
        $(".armor-defs2").html(`
            <linearGradient id="circle-armor-grad1">
                <stop offset="${data.armor}%" style="stop-color:#ff3693; stop-opacity: 1;"/>
                <stop offset="${(data.armor > 0 && data.armor + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.armor < 95 && 0.3 || 1.0)};"/>
            </linearGradient>
            <linearGradient id="circle-armor-grad2">
                <stop offset="${data.armor}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
                <stop offset="${(data.armor > 0 && data.armor + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
            </linearGradient>
            <filter id="circle-shadowsvg-armor">
                <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
            </filter>
            <filter id="shadowsvg-black">
                <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
            </filter>
        `);
        $(".armor-defs3").html(`
            <linearGradient id="hexagon-armor-grad1">
                <stop offset="${data.armor}%" style="stop-color:#ff3693; stop-opacity: 1;"/>
                <stop offset="${(data.armor > 0 && data.armor + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.armor < 95 && 0.3 || 1.0)};"/>
            </linearGradient>
            <linearGradient id="hexagon-armor-grad2">
                <stop offset="${data.armor}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
                <stop offset="${(data.armor > 0 && data.armor + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
            </linearGradient>
            <filter id="hexagon-shadowsvg-armor">
                <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
            </filter>
            <filter id="shadowsvg-black">
                <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
            </filter>
        `);
    } else {
        $(".hud_element_square.armor").fadeOut();
        $(".hud_element_circle.armor").fadeOut();
        $(".hud_element_hexagon.armor").fadeOut();
    }

    $(".hunger-defs1").html(`
        <linearGradient id="square-hunger-grad1">
            <stop offset="${data.hunger}%" style="stop-color:#ff3693; stop-opacity: 1;"/>
            <stop offset="${(data.hunger > 0 && data.hunger + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.hunger < 95 && 0.3 || 1.0)};"/>
        </linearGradient>
        <linearGradient id="square-hunger-grad2">
            <stop offset="${data.hunger}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
            <stop offset="${(data.hunger > 0 && data.hunger + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
        </linearGradient>
        <filter id="square-shadowsvg-hunger">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
        </filter>
        <filter id="shadowsvg-black">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
        </filter>
    `);
    $(".hunger-defs2").html(`
        <linearGradient id="circle-hunger-grad1">
            <stop offset="${data.hunger}%" style="stop-color:#ff3693; stop-opacity: 1;"/>
            <stop offset="${(data.hunger > 0 && data.hunger + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.hunger < 95 && 0.3 || 1.0)};"/>
        </linearGradient>
        <linearGradient id="circle-hunger-grad2">
            <stop offset="${data.hunger}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
            <stop offset="${(data.hunger > 0 && data.hunger + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
        </linearGradient>
        <filter id="circle-shadowsvg-hunger">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
        </filter>
        <filter id="shadowsvg-black">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
        </filter>
    `);
    $(".hunger-defs3").html(`
        <linearGradient id="hexagon-hunger-grad1">
            <stop offset="${data.hunger}%" style="stop-color:#ff3693; stop-opacity: 1;"/>
            <stop offset="${(data.hunger > 0 && data.hunger + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.hunger < 95 && 0.3 || 1.0)};"/>
        </linearGradient>
        <linearGradient id="hexagon-hunger-grad2">
            <stop offset="${data.hunger}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
            <stop offset="${(data.hunger > 0 && data.hunger + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
        </linearGradient>
        <filter id="hexagon-shadowsvg-hunger">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
        </filter>
        <filter id="shadowsvg-black">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
        </filter>
    `);

    $(".thirst-defs1").html(`
        <linearGradient id="square-thirst-grad1">
            <stop offset="${data.thirst}%" style="stop-color:#ff3693; stop-opacity: 1;"/>
            <stop offset="${(data.thirst > 0 && data.thirst + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.thirst < 95 && 0.3 || 1.0)};"/>
        </linearGradient>
        <linearGradient id="square-thirst-grad2">
            <stop offset="${data.thirst}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
            <stop offset="${(data.thirst > 0 && data.thirst + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
        </linearGradient>
        <filter id="square-shadowsvg-thirst">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
        </filter>
        <filter id="shadowsvg-black">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
        </filter>
    `);
    $(".thirst-defs2").html(`
        <linearGradient id="circle-thirst-grad1">
            <stop offset="${data.thirst}%" style="stop-color:#ff3693; stop-opacity: 1;"/>
            <stop offset="${(data.thirst > 0 && data.thirst + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.thirst < 95 && 0.3 || 1.0)};"/>
        </linearGradient>
        <linearGradient id="circle-thirst-grad2">
            <stop offset="${data.thirst}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
            <stop offset="${(data.thirst > 0 && data.thirst + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
        </linearGradient>
        <filter id="circle-shadowsvg-thirst">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
        </filter>
        <filter id="shadowsvg-black">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
        </filter>
    `);
    $(".thirst-defs3").html(`
        <linearGradient id="hexagon-thirst-grad1">
            <stop offset="${data.thirst}%" style="stop-color:#ff3693; stop-opacity: 1;"/>
            <stop offset="${(data.thirst > 0 && data.thirst + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: ${(data.thirst < 95 && 0.3 || 1.0)};"/>
        </linearGradient>
        <linearGradient id="hexagon-thirst-grad2">
            <stop offset="${data.thirst}%" style="stop-color:#ff3693; stop-opacity: 0.4;"/>
            <stop offset="${(data.thirst > 0 && data.thirst + 5 || 0.0)}%" style="stop-color:#ff3693; stop-opacity: 0.2;"/>
        </linearGradient>
        <filter id="hexagon-shadowsvg-thirst">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="#ff3693"/>
        </filter>
        <filter id="shadowsvg-black">
            <feDropShadow dx="0" dy="0" stdDeviation="5" flood-color="black"/>
        </filter>
    `);

    $(".hud-micro").css("width", $(".hud").width())
}


function PauseMenu(data) {
    if (data) {
        $('body').fadeOut();
    } else {
        $('body').fadeIn();
    }
}

function UpdateBelt(belt) {
    if (belt) {
        $("#belt > i").css("color", "var(--mainColor)");
      } else {
        $("#belt > i").css("color", "#949494");
      }
}



function ToggleHud(data, type) {
    switch(type) {
        case 'hud':
            localStorage.setItem("hudStatus", data);
            if (data) {
                $('#hud').fadeIn();
            } else {
                $('#hud').fadeOut();
            }
            break;
        case 'carhud':
            carHudStatus = data
            if (data) {
                $('.carhud-box').fadeIn();
                $('#streetlabel').fadeIn();
            } else {
                $('.carhud-box').fadeOut();
                $('#streetlabel').fadeOut();
            }
            break;
        case 'watermark':
            localStorage.setItem("watermarkStatus", data);
            if (data) {
                $('#watermark').fadeIn();
            } else {
                $('#watermark').fadeOut();
            }
            break;
        case 'minimap':
            if (data) {
                $.post("https://rp_ui/ChangeMinimap", JSON.stringify({
                    minimapSide: 'left'
                }));
                $('.carhud-box').css('right', '');
                $('.carhud-box').css('left', '20px');

                $('.street-label').css('right', '');
                $('.street-label').css('left', '300px');

                $('.siren-controller').css('right', '');
                $('.siren-controller').css('left', '134px');
                        
                $('.police-radar').css('right', '');
                $('.police-radar').css('left', '20px');
                localStorage.setItem("minimap", 'left');
            } else {
                $.post("https://rp_ui/ChangeMinimap", JSON.stringify({
                    minimapSide: 'right'
                }));
                $('.carhud-box').css('left', '');
                $('.carhud-box').css('right', '20px');

                $('.street-label').css('left', '');
                $('.street-label').css('right', '300px');
                
                $('.siren-controller').css('left', '');
                $('.siren-controller').css('right', '134px');
                
                $('.police-radar').css('left', '');
                $('.police-radar').css('right', '20px');
                localStorage.setItem("minimap", 'right');
            }
            break;
        case 'cam':
            if (data) {
                $('#cam').fadeIn();
            } else {
                $('#cam').fadeOut();
            }
            break;
        default:
            break;
    }
}

function updateStreetLabel(direction, line1, line2) {
    $('.direction').html(direction);
    $('.locaation-1').html(line1);
    $('.locaation-2').html(line2);
}

var CurrentIcon = 'health';

function SelectIcon(icon) {  

    $(".hudedit__" + CurrentIcon).removeClass("selected")

    $(".hudedit__" + icon).addClass("selected")

    CurrentIcon = icon
    const color = Root.style.getPropertyValue('--' + CurrentIcon)

    $('#changeColor').val(color);
}

$(document).ready(function(){
    $('#changeColor').change(function(){
        var color = $(this).val();
        Root.style.setProperty("--" + CurrentIcon, color);
        localStorage.setItem(CurrentIcon, color);
    })

    $('#changeMainColor').change(function(){
        var color = $(this).val();
        Root.style.setProperty("--mainColor", color);
        localStorage.setItem('mainColor', color);

        $.post("https://rp_ui/UpdateColor", JSON.stringify({
            primaryColor: color,
            secondaryColor: localStorage.getItem("mainBgColor"),
        }));
    })

    $('#changeMainBgColor').change(function(){
        var color = $(this).val();
        Root.style.setProperty("--mainBgColor", color);
        localStorage.setItem('mainBgColor', color);

        $.post("https://rp_ui/UpdateColor", JSON.stringify({
            primaryColor: localStorage.getItem("mainColor"),
            secondaryColor: color,
        }));
    })
    
})








$(document).on('keyup',function(evt) {
    if (evt.keyCode == 27) {
        CloseHudEdit();
    }
});

var NotifyId = 0
var audioPlayer = null;

function ShowNotify(data) {

    NotifyId++

    setTimeout(() => {
        if (audioPlayer != null) {
            audioPlayer.pause();
        }
        audioPlayer = new Howl({src: ["./sound/intuition.mp3"]});
        audioPlayer.volume(1);
        audioPlayer.play();
    }, 500);

    if (data.title == undefined) {
        $('.notifications').append(`
        <div id="notify-` + NotifyId + `" class="notification" style="background: ` + data.background + `;">
            <div class="icon" style="background-color: ` + data.color + `;">
                <i class="` + data.icon + `"></i>
            </div>
            <div class="content">
                <span class="title2">` + data.description + `</span>
            </div>
        </div>`);
    } else {
        $('.notifications').append(`
        <div id="notify-` + NotifyId + `" class="notification" style="background: ` + data.background + `;">
            <div class="icon" style="background-color: ` + data.color + `;">
                <i class="` + data.icon + `"></i>
            </div>
            <div class="content">
                <span class="title">` + data.title + `</span>
                <span class="description">` + data.description + `</span>
            </div>
        </div>`);
    }

    $( `#notify-` + NotifyId ).animate({
        left: "+=400",
    }, 600, function() {
    });

    RemoveNotify(NotifyId, data.time)
}
function RemoveNotify(id, time) {
    setTimeout(() => {
        $( `#notify-` + id ).animate({
            left: "-=400",
        }, 1000, function() {
            $('#notify-' + id).remove()
        });
    }, time);
}

function changeHud(type){
    $(".hudIcon").removeClass("active");
    $(".fa-" + type).addClass("active");
    $(".hud__container").css("display", "none");
    $(".hud__container.style-" + type).css("display", "flex");
    localStorage.setItem("hudShape", type);
}

$.post(`https://${GetParentResourceName()}/loaded`, JSON.stringify({}));
var speedo = null
document.addEventListener('DOMContentLoaded', function () {

    $('#garage').hide()
    $('#hint').hide()

    console.log = function() {}

}, false)

$(function () {
    var cars_number = 0;

    window.addEventListener('message', function (event) {

        if (event.data.action == "show_garage") {
            let elename = " GARAGE"
            let lays_strong = '<div id="garage-top"><h1 id="action-name"><i class="fas fa-warehouse"></i>'+elename+'</h1><i class="fas fa-times" id="action-close"></i></div><div id="car-list"> </div>'
            $('#garage').append(lays_strong)
            $('#garage').show()
        } else if (event.data.action == "show_impound") {
            let elename = " IMPOUND"
            let lays_strong = '<div id="garage-top"><h1 id="action-name"><i class="fas fa-warehouse"></i>'+elename+'</h1><i class="fas fa-times" id="action-close"></i></div><div id="car-list"> </div>'
            $('#garage').append(lays_strong)
            $('#garage').show()
        } else if (event.data.action == "show_police_impound") {
            let elename = " POLICE IMPOUND"
            let lays_strong = '<div id="garage-top"><h1 id="action-name"><i class="fas fa-warehouse"></i>'+elename+'</h1><i class="fas fa-times" id="action-close"></i></div><div id="car-list"> </div>'
            $('#garage').append(lays_strong)
            $('#garage').show()
        } else if (event.data.action == "hide_garage") {
            $('#garage').hide()
            document.getElementById("garage-top").remove();
            document.getElementById("car-list").remove();
            cars_number = 0
        } else if (event.data.action == "add_car") {
            let engine = event.data.engine / 10
            engine = engine+"%"
            let body = event.data.body / 10
            body = body+"%"
            let string = '<div id="car-'+cars_number+'" class="car" model="'+event.data.plate+'"><div id="car-d-info"><h1 id="car-name">' +event.data.modelName+ '</h1><h3 id="car-plate">' +event.data.plate+ '</h3></div><div id="car-statuses"><div id="component-status"><h3 id="component-name">Engine Health</h3><div class="progress-bar"><span class="progress-bar-fill" id="health-bar" style="width: '+engine+';"></span></div></div><div id="component-status"><h3 id="component-name">Body Health</h3><div class="progress-bar"><span class="progress-bar-fill" id="health-bar" style="width: '+body+';"></span></div></div></div><h6 onclick="takecar('+cars_number+')" id="choose-car-'+cars_number+'" class="choose-car">CHOOSE CAR</h6></div>'
            cars_number = cars_number + 1;
            $("#car-list").append(string)
        } else if (event.data.action == "add_impound_car") {
            let engine = event.data.engine / 10
            engine = engine+"%"
            let body = event.data.body / 10
            body = body+"%"
            let string = '<div id="towcar-'+cars_number+'" class="car" model="'+event.data.plate+'"><div id="car-d-info"><h1 id="car-name">' +event.data.modelName+ '</h1><h3 id="car-plate">' +event.data.plate+ '</h3></div><div id="car-statuses"><div id="component-status"><h3 id="component-name">Engine Health</h3><div class="progress-bar"><span class="progress-bar-fill" id="health-bar" style="width: '+engine+';"></span></div></div><div id="component-status"><h3 id="component-name">Body Health</h3><div class="progress-bar"><span class="progress-bar-fill" id="health-bar" style="width: '+body+';"></span></div></div></div><h6 onclick="towcar('+cars_number+')" id="impound-car-'+cars_number+'" class="choose-car">IMPOUND CAR</h6></div>'
            cars_number = cars_number + 1;
            $("#car-list").append(string)
        } else if (event.data.action == "add_police_impound_car") {
            let engine = event.data.engine / 10
            engine = engine+"%"
            let body = event.data.body / 10
            body = body+"%"
            let string = '<div id="towcar-'+cars_number+'" class="car" model="'+event.data.plate+'"><div id="car-d-info"><h1 id="car-name">' +event.data.modelName+ '</h1><h3 id="car-plate">' +event.data.plate+ '</h3></div><div id="car-statuses"><div id="component-status"><h3 id="component-name">Engine Health</h3><div class="progress-bar"><span class="progress-bar-fill" id="health-bar" style="width: '+engine+';"></span></div></div><div id="component-status"><h3 id="component-name">Body Health</h3><div class="progress-bar"><span class="progress-bar-fill" id="health-bar" style="width: '+body+';"></span></div></div></div><h6 onclick="policetowcar('+cars_number+')" id="police-impound-car-'+cars_number+'" class="choose-car">IMPOUND CAR</h6></div>'
            cars_number = cars_number + 1;
            $("#car-list").append(string)
        } else if (event.data.action == "show_hint") {
            document.getElementById("key").innerHTML = event.data.keyword
            document.getElementById("hint-text").innerHTML = event.data.maintext
            document.getElementById("hint-desc").innerHTML = event.data.desc
            $('#hint').show()
        } else if (event.data.action == "hide_hint") {
            $('#hint').hide()
        }

        document.onkeyup = function (data) {
            if (data.which == 27) {
              $.post('https://rp-garages/close', JSON.stringify({}));
            }
        };

        $("#action-close").click(function(){
            $.post('https://rp-garages/close', JSON.stringify({})); 
        });
    })
})
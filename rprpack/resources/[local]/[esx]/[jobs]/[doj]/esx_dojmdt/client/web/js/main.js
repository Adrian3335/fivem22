$(document).ready(function () {
    let show = 'none';
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "OpenMDT":
                $('.tablet-all').show();
                $(".holder").show();
                $(".avatar").hide();
                $(".nav-user").hide();
                $(".default-content").hide();
                setTimeout(function() {
                    $(".holder").fadeOut(700);
                    $(".avatar").fadeIn(700);
                    $(".nav-user").fadeIn(700);
                    $(".default-content").fadeIn(700);
                }, 3000);
            break;
            case "SendMDTdata":
                let data = event.data.mdtdata;
                $('.default-duty-info-box').empty();
                $('.sim-holder-content').empty();
                $('.announcements-content-undermenu').empty();
                $('.raport-content-undermenu').empty();
                $('#Wykroczenia_drogowe, #Przestępstwa_lekkie, #Przestępstwa_ciężkie, #Przestępstwa_związane_z_kontrabandą_i_nielegalnymi_substancjami, #Przestępstwa_związane_z_bronią').empty();
                $('.loading-logo').css({'background-image' : `url("img/${data.job}.png")`});
                $('.logo').css({'background-image' : `url("img/${data.job}2.png")`})
                $('#car-counter').html(data.vehCount);
                $('#people-counter').html(data.charCount);
                $('#week-counter').html(data.mandatyTydzien);
                $('#week-month').html(data.mandatyMiesiac);
                $('#name').html(data.Player.firstname + " " + data.Player.lastname);
                $('#grade').html(data.Player.job.grade_label);
                $('#note-textbox').val(data.Notepad);
                if(data.Player.job.grade_name == "boss") {
                    $("#announce_textbox").prop("readonly", false); 
                    $('.boss-column').show();
                    show = 'block';
                } else {
                    $("#announce_textbox").prop("readonly", true); 
                    $('.boss-column').hide();
                    show = 'none';
                }
                for (let key in data.OstatnieMandaty) {
                    $('#ostatniemandaty-info').append(
                        `<div class="default-duty-info" style="margin-top: 8px; text-align: center;">
                            <div class="default-fineid">#${data.OstatnieMandaty[key].id}</div>
                            <div class="default-person">${data.OstatnieMandaty[key].charname}</div>
                            <div class="default-date">${new Date(data.OstatnieMandaty[key].date).toLocaleDateString("pl-PL")}</div>
                            <div class="default-officer">${data.OstatnieMandaty[key].fp}</div>
                            <div class="default-fine">${data.OstatnieMandaty[key].fee}$</div>
                            <div class="default-jail">${data.OstatnieMandaty[key].length} Miesięcy</div>
                        </div>`
                    )
                }
                for (let key in data.Ogloszenia) {
                    $('.announcements-content-undermenu').append(
                        `<div class="announcements-content-holder" style="margin-top: 1%; margin-bottom: 0.5%;">
                            <div id="announcements-content-reason" style="width: 43%;">${data.Ogloszenia[key].ogloszenie}</div>
                            <div id="announcements-content-fine" style="width: 20%;">${data.Ogloszenia[key].fp}</div>
                            <div id="announcements-content-date" style="width: 20%;">${new Date(data.Ogloszenia[key].date).toLocaleDateString("pl-PL")}</div>
                            <div id="announcements-content-remove" style="width: 5%; display: ${show};"><i class="far fa-trash-alt"></i></div>
                        </div>`
                    )
                }
                for (let key in data.Raporty) {
                    $('.raport-content-undermenu').append(
                        `<div class="raport-content-holder" style="margin-top: 1%; margin-bottom: 0.5%;">
                            <div id="raport-content-reason" style="width: 43%;">${data.Raporty[key].raport}</div>
                            <div id="raport-content-fine" style="width: 20%;">${data.Raporty[key].fp}</div>
                            <div id="raport-content-date" style="width: 20%;">${new Date(data.Raporty[key].date).toLocaleDateString("pl-PL")}</div>
                            <div id="raport-content-remove" style="width: 5%; display: ${show};"><i class="far fa-trash-alt"></i></div>
                        </div>`
                    )
                }
                for (let key in data.Taryfikator) {
                    for (let key2 in data.Taryfikator[key]) {
                        $(`#${key.replace(/\s+/g,"_")}`).append(
                            `<div class="tariff-holder" data-name="${key2}">
                                <div class="tariff-holder-title">${key2}</div>
                                <div class="tariff-holder-fee" style="width: 100%">
                                    <div id="tariff-grzywna" data-grzywna="${data.Taryfikator[key][key2]["Ticket min"]}" class="tariff-holder-title">Grzywna: $${data.Taryfikator[key][key2]["Ticket min"]} - $${data.Taryfikator[key][key2]["Ticket max"]}</div>
                                    <div id="tariff-jail" data-jail="${data.Taryfikator[key][key2]["Jail min"]}" class="tariff-holder-title">Wyrok: ${data.Taryfikator[key][key2]["Jail min"]} - ${data.Taryfikator[key][key2]["Jail max"]} miesięcy</div>
                                </div>
                            </div>`
                         )
                    }
                }
                for (let key in data.Doj) {
                    let status = 'Nie';
                    if(data.Doj[key].duty_status == 1) {
                        status = 'Nie'
                    } else if(data.Doj[key].duty_status == 2) {
                        status = 'Tak'
                    }
                    $('#onduty-info').append(
                        `<div class='default-duty-info' style='margin-top: 8px;'>
                            <div class='duty-who'>${data.Doj[key].firstname + ' ' + data.Doj[key].lastname}</div>
                            <div class="duty-number">${data.Doj[key].phone_number}</div>
                            <div class="duty-online">
                                <div class="duty-yes"><span style="color: ${data.Doj[key].color};">${status}</span></div>
                            </div>
                        </div>`
                    )
                }
            break;
        }
    })
    
    let array = [];
    $(document).on("click", ".tariff-holder", function (event) {
        if(!$(".tariff-input").is(':focus')){
            const title = $(this).children(".tariff-holder-title").html()
            const grzywna = $(this).children('.tariff-holder-fee').children('#tariff-grzywna').data("grzywna");
            const jail = $(this).children('.tariff-holder-fee').children('#tariff-jail').data("jail");

            const tariff_cost = parseInt($('#tariff-cost').html());
            const tariff_minutes = parseInt($('#tariff-minutes').html());

            let index = -1;
            for (let key in array) {
                if(array[key].title == title) {
                    index = key
                }
            }
            if(index != -1) {
                array[index].value++
                $('.tariff-counter-text').html("");
                for (let key in array) {
                    $('.tariff-counter-text').append("x" + array[key].value + " " + array[key].title + ", ");
                }
            } else {
                var temparray = {
                    title: title,
                    value: 1
                }
                array.push(temparray)
                $('.tariff-counter-text').append("x" + 1 + " " + title + ", ");
            }
            $('#tariff-cost').html(tariff_cost + grzywna);
            $('#tariff-minutes').html(tariff_minutes + jail);
        }   
    });

    $('.tariff-clear-button').on('click', function(){
        $('#tariff-cost').html(0);
        $('#tariff-minutes').html(0);
        $('.tariff-counter-text').html("");
        array = [];
    })


    $('.tariff-copy-button').on('click', function(){
        const text = $('.tariff-counter-text').html();
        copyToClipboard(text);
    })

    function copyToClipboard(text) {
        var sampleTextarea = document.createElement("textarea");
        document.body.appendChild(sampleTextarea);
        sampleTextarea.value = text; 
        sampleTextarea.select(); 
        document.execCommand("copy");
        document.body.removeChild(sampleTextarea);
    }

    $('#car-search').on('click', function(){
        $('.car-founded-box').show();
        $('.car-holder-content').empty();
        const plate = $('#car-plate').val();
        $.post('http://esx_dojmdt/GetVehicleByPlate', JSON.stringify({plate: plate}), function(vehicledata){
            for (let key in vehicledata) {
                $('.car-holder-content').append(
                   `<div class="car-holder-info" style="margin-top: 1%; margin-bottom: 0.5%; border-radius: 0px; height: 50px;">
                        <div class="car-who">
                            <div class="car-who-photo"></div>
                            ${vehicledata[key].ownername}
                        </div>
                        <div class="car-serial">${vehicledata[key].plate}</div>
                        <div class="car-model">${vehicledata[key].model}</div>
                        <div class="car-phone">${vehicledata[key].phone_number}</div>
                    </div>`
                )
            }
        })
    })

    window.tariffsearch = function() {
        let input = (document.getElementById('tariff-search').value).toLowerCase();
        let tariffs = document.getElementsByClassName('tariff-holder');
        
        if (tariffs) {
            for (i = 0; i < tariffs.length; i++) { 
                let name = tariffs[i].dataset.name.toLowerCase()
                if (name.includes(input)) {
                    tariffs[i].style.display = "flex";
                } else {
                    tariffs[i].style.display = "none";
                }
            }	
        }
    }

    $('#sim-search').on('click', function(){
        const numer = $('#sim-numer').val();
        if(numer.length > 2) {
            $('.sim-founded-box').show();
            $('.sim-holder-content').empty();
            $.post('http://esx_dojmdt/SearchNumber', JSON.stringify({numer: numer}), function(numerdata){
                $('.sim-holder-content').append(
                    `<div class="sim-holder-info" style="margin-top: 1%; margin-bottom: 0.5%; border-radius: 0px; height: 50px;">
                        <div class="sim-who">
                            <div class="sim-who-photo"></div>
                            ${numerdata.ownername}
                        </div>
                        <div class="sim-phone">${numerdata.phone_number}</div>
                    </div>`
                )
            })
        }
    })

    $('#wystaw-mandat-button').on('click', function(){
        const id = $('#mandatPlayer').val();
        const fee = $('#fee-mandat').val();
        const text = $('#text-mandat').val();
        if(fee != "" && text != "") {
            $('#fee-mandat').val("");
            $('#text-mandat').val("");
            $.post('http://esx_dojmdt/WystawMandat', JSON.stringify({id: id.split('[').pop().split(']')[0], fee: fee, text: text}));
        }
    })

    $('#wystaw-wiezienie-button').on('click', function(){
        const id = $('#jailPlayer').val();
        let fee = $('#fee-wiezienie').val();
        const text = $('#text-wiezienie').val();
        const length = $('#length-wiezienie').val();
        if(fee == "") 
        fee = 0
        if(text != "" && length != "") {
            $('#fee-wiezienie').val("");
            $('#text-wiezienie').val("");
            $('#length-wiezienie').val(""); 
            $.post('http://esx_dojmdt/WystawWiezienie', JSON.stringify({id: id.split('[').pop().split(']')[0], fee: fee, text: text, length: length}));
        }
    })

    $('#send_announce').on('click', function(){
        const text = $('#announce_textbox').val();
        $('#announce_textbox').val("");
        $.post('http://esx_dojmdt/SendAnnounce', JSON.stringify({text: text}), function(announcedata){
            $('.announcements-content-undermenu').append(
                `<div class="announcements-content-holder" style="margin-top: 1%; margin-bottom: 0.5%;">
                    <div id="announcements-content-reason" style="width: 43%;">${announcedata.text}</div>
                    <div id="announcements-content-fine" style="width: 20%;">${announcedata.owner}</div>
                    <div id="announcements-content-date" style="width: 20%;">${new Date(announcedata.date*1000).toLocaleDateString("pl-PL")}</div>
                    <div id="announcements-content-remove"><i class="far fa-trash-alt"></i></div>
                </div>`
            )
        })
    })

    $('#send_raport').on('click', function(){
        const text = $('#raport_textbox').val();
        $('#raport_textbox').val("");
        $.post('http://esx_dojmdt/SendRaport', JSON.stringify({text: text}), function(raportdata){
            $('.raport-content-undermenu').append(
                `<div class="raport-content-holder" style="margin-top: 1%; margin-bottom: 0.5%;">
                    <div id="raport-content-reason" style="width: 43%;">${raportdata.text}</div>
                    <div id="raport-content-fine" style="width: 20%;">${raportdata.owner}</div>
                    <div id="raport-content-date" style="width: 20%;">${new Date(raportdata.date*1000).toLocaleDateString("pl-PL")}</div>
                    <div id="raport-content-remove" style="width: 5%; display: ${show};"><i class="far fa-trash-alt"></i></div>
                </div>`
            )
        })
    })

    $(document).on ("click", "#announcements-content-remove", function () {
        const owner = $(this).parent().children("#announcements-content-fine").html();
        const text = $(this).parent().children("#announcements-content-reason").html();
        $.post('http://esx_dojmdt/RemoveAnnounce', JSON.stringify({fp: owner, ogloszenie: text}));
        $(this).parent().fadeOut(500);
    });

    $(document).on ("click", "#raport-content-remove", function () {
        const owner = $(this).parent().children("#raport-content-fine").html();
        const text = $(this).parent().children("#raport-content-reason").html();
        $.post('http://esx_dojmdt/RemoveRaport', JSON.stringify({fp: owner, raport: text}));
        $(this).parent().fadeOut(500);
    });

    $(document).on ("click", "#file-content-removemandat", function() {
        const id = $(this).parent().data("id");
        const identifier = $("#file-personnametype").data("identifier");
        $.post('http://esx_dojmdt/RemoveMandatKartoteka', JSON.stringify({id: id, identifier: identifier}));
        $(this).parent().fadeOut(500);
    });

    $(document).on ("click", "#file-content-removeposzukiwania", function() {
        const identifier = $("#file-personnametype").data("identifier");
        const reason = $(this).parent().children('#file-content-reason2').html();
        $.post('http://esx_dojmdt/RemovePoszukiwaniaKartoteka', JSON.stringify({identifier: identifier, reason: reason}));
        console.log(reason)
        $(this).parent().fadeOut(500);
    });

    $(document).on ("click", "#file-content-removenotatki", function() {
        const identifier = $("#file-personnametype").data("identifier");
        const note = $(this).parent().children('#file-content-note').html();
        $.post('http://esx_dojmdt/RemoveNotatkiKartoteka', JSON.stringify({identifier: identifier, note: note}));
        $(this).parent().fadeOut(500);
    });

    $(document).on ("click", "#file-content-gps", function() {
        const coords = $(this).data("coords");
        $.post('http://esx_dojmdt/setGps', JSON.stringify({coords: coords}));
    });

    $(document).on ("click", "#file-more-info", function (event) {
        const name = $(this).parent().children(".file-who").children("#file-name").html();
        const identifier = $(this).parent().children(".file-who").children("#file-name").data("identifier");    
        const dateofbirth = $(this).parent().children(".file-date").html();
        $('#file-personnametype').html(name);
        $('#file-personnametype').data("identifier", identifier);
        $('#file-persondatetype').html(dateofbirth)
        $('.moreinfo-mandaty').empty();
        $('.moreinfo-poszukiwania').empty();
        $('.moreinfo-pojazdy').empty();
        $('.moreinfo-mieszkania').empty();
        $('.moreinfo-notatki').empty();
        $(".file-licenseholderinformation[data-type='drive_bike']").children('.file-licenseowned').html('Nie');
        $(".file-licenseholderinformation[data-type='drive']").children('.file-licenseowned').html('Nie');
        $(".file-licenseholderinformation[data-type='drive_truck']").children('.file-licenseowned').html('Nie');
        $(".file-licenseholderinformation[data-type='weapon']").children('.file-licenseowned').html('Nie');
        $(".file-licenseholderinformation[data-type='test_psycho']").children('.file-licenseowned').html('Nie');
        $.post('http://esx_dojmdt/PersonMoreInfo', JSON.stringify({identifier: identifier}), function(moreinfodata){
            for (let key in moreinfodata.mandaty) {
				if (moreinfodata.canDeleteMandaty == true) {
					$('.moreinfo-mandaty').append(
						`<div class="file-content-holder" data-id="${moreinfodata.mandaty[key].id}">
							<div id="file-content-reason" style="width: 25%;">${moreinfodata.mandaty[key].reason}</div>
							<div id="file-content-fine" style="width: 15%;">$${moreinfodata.mandaty[key].fee}</div>
							<div id="file-content-jail" style="width: 15%;">${moreinfodata.mandaty[key].length}</div>
							<div id="file-content-doj" style="width: 20%;">${moreinfodata.mandaty[key].fp}</div>
							<div id="file-content-date" style="width: 15%;">${new Date(moreinfodata.mandaty[key].date).toLocaleDateString("pl-PL")}</div>
							<div id="file-content-removemandat" style="width: 5%;"><i class="far fa-trash-alt"></i></div>
						</div>`
					)
				} else {
					$('.moreinfo-mandaty').append(
						`<div class="file-content-holder" data-id="${moreinfodata.mandaty[key].id}">
							<div id="file-content-reason" style="width: 25%;">${moreinfodata.mandaty[key].reason}</div>
							<div id="file-content-fine" style="width: 15%;">$${moreinfodata.mandaty[key].fee}</div>
							<div id="file-content-jail" style="width: 15%;">${moreinfodata.mandaty[key].length}</div>
							<div id="file-content-doj" style="width: 20%;">${moreinfodata.mandaty[key].fp}</div>
							<div id="file-content-date" style="width: 15%;">${new Date(moreinfodata.mandaty[key].date).toLocaleDateString("pl-PL")}</div>
						</div>`
					)					
				}
            }
            for (let key in moreinfodata.poszukiwania) {
                $('.moreinfo-poszukiwania').append(
                    `<div class="file-content-holder" style="margin-top: 0.5%;">
                        <div id="file-content-reason2" style="width: 35%;">${moreinfodata.poszukiwania[key].reason}</div>
                        <div id="file-content-who2" style="width: 20%;">${name}</div>
                        <div id="file-content-doj2" style="width: 20%;">${moreinfodata.poszukiwania[key].fp}</div>
                        <div id="file-content-date2" style="width: 15%;">${new Date(moreinfodata.poszukiwania[key].date).toLocaleDateString("pl-PL")}</div>
                        <div id="file-content-removeposzukiwania" style="width: 5%;"><i class="far fa-trash-alt"></i></div>
                    </div>`
                )
            }
            for (let key in moreinfodata.pojadzy) {
                $('.moreinfo-pojazdy').append(
                    `<div class="file-content-holder" style="margin-top: 0.5%;">
                        <div id="file-content-carname" style="width: 50%;">${moreinfodata.pojadzy[key].model}</div>
                        <div id="file-content-carnumber" style="width: 50%;">${moreinfodata.pojadzy[key].plate}</div>
                    </div>`
                )
            }
            for (let key in moreinfodata.mieszkania) {
                console.log(moreinfodata.mieszkania[key].coords)
                $('.moreinfo-mieszkania').append(
                    `<div class="file-content-holder" style="margin-top: 0.5%;">
                        <div id="file-content-street" style="width: 75%;">${moreinfodata.mieszkania[key].label}</div>
                        <div data-coords='${moreinfodata.mieszkania[key].coords}' id="file-content-gps" style="width: 20%;"><i class="fas fa-map-marker-alt"></i></div>
                    </div>`
                )
            }
            for (let key in moreinfodata.notatki) {
                $('.moreinfo-notatki').append(
                    `<div class="file-content-holder" style="margin-top: 0.5%;">
                        <div id="file-content-note" style="width: 50%;">${moreinfodata.notatki[key].notatka}</div>
                        <div id="file-content-date5" style="width: 20%;">${new Date(moreinfodata.notatki[key].date).toLocaleDateString("pl-PL")}</div>
                        <div id="file-content-doj5" style="width: 20%;">${moreinfodata.notatki[key].fp}</div>
                        <div id="file-content-removenotatki" style="width: 10%;"><i class="far fa-trash-alt"></i></div>
                    </div>`
                )
            }
            for (let key in moreinfodata.licenses) {
                const data = moreinfodata.licenses[key];
                $(".file-licenseholderinformation[data-type='" + data.type +"']").children('.file-licenseowned').html('Tak')   
            }
			
			if (moreinfodata.canManageLicenses == true) {
				$('#file-licensesremoveaddmanage').css({'display' : `flex`})
			} else {
				$('#file-licensesremoveaddmanage').css({'display' : `none`})
			}
        })
        $('.file-content').hide();
        $('.file-content2').show();
    });
    
    $('#file-button-search').on('click', function(){
        const reasonarea = $('#file-button-reason').val();
        const name = $("#file-name").html();
        const identifier = $("#file-personnametype").data("identifier");
        if(reasonarea != "") {
            $('#file-button-reason').val("");
            $.post('http://esx_dojmdt/AddPoszukiwaniaKartoteka', JSON.stringify({identifier: identifier, reasonarea: reasonarea}), function(poszukiwaniadata){
                $('.moreinfo-poszukiwania').append(
                    `<div class="file-content-holder" style="margin-top: 0.5%;">
                        <div id="file-content-reason2" style="width: 35%;">${poszukiwaniadata.reason}</div>
                        <div id="file-content-who2" style="width: 20%;">${name}</div>
                        <div id="file-content-doj2" style="width: 20%;">${poszukiwaniadata.fp}</div>
                        <div id="file-content-date2" style="width: 15%;">${new Date(poszukiwaniadata.date*1000).toLocaleDateString("pl-PL")}</div>
                        <div id="file-content-removeposzukiwania" style="width: 5%;"><i class="far fa-trash-alt"></i></div>
                    </div>`
                )
            }); 
        }
    })

    $('#file-button-notes').on('click', function(){
        const note = $('#file-button-notetext').val();
        const identifier = $("#file-personnametype").data("identifier");
        if (note != "") {
            $("#file-button-notetext").val("");
            $.post('http://esx_dojmdt/AddNotatkaKartoteka', JSON.stringify({identifier: identifier, note: note}), function(notedata){
                $('.moreinfo-notatki').append(
                    `<div class="file-content-holder" style="margin-top: 0.5%;">
                        <div id="file-content-note" style="width: 50%;">${notedata.notatka}</div>
                        <div id="file-content-date5" style="width: 20%;">${new Date(notedata.date*1000).toLocaleDateString("pl-PL")}</div>
                        <div id="file-content-doj5" style="width: 20%;">${notedata.fp}</div>
                        <div id="file-content-removenotatki" style="width: 10%;"><i class="far fa-trash-alt"></i></div>
                    </div>`
                )
            }); 
        }
    })

    $('.nav-select').on('click', function(){
        $('.nav-select').removeClass('nav-select-color');
        $(this).addClass('nav-select-color');
    })

    $('.tariff-button').on('click', function(){
        $('.tariff-button').removeClass('tariff-button-selected');
        $(this).addClass('tariff-button-selected');
    })

    $('.file-content-button').on('click', function(){
        $('.file-content-button').removeClass('file-content-selected');
        $(this).addClass('file-content-selected');
    })

    $('.nav-select').click(function () {

        switch ($(this).attr('id')) {

            case 'default':
                hide();
                $('.default-content').delay(110).fadeIn(100);
            break;
            
            case 'fine':
                hide();
                $('.fine-content').delay(110).fadeIn(100);
                $('.nearbyPlayers').empty();
                $.post('http://esx_dojmdt/NearbyPlayers', function(nearbyplayers){
                    for (let key in nearbyplayers) {
                        $(".nearbyPlayers").append(new Option(nearbyplayers[key].name));
                    }
                })
            break;

            case 'jail':
                hide();
                $('.jail-content').delay(110).fadeIn(100);
                $('.nearbyPlayers').empty();
                $.post('http://esx_dojmdt/NearbyPlayers', function(nearbyplayers){
                    for (let key in nearbyplayers) {
                        $(".nearbyPlayers").append(new Option(nearbyplayers[key].name));
                    }
                })
            break;

            case 'tariff':
                hidetariff();
                hide();
                $('.tariff-content').delay(110).fadeIn(100);
                $('.tariff-title').text('Wykroczenia drogowe');
                $('#tariff-1-1').show();
                $('.tariff-button').removeClass('tariff-button-selected');
                $('.default-tariff').addClass('tariff-button-selected');
            break;

            case 'file':
                hide();
                $('.file-content').delay(110).fadeIn(100);
            break;

            case 'check-car':
                hide();
                $('.car-content').delay(110).fadeIn(100);
            break;

            case 'check-sim':
                hide();
                $('.sim-content').delay(110).fadeIn(100);
            break;

            case 'note':
                hide();
                $('.note-content').delay(110).fadeIn(100);
            break;

            case 'announcements':
                hide();
                $('.announcements-content').delay(110).fadeIn(100);
            break;

            case 'raports':
                hide();
                $('.raport-content').delay(110).fadeIn(100);
            break;

            case 'dispatch':
                hide();
                $('.dispatch-content').delay(110).fadeIn(100);
            break;
            
        }
    });

    $('.tariff-button').click(function () {

        switch ($(this).attr('id')) {

            case 'tariff-1':
                $('.tariff-title').text('Wykroczenia drogowe');
                hidetariff();
                $('#tariff-1-1').show();
            break;

            case 'tariff-2':
                $('.tariff-title').text('Przestępstwa lekkie');
                hidetariff();
                $('#tariff-2-2').show();
            break;

            case 'tariff-3':
                $('.tariff-title').text('Przestępstwa ciężkie');
                hidetariff();
                $('#tariff-3-3').show();
            break;

            case 'tariff-4':
                $('.tariff-title').text('Przestępstwa kontrabanda/substancje');
                hidetariff();
                $('#tariff-4-4').show();
            break;

            case 'tariff-5':
                $('.tariff-title').text('Przestępstwa związane z bronią');
                hidetariff();
                $('#tariff-5-5').show();
            break;
        }
    });

    $('.file-content-button').click(function () {
        switch ($(this).attr('id')) {
            case 'file-content-1':
                hidefile();
                $('[id=file-content-1-1]').show();
                $('#file-search-show').hide();
                $('#file-notes-show').hide();
            break;

            case 'file-content-2':
                hidefile();
                $('[id=file-content-2-2]').show();
                $('#file-search-show').show();
                $('#file-notes-show').hide();
            break;

            case 'file-content-3':
                hidefile();
                $('[id=file-content-3-3]').show();
                $('#file-search-show').hide();
                $('#file-notes-show').hide();
            break;

            case 'file-content-4':
                hidefile();
                $('[id=file-content-4-4]').show();
                $('#file-search-show').hide();
                $('#file-notes-show').hide();
            break;

            case 'file-content-5':
                hidefile();
                $('[id=file-content-5-5]').show();
                $('#file-search-show').hide();
                $('#file-notes-show').show();
            break;
        }
    });

    $('#person-search').click(function(){
        const firstname = $('#firstname-kartoteka').val();
        const lastname = $('#lastname-kartoteka').val();

        $.post('http://esx_dojmdt/SearchPersonKartoteka', JSON.stringify({firstname: firstname, lastname: lastname}), function(persondata){
            $('.file-founded-box').show();
            $('.file-holder-content').empty();
            for (let key in persondata) {
                let phone_number = persondata[key].charinfo
                let age = 2020 - parseInt(persondata[key].dateofbirth.substring(0, 4))
                if(phone_number == "") {
                    phone_number = "Brak"
                }
                $('.file-holder-content').append(`
                    <div class="file-holder-info" style="margin-top: 1%; margin-bottom: 0.5%; border-radius: 0px; height: 50px;">
                        <div class="file-who">
                            <div class="file-who-photo"></div>
                            <span id="file-name" data-identifier="${persondata[key].identifier}">${persondata[key].firstname} ${persondata[key].lastname}</span>
                        </div> 
                        <div class="file-date">${persondata[key].dateofbirth}</div>
                        <div class="file-age">${age}</div>
                        <div class="file-phone">${phone_number}</div>
                        <div class="file-look" id="file-more-info"><i class="fas fa-arrow-right"></i></div>
                    </div>
                `)
            }
        })

    });

});

//Hide
function hide() {
    $('.default-content, .fine-content, .jail-content, .tariff-content, .file-content, .file-content2, .car-content, .sim-content, .note-content, .announcements-content, .raport-content, .dispatch-content').hide();
    UpdateNotepad()
}

//Tariff
function hidetariff() {
    $('#tariff-1-1, #tariff-2-2, #tariff-3-3, #tariff-4-4, #tariff-5-5').hide();
    $('#tariff-search').val('');
    tariffsearch()
}

//File
function hidefile() {
    $('[id=file-content-1-1], [id=file-content-2-2], [id=file-content-3-3], [id=file-content-4-4], [id=file-content-5-5]').hide();
}

//Plus minus
$(document).ready(function(){
    var test = document.getElementsByClassName("no");
    var test2 = document.getElementsByClassName("yes");
    for (var i = 0; i < test.length; i++) {    
        test[i].onclick = function() {
            var lel = $(this).parents()[1];
            var qee = lel.querySelector('.file-licenseowned');
            var type = $(this).parent().parent().data('type')
            var identifier = $("#file-personnametype").data("identifier");
            qee.innerHTML = "Nie";
            $.post('http://esx_dojmdt/licencjaUsun', JSON.stringify({identifier: identifier, type: type}));
        }
    }
	
    for (var i = 0; i < test2.length; i++) {    
        test2[i].onclick = function() {
            var lel = $(this).parents()[1];
            var qee = lel.querySelector('.file-licenseowned');
            var type = $(this).parent().parent().data('type')
            var identifier = $("#file-personnametype").data("identifier");
            qee.innerHTML = "Tak";
            $.post('http://esx_dojmdt/licencjaDodaj', JSON.stringify({identifier: identifier, type: type}));
        }
    }
});


$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESCAPE
            CloseMdt()
        break;
    }
});

function CloseMdt() {
    hide();
    hidetariff();
    hidefile();
    $('.nav-select').removeClass('nav-select-color');
    $('#default').addClass('nav-select-color');
    $('.tablet-all').hide();
    $.post('http://esx_dojmdt/mdtclose');
}

function UpdateNotepad() {
    const note = $('#note-textbox').val();
    $.post('http://esx_dojmdt/UpdateNotepad', JSON.stringify({note: note}));
}

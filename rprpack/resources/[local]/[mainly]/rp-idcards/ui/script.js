document.addEventListener('DOMContentLoaded', function () {


}, false)

$(function () {
    var identif = 0
    var businesid = 0
    window.addEventListener('message', function (event) {
        
        if (event.data.action == "show_id2") {
            console.log('Pokazuje dowod')
            let string_lickab;
            let string_lickaa;
            let string_lickac;

            if (event.data.lickaa == "yes") {
                string_lickaa = '<span id="drive-a" style="color: #00b33e;">A</span>'
            } else if (event.data.lickaa != "yes") {
                string_lickaa = '<span id="drive-a" style="color: #9e2020;">A</span>'
            }

            if (event.data.lickab == "yes") {
                string_lickab = '<span id="drive-b" style="color: #00b33e;">B</span>'
            } else if (event.data.lickab != "yes") {
                string_lickab = '<span id="drive-b" style="color: #9e2020;">B</span>'
            }

            if (event.data.lickac == "yes") {
                string_lickac = '<span id="drive-c" style="color: #00b33e;">C</span>' 
            } else if (event.data.lickac != "yes") {
                string_lickac = '<span id="drive-c" style="color: #9e2020;">C</span>' 
            }

            let caroc;
            let med;

            if (event.data.caroc == "yes") {
                caroc = '<span id="caroc" style="color: #00b33e;">OC</span>'
            } else {
                caroc = '<span id="caroc" style="color: #9e2020;">OC</span>'
            }

            if (event.data.med == "yes") {
                med = '<span id="med" style="color: #00b33e;">MED</span>'
            } else {
                med = '<span id="med" style="color: #9e2020;">MED</span>'
            }

            let insurances = med+' '+caroc

            let string_licki = string_lickaa + " " + string_lickab + " " + string_lickac + ' <span id="gun" style="color: #9e2020;">GUN</span>'

            //let string_id = '<div class="idcard" id="idcard-'+identif+'" style="display: none;"><div id="card-content"><div id="head"><h1 id="state-name">LOS SANTOS</h1><h4 id="id-type">Dowód osobisty & Prawo Jazdy</h4></div><div id="bottom-content"><div id="image"><img src="'+event.data.photo+'" width="80px" height="110px" id="photo"><h1 id="signature">'+event.data.firstname+' '+event.data.lastname+'</h1></div><div id="data-content"><h6 id="name">Imię: <span id="name-cont">'+event.data.firstname+'</span></h6><h6 id="lastname">Nazwisko: <span id="lastname-cont">'+event.data.lastname+'</span></h6><h6 id="date">Data urodzenia: <span id="birth-cont">'+event.data.birth+'</span></h6><h6 id="sex">Płeć: <span id="sex-cont">'+event.data.sex+'</span></h6><h6 id="licenses">Licencje:</h6><h6 id="license">'+string_licki+'</h6><h6 id="licenses">Ubezpieczenia:</h6><h6 id="license">'+insurances+'</h6></div></div> </div></div>'
        
            let string_id;

            if (event.data.lang == "pl") {
                string_id = '<div class="newidcard" id="idcard-'+identif+'" style="display: none;"><div id="idheader"><h1 id="idstate">LOS SANTOS</h1><h4 id="idname"> Dowód Osobisty</h4></div><div id="idbottomcontent"><div id="photodiv"><img src="'+event.data.photo+'" width="76px" height="76px"><h1 id="idsignature">'+event.data.firstname+' '+event.data.lastname+'</h1></div><div id="idcontent"><h6 id="idtext">Imię: <span>'+event.data.firstname+'</span></h6><h6 id="idtext">Nazwisko: <span>'+event.data.lastname+'</span></h6><h6 id="idtext">Data urodzin: <span>'+event.data.birth+'</span></h6><h6 id="idtext">Płeć: <span>'+event.data.sex+'</span></h6><h6 id="idtextlic">Licencje</h6><h6 id="idtextlic2">'+string_licki+'</h6><h6 id="idtextlic">Ubezpieczenia</h6><h6 id="idtextlic2">'+insurances+'</h6></div></div></div>'
            } else if (event.data.lang == "en") {
                string_id = '<div class="newidcard" id="idcard-'+identif+'" style="display: none;"><div id="idheader"><h1 id="idstate">LOS SANTOS</h1><h4 id="idname"> IDENTITY CARD</h4></div><div id="idbottomcontent"><div id="photodiv"><img src="'+event.data.photo+'" width="76px" height="76px"><h1 id="idsignature">'+event.data.firstname+' '+event.data.lastname+'</h1></div><div id="idcontent"><h6 id="idtext">Name: <span>'+event.data.firstname+'</span></h6><h6 id="idtext">Last Name: <span>'+event.data.lastname+'</span></h6><h6 id="idtext">Birth: <span>'+event.data.birth+'</span></h6><h6 id="idtext">Sex: <span>'+event.data.sex+'</span></h6><h6 id="idtextlic">Licenses</h6><h6 id="idtextlic2">'+string_licki+'</h6><h6 id="idtextlic">Insurances</h6><h6 id="idtextlic2">'+insurances+'</h6></div></div></div>'
            }

            
            $('#container').append(string_id)
            $('#idcard-'+identif).fadeIn()

            let numofcard = identif
            identif = identif + 1

            setTimeout(function() {
                $('#idcard-'+numofcard).fadeOut()
                setTimeout(function() {
                    document.getElementById('#idcard-'+numofcard).remove();
                    identif = identif - 1
                }, 500)
            }, 1000 * 10)

        } else if (event.data.action == "show_business") {
            //let businescardstring = '<div class="businesscard" id="business-'+businesid+'" style="display: none;"><div id="business-head"><i class="fas fa-id-card"></i><h1 id="business-htitle">Wizytówka</h1></div><div id="business-bottom-cont"><h5 id="businessname">'+event.data.firstname+' '+event.data.lastname+'</h5><h5>Numer Telefonu: <span id="business-phone">'+event.data.phone+'</span></h5><h5>Numer Konta: <span id="business-account">'+event.data.bank+'</span></h5><h5>Praca: <span id="business-job">'+event.data.job+' - '+event.data.jobgrade+'</span></h5></div></div>'
        
            let businescardstring;
            if (event.data.lang == "pl") {
                businescardstring = '<div class="businesscard" id="business-'+businesid+'" style="display: none;"><div id="business-head"><h1 id="business-htitle">'+event.data.firstname+' '+event.data.lastname+'</h1><h3 id="business-hdesc">Wizytówka</h3></div><div id="business-bottom-cont"><h6 id="businesstext">Numer Telefonu: <span>'+event.data.phone+'</span></h6><h6 id="businesstext">Konto Bankowe: <span>'+event.data.bank+'</span></h6><h6 id="businesstext">Zatrudniony w: <span>'+event.data.job+' '+event.data.jobgrade+'</span></h6><img src="./img/frame.png" width="64px" height="64px" id="framelogo"></div></div>'
            } else if (event.data.lang == "en") {
                businescardstring = '<div class="businesscard" id="business-'+businesid+'" style="display: none;"><div id="business-head"><h1 id="business-htitle">'+event.data.firstname+' '+event.data.lastname+'</h1><h3 id="business-hdesc">BUSINESS CARD</h3></div><div id="business-bottom-cont"><h6 id="businesstext">Phone Number: <span>'+event.data.phone+'</span></h6><h6 id="businesstext">Bank Account Number: <span>'+event.data.bank+'</span></h6><h6 id="businesstext">Job: <span>'+event.data.job+' '+event.data.jobgrade+'</span></h6><img src="./img/frame.png" width="64px" height="64px" id="framelogo"></div></div>'
            }
            
            $('#container').append(businescardstring)
            $('#business-'+businesid).fadeIn()

            let numofbusines = businesid
            businesid = businesid + 1

            setTimeout(function() {
                $('#business-'+numofbusines).fadeOut()
                setTimeout(function() {
                    document.getElementById('#business-'+numofbusines).remove();
                    businesid = businesid - 1
                }, 500)
            }, 1000 * 10)
        }
    })
})
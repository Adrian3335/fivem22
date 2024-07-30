const Root = document.querySelector(":root");

window.addEventListener('message', function(event) {
    switch(event.data.action) {
        case 'ShowCard':
            ShowCard(event.data.type, event.data.playerData);
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

function ShowCard(type, playerData) {
    switch(type) {
        case 'dowod':
            $('#mainCard').hide();
            $('#mainCard').html(`
            <div class="id-card">
                <div class="title">
                    <div class="title-inner">
                        <h1>` + playerData.fullName + `</h1>
                        <h2>` + playerData.date + ` | ` + playerData.sex + `</h2>
                    </div>
                
                    <div class="title-icon">
                        <div class="icon-inner">
                            <i class="fa-regular fa-id-card"></i>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <p>Licencja na broń: <b>` + playerData.weapon + `</b></p>
                    <p>Ubezpieczenia: <b>` + playerData.licence + `</b></p>
                    <p>Prawojazdy: <b>` + playerData.drive + `</b></p>
                </div>
                <div id='progbar'></div>
            </div>`);
            $('#progbar').css('background-image', "repeating-linear-gradient(45deg, var(--primaryColor), var(--primaryColor))");

            var width = 100;
            var id = setInterval(frame, 50);
            function frame() {
              if (width == 0) {
                clearInterval(id);
              } else {
                width--;
                $('#progbar').css('width', width+'%');
              }
            }

            setTimeout(function () {
                $('#mainCard').fadeIn();
            }, 100);
            setTimeout(function () {
                $('#mainCard').fadeOut();
                setTimeout(function () {
                    $('#mainCard').html("")
                }, 200);
            }, 5000);

            break;
        case 'wizytowka':
            $('#mainCard').html(`
            <div class="phone-card">
                <div class="title">
                    <div class="title-inner">
                        <h1>` + playerData.firstname + `</h1>
                        <h2>` + playerData.jobLabel + ` | `  + playerData.gradeLabel + `</h2>
                    </div>
                
                    <div class="title-icon">
                        <div class="icon-inner">
                            <i class="fa-regular fa-phone-arrow-up-right"></i>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <p>Numer Telefonu: <b>` + playerData.phone + `</b></p>
                    <p>Numer Konta: <b>` + playerData.account + `</b></p>
                </div>

                <div id='progbar'></div>
            </div>
            `);
            $('#progbar').css('background-image', "repeating-linear-gradient(45deg, var(--primaryColor), var(--primaryColor))");

            var width = 100;
            var id = setInterval(frame, 50);
            function frame() {
              if (width == 0) {
                clearInterval(id);
              } else {
                width--;
                $('#progbar').css('width', width+'%');
              }
            }

            setTimeout(function () {
                $('#mainCard').fadeIn();
            }, 100);
            setTimeout(function () {
                $('#mainCard').fadeOut();
                setTimeout(function () {
                    $('#mainCard').html("")
                }, 200);
            }, 5000);

            break;
        case 'odznaka':
            $('#licenceCard').html(`
            <div class="police-card">
                <div class="title">
                <div class="title-inner">
                    <h1>Odznaka LSPD</h1>
                    <h2>` + playerData.fullName + `</h2>
                </div>
            
                <div class="title-icon">
                    <div class="icon-inner">
                        <i class="fa-regular fa-user-police-tie"></i>
                    </div>
                </div>

                <div id='progbar'></div>
            </div>
            <div class="content">
                <p>Numer odznaki: <b>` + playerData.odznaka + `</b></p>
                <p>Stopień: <b>` + playerData.gradeLabel + `</b></p>
            </div>
            `);

            $('#progbar').css('background-image', "repeating-linear-gradient(45deg, #001aff, rgb(0, 137, 179))");
            
            var width = 100;
            var id = setInterval(frame, 50);
            function frame() {
              if (width == 0) {
                clearInterval(id);
              } else {
                width--;
                $('#progbar').css('width', width+'%');
              }
            }

            setTimeout(function () {
                $('#licenceCard').fadeIn();
            }, 100);
            setTimeout(function () {
                $('#licenceCard').fadeOut();
                setTimeout(function () {
                    $('#licenceCard').html("")
                }, 200);
            }, 5000);
            break;

            case 'odznakaLSSD':
                $('#licenceCard').html(`
                <div class="LSSD-card">
                    <div class="title">
                    <div class="title-inner">
                        <h1>Odznaka LSSD</h1>
                        <h2>` + playerData.fullName + `</h2>
                    </div>
                
                    <div class="title-icon">
                        <div class="icon-inner">
                            <i class="fa-regular fa-user-police"></i>
                        </div>
                    </div>
    
                    <div id='progbar'></div>
                </div>
                <div class="content">
                    <p>Numer odznaki: <b>` + playerData.odznaka + `</b></p>
                    <p>Stopień: <b>` + playerData.gradeLabel + `</b></p>
                    <p>Uprawnienia: <b>` + playerData.jobLicence + `</b></p>
                </div>
                `);
    
                $('#progbar').css('background-image', "repeating-linear-gradient(45deg, #ff9100, rgb(179, 152, 0))");
                
                var width = 100;
                var id = setInterval(frame, 50);
                function frame() {
                  if (width == 0) {
                    clearInterval(id);
                  } else {
                    width--;
                    $('#progbar').css('width', width+'%');
                  }
                }
    
                setTimeout(function () {
                    $('#licenceCard').fadeIn();
                }, 100);
                setTimeout(function () {
                    $('#licenceCard').fadeOut();
                    setTimeout(function () {
                        $('#licenceCard').html("")
                    }, 200);
                }, 5000);
                break;




            case 'ambulance':
                $('#licenceCard').html(`            
                    <div class="ambulance-card">
                    <div class="title">
                        <div class="title-inner">
                            <h1>Legitymacja EMS</h1>
                            <h2>` + playerData.fullName + `</h2>
                        </div>

                        <div class="title-icon">
                            <div class="icon-inner">
                                <i class="fa-regular fa-truck-medical"></i>
                            </div>
                        </div>

                        <div id='progbar'></div>
                    </div>
                    <div class="content">
                        <p>Numer odznaki: <b>` + playerData.odznaka + `</b></p>
                        <p>Stopień: <b>` + playerData.gradeLabel + `</b></p>
                    </div>
                `);
                $('#progbar').css('background-image', "repeating-linear-gradient(45deg, #ff0000, rgb(179, 36, 0))");
            
                var width = 100;
                var id = setInterval(frame, 50);
                function frame() {
                  if (width == 0) {
                    clearInterval(id);
                  } else {
                    width--;
                    $('#progbar').css('width', width+'%');
                  }
                }
    
                setTimeout(function () {
                    $('#licenceCard').fadeIn();
                }, 100);
                setTimeout(function () {
                    $('#licenceCard').fadeOut();
                    setTimeout(function () {
                        $('#licenceCard').html("")
                    }, 200);
                }, 5000);
                break;
            case 'mechanic':
                $('#licenceCard').html(`            
                <div class="mechanik-card">
                    <div class="title">
                    <div class="title-inner">
                        <h1>Legitymacja LSCM</h1>
                        <h2>` + playerData.fullName + `</h2>
                    </div>
                
                    <div class="title-icon">
                        <div class="icon-inner">
                            <i class="fa-sharp fa-regular fa-wrench"></i>
                        </div>
                    </div>
                    
                    <div id='progbar'></div>
                </div>
                <div class="content">
                    <p>Numer odznaki: <b>` + playerData.odznaka + `</b></p>
                    <p>Stopień: <b>` + playerData.gradeLabel + `</b></p>
                </div>
                `);
                $('#progbar').css('background-image', "repeating-linear-gradient(45deg, #ff6600, rgb(179, 176, 0))");
            
                var width = 100;
                var id = setInterval(frame, 50);
                function frame() {
                  if (width == 0) {
                    clearInterval(id);
                  } else {
                    width--;
                    $('#progbar').css('width', width+'%');
                  }
                }
    
                setTimeout(function () {
                    $('#licenceCard').fadeIn();
                }, 100);
                setTimeout(function () {
                    $('#licenceCard').fadeOut();
                    setTimeout(function () {
                        $('#licenceCard').html("")
                    }, 200);
                }, 5000);
                break;
            case 'doj':
                $('#licenceCard').html(`            
                <div class="doj-card">
                    <div class="title">
                    <div class="title-inner">
                        <h1>Legitymacja DOJ</h1>
                        <h2>` + playerData.fullName + `</h2>
                    </div>
                
                    <div class="title-icon">
                        <div class="icon-inner">
                            <i class="fa-sharp fa-regular fa-briefcase"></i>
                        </div>
                    </div>
                    
                    <div id='progbar'></div>
                </div>
                <div class="content">
                    <p>Stopień: <b>` + playerData.gradeLabel + `</b></p>
                </div>
                `);
                $('#progbar').css('background-image', "repeating-linear-gradient(45deg, #e28b09, #b87f04e1)");
            
                var width = 100;
                var id = setInterval(frame, 50);
                function frame() {
                  if (width == 0) {
                    clearInterval(id);
                  } else {
                    width--;
                    $('#progbar').css('width', width+'%');
                  }
                }
    
                setTimeout(function () {
                    $('#licenceCard').fadeIn();
                }, 100);
                setTimeout(function () {
                    $('#licenceCard').fadeOut();
                    setTimeout(function () {
                        $('#licenceCard').html("")
                    }, 200);
                }, 5000);
                break;


        default:
            break;
    }
}
let canShow = true

$(function() {
    window.addEventListener('message', function(event) {
        switch (event.data.action) {
            case 'toggle':
                if (event.data.state == true) {
                    if (canShow == true) {
                        $('.contianer').animate({
                            top: "2vh"
                        }, 250)
                        canShow = false
                    }
                } else {
                    if (canShow == false) {
                        $('.contianer').animate({
                            top: "-5vh"
                        }, 250)
                        setTimeout(() => {
                            canShow = true
                        }, 250);
                    }
                }
                break;
            case 'updateJobs':
                var jobs = event.data.jobs;
                if (jobs.police > 0) {
                    $('#lspd').html('<span style="color: #00ff00">' + jobs.police + '</span>');
                } else {
                    $('#lspd').html('<span style="color: red">0</span>');
                }
                if (jobs.ems > 0) {
                    $('#ems').html('<span style="color: #00ff00">' + jobs.ems + '</span>');
                } else {
                    $('#ems').html('<span style="color: red">0</span>');
                }
                if (jobs.doj > 0) {
                    $('#doj').html('<span style="color: #00ff00">' + jobs.doj + '</span>');
                } else {
                    $('#doj').html('<span style="color: red">0</span>');
                }
                if (jobs.ottos > 0) {
                    $('#ottos').html('<span style="color: #00ff00">' + jobs.ottos + '</span>');
                } else {
                    $('#ottos').html('<span style="color: red">0</span>');
                }
                if (jobs.bennys > 0) {
                    $('#bennys').html('<span style="color: #00ff00">' + jobs.bennys + '</span>');
                } else {
                    $('#bennys').html('<span style="color: red">0</span>');
                }
                if (jobs.carzone > 0) {
                    $('#carzone').html('<span style="color: #00ff00">' + jobs.carzone + '</span>');
                } else {
                    $('#carzone').html('<span style="color: red">0</span>');
                }
                break;
            default:
                break;
        }
    }, false);
});
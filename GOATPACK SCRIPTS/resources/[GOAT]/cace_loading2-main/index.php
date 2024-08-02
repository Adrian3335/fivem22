<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cace.xyz</title>
</head>

<body>
    <div id="container" style="display: block">
        <a class="spacebar" id="spacebar">Naciśnij <b>Spacje</b> żeby zatrzymać muzyke</a>
        <div>
            <h1 class="ml5">
                <span class="text-wrapper">
                  <span class="line line1"></span>
                <span class="letters letters-left">GOATPACK</span>
                <span class="letters ampersand"></span>
                <span class="letters letters-right"></span>
                <span class="line line2"></span>
                </span>
            </h1>
        </div>
        <div class="container2" style="display: block">
            <h1 class="ml11">
                <span class="text-wrapper2">
                  <span class="line line2"></span>
                <span class="letters">Discord.gg/<b>goatpack</b></span>
                </span>
            </h1>
        </div>
    </div>
    <audio id="leson" src="music/music.ogg" autoplay="true" hidden="true" loop="true" volume="0">
</body>
    <script>
    
        var play = false;
        var myAudio = document.getElementById("leson");
        
        myAudio.volume = 0.1;
    
        function onKeyDown(event) {
                switch (event.keyCode) {
                    case 32: //SpaceBar                    
                        if (play) {
                            myAudio.pause();
                            play = false;
                        } else {
                            myAudio.play();
                            play = true;
                        }
                        break;
                }
          return false;
        }
    
        window.addEventListener("keydown", onKeyDown, false);
    </script>

    <div class="overcast"></div>
    <div class="progress"></div>

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            display: none;
        }
        
        #myProgress {
            width: 100%;
            background-color: grey;
        }
        
        #myBar {
            width: 1%;
            height: 30px;
            background-color: green;
        }
    </style>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Saira:ital@1&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Cuprum&family=Noto+Sans&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');
        @import url('https://fonts.googleapis.com/css?family=Raleway:400,400i,700');
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300&display=swap');
body {
    margin: 0;
    background-image: url('../background.png');
    background-size: cover;
}

.ml5 {
    position: relative;
    font-weight: 800;
    font-size: 4.5em;
    color: #ffffff;
    font-family: 'Raleway', sans-serif;
    margin-top: 450px;
    text-align: center;
}

.ml5 .text-wrapper {
    position: relative;
    display: inline-block;
    padding-top: 0.1em;
    padding-right: 0.05em;
    padding-bottom: 0.15em;
    line-height: 1em;
}

.ml5 .line {
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    margin: auto;
    height: 3px;
    width: 100%;
    background-color: #402d2d;
    transform-origin: 0.5 0;
}

.ml5 .ampersand {
    font-family: Baskerville, serif;
    font-style: italic;
    font-weight: 400;
    width: 1em;
    margin-right: -0.1em;
    margin-left: -0.1em;
}

.ml5 .letters {
    display: inline-block;
    opacity: 0;
}

.container2 {
    color: white;
    font-size: 20px;
    font-family: 'Raleway', sans-serif;
    text-align: center;
    text-transform: uppercase;
}

.spacebar {
    padding-top: 20vh;
    margin-left: 870px;
    font-family: 'Raleway', sans-serif;
    text-transform: uppercase;
}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="nui://game/ui/jquery.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/b6ec58ae28.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    <script src="script.js"></script>
</body>

</html>
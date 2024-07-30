var volumeSlider = document.getElementById("volumeSlider");
var otherSlider = document.getElementById("otherSlider");
var audio = document.getElementById("myAudio");

audio.volume = 0.5;

volumeSlider.addEventListener("input", function() {
    audio.volume = volumeSlider.value / 100;
});

otherSlider.addEventListener("input", function() {
});

(function () {
    var words = [
        "Naciśnij ALT aby użyć oczka.",
        "Pamiętaj o przestrzeganiu regulaminu!",
        "F1 -> otwiera Ci główne menu postaci.",
        "/propfix naprawi Twoją postać, gdy przedmiot zostanie Ci w ręce",
        "/seat 1/2/3/4 pozwala, abyś przesiadł się w pojeździe na inne siedzenie.",
        "Nie zapomnij zapoznać się z regulaminem naszego serwera",
        "Możesz skontaktować się z administracją komendą /report."
    ];

    var i = 0;

    setInterval(function() {
        $('#changemsg').fadeOut(function() {
            $(this).html(words[i]);
            i = (i + 1) % words.length;
            $(this).fadeIn();
        });
    }, 5000);
})();
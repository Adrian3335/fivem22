let time = 0
function secondsToTime(e){
    const m = Math.floor(e % 3600 / 60).toString().padStart(2,'0'),
    s = Math.floor(e % 60).toString().padStart(2,'0');
    
    return m + ':' + s;
}

window.addEventListener("message", (ev) => {
    let name = ev.data.name
    
    if (name == "time") {
        let newTime = secondsToTime(ev.data.time)
        document.querySelector("#czas").innerHTML = newTime
        $("body").show()
        time = ev.data.time
    } else if (name == "hide") {
        $("body").hide()
        time = 0
    }
})

setInterval(() => {
    if (time > 0) {
        document.querySelector("#czas").innerHTML = secondsToTime(time)
        time--
    } else if (time < 1) {
        $("body").hide()
    }
}, 1000);
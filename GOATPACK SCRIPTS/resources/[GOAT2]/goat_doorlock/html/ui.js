ShowNotification = function(icon, text){
    $(".notification").html(`<div class="icon">${icon}</div><div class="text">${text}</div>`)
    $(".notification").addClass("showed")
}

HideNotification = function(){
    $(".notification").html("")
    $(".notification").removeClass("showed")
}

window.addEventListener('message', function(event) {
    if (event.data.action == "show") {
        let icon = `<i class="fa-regular fa-door-open"></i>`
        let text = "Otwarte"
        if (event.data.locked) {
            text = "Zamknięte"
            icon = `<i class="fa-regular fa-door-closed"></i>`
        }
        if (event.data.canInteract) {
            text = "[E] " + text
        }
        ShowNotification(icon, text)
    } else if (event.data.action == "hide") {
        HideNotification()
    }
})
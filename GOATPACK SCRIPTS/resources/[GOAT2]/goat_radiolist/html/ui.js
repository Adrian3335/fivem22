const Root = document.querySelector(":root");


window.addEventListener("message", (event) => {
    let data = event.data;

    if (data.action == "UpdateHudVisible") {
        if (data.visible) {
            document.querySelector("body").style.display = "block";
        } else {
            document.querySelector("body").style.display = "none";
        }
    }

    if (data.action == "UpdateVisible") {
        if (data.number !== 0) {
            document.querySelector(".radioContainer").style.display = "block";
        } else {
            document.querySelector(".radioContainer").style.display = "none";
        }

        document.querySelector(".channel").innerHTML = data.name;
    }

    if (data.action == "UpdateList") {
        document.querySelector(".users").innerHTML = data.count;
        document.querySelector(".radioUsers").innerHTML = "";
        data.list.forEach((element) => {
            let div = document.createElement("div");
            div.innerHTML = `
                <div class="user-info">
                    <i class="fas fa-microphone microphone-icon"></i>
                    <span class="username">${element.name}</span>
                </div>
            `;
            div.classList.add("user");
            div.classList.add("id-" + element.source);
            if (element.talking) {
                div.querySelector(".microphone-icon").classList.add("active");
            }
            document.querySelector(".radioUsers").append(div);
        });
    }
    
    if (data.action == "UpdateTalking") {
        let activeUserIcon = document.querySelector(".id-" + data.target + " .microphone-icon");
        if (data.talking) {
            activeUserIcon.classList.add("active");
        } else {
            activeUserIcon.classList.remove("active");
        }
    }

    if (data.action == "updatecolor") {
        document.documentElement.style.setProperty("--primaryColor", data.color.primaryColor);
    }
});
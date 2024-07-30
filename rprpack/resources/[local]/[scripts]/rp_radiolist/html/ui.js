const Root = document.querySelector(":root");


window.addEventListener("message", (event) => {
    let data = event.data;

    if (data.action == "UpdateVisible") {
        if (data.number !== 0) {
            document.querySelector("body").style.display = "block";
        } else {
            document.querySelector("body").style.display = "none";
        }

        document.querySelector(".channel").innerHTML = data.name;
    }

    if (data.action == "UpdateList") {
        document.querySelector(".users").innerHTML = data.count;
        document.querySelector(".radioUsers").innerHTML = "";
        data.list.forEach((element) => {
            let div = document.createElement("div");
            div.innerHTML = element.name;
            div.classList.add("user");
            div.classList.add("id-" + element.source);
            if (element.talking) {
                div.classList.add("active");
            }
            document.querySelector(".radioUsers").append(div);
        });
    }

    if (data.action == "UpdateTalking") {
        if (data.talking) {
            document.querySelector(".id-" + data.target).classList.add("active");
        } else {
            document.querySelector(".id-" + data.target).classList.remove("active");
        }
    }

    if (data.action == "updatecolor") {
        document.documentElement.style.setProperty("--primaryColor", data.color.primaryColor);
    }
});
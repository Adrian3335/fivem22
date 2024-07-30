var resourceName = ""

defaultaudio = new Audio('https://cdn.discordapp.com/attachments/597915484608004137/1053321884927803422/notification-sound-7062.mp3');
audio1 = new Audio('https://cdn.discordapp.com/attachments/505459419283324939/1049106282545696890/airunit.mp3');
audio3 = new Audio('https://cdn.discordapp.com/attachments/505459419283324939/1049106515769954314/airunits.mp3');
audio2 = new Audio('https://cdn.discordapp.com/attachments/505459419283324939/1049106515426033716/3suspects.mp3');
audio4 = new Audio('https://cdn.discordapp.com/attachments/505459419283324939/1049106516092932226/storerobbery.mp3');
audio5 = new Audio('https://cdn.discordapp.com/attachments/505459419283324939/1049106516382335106/storerobbery2.mp3');

defaultaudio.volume = 0.3;
audio1.volume = 0.2;
audio2.volume = 0.2;
audio3.volume = 0.2;
audio4.volume = 0.2;
audio5.volume = 0.2;
// JESLI CHCESZ DODAC WIECEJ RADIO CALLOW, DODAJ NOWY DZWIEK I USTAW VOLUME, POTEM NA DOLE DOPISZ LICZBE DO MATH FLOORA I DODAJ ELSE IF ;3

const app = new Vue({
    el: "#app",
    data: {
        showing_list: false,
        dispatchList: [],
        cacheDispatch: [],
    },
    methods: {
        AddNewNotification(notification) {
            this.dispatchList.unshift(notification);
            this.cacheDispatch.unshift(notification);
            
            if (this.cacheDispatch.length > 30) {
                this.cacheDispatch.pop();
            }

            setTimeout(() => {
                // this.dispatchList.pop();
                $("#" + notification.id).removeClass("fade-left-enter")
                $("#" + notification.id).addClass("fade-right-leave")
                setTimeout(() => {
                    this.dispatchList.pop();
                }, 300)
            }, notification.duration);
        },
        SetGPSPosition(notification) {
            // console.log(JSON.stringify(notification))
            $.post('https://' + resourceName + '/setGPSPosition', JSON.stringify({
                position: notification.position
            }));
        },
        ClearAllDispatch() {
            if (this.cacheDispatch.length > 0) {
                $.post('https://' + resourceName + '/clearNotifications', JSON.stringify({
                    notifications: this.dispatchList
                }));

                this.cacheDispatch = [];
                this.dispatchList = [];
            }
        },
        DisableNotifications() {
            $.post('https://' + resourceName + '/disableNotifications', JSON.stringify({}));
        }
    },
    computed: {},
});

window.addEventListener('message', function(event) {
    // console.log(JSON.stringify(event.data))
    if (event.data.type == "addNewNotification") {
        /*
            message: 'this is a test dispatch',
            priority: rand,
            code: '10-5051',
            duration: 5000,
            title: 'This is a test title This is a test title This is a test title This is',
            officer: 'Giovanni Lucky',
            street: 'Sono una strada | lunga tre sezioni e anche di più | per vedere cosa succede',
            id: id
        */
        app.AddNewNotification(event.data.notification);
        defaultaudio.play();
        /*let nigga = Math.floor(Math.random() * 5) + 1;
        if (nigga == 1) {
            audio1.play();
        } else if (nigga == 2) {
            audio2.play();
        } else if (nigga == 3) {
            audio3.play();
        } else if (nigga = 4) {
            audio4.play();
        } else if (nigga = 5) {
            audio5.play();
        };*/
    };

    if (event.data.type == "showOldNotifications") {
        app.showing_list = event.data.show;
    };

    if (event.data.type == "sendResourceName") {
        resourceName = event.data.resource;
    };
});

// let id = 0
document.onkeydown = function(event) {
    // if (event.key === "Escape") {
    //     if (app.showing_list) {
    //         app.showing_list = false;
    //         $.post('https://' + resourceName + '/close', JSON.stringify({}));
    //     };
    // };

    // if (event.key == 1) {
    //     id += 1
    //     let rand = Math.random()
    //     if (rand < 0.5) 
    //         rand = 1
    //     else
    //         rand = 2
    //     app.AddNewNotification({
    //         message: 'To jest testowa wiadomość',
    //         priority: rand,
    //         code: '10-10',
    //         duration: 5000,
    //         title: 'To jest testowy tytuł',
    //         officer: 'Developa Many',
    //         street: 'Palomino Avenue | Los Santos Highway | Vespucci Boulevard',
    //         id: id
    //     })
    // }
    // if (event.key == 2) {
    //     app.showing_list = !app.showing_list;
    // }
};
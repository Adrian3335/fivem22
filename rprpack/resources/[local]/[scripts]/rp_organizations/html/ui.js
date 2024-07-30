let UpgradesPrice = {}
let MyIdentifier = ""
let OrgOwner = ""
let Permissions = {}
let MembersPermissions = {}

let LoadMemberPage = function(members) {
    let membersContent = ""
    members.forEach(element => {
        if (Array.isArray(element.job.permissions) && element.job.permissions.length === 0) {
            MembersPermissions[element.identifier] = {}
        } else {
            MembersPermissions[element.identifier] = element.job.permissions
        }

        if ((element.identifier == MyIdentifier) || (element.identifier == OrgOwner)) {
            membersContent = membersContent + `\n
            <div class="member" data-identifier="${element.identifier}">
                <div class="onlineStatus ${element.online && "true"}"><i class="fa-solid fa-circle"></i></div>
                <div class="name">${element.name}</div>
                <div class="actions"></div>
            </div>
            `
        } else {
            membersContent = membersContent + `\n
            <div class="member" data-identifier="${element.identifier}">
                <div class="onlineStatus ${element.online && "true"}"><i class="fa-solid fa-circle"></i></div>
                <div class="name">${element.name}</div>
                <div class="actions">
                    ${(MembersPermissions[MyIdentifier]["permissionsManage"] == true) && `<div class="action permissions" onclick="PermissionEdit('${element.identifier}')">
                        <i class="fa-solid fa-shield"></i>uprawnienia
                    </div>` || ""}
                    ${(MembersPermissions[MyIdentifier]["fireMember"] == true) && `<div class="action hire" onclick="FireMember('${element.identifier}')">
                        <i class="fa-solid fa-trash"></i>wyrzuć
                    </div>` || ""}
                </div>
            </div>
            `
        }
    });
    
    $(".page-content.members > .list > .list-content").html(membersContent);
}

let CloseTablet = function() {
    $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
    $("body").css("display", "none");

    $(".page-content.members > .list > .list-content").html(`
        <div class="loader">
            <i class="fa-solid fa-spinner-third fa-spin"></i>
        </div>
    `);

    $(".page-content").fadeOut();
    $(".page-content.home").fadeIn();
}

let OpenPage = function(type) {
    if (type == "members") {
        $(".page-content.members > .list > .list-content").html(`
            <div class="loader">
                <i class="fa-solid fa-spinner-third fa-spin"></i>
            </div>
        `);

        $.post(`https://${GetParentResourceName()}/getMembers`, JSON.stringify({}), function(data, status, jqXHR){
            if (status == "success") {
                LoadMemberPage(data);
            }
        });
    } else if (type == "logs") {
        $.post(`https://${GetParentResourceName()}/getLogs`, JSON.stringify({}), function(data, status, jqXHR){
            if (status == "success") {
                let logsContent = ""
                data.forEach(element => {
                    logsContent = logsContent + `\n
                    <div class="member">
                        <div class="name">${element.title}</div>
                        <div class="actions">${element.time}</div>
                    </div>
                    `
                });
                
                $(".page-content.logs > .list > .list-content").html(logsContent);
            }
        });
    }
}

let PermissionsChange = function(identifier, type) {
    let has = !MembersPermissions[identifier][type]
    MembersPermissions[identifier][type] = has

    $(".page-content.members > .permissions-edit > .permissions-edit-content > .informations > .information." + type + " .content").html(`<i class="` + (has && "fa-solid fa-check" || "fa-solid fa-xmark") + `"></i>`);
    if (has) {
        $(".page-content.members > .permissions-edit > .permissions-edit-content > .informations > .information." + type + " .content").addClass("hasPermissions");
    } else {
        $(".page-content.members > .permissions-edit > .permissions-edit-content > .informations > .information." + type + " .content").removeClass("hasPermissions");
    }
}

let PermissionSave = function(identifier) {
    $(".page-content.members > .permissions-edit").fadeOut(300);
    $.post(`https://${GetParentResourceName()}/savePermissions`, JSON.stringify({
        identifier: identifier,
        permissions: MembersPermissions[identifier]
    }));
}

let PermissionEdit = function(identifier) {
    let DefaultPermissions = MembersPermissions[identifier]
    
    $(".permissions-edit-content").html(`
        <div class="title"><i class="fa-solid fa-shield"></i>uprawnienia</div>
        <div class="informations"></div>
        <div class="buttons">
            <div class="button permissions-save"><i class="fa-solid fa-plus"></i>zapisz</div>
            <div class="button permissions-cancel"><i class="fa-solid fa-minus"></i>anuluj</div>
        </div>
    `);

    Permissions.forEach(element => {
        let has = MembersPermissions[identifier][element.name]
        $(".permissions-edit-content > .informations").append(`
        <div class="information ${element.name}">
            <div class="title">${element.label}</div>
            <div class="content ${(has && "hasPermissions")}" data-type="${element.name}"><i class="${(has && "fa-solid fa-check" || "fa-solid fa-xmark")}"></i></div>
        </div>
        `);
    });

    $(".page-content.members > .permissions-edit > .permissions-edit-content > .informations > .information > .content").on("click", function(){
        PermissionsChange(identifier, $(this).data("type"))
    })

    $(".page-content.members > .permissions-edit > .permissions-edit-content > .buttons > .button.permissions-save").on("click", function(){
        PermissionSave(identifier)
    })

    $(".page-content.members > .permissions-edit > .permissions-edit-content > .buttons > .button.permissions-cancel").on("click", function(){
        MembersPermissions[identifier] = DefaultPermissions
        $(".page-content.members > .permissions-edit").fadeOut(300);
    })
    
    $(".page-content.members > .permissions-edit").fadeIn(300);
}

let FireMember = function(identifier) {
    $.post(`https://${GetParentResourceName()}/fireMember`, JSON.stringify({
        identifier: identifier
    }), function(data, status, klRFJ) {
        if (status == "success") {
            LoadMemberPage(data);
        }
    });
}

let NearbyPlayers = function() {
    $(".page-content.members > .hiring").fadeIn(300);

    $.post(`https://${GetParentResourceName()}/getNearbyPlayers`, JSON.stringify({}), function(data, status, klRFJ) {
        if (status == "success") {
            if (data.length == 0) {
                $(".page-content > .hiring > .hiring-content > .informations").append(`
                    <div class="information">brak obywateli w pobliżu</div>
                `);
            } else {
                data.forEach(element => {
                    $(".page-content > .hiring > .hiring-content > .informations").append(`
                        <div class="information" data-id="${element}">[${element}]</div>
                    `);
                });
    
                $(".page-content > .hiring > .hiring-content > .informations > .information").on("click", function(){
                    $(".page-content > .hiring > .hiring-content > .informations > .information").removeClass("active");
                    $(this).addClass("active");
                })
            }
        }
    });
    
    $(".page-content.members > .hiring > .hiring-content > .buttons > .button.hiring-save").on("click", function(){
        document.querySelectorAll(".page-content > .hiring > .hiring-content > .informations > .information").forEach(select => {
            if ($(select).hasClass("active")){
                $.post(`https://${GetParentResourceName()}/hireMember`, JSON.stringify({
                    id: $(select).data("id")
                }), function(data, status, klRFJ) {
                    if (status == "success") {
                        LoadMemberPage(data);
                    }
                });
                return
            }
        })

        $(".page-content.members > .hiring").fadeOut(300);
        setTimeout(() => {
            $(".page-content > .hiring > .hiring-content > .informations").html("");
        }, 300);
    })

    $(".page-content.members > .hiring > .hiring-content > .buttons > .button.hiring-cancel").on("click", function(){
        $(".page-content.members > .hiring").fadeOut(300);
        setTimeout(() => {
            $(".page-content > .hiring > .hiring-content > .informations").html("");
        }, 300);
    })
}

window.onload = function(){
    $(".page-selector > .button").on("click", function(){
        let type = $(this).data("type")
        if (type == "close"){
            return CloseTablet();
        }

        $(".page-content").fadeOut(0);
        $(".page-content." + type).fadeIn(0);
        OpenPage(type);
    })

    $(".page-content.home > .announcements > .title > .add-note").on("click", function(){
        $(".page-content.home > .announce-send").fadeIn(300);
    })

    $(".page-content.home > .announce-send > .announce-send-content > .buttons > .button.note-add-accept").on("click", function(){
        $.post(`https://${GetParentResourceName()}/noteAdd`, JSON.stringify({
            text: $(".page-content.home > .announce-send > .announce-send-content > .announceText").val()
        }));
        $(".page-content.home > .announce-send").fadeOut(300);
    })

    $(".page-content.home > .announce-send > .announce-send-content > .buttons > .button.note-add-deny").on("click", function(){
        $(".page-content.home > .announce-send").fadeOut(300);
    })

    $(".page-content.members > .page-title > .add-member").on("click", function(){
        NearbyPlayers();
    })

    $(".page-content.upgrades > .upgrades-list > .upgrades-list-content > .section > input").on("input", function(){
        $(`.page-content.upgrades > .upgrades-list > .upgrades-list-content.${$(this).data("type")} > .section > .button:nth-child(1) > .count`).html($(this).val());
        $(`.page-content.upgrades > .upgrades-list > .upgrades-list-content.${$(this).data("type")} > .section > .button:nth-child(2) > .count`).html("$" + UpgradesPrice[$(this).data("type")] * $(this).val());
    })
    
    $(".page-content.upgrades > .upgrades-list > .upgrades-list-content > .section > .button:last-child").on("click", function(){
        $.post(`https://${GetParentResourceName()}/buyUpgrade`, JSON.stringify({
            type: $(this).data("type"),
            count: $(`.page-content.upgrades > .upgrades-list > .upgrades-list-content.${$(this).data("type")} > .section > .button:nth-child(1) > .count`).html()
        }));
    })
}

window.addEventListener("message", function(event){
    let data = event.data
    switch (data.action) {
        case "open":
            $("body").css("display", "block");

            $(".page-content.home > .informations > .orgName > .content").html(data.data.name);
            $(".page-content.home > .informations > .membersCount > .content").html(data.data.members);
            $(".page-content.home > .informations > .onlineMembersCount > .content").html(data.data.membersOnline);
            $(".page-content.home > .finances > .money > .content").html("$" + data.data.money);

            Permissions = data.permissions
            UpgradesPrice = data.upgrades

            for (const key in UpgradesPrice) {
                $(`.page-content.upgrades > .upgrades-list > .upgrades-list-content.${key} > .section > .button:nth-child(2) > .count`).html("$" + UpgradesPrice[key]);
            }

            OrgOwner = data.owner
            MyIdentifier = data.data.identifier
            MembersPermissions[MyIdentifier] = data.mypermissions
            if (data.mypermissions["noteAdd"] == true) {
                $(".add-note").fadeIn(0);
            } else {
                $(".add-note").fadeOut(0);
            }

            $(".announcements-content").html("");
            data.data.notes.forEach(element => {
                $(".announcements-content").append(`
                <div class="announce">
                    ${element.text}
                </div>
                `);
            });

            if (data.mypermissions["hireMembers"] == true) {
                $(".add-member").fadeIn(0);
            } else {
                $(".add-member").fadeOut(0);
            }

            break;
        default:
            break;
    }
})

document.onkeyup = function (data) {
    if (data.which == 27) {
        return CloseTablet();
    }
};
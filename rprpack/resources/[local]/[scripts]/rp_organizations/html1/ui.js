let MyIdentifier = ""
let OrgOwner = ""
let Permissions = {}
let MembersPermissions = {}

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
                let id = 0
                let membersContent = ""
                data.forEach(element => {
                    id++;

                    MembersPermissions[element.identifier] = element.job.permissions

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
                                ${(MembersPermissions[MyIdentifier]["hireMember"] == true) && `<div class="action hire">
                                    <i class="fa-solid fa-trash"></i>wyrzuć
                                </div>` || ""}
                            </div>
                        </div>
                        `
                    }
                });
                
                $(".page-content.members > .list > .list-content").html(membersContent);
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
    
    $(".page-content.members > .permissions-edit").fadeIn(300);

    $(".permissions-edit-content").html(`
    <div class="title"><i class="fa-solid fa-shield"></i>uprawnienia</div>
    <div class="informations">
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

    $(".permissions-edit-content").append(`
    </div>
    <div class="buttons">
        <div class="button permissions-save"><i class="fa-solid fa-plus"></i>zapisz</div>
        <div class="button permissions-cancel"><i class="fa-solid fa-minus"></i>anuluj</div>
    </div>
    `);

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

    $(".page-content.home > .announce-send > .announce-send-content > .buttons > .button.note-add-deny").on("click", function(){
        $(".page-content.home > .announce-send").fadeOut(300);
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

            OrgOwner = data.owner
            MyIdentifier = data.data.identifier
            MembersPermissions[MyIdentifier] = data.mypermissions
            if (data.mypermissions["noteAdd"] == true) {
                $(".add-note").fadeIn(0);
            } else {
                $(".add-note").fadeOut(0);
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
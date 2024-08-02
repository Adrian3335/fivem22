function SetQueueMax(queue, max)
    local tmp = {
        queue = tostring(queue),
        max = tonumber(max)
    }

    SendNUIMessage({maxNotifications = tmp})
end

function manyNotify(options)
    options.animation = options.animation or {}
    options.sounds = options.sounds or {}
    options.docTitle = options.docTitle or {}

    CreateThread(function()
        if options.frontendSound then
            for i=1, options.frontendSound.times, 1 do
                Wait(options.frontendSound.wait or 1000)
                PlaySoundFrontend(-1, options.frontendSound.string[1], options.frontendSound.string[2], 0)
            end
        end
    end)

    if options.frontendSound then
        options.sounds.volume = 0.0
    end

local options = {
    type = options.type or "info",
    layout = options.layout or "centerLeft",
    theme = options.theme or "gta",
    text = options.text or "Powiadomienie Testowe",
    timeout = options.timeout or 5000,
    progressBar = options.progressBar ~= false and true or false,
    closeWith = options.closeWith or {},
    animation = {
        open = options.animation.open or "gta_effects_open",
        close = options.animation.close or "gta_effects_close"
    },
    sounds = {
        volume = options.sounds.volume or 0.5,
        conditions = options.sounds.conditions or {"docVisible"},
        sources = options.sounds.sources or {"sounds/notif.wav"}
    },
    docTitle = {
        conditions = options.docTitle.conditions or {}
    },
    modal = options.modal or false,
    id = options.id or false,
    force = options.force or false,
    queue = options.queue or "global",
    killer = options.killer or false,
    container = options.container or false,
    buttons = options.button or false
}
    SendNUIMessage({options = options})
end

RegisterNetEvent("manyNotify:SendNotification")
AddEventHandler("manyNotify:SendNotification", function(options)
    manyNotify(options)
end)

RegisterNetEvent("manyNotify:SetQueueMax")
AddEventHandler("manyNotify:SetQueueMax", function(queue, max)
    SetQueueMax(queue, max)
end)


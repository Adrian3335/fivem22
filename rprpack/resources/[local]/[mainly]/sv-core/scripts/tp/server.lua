ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback("sprawdzrange", function(source, cb)
    local pedal = ESX.GetPlayerFromId(source)
    if pedal ~= nil then
        local ranga = pedal.getGroup()
        if ranga ~= nil then 
            cb(ranga)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)
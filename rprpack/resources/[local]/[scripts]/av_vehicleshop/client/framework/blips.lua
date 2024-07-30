--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

CreateThread(function()
    for k, v in pairs(Config.Dealerships) do
        local blip = AddBlipForCoord(v["blip"]['coords'].x, v["blip"]['coords'].y, v["blip"]['coords'].z)
        SetBlipSprite(blip, v["blip"].icon)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.70)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, v["blip"].color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v["blip"].label)
        EndTextCommandSetBlipName(blip)
    end
end)
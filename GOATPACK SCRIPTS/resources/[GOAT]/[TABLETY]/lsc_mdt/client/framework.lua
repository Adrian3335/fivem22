FRAMEWORK = {}
ESX = {}
QB = {}
CUSTOM = {}
PlayerData = {}

FRAMEWORK.IsPlayerLoaded = function()
    if Config.ESX.enabled then
        return ESX.IsPlayerLoaded()
    elseif Config.QB.enabled then
        return LocalPlayer.state.isLoggedIn
    else
        return -- YOUR OWN FRAMEWORK FUNCTION
    end
end

FRAMEWORK.GetPlayerData = function()
    if Config.ESX.enabled then
        return ESX.GetPlayerData()
    elseif Config.QB.enabled then
        return QBCore.Functions.GetPlayerData()
    else
        return -- YOUR OWN FRAMEWORK FUNCTION
    end
end

FRAMEWORK.ShowNotification = function(msg)
    if Config.ESX.enabled then
        return ESX.ShowNotification(msg)
    elseif Config.QB.enabled then
        return QBCore.Functions.Notify(msg)
    else
        return -- YOUR OWN FRAMEWORK FUNCTION
    end
end

FRAMEWORK.GetMdtPlayerData = function()
    local p = promise.new()
    ESX.TriggerServerCallback('qf_mdt:getMDTData', function(data, notes, annoucements, officers, lastNotes)
        p:resolve({data, notes, annoucements, officers, lastNotes})
    end)
    return Citizen.Await(p)
end

RegisterNetEvent('qf_mdt:showNotification', FRAMEWORK.ShowNotification)

if Config.ESX.enabled then

    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
        PlayerData = xPlayer
    end)

    RegisterNetEvent('esx:setJob', function(job)
        PlayerData.job = job
        CLIENT.SetPlayerData()
    end)

    RegisterNetEvent('esx:onPlayerLogout', function()
        PlayerData = {}
    end)

elseif Config.QB.enabled then

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        PlayerData = FRAMEWORK.GetPlayerData()
    end)

    RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
        PlayerData.job = JobInfo
        CLIENT.SetPlayerData()
    end)

    RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
        PlayerData = {}
    end)

else
    -- YOUR OWN FRAMEWORK EVENTS
end

Citizen.CreateThread(function()
    if Config.ESX.enabled then
        ESX = exports[Config.ESX.frameworkScript][Config.ESX.frameworkExport]()
    elseif Config.QB.enabled then
        QBCore = exports[Config.QB.frameworkScript][Config.QB.frameworkExport]()
    else
        -- CUSTOM = YOUR OWN FRAMEWORK EXPORT
    end

    while not FRAMEWORK.IsPlayerLoaded() do
        Citizen.Wait(150)
    end
    
    PlayerData = FRAMEWORK.GetPlayerData()
    CLIENT.Load()
    CLIENT.SetPlayerData()
end)
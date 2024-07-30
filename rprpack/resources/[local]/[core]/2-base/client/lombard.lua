ESX = nil

pawnshopcoords = vector3(-7.5560, -6.0490, 3.2791)
sellerpedcoords = vector3(-780.4769, -608.8374, 29.2791)
coords = vector3(0.0, 0.0, 0.0)

items = {
    {label = 'Kajdanki', value = 'handcuffs', baseprice = 300},
    {label = 'Krótkofalówka', value = 'radio', baseprice = 10},
    {label = 'Zapalniczka', value = 'zapalniczka', baseprice = 2},
    {label = 'Telefon', value = 'phone', baseprice = 150},

    {label = 'Smocze łuski', value = 'dragon_scales', baseprice = 30},
    {label = 'Wykrywacz metali', value = 'detector', baseprice = 2000},
    {label = 'Złoty pierścionek', value = 'gold_ring', baseprice = 100},
    {label = 'Złom metalowy', value = 'metalscrap', baseprice = 10},
    {label = 'Nakrętki i śruby', value = 'nuts_and_bolts', baseprice = 15},

    {label = 'Popsuty telefon', value = 'phone2', baseprice = 80},
}

prices = {}
blockbargaining = {}
local sellerped = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    PlayerData = ESX.GetPlayerData()
    generateprices()
    initped()
end)

Citizen.CreateThread(function()
    pawnshopblip = AddBlipForCoord(pawnshopcoords)
    SetBlipSprite (pawnshopblip, 375)
    SetBlipDisplay(pawnshopblip, 4)
    SetBlipScale  (pawnshopblip, 0.8)
    SetBlipColour(pawnshopblip, 43)
    SetBlipAsShortRange(pawnshopblip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName('Lombard')
    EndTextCommandSetBlipName(pawnshopblip)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(250)
        coords = GetEntityCoords(PlayerPedId())
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        sleep = true
        local dist = GetDistanceBetweenCoords(pawnshopcoords, coords, true)
        if dist <= 20.0 then
            sleep = false
            DrawMarker(21, pawnshopcoords, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 165, 0, 100, 0, 0, 0, 1)
            if dist <= 1.25 then
                inmarker = true
                ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~, aby przejrzeć ofertę lombardu')
                if IsControlJustPressed(0, 38) then
                    pawnshopmenu()
                end
            else
                if inmarker then
                    inmarker = false
                    ESX.UI.Menu.CloseAll()
                end
            end
        end
        if sleep then
            Citizen.Wait(1000)
        end
    end
end)

pawnshopmenu = function()
    PlayAmbientSpeech1(sellerped, 'Generic_Hi', 'Speech_Params_Force')
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pawnshop', {
        title    = 'Lombard',
        align    = 'center',
        elements = prices
    }, function(data, menu)
        ESX.TriggerServerCallback('summer-lombard:getplayeritemcount', function(result)
            if result > 0 then
                menu.close()
                local choose = {}
                if not blockbargaining[data.current.value] then
                    table.insert(choose, {label = 'Targuj się', value = 'changeprice'})
                end
                table.insert(choose, {label = 'Sprzedaj', value = 'sell'})
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pawnshop_choose', {
                    title    = 'Co chcesz zrobić?',
                    align    = 'center',
                    elements = choose
                }, function(data2, menu2)
                    menu2.close()
                    if data2.current.value == 'changeprice' then
                        changeprice(data.current.label, data.current.value, data.current.price, true)
                    else
                        openquantitymenu(data.current.value, data.current.price)
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            else
                ESX.ShowNotification('Nie posiadasz tego przedmiotu')
            end
        end, data.current.value)
    end, function(data, menu)
        menu.close()
    end)
end

generateprices = function()
    for k,v in pairs(items) do
        chance = math.random(10,20)
        chancenumber = tonumber('1.'..chance)
        finalprice = math.floor(v.baseprice*chancenumber)
        newlabel = v.label..' <font color=#00c749>'..finalprice..'$</font>'
        table.insert(prices, {label = newlabel, value = v.value, price = finalprice})
    end
    table.sort(prices, function(a, b)
        return a.price > b.price
    end)
end

changeprice = function(label, item, price, canbargaining)
    local elements = {}
    if canbargaining then
        table.insert(elements, {label = 'Oferta <font color=#00c749>'..price..'$</font>', value = 'atmprice'})
        table.insert(elements, {label = 'Targuj cenę', value = 'changeprice'})
    else
        table.insert(elements, {label = 'Ostateczna oferta <font color=#00c749>'..price..'$</font>', value = 'atmprice'})
        table.insert(elements, {label = 'Sprzedaj', value = 'sell'})
    end
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'bargaining', {
        title    = 'Targowanie',
        align    = 'center',
        elements = elements
    }, function(data, menu)
        if data.current.value == 'changeprice' then
            menu.close()
            local chance = math.random(0, 100)
            if chance >= 50 then
                local multiplierchange = math.random(2,5)
                local multiplierchangenumber = tonumber('1.0'..multiplierchange)
                local finalmultiplierprice = math.floor(price*multiplierchangenumber)
                changeprice(label, item, finalmultiplierprice, true)
            else
                blockbargaining[item] = true
                ESX.ShowNotification('Pracownik lombardu: nie ma chuja, drożej nie kupie!')
                PlayAmbientSpeech1(sellerped, 'Generic_Curse_High', 'Speech_Params_Force_Shouted_Critical')
                ESX.PlayAnimOnPed(sellerped, 'anim@heists@ornate_bank@chat_manager', 'fail', 8.0, -1, 0)
                changeprice(label, item, price, false)
                updateprice(label, item, price)
            end
        elseif data.current.value == 'sell' then
            menu.close()
            openquantitymenu(item, price)
            blockbargaining[item] = true
            updateprice(label, item, price)
        end
    end, function(data, menu)
        menu.close()
    end)
end

openquantitymenu = function(item, price)
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'pawnshop_quantity', {
        title = 'Ilość'
    }, function(data, menu)
        local quantity = tonumber(data.value)
        ESX.TriggerServerCallback('summer-lombard:getplayeritemcount', function(result)
            if result > 0 then
                if quantity <= result then
                    menu.close()
                    TriggerServerEvent('summer-lombard:requestsellitem', item, price, quantity, PlayerData.token)
                    PlayAmbientSpeech1(sellerped, 'Generic_Thanks', 'Speech_Params_Force_Shouted_Critical')
                else
                    ESX.ShowNotification('Posiadasz tylko '..result..' tego przedmiotu')
                end
            end
        end, item)
    end, function(data,menu)
        menu.close()
    end)
end

updateprice = function(label, item, price)
    split_string = Split(label, " ")
    cuttedlabel = split_string[1]
    for k,v in pairs(prices) do
        if v.value == item then
            prices[k].price = price
            prices[k].label = cuttedlabel..' <font color=lightgreen>'..price..'$</font>'
            break
        end
    end
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

initped = function()
    RequestModel(`g_m_m_korboss_01`)
	while not HasModelLoaded(`g_m_m_korboss_01`) do
	  Wait(100)
	end

    sellerped = CreatePed(5, `g_m_m_korboss_01`, sellerpedcoords, 357.775, false, true)
    FreezeEntityPosition(sellerped, true)
	SetEntityInvincible(sellerped, true)
	SetBlockingOfNonTemporaryEvents(sellerped, true)
end

RegisterNetEvent('very-lombard', function()
    pawnshopmenu()
end)

exports.qtarget:AddBoxZone("very-lombard", vector3(-782.28, -607.9, 30.28), 1, 3, {
    name="very-lombard",
    heading=11.0,
    debugPoly=false,
    minZ=28.77834,
    maxZ=32.87834,
    }, {
        options = {
            {
                event = "very-lombard",
                icon = "fas fa-sign-in-alt",
                label = "Otwórz lombard",
            },
        },
        distance = 3.5
})
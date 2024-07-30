local COLLECTION = {
	['ammunation'] = function(blip)
        SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Ammu-Nation</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_ammunation')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Należy posiadać licencję na broń palną.</font>")
	end,

	['bank'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Bank</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_bank')
		-- AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>W placówkach banku możesz wpłacać</font>")
	end,
	
	['taxi'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Taxi</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", "needrp_taxi")
	end,
	
	['bank_glowny'] = function(blip)		
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Pacific Standard Bank</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_bank_glowny')
		-- AddBlipInfoText(blip, "Informacje", "W głównej placówce banku możesz wpłacać,")
	end,
	
	['clothes'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Sklep Odzieżowy</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_clothes')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Wiele ubrań tylko tutaj!</font>")	
	end,
	
	['apple'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Zbiórka jabłek</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_apple')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Udaj się do sadu żeby zebrać jabłka!</font>")		
	end,

	['casino'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Diamond Casino</font", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_casino')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Miejsce w którym możesz się zabawić grając</font>")
		-- AddBlipInfoText(blip, "", "ruletkę, black jacka oraz jednorękiego bandytę.")
	end,

	['impound'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Holowanie</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_impound')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj odholować swój pojazd</font>")
	end,

	['jeweler'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Jubiler</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_jubiler')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Dostępne w sprzedaży drogie kamienie i pierścionki</font>")
	end,

	['cinemacar'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Kino Samochodowe</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_cinemacar')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Kino samochodowe na plaży</font>")
	end,

	['mission_row'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Los Santos Police Department</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_komenda')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Szef Policji</font>", "<font face='Poppins-Medium'>Jay Halstead</font>")
	end,

	['paletobay'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Paleto Bay Sheriff Department</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_paletobay')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Szef Policji</font>", "<font face='Poppins-Medium'>Jay Halstead</font>")
	end,

	['sandyshores'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Los Santos Sheriff Department</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_sheriff')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Szef Policji</font>", "<font face='Poppins-Medium'>Jay Halstead</font>")
	end,

	['fib'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Biuro FIB</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_fib')
	end,
	
	['church'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Kościół</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_church')
	end,

	['golf'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Pole golfowe</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_golf')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Dobre miejsce na spędzenie czasu z przyjaciółmi</font>")
	end,
	
	['bowling'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Kręgielnia</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_kregielnia')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Dobre miejsce na spędzenie czasu z przyjaciółmi</font>")
	end,

	['lombard'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Lombard</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_jubiler')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Skup rzeczy codziennego użytku</font>")
	end,

	['phone'] = function(blip)
		SetBlipInfoTitle(blip, "Multimedialny</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_phone')
		AddBlipInfoText(blip, "Informacje</font>", "Operator sieci komórkowej</font>")	
	end,
	
	['jail'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Więzienie</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_jail')
	end,

	['lscustoms'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Los Santos Customs</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_mechanic')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Firma świadczy usługi mechaniki pojazdów.</font>")
	end,	
	
	['operacja'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Operacja Plastyczna</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_operacja')
	end,

	['bike'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Wypożyczalnia rowerów</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_bike')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Tylko tutaj wypożyczysz BMX!</font>")
	end,		
	
	['cardealer'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Sprzedawca samochodów", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_cardealer')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "Możesz tutaj zakupić swój pojazd</font>")	
	end,	
	
	['silownia'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Siłownia", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_silownia')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj trochę pocwiczyć</font>")
	end,	
	
	['org'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Organizacja</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_house')
	end,	

	['airport'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Lotnisko</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_airport')
	end,

	['shop247'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Market 24/7</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_shop')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tu zakupić wodę, chleb</font>")
	end,

	['museum'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Muzeum</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_muzeum')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możemy tam napotkać Dinozaury</font>")
	end,
	
	['kawiarnia2'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Kawiarnia</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_kaw')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możemy tam zakupić pyszna kawe</font>")
	end,

	['wash'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Myjnia</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_myjnia')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj umyć swój cudowny samochód</font>")
	end,
	
	['scratch'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Złomowisko</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_scratch')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj zezłomować samochód innego obywatela</font>")	
	end,
	
	['komunikacji'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Wydział komunikacji</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_klucz')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj zarządzać samochodem</font>")		
	end,

	['komunikacji2'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Wydział kadrowy</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_cityhall')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj sprawdzić swoje doświadczenie w pracy</font>")		
	end,
	
	['parking'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Parking</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_parking')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj zaparkować swój pojazd</font>")
	end,	
	
	['parkingpd'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Parking policyjny</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_parkingpd')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>W tym miejscu policja przetrzymuje skonfiskowane pojazdy</font>")
	end,
	
	['boat'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Przystań</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_boat')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj zatamować swoją łódź</font>")
	end,
	
	['boat_dealer'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Sprzedawca łódek</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_boat_dealer')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj zakupić łódź</font>")	
	end,	
	
	['holdup'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Napad</font>", false)
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Tylko odważni są w stanie zrobić napad</font>")
	end,
	
	['house'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Nieruchomość</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_house')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj się przebrać, schować wyposażenie</font>")	
	end,
	
	['fryzjer'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Salon fryzjerski</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_fryzjer')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj zmienić swoją fryzurę</font>")		
	end,
	
	['octagon'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Oktagon MMA</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_mma')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Miejsce walk 1vs1</font>")
	end,
	
	['driving'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Ośrodek egzaminacyjny</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_diving')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj zdać swoje pierwsze prawo jazdy</font>")	
	end,

	['cityhall'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Urząd miasta</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_cityhall')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj zdobyć swoją pierwszą pracę</font>")
	end,

	['robsliquor'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Robs Liquor</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_mono')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tu zakupić wodę, chleb</font>")
	end,

	['hurtownia'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Hurtownia</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_hurtownia')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tu zakupić wytrych</font>")
	end,	
	
	['klub'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Klub</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_klub')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tu zakupić napój alkoholowy</font>")
	end,	
	
	['stacja'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Stacja benzynowa</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_shop')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tu zakupić wodę, chleb</font>")
	end,

	['tattoo'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Salon tatuażu</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_tattoo')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Informacje</font>", "<font face='Poppins-Medium'>Możesz tutaj zdobyć swój pierwszy tatuaż</font>")
	end,

	['pillbox'] = function(blip)
		SetBlipInfoTitle(blip, "<font face='Poppins-Medium'>Emergency Medical Services</font>", false)
		SetBlipInfoImage(blip, "NeedRP_blips", 'needrp_szpital')
		AddBlipInfoText(blip, "<font face='Poppins-Medium'>Dyrektor</font>", "<font face='Poppins-Medium'>Alan Parker</font>")
	end,
}

CreateThread(function()
	RequestStreamedTextureDict("NeedRP_blips", 1)
    while not HasStreamedTextureDictLoaded("NeedRP_blips") do
        Citizen.Wait(0)
	end
end)

function SetBlip(blip, switch)
	local f = COLLECTION[switch]
	if f then
		f(blip)
	end
end
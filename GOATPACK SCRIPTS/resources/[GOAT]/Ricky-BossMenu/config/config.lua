-- Tech Development
-- Another free script
-- Join now: https://discord.gg/tHAbhd94vS

Config = {}

Config.HireRange = 2.5

Config.UseESXAddonAccount = true

Config.DateFormat = { -- https://www.lua.org/pil/22.1.html
    dashboard = '%A, %d %B %Y',
    dashboardTime = '%H:%M',
    note = '%d/%m/%y %H:%M',
    hire = '%d/%m/%y',
}

Config.MarkerSettings = {
    type = 2,
    color = {r = 0, g = 255, b = 0, a = 200},
    scale = {x = 0.7, y = 0.7, z = 0.7},
    bump = false,
    rotate = true
}

Config.UnemployedJob = {
    name = 'unemployed',
    grade = 0,
}

Config.Job = {
    ['police'] = {
        label = 'Police Department',
        minGrade = 1,
        creationDate = '01/01/2021',
        logo = "https://cdn.discordapp.com/attachments/1224836066704490596/1236694050447298610/pngaaa.com-3764851.png?ex=6638f096&is=66379f16&hm=41c9f5b1045e3abac939a9edc65822ff324bca060c004b510fd0716bcb769cf0&",
        coords = {
           vec3(615.6823, -23.9972, 91.2734)
        }
    },
    ['ambulance'] = {
        label = 'EMS',
        minGrade = 1,
        creationDate = '01/01/2021',
        logo = "https://cdn.discordapp.com/attachments/944572269202640946/1023536303180107856/tech2.png"
    },
}

Config.Locales = {
    ['society_informations'] = "Informacje",
    ['society_money'] = "Pieniadze spolecznosci",
    ['employee'] = "Pracownicy",
    ['since'] = "od",
    ['welcome'] = "Witaj!",
    ['rank'] = "Ranga",
    ['play_time'] = "Czas sluzby",
    ['hire'] = "Zatrudnij",
    ['actions'] = "Akcje",
    ['amount'] = "Kwota",
    ['withdraw_money'] = "Wyplacic pieniadze",
    ['deposit_money'] = "Wplacic pieniadze",
    ['dashboard'] = "Dashboard",
    ['confirm'] = "Potwierdz",
    ['invalid_amount'] = "Nieprawidlowa kwota",
    ['edit_grade'] = "Edytuj stopien",
    ['last_update'] = "Ostatnia aktualizacja",
    ['fire'] = "Zwolnij",
    ['employee_management'] = "Zarzadzanie pracownikami",
    ['employee_info'] = "Informacje o pracowniku",
    ['hired_from'] = "Zatrudniony z",
    ['status'] = "Status",
    ['input_employee'] = "Wyszukaj po imieniu",
    ['grade_list'] = "Lista stopni",
    ['employees'] = "Pracownicy",
    ['grade_management'] = "Zarzadzanie stopniami",
    ['edit_salary'] = "Edytuj pensje",
    ['sure_fire'] = "Czy jestes pewien, ze chcesz zwolnic tego pracownika?",
    ['cancel'] = "Anuluj",
    ['no_player'] = "Nikt",
    ['online'] = "W sieci",
    ['offline'] = "Poza siecia",
    ['currency'] = "$",
    ['no_money'] = "Nie masz wystarczajaco pieniedzy",
    ['sure_remove_avatar'] = "Czy jestes pewien, ze chcesz usunac swoj awatar?",
    ['no_fire_yourself'] = "Nie mozesz zwolnic siebie",
    ['salary_edited'] = "Zmieniles pensje",
    ['grade_edited'] = "Zmieniles ocene",
    ['withdrawn'] = "Wyplaciles %s",
    ['deposited'] = "Wplaciles %s",
    ['fired'] = "Zwolniles %s",
    ['press_to_open'] = "Nacisnij ~g~[E]~w~ aby otworzyc menu pracodawcy"}

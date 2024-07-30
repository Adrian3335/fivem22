Config = {}

Config.EnableVersionCheck = false
Config.VersionCheckInterval = 60

--POWIADOMIENIE PD
Config.EnablePoliceNotify = false -- Powiadomienie dla PD jak grajek sobie pierze (wymagane linden_outlawalert lub przerob sobie)
Config.PoliceNotifyBlipSpirit = 161
Config.PoliceNotifyBlipScale = 1.0
Config.PoliceNotifyBlipColor = 1
Config.MinAmountToWash = 5000

--PRALNIA
Config.NeedIDCardToWashMoney = false
Config.EnableTax = true 
Config.TaxRate = 25 --In percents %

-- BLIP --

Config.EnableMoneyWashBlip = false
Config.WashMoneyBlipName = "Laundry"

--KORDY PRALNI
Config.MoneyWash = {
    Loc = {
        WashMoney = {
            vector3(562.7527, -3121.9636, 18.7687)
        }
    }
}

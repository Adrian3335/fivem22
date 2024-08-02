FetchSkills = function()
    ESX.TriggerServerCallback("goat_skills:fetchStatus", function(data)
		if data then
            for status, value in pairs(data) do
                if Config.Skills[status] then
                    Config.Skills[status]["Current"] = value["Current"]
                else
                    print("Removing: " .. status) 
                end
            end
		end
        RefreshSkills()
    end)
end

RegisterNetEvent('skills', function()
    SkillMenu()
end)

SkillMenu = function()
    SendNUIMessage({
        action = 'OpenUI',
        stats = Config.Skills
    })
    SetNuiFocus(true, true)
end

RegisterNUICallback('Close', function()
    SetNuiFocus(false, false)
end)

GetCurrentSkill = function(skill)
    return Config.Skills[skill]
end

UpdateSkill = function(skill, amount)

    if not Config.Skills[skill] then
        print("Skill " .. skill .. " doesn't exist")
        return
    end

    local SkillAmount = Config.Skills[skill]["Current"]
    
    if SkillAmount + tonumber(amount) < 0 then
        Config.Skills[skill]["Current"] = 0
    elseif SkillAmount + tonumber(amount) > 100 then
        Config.Skills[skill]["Current"] = 100
    else
        Config.Skills[skill]["Current"] = SkillAmount + tonumber(amount)
    end
    
    RefreshSkills()

	TriggerServerEvent("goat_skills:update", json.encode(Config.Skills))
end


function round(num) 
    return math.floor(num+.5) 
end

RefreshSkills = function()
    for type, value in pairs(Config.Skills) do
        
        if value["Stat"] then
            StatSetInt(value["Stat"], round(value["Current"]), true)
        end
        
        if ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "skill_menu") then
            SkillMenu()
        end
    end
end

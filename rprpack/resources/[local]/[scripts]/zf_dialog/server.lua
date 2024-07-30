PerformHttpRequest("https://raw.githubusercontent.com/zf-development/zf_version/main/zf_dialog.txt", function(err, text, headers)
    Citizen.Wait(2000)
    local curVer = GetResourceMetadata(GetCurrentResourceName(), "version")

    if (text ~= nil) then
        if (text ~= curVer) then
        else
        end
    else
    end 
end)
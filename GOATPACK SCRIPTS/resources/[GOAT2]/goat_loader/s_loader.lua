local rsrcName = GetCurrentResourceName()
if rsrcName ~= "goat_loader" then
    local FilesContent = {}
    local FilesTable = json.decode(GetResourceMetadata(rsrcName, 'my_data_extra'))

    if FilesTable == nil then
        print("Client files undefined")
    end

    for i,v in pairs(FilesTable) do
        local content = LoadResourceFile(rsrcName, v)
        if content ~= nil then
            table.insert(FilesContent, content)
        else
            print("file ["..v.."] error")
        end
    end

    local GotSrc = {}
    RegisterNetEvent(rsrcName, function()
        local src = source
        if not GotSrc[src] then
            TriggerClientEvent(rsrcName, src, FilesContent)
            GotSrc[src] = true
        else
            -- exports["goat_logs"]:Send(src, "anticheat.loader", rsrcName)
        end
    end)
end
ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback("goat_skills:fetchStatus", function(source, cb)
     local xPlayer = ESX.GetPlayerFromId(source)
     MySQL.Async.fetchScalar('SELECT skills FROM users WHERE identifier = ?', {
          xPlayer.identifier
     }, function(status)
          if status ~= nil then
               cb(json.decode(status))
          else
               cb(nil)
          end
     end)
end)


RegisterServerEvent("goat_skills:update")
AddEventHandler("goat_skills:update", function(data)
     local xPlayer = ESX.GetPlayerFromId(source)
     MySQL.Async.execute('UPDATE users SET skills = ? WHERE identifier = ?', {
          data,
          xPlayer.identifier
     })
end)

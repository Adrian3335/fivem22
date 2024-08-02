

RegisterCommand('testkey', function()
	StartKey({
		{
			label = "Anuluj",
			key = "esc",
		},
		{
			label = "Zapisz",
			key = "alt",
		},
		{
			label = "Usuń",
			key = "dol"
		}})

	Hint(true, '???', 'Dostarcz paczkę do miejsca zaznaczonego na mapie')
end)

function StartKey(data)
	-- SetNuiFocus(true, false)
	SendNUIMessage({
		action = 'open',
		datas = data
	})
end



function EndKey(data)
	SendNUIMessage({
		action = 'close',
	})
end

exports('StartKey', function(data)
	StartKey(data)
end)

exports('EndKeys', function()
	EndKey()
end)

exports('ToggleHint', function(toggle, title, content, clear) Hint(toggle, title, content, clear) end)

function Hint(toggle, title, content, clear)
    SendNUIMessage({
        action = "toggleHint",
        status = toggle,
        data = {title = title, content = content},
      })
end
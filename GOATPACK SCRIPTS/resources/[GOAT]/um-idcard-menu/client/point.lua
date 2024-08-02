local idCardNpcPoint = lib.points.new(Config.NPC.coords, 2)

function idCardNpcPoint:onEnter()
    lib.showTextUI('[E] - Dowod osobisty', {position = "left-center",icon = 'id-card'})
end

function idCardNpcPoint:onExit()
    lib.hideTextUI()
end

function idCardNpcPoint:nearby()
    if self.currentDistance < 4 and IsControlJustReleased(0, 38) then
        lib.showContext("identity_menu")
    end
end
EDITABLE = {}

EDITABLE.CanOpenMDT = function()
    return not LocalPlayer.state.IsDead and not LocalPlayer.state.IsHandcuffed
end
--
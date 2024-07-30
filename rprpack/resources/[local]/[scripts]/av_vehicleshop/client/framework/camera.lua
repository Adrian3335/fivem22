--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

prevCam = nil

function renderCamera()
    DoScreenFadeOut(100)
    Wait(1000)
    local dealership = Config.Dealerships[currentDealer]
    local spawnCoords = dealership.preview_vehicle_coords
    local camCoords = dealership.preview_vehicle_camera
    local interior = GetInteriorAtCoords(spawnCoords.x, spawnCoords.y, spawnCoords.z)
    if tonumber(interior) == 285953 then
        ActivateInteriorEntitySet(interior,"entity_set_style_3")
        RefreshInterior(interior)
    end
    prevCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(prevCam, camCoords.x, camCoords.y, camCoords.z)
    SetCamRot(prevCam, 0.0, 0.0, camCoords.rotation)
    SetFocusPosAndVel(camCoords.x, camCoords.y, camCoords.z, 0.0, 0.0, 0.0)
    SetCamFov(prevCam, camCoords.fov)
    RenderScriptCams(true, false, 0, 1, 0)
    Wait(1000)
    DoScreenFadeIn(50)
end
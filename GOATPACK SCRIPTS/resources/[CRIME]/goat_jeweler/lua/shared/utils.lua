loadPtfxAsset = function(dict)
    repeat
        RequestNamedPtfxAsset(dict)
        Citizen.Wait(50)
    until HasNamedPtfxAssetLoaded(dict)
end
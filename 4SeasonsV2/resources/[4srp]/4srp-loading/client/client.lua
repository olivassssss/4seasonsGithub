local checkState = false
local sky = exports["4srp-multicharacter"]:skyCam(bool)

AddEventHandler("playerSpawned", function ()
    if sky then 
        if not checkState then
            ShutdownLoadingScreenNui()
            checkState = true
        end
    end
end)
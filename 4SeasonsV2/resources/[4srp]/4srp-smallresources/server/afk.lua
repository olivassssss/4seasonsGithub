local QBCore = exports['4srp-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
	DropPlayer(source, 'You Have Been Kicked For Being AFK')
end)

QBCore.Functions.CreateCallback('4srp-afkkick:server:GetPermissions', function(source, cb)
    cb(QBCore.Functions.GetPermission(source))
end)

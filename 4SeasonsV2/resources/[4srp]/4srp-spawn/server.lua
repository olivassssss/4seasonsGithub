local QBCore = exports['4srp-core']:GetCoreObject()

QBCore.Functions.CreateCallback('4srp-spawn:server:getOwnedHouses', function(_, cb, cid)
    if cid ~= nil then
        local houses = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?', {cid})
        if houses[1] ~= nil then
            cb(houses)
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

QBCore.Commands.Add("addloc", "Add location for spawn (God Only)", {}, false, function(source)
    local src = source
    TriggerClientEvent('4srp-spawn:client:OpenUIForSelectCoord', src)
end, "god")
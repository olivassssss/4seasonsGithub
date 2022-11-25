local QBCore = exports['4srp-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('book', function(source)
    TriggerClientEvent('edrp_4srp-books:OpenBook', source, "kitaplspd1")
end)
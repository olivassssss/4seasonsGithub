local QBCore = exports['4srp-core']:GetCoreObject()

RegisterCommand('kitaptest', function()
    TriggerEvent('edrp_4srp-books:OpenBook', "kitaplspd1")
end)

RegisterNetEvent("edrp_4srp-books:OpenBook")
AddEventHandler("edrp_4srp-books:OpenBook", function(book)
    if Config[book] then
        SendNUIMessage({
            action = "OpenUI",
            pages = Config[book]
        })
        SetNuiFocus(true, true)
    else
        QBCore.Functions.Notify("Kitap boş görünüyor.", "error")
    end
end)

RegisterNUICallback("CloseUI", function(data, cb)
    SendNUIMessage({
        action = "CloseUI",
    })
    SetNuiFocus(false, false)
end)
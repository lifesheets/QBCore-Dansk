local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("strips", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("police:client:CuffPlayerSoft", src)
    end
end)
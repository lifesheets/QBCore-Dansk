local QBCore = exports['qb-core']:GetCoreObject()

-------------------USABLE ITEMS-------------------
--ENGINE PARTS
QBCore.Functions.CreateUseableItem("engine0", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:E0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("engine1", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:E1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("engine2", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:E2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("engine3", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:E3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("engine4", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:E4", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

--BRAKES
QBCore.Functions.CreateUseableItem("brake0", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:B0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("brake1", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:B1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("brake2", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:B2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("brake3", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:B3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

--TRANSMISSION
QBCore.Functions.CreateUseableItem("transmission0", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:T0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("transmission1", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:T1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("transmission2", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:T2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("transmission3", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:T3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

--SUSPENSION
QBCore.Functions.CreateUseableItem("suspension0", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:S0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("suspension1", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:S1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("suspension2", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:S2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("suspension3", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:S3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("suspension4", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:S4", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

--TURBO
QBCore.Functions.CreateUseableItem("turbo0", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:Turbo0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("turbo1", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:Turbo1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("windowtint0", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:WT0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("windowtint1", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:WT1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("windowtint2", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:WT2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("windowtint3", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:WT3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)
-----------------
-----------------
-----------------
-----------------
QBCore.Functions.CreateUseableItem("stock", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HLS", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("white", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("blue", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("electricblue", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("mintgreen", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("limegreen", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL4", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("yellow", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL5", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("goldenshower", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL6", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("orange", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL7", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("red", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL8", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("ponypink", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL9", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)


QBCore.Functions.CreateUseableItem("hotpink", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL10", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("purple", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL11", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("blacklight", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:HL12", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)
----------------------------------------
QBCore.Functions.CreateUseableItem("spoiler0", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:Spoiler0", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("spoiler1", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:Spoiler1", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("spoiler2", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:Spoiler2", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("spoiler3", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:Spoiler3", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

QBCore.Functions.CreateUseableItem("spoiler4", function(source, item)

    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:Spoiler4", source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Ukendt Fejl", "error")
    end
end)

--DATA
RegisterServerEvent("updateVehicle")
AddEventHandler("updateVehicle", function(myCar)
    local src = source
    if IsVehicleOwned(myCar.plate) then
        MySQL.Async.execute('UPDATE player_vehicles SET mods = ? WHERE plate = ?', {json.encode(myCar), myCar.plate})
    end
end)

function IsVehicleOwned(plate)
    local retval = false
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        retval = true
    end
    return retval
end

----- DO NOT TOUCH ABOVE ^^^^^
-----ONLY EDIT BELOW THIS LINE-------
--[[QBCore.Commands.Add("fix", "Repair your vehicle (Admin Only)", {}, false, function(source)
    TriggerClientEvent('iens:repaira', source)
    TriggerClientEvent('vehiclemod:client:fixEverything', source)
end, "admin")

QBCore.Functions.CreateUseableItem("repairkit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:client:RepairVehicle", source)
    end
end)

QBCore.Functions.CreateUseableItem("cleaningkit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("qb-mechanicparts:client:CleanVehicle", source)
    end
end)

RegisterNetEvent('qb-mechanicparts:removeItem', function(item)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    ply.Functions.RemoveItem(item, 1)
end)

RegisterNetEvent('qb-mechanicparts:server:removewashingkit', function(veh)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    ply.Functions.RemoveItem("cleaningkit", 1)
    TriggerClientEvent('qb-mechanicparts:client:SyncWash', -1, veh)
end)]]

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------EDIT BELOW HERE FOR 'CRAFTING'--------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------


RegisterServerEvent("craft:part")
AddEventHandler("craft:part", function(part)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

            local hasEverything = true
            for item, amount in pairs(Config.parts[part].costs) do
                if Player.Functions.GetItemByName(item) ~= nil then
                    if Player.Functions.GetItemByName(item).amount < amount then
                        hasEverything = false
                        TriggerClientEvent('QBCore:Notify', src, 'Du har ikke det korrekte antal af '..QBCore.Shared.Items[item].label..' ...', 'error')
                    end
                else
                    hasEverything = false
                    TriggerClientEvent('QBCore:Notify', src, 'Du har ikke '..QBCore.Shared.Items[item].label..' ...', 'error')
                end
            end
            if hasEverything and Player.Functions.AddItem(part, 1) then
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[part], "add")
                for item, amount in pairs(Config.parts[part].costs) do
                    Player.Functions.RemoveItem(item, amount)
                end
            end

end)

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------EDIT BELOW HERE FOR 'PURCHASABLES'--------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------


RegisterNetEvent('buy:repairkit')
AddEventHandler('buy:repairkit', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerEvent('qb-bossmenu:server:removeAccountMoney','mechanic', 2200)
    Player.Functions.AddItem("repairkit", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["repairkit"], "add")
    TriggerClientEvent('QBCore:Notify', src, 'Du købte et reparationskit for 2200 DKK', 'success')
end)

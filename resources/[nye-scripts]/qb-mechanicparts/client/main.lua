local QBCore = exports['qb-core']:GetCoreObject()
local propAttached = false
local BackEngineVehicles = { 'ninef', 'adder', 'vagner', 't20', 'infernus', 'zentorno', 'reaper', 'comet2', 'comet3', 'jester', 'jester2',
                             'cheetah', 'cheetah2', 'prototipo', 'turismor', 'pfister811', 'ardent', 'nero', 'nero2', 'tempesta', 'vacca', 'bullet', 'osiris', 'entityxf',
                             'turismo2', 'fmj', 're7b', 'tyrus', 'italigtb', 'penetrator', 'monroe', 'ninef2', 'stingergt', 'surfer', 'surfer2', 'comet3', }

--------------------------------------------------
------ESSENTIAL CODING / DONT MESS WITH THIS------
--------------------------------------------------
isLoggedIn = true
PlayerJob = {}

local function saveVehicle()
    local plyPed = PlayerPedId()
    local veh = QBCore.Functions.GetClosestVehicle()
    local vehicleMods = {
        mods = {},
    }
    vehicleMods.mods[11] = GetVehicleMod(veh, 11)
    vehicleMods.mods[12] = GetVehicleMod(veh, 12)
    vehicleMods.mods[13] = GetVehicleMod(veh, 13)
    vehicleMods.mods[15] = GetVehicleMod(veh, 15)
    vehicleMods.mods[18] = IsToggleModOn(veh, 18)

    local myCar = QBCore.Functions.GetVehicleProperties(veh)
    TriggerServerEvent('updateVehicle', myCar)
end
function IsBackEngine(vehModel)
    for _, model in pairs(BackEngineVehicles) do
        if GetHashKey(model) == vehModel then
            return true
        end
    end
    return false
end

AddEventHandler('onResourceStop', function(name)
    if name == GetCurrentResourceName() then
        TriggerEvent("b1g_props:client:RemoveItems", false)
    end
end)


--^^^^^^^^^^^^^^^DONT TOUCH ABOVE THIS LINE^^^^^^^^^^^^^^^--


--------------------------
------PARTS CRAFTING------
--------------------------

----REPAIRKIT-----
------------------
RegisterNetEvent('craft:repairkit') AddEventHandler("craft:repairkit", function()
    QBCore.Functions.Progressbar("craft_repairkit", "Getting Tools & Parts...", 25000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 10)
        
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "repairkit")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

------ENGINE------
------------------
RegisterNetEvent('craft:engine0') AddEventHandler("craft:engine0", function()
    QBCore.Functions.Progressbar("craft_engine0", "Building Engine...", 25000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 10)
        
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "engine0")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:engine1')
AddEventHandler("craft:engine1", function()
    QBCore.Functions.Progressbar("craft_engine1", "Building Engine...", 25000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 10)
        
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)

            TriggerServerEvent("craft:part", "engine1")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:engine2')
AddEventHandler("craft:engine2", function()
    QBCore.Functions.Progressbar("craft_engine2", "Building Engine...", 25000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "engine2")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:engine3')
AddEventHandler("craft:engine3", function()
    QBCore.Functions.Progressbar("craft_engine3", "Building Engine...", 25000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(4, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "engine3")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:engine4')
AddEventHandler("craft:engine4", function()
    QBCore.Functions.Progressbar("craft_engine4", "Building Engine...", 25000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(4, 8)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "engine4")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

-- BRAKES
RegisterNetEvent('craft:brake0')
AddEventHandler("craft:brake0", function()
    QBCore.Functions.Progressbar("craft_brake0", "Building Brake Setup...", 22000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "brake0")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:brake1')
AddEventHandler("craft:brake1", function()
    QBCore.Functions.Progressbar("craft_brake1", "Building Brake Setup...", 22000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "brake1")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:brake2')
AddEventHandler("craft:brake2", function()
    QBCore.Functions.Progressbar("craft_brake2", "Building Brake Setup...", 22000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "brake2")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:brake3')
AddEventHandler("craft:brake3", function()
    QBCore.Functions.Progressbar("craft_brake3", "Building Brake Setup...", 22000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "brake3")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

-- Transmission
RegisterNetEvent('craft:transmission0')
AddEventHandler("craft:transmission0", function()
    QBCore.Functions.Progressbar("craft_transmission0", "Building Transmission...", 24000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "transmission0")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:transmission1')
AddEventHandler("craft:transmission1", function()
    QBCore.Functions.Progressbar("craft_transmission1", "Building Transmission...", 24000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "transmission1")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:transmission2')
AddEventHandler("craft:transmission2", function()
    QBCore.Functions.Progressbar("craft_transmission2", "Building Transmission...", 24000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "transmission2")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:transmission3')
AddEventHandler("craft:transmission3", function()
    QBCore.Functions.Progressbar("craft_transmission3", "Building Transmission...", 24000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "transmission3")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

-- Suspension
RegisterNetEvent('craft:suspension0')
AddEventHandler("craft:suspension0", function()
    QBCore.Functions.Progressbar("craft_suspension0", "Building Suspension...", 24000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "suspension0")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:suspension1')
AddEventHandler("craft:suspension1", function()
    QBCore.Functions.Progressbar("craft_suspension1", "Building Suspension...", 24000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "suspension1")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:suspension2')
AddEventHandler("craft:suspension2", function()
    QBCore.Functions.Progressbar("craft_suspension2", "Building Suspension...", 24000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "suspension2")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:suspension3')
AddEventHandler("craft:suspension3", function()
    QBCore.Functions.Progressbar("craft_suspension3", "Building Suspension...", 24000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "suspension3")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:suspension4')
AddEventHandler("craft:suspension4", function()
    QBCore.Functions.Progressbar("craft_suspension4", "Building Suspension...", 24000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "suspension4")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

-- TURBO
RegisterNetEvent('craft:turbo0')
AddEventHandler("craft:turbo0", function()
    QBCore.Functions.Progressbar("craft_turbo0", "Building Turbo...", 18000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "turbo0")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:turbo1')
AddEventHandler("craft:turbo1", function()
    QBCore.Functions.Progressbar("craft_turbo1", "Building Turbo...", 18000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "turbo1")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

-- WINDOW TINTING (TEST)
RegisterNetEvent('craft:windowtint0')
AddEventHandler("craft:windowtint0", function()
    QBCore.Functions.Progressbar("craft_windowtint0", "Setting Window Tint...", 18500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "windowtint0")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

RegisterNetEvent('craft:harness')
AddEventHandler("craft:harness", function()
    QBCore.Functions.Progressbar("craft_harness", "Building Harness Kit...", 17500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 9,
    }, {}, {}, function()
        local playerPed = PlayerPedId()
        local success = exports['qb-lock']:StartLockPickCircle(3, 9)
        if success then
            StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
            TriggerServerEvent("craft:part", "harness")
            ClearPedTasks(playerPed)
        else
            QBCore.Functions.Notify("Fejlede!", "error")
            ClearPedTasks(playerPed)
        end
    end)
end)

------------------------------
------PARTS INSTALLATION------
------------------------------

------ENGINE------
------------------

RegisterNetEvent('qb-mechanicparts:E0')
AddEventHandler('qb-mechanicparts:E0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["engine0"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            engine = GetVehicleMod(vehicle, 11)
                            if engine ~= -1 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                    -- 			    trunkpos = true
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Gas_Engine", "Installerer "..QBCore.Shared.Items["engine0"].label.."...", 35000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine0"], "remove")
                                    QBCore.Functions.Notify("Stock Engine Successfully installed", "success")
                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify("Stock Engine already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_car_engine_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:E1')
AddEventHandler('qb-mechanicparts:E1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["engine1"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            engine = GetVehicleMod(vehicle, 11)
                            if engine ~= 0 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Gas_Engine", "Installerer "..QBCore.Shared.Items["engine1"].label.."...", 35000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine1"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["engine1"].label.." Successfully installed", "success")
                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["engine1"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_car_engine_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:E2')
AddEventHandler('qb-mechanicparts:E2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["engine2"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            engine = GetVehicleMod(vehicle, 11)
                            if engine ~= 1 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Gas_Engine", "Installerer "..QBCore.Shared.Items["engine2"].label.."...", 35000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine2"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["engine2"].label.." Successfully installed", "success")
                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["engine2"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_car_engine_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:E3')
AddEventHandler('qb-mechanicparts:E3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["engine3"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            engine = GetVehicleMod(vehicle, 11)
                            if engine ~= 2 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Gas_Engine", "Installerer "..QBCore.Shared.Items["engine3"].label.."...", 35000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine3"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["engine3"].label.." Successfully installed", "success")
                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["engine3"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_car_engine_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:E4')
AddEventHandler('qb-mechanicparts:E4', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["engine4"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            engine = GetVehicleMod(vehicle, 11)
                            if engine ~= 3 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Gas_Engine", "Installerer "..QBCore.Shared.Items["engine4"].label.."...", 35000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 3, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine4", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine4"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["engine4"].label.." Successfully installed", "success")
                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["engine4"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_car_engine_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

--brakes
RegisterNetEvent('qb-mechanicparts:B0')
AddEventHandler('qb-mechanicparts:B0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["brake0"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            brake = GetVehicleMod(vehicle, 12)
                            if brake ~= -1 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Brakes", "Installerer "..QBCore.Shared.Items["brake0"].label.."...", 28500, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake0"], "remove")
                                    QBCore.Functions.Notify("Stock Brakes Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["brake0"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_brake_caliper_01a')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:B1')
AddEventHandler('qb-mechanicparts:B1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["brake1"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            brake = GetVehicleMod(vehicle, 12)
                            if brake ~= 0 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Brakes", "Installerer "..QBCore.Shared.Items["brake1"].label.."...", 28500, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake1"], "remove")
                                    QBCore.Functions.Notify("Stock Brakes Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["brake1"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_brake_caliper_01a')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:B2')
AddEventHandler('qb-mechanicparts:B2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["brake2"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            brake = GetVehicleMod(vehicle, 12)
                            if brake ~= 1 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Brakes", "Installerer "..QBCore.Shared.Items["brake2"].label.."...", 28500, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, 1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake2"], "remove")
                                    QBCore.Functions.Notify("Stock Brakes Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["brake2"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_brake_caliper_01a')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:B3')
AddEventHandler('qb-mechanicparts:B3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["brake3"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            brake = GetVehicleMod(vehicle, 12)
                            if brake ~= 2 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Brakes", "Installerer "..QBCore.Shared.Items["brake3"].label.."...", 28500, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake3"], "remove")
                                    QBCore.Functions.Notify("Stock Brakes Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["brake3"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_brake_caliper_01a')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

-- --Transmission
RegisterNetEvent('qb-mechanicparts:T0')
AddEventHandler('qb-mechanicparts:T0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["transmission0"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            transmission = GetVehicleMod(vehicle, 13)
                            if transmission ~= -1 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["transmission0"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 13, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "transmission0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["transmission0"], "remove")
                                    QBCore.Functions.Notify("Stock Transmission Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["transmission0"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_gearbox_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:T1')
AddEventHandler('qb-mechanicparts:T1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["transmission1"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            transmission = GetVehicleMod(vehicle, 13)
                            if transmission ~= 0 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["transmission1"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 13, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "transmission1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["transmission1"], "remove")
                                    QBCore.Functions.Notify("Stock Transmission Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["transmission1"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_gearbox_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:T2')
AddEventHandler('qb-mechanicparts:T2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["transmission2"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            transmission = GetVehicleMod(vehicle, 13)
                            if transmission ~= 1 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["transmission2"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 13, 1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "transmission2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["transmission2"], "remove")
                                    QBCore.Functions.Notify("Stock Transmission Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["transmission2"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_gearbox_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:T3')
AddEventHandler('qb-mechanicparts:T3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["transmission3"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            transmission = GetVehicleMod(vehicle, 13)
                            if transmission ~= 2 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["transmission3"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 13, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "transmission3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["transmission3"], "remove")
                                    QBCore.Functions.Notify("Stock Transmission Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["transmission3"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_gearbox_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

-- --Suspension
RegisterNetEvent('qb-mechanicparts:S0')
AddEventHandler('qb-mechanicparts:S0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["suspension0"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            suspension = GetVehicleMod(vehicle, 15)
                            if suspension ~= -1 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["suspension0"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension0"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["suspension0"].label.." Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["suspension0"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_cs_trolley_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:S1')
AddEventHandler('qb-mechanicparts:S1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["suspension1"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            suspension = GetVehicleMod(vehicle, 15)
                            if suspension ~= 0 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["suspension1"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension1"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["suspension1"].label.." Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["suspension1"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_cs_trolley_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:S2')
AddEventHandler('qb-mechanicparts:S2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["suspension2"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            suspension = GetVehicleMod(vehicle, 15)
                            if suspension ~= 1 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["suspension2"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, 1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension2"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["suspension2"].label.." Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["suspension2"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_cs_trolley_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:S3')
AddEventHandler('qb-mechanicparts:S3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["suspension3"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            suspension = GetVehicleMod(vehicle, 15)
                            if suspension ~= 2 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["suspension3"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension3"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["suspension3"].label.." Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["suspension3"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_cs_trolley_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:S4')
AddEventHandler('qb-mechanicparts:S4', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["suspension4"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            suspension = GetVehicleMod(vehicle, 15)
                            if suspension ~= 3 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["suspension4"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 15, 3, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "suspension4", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["suspension4"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["suspension4"].label.." Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["suspension4"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'prop_cs_trolley_01')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

-- --Turbo

RegisterNetEvent('qb-mechanicparts:Turbo0')
AddEventHandler('qb-mechanicparts:Turbo0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["turbo0"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            turbo = IsToggleModOn(vehicle, 18)
                            if turbo ~= false then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["turbo0"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 18, false)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "turbo0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["turbo0"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["turbo0"].label.." Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["turbo0"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_radiator_02')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

RegisterNetEvent('qb-mechanicparts:Turbo1')
AddEventHandler('qb-mechanicparts:Turbo1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    for k,v in pairs(Config.parts["turbo1"].Jobs) do
        if v == PlayerJob.name then
            if PlayerJob.onduty then
                if vehicle ~= nil and vehicle ~= 0 then
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            turbo = IsToggleModOn(vehicle, 18)
                            print(turbo)
                            if turbo ~= 1 then
                                if (IsBackEngine(GetEntityModel(vehicle))) then
                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                else
                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                end
                                if propAttached then
                                    TriggerEvent("b1g_props:client:RemoveItems", false)
                                    propAttached = false
                                end
                                QBCore.Functions.Progressbar("Transmission", "Installerer "..QBCore.Shared.Items["turbo1"].label.."...", 21250, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 9,
                                }, {}, {}, function()
                                    -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    ToggleVehicleMod(vehicle, 18, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "turbo1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["turbo1"], "remove")
                                    QBCore.Functions.Notify(QBCore.Shared.Items["turbo1"].label.." Successfully installed", "success")

                                end,  function()
                                    ClearPedTasksImmediately(PlayerPedId())
                                end )
                            else
                                QBCore.Functions.Notify(QBCore.Shared.Items["turbo1"].label.." already installed...", "error")
                            end
                        end
                    elseif not IsPedInAnyVehicle(ped) then
                        if propAttached then
                            TriggerEvent("b1g_props:client:RemoveItems", false)
                            propAttached = false
                        else
                            TriggerEvent('b1g_props:client:attach', 'imp_prop_impexp_radiator_02')
                            propAttached = true
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Du skal være på job!", "error")
            end
        end
    end
end)

--WINDOW TINT (TESTING)
RegisterNetEvent('qb-mechanicparts:WT0')
AddEventHandler('qb-mechanicparts:WT0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    tint = GetVehicleMod(vehicle, 46)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if tint ~= 0 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("Tint", "Removing Window Tint...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                SetVehicleWindowTint(vehicle, 0)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "windowtint0", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["windowtint0"], "remove")
                                QBCore.Functions.Notify("Stock Tint Successfully installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Stock Tint already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:WT1')
AddEventHandler('qb-mechanicparts:WT1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    tint = GetVehicleMod(vehicle, 46)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if tint ~= 1 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("Tint", "Installerer Window Tint...", 16500, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                SetVehicleWindowTint(vehicle, 1)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "windowtint1", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["windowtint1"], "remove")
                                QBCore.Functions.Notify("Stage 1 Tint Successfully installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Stage 1 Tint already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:WT2')
AddEventHandler('qb-mechanicparts:WT2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    tint = GetVehicleMod(vehicle, 46)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if tint ~= 2 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("Tint", "Installerer Window Tint...", 16500, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                SetVehicleWindowTint(vehicle, 2)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "windowtint2", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["windowtint2"], "remove")
                                QBCore.Functions.Notify("Stage 2 Tint Successfully installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Stage 2 Tint already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:WT3')
AddEventHandler('qb-mechanicparts:WT3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    tint = GetVehicleMod(vehicle, 46)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if tint ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("Tint", "Installerer Window Tint...", 16500, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                SetVehicleWindowTint(vehicle, 3)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "windowtint3", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["windowtint3"], "remove")
                                QBCore.Functions.Notify("Stage 3 Tint Successfully installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("Stage 3 Tint already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HLS')
AddEventHandler('qb-mechanicparts:HLS', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 255)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "stock", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["stock"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL0')
AddEventHandler('qb-mechanicparts:HL0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 0)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "white", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["white"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL1')
AddEventHandler('qb-mechanicparts:HL1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 1)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "blue", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["blue"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL2')
AddEventHandler('qb-mechanicparts:HL2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 2)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "electricblue", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["electricblue"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL3')
AddEventHandler('qb-mechanicparts:HL3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 3)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "mintgreen", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["mintgreen"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL4')
AddEventHandler('qb-mechanicparts:HL4', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 4)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "limegreen", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["limegreen"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL5')
AddEventHandler('qb-mechanicparts:HL5', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 5)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "yellow", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["yellow"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL6')
AddEventHandler('qb-mechanicparts:HL6', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 6)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "goldenshower", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["goldenshower"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL7')
AddEventHandler('qb-mechanicparts:HL7', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 7)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "orange", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["orange"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL8')
AddEventHandler('qb-mechanicparts:HL8', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 8)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "red", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["red"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL9')
AddEventHandler('qb-mechanicparts:HL9', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 9)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "ponypink", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["ponypink"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL10')
AddEventHandler('qb-mechanicparts:HL10', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 10)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "hotpink", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["hotpink"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL11')
AddEventHandler('qb-mechanicparts:HL11', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 11)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "purple", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["purple"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:HL12')
AddEventHandler('qb-mechanicparts:HL12', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    headlight = GetVehicleMod(vehicle, 22)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if headlight ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("headlight", "Installerer Headlights...", 15000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                ToggleVehicleMod(vehicle, 22, true) -- toggle xenon
                                SetVehicleHeadlightsColour(vehicle, 12)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "blacklight", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["blacklight"], "remove")
                                QBCore.Functions.Notify("Headlights installed", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("This colour is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:Spoiler0')
AddEventHandler('qb-mechanicparts:Spoiler0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    --     local trunkpos = false
    spoiler = GetVehicleMod(veh, 0)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if spoiler ~= -1 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                        -- 			    trunkpos = true
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            QBCore.Functions.Progressbar("spoiler", "Attaching Spoiler...", 10000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                SetVehicleMod(vehicle, 0, -1, true)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "spoiler0", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["spoiler0"], "remove")
                                QBCore.Functions.Notify("Spoiler successfully attached.", "success")
                            end)
                            -- 				if trunkpos then
                            -- 					SetVehicleDoorShut(vehicle, 5, false)
                            -- 				else
                            -- 					SetVehicleDoorShut(vehicle, 4, false)
                            -- 				end
                        end
                    end
                end
            else
                QBCore.Functions.Notify("That spoiler is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)
RegisterNetEvent('qb-mechanicparts:Spoiler1')
AddEventHandler('qb-mechanicparts:Spoiler1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    spoiler = GetVehicleMod(veh, 0)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if spoiler ~= 0 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("spoiler", "Attaching Spoiler...", 10000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                SetVehicleMod(vehicle, 0, 0, true)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "spoiler1", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["spoiler1"], "remove")
                                QBCore.Functions.Notify("Spoiler successfully attached.", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("That spoiler is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:Spoiler2')
AddEventHandler('qb-mechanicparts:Spoiler2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    spoiler = GetVehicleMod(veh, 0)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if spoiler ~= 1 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("spoiler", "Attaching Spoiler...", 10000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                SetVehicleMod(vehicle, 0, 1, true)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "spoiler2", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["spoiler2"], "remove")
                                QBCore.Functions.Notify("Spoiler successfully attached.", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("That spoiler is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:Spoiler3')
AddEventHandler('qb-mechanicparts:Spoiler3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    spoiler = GetVehicleMod(veh, 0)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if spoiler ~= 2 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("spoiler", "Attaching Spoiler...", 10000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                SetVehicleMod(vehicle, 0, 2, true)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "spoiler3", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["spoiler3"], "remove")
                                QBCore.Functions.Notify("Spoiler successfully attached.", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("That spoiler is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

RegisterNetEvent('qb-mechanicparts:Spoiler4')
AddEventHandler('qb-mechanicparts:Spoiler4', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    spoiler = GetVehicleMod(veh, 0)
    if PlayerJob.name == Config.Job then
        if PlayerJob.onduty then
            if spoiler ~= 3 then
                if vehicle ~= nil and vehicle ~= 0 then
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    else
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local vehpos = GetEntityCoords(vehicle)
                    if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                        local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                        end
                        if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then

                            QBCore.Functions.Progressbar("spoiler", "Attaching Spoiler...", 10000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_player",
                                flags = 9,
                            }, {}, {}, function()
                                -- Done
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleModKit(vehicle, 0)
                                SetVehicleMod(vehicle, 0, 3, true)
                                local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                saveVehicle()
                                TriggerServerEvent("QBCore:Server:RemoveItem", "spoiler4", 1)
                                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["spoiler4"], "remove")
                                QBCore.Functions.Notify("Spoiler successfully attached.", "success")

                            end)
                        end
                    end
                end
            else
                QBCore.Functions.Notify("That spoiler is already installed...", "error")
            end
        else
            QBCore.Functions.Notify("Du skal være på job!", "error")
        end
    else
        QBCore.Functions.Notify("You are not allowed to complete this action", "error")
    end
end)

-------------------------------------------------------
------QB MENU PARTS CRAFTING WITH RECIPES DETAILS------
-------------------------------------------------------

---------- CRAFTING MENU ----------
RegisterNetEvent('craft:mechanicparts', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Parts Menu",
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = "Engine Upgrades",
            txt = " View engine upgrades for vehicles ",
            params = {
                event = "craft:engines",
            }
        },
        {
            id = 3,
            header = "Brake Modifications",
            txt = " View brake modifications for vehicles ",
            params = {
                event = "craft:brakes",
            }
        },
        {
            id = 4,
            header = "Transmission Modifications",
            txt = " View transmission modifications for vehicles ",
            params = {
                event = "craft:transmissions",
            }
        },
        {
            id = 5,
            header = "Suspension Upgrades",
            txt = " View suspension upgrades for vehicles ",
            params = {
                event = "craft:suspensions",
            }
        },
        {
            id = 6,
            header = "Turbos",
            txt = " View turbo options for vehicles ",
            params = {
                event = "craft:turbos",
            }
        },
        {
            id = 7,
            header = "Tools & Equipment",
            txt = " View Ivans Customs shop tool options ",
            params = {
                event = "craft:repairkit1",
            }
        },
        {
            id = 8,
            header = "Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
    })
end)

---------- ENGINE MENU ----------
RegisterNetEvent('craft:engines', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Engine Modifications",
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = QBCore.Shared.Items["engine0"].label,
            txt = getItemsNeeded('engine0'),
            params = {
                event = "craft:engine0",
            }
        },
        {
            id = 3,
            header = QBCore.Shared.Items["engine1"].label,
            txt = getItemsNeeded('engine1'),
            params = {
                event = "craft:engine1",
            }
        },
        {
            id = 4,
            header = QBCore.Shared.Items["engine2"].label,
            txt = getItemsNeeded('engine2'),
            params = {
                event = "craft:engine2",
            }
        },
        {
            id = 5,
            header = QBCore.Shared.Items["engine3"].label,
            txt = getItemsNeeded('engine3'),
            params = {
                event = "craft:engine3",
            }
        },
        {
            id = 6,
            header = QBCore.Shared.Items["engine4"].label,
            txt = getItemsNeeded('engine4'),
            params = {
                event = "craft:engine4",
            }
        },
        {
            id = 7,
            header = "Main Menu",
            txt = "Back to main menu",
            params = {
                event = "craft:mechanicparts",
            }
        },
    })
end)

---------- BRAKES MENU ----------
RegisterNetEvent('craft:brakes', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Brake Modifications",
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = QBCore.Shared.Items["brake0"].label,
            txt = getItemsNeeded('brake0'),
            params = {
                event = "craft:brake0",
            }
        },
        {
            id = 3,
            header = QBCore.Shared.Items["brake1"].label,
            txt = getItemsNeeded('brake1'),
            params = {
                event = "craft:brake1",
            }
        },
        {
            id = 4,
            header = QBCore.Shared.Items["brake2"].label,
            txt = getItemsNeeded('brake2'),
            params = {
                event = "craft:brake2",
            }
        },
        {
            id = 5,
            header = QBCore.Shared.Items["brake3"].label,
            txt = getItemsNeeded('brake3'),
            params = {
                event = "craft:brake3",
            }
        },
        {
            id = 6,
            header = "Main Menu",
            txt = "Back to main menu",
            params = {
                event = "craft:mechanicparts",
            }
        },
    })
end)

---------- TRANSMISSION MENU ----------
RegisterNetEvent('craft:transmissions', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Transmission Modifications",
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = QBCore.Shared.Items["transmission0"].label,
            txt = getItemsNeeded('transmission0'),
            params = {
                event = "craft:transmission0",
            }
        },
        {
            id = 3,
            header = QBCore.Shared.Items["transmission1"].label,
            txt = getItemsNeeded('transmission1'),
            params = {
                event = "craft:transmission1",
            }
        },
        {
            id = 4,
            header = QBCore.Shared.Items["transmission2"].label,
            txt = getItemsNeeded('transmission2'),
            params = {
                event = "craft:transmission2",
            }
        },
        {
            id = 5,
            header = QBCore.Shared.Items["transmission3"].label,
            txt = getItemsNeeded('transmission3'),
            params = {
                event = "craft:transmission3",
            }
        },
        {
            id = 6,
            header = "Main Menu",
            txt = "Back to main menu",
            params = {
                event = "craft:mechanicparts",
            }
        },
    })
end)

---------- SUSPENSION MENU ----------
RegisterNetEvent('craft:suspensions', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Suspension Modifications",
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = QBCore.Shared.Items["suspension0"].label,
            txt = getItemsNeeded('suspension0'),
            params = {
                event = "craft:suspension0",
            }
        },
        {
            id = 3,
            header = QBCore.Shared.Items["suspension1"].label,
            txt = getItemsNeeded('suspension1'),
            params = {
                event = "craft:suspension1",
            }
        },
        {
            id = 4,
            header = QBCore.Shared.Items["suspension2"].label,
            txt = getItemsNeeded('suspension2'),
            params = {
                event = "craft:suspension2",
            }
        },
        {
            id = 5,
            header = QBCore.Shared.Items["suspension3"].label,
            txt = getItemsNeeded('suspension3'),
            params = {
                event = "craft:suspension3",
            }
        },
        {
            id = 6,
            header = QBCore.Shared.Items["suspension4"].label,
            txt = getItemsNeeded('suspension4'),
            params = {
                event = "craft:suspension4",
            }
        },
        {
            id = 7,
            header = "Main Menu",
            txt = "Back to main menu",
            params = {
                event = "craft:mechanicparts",
            }
        },
    })
end)

---------- TURBO MENU ----------
RegisterNetEvent('craft:turbos', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Turbos",
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = QBCore.Shared.Items["turbo0"].label,
            txt = getItemsNeeded('turbo0'),
            params = {
                event = "craft:turbo0",
            }
        },
        {
            id = 3,
            header = QBCore.Shared.Items["turbo1"].label,
            txt = getItemsNeeded('turbo1'),
            params = {
                event = "craft:turbo1",
            }
        },
        {
            id = 4,
            header = "Main Menu",
            txt = "Back to main menu",
            params = {
                event = "craft:mechanicparts",
            }
        },
    })
end)

---------- TOOLS MENU ----------

RegisterNetEvent('craft:repairkit1', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Tools & Equipment",
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = QBCore.Shared.Items["repairkit"].label,
            txt = getItemsNeeded('repairkit'),
            params = {
                event = "craft:repairkit",
            }
        },
        {
            id = 3,
            header = QBCore.Shared.Items["harness"].label,
            txt = getItemsNeeded('harness'),
            params = {
                event = "craft:harness",
            }
        },
        {
            id = 4,
            header = "Main Menu",
            txt = "Back to main menu",
            params = {
                event = "craft:mechanicparts",
            }
        },
    })
end)


-------------------------------------------------
------QB MENU MOD CHECKS AND VEHICLE HEALTH------
-------------------------------------------------

RegisterNetEvent('craft:vehmenu', function()
    local ped = PlayerPedId()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate = QBCore.Functions.GetPlate(vehicle)

    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Køretøj: " .. plate,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = "Køretøj Status",
            txt = "Tjek Køretøjets Helbred og Status",
            params = {
                event = "craft:vehstatus",
            }
        },
        {
            id = 3,
            header = "Køretøj Modifikationer",
            txt = "Tjek Køretøjets Modifikationer og Opgraderinger",
            params = {
                event = "craft:vehmods",
            }
        },
        {
            id = 4,
            header = "Luk Menu",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

-- VEHICLE MODS (DON'T MESS WITH THESE NUMBERS!)
RegisterNetEvent('craft:vehmods', function()
    local ped = PlayerPedId()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate = QBCore.Functions.GetPlate(vehicle)
    local statusList = exports['qb-mechanicjob']:GetVehicleStatusList(plate)
    local fuel = exports['LegacyFuel']:GetFuel(vehicle)
    local turbo = "Ingen Turbo"
    if IsToggleModOn(vehicle, 18) == 1 then
        turbo = "Turbo"
    end

    local engine = "Stock"
    local engineMod = GetVehicleMod(vehicle, 11)
    if engineMod > -1 then
        if engineMod == -1 then
            engine = "Stock"
        elseif engineMod == 0 then
            engine = "Stage 1 Opgradering"
        elseif engineMod == 1 then
            engine = "Stage 2 Opgradering"
        elseif engineMod == 2 then
            engine = "Stage 3 Opgradering"
        elseif engineMod == 3 then
            engine = "Stage 4 Opgradering"
        end
    end

    local brakes = "Stock"
    local brakesMod = GetVehicleMod(vehicle, 12)
    if brakesMod > -1 then
        if brakesMod == -1 then
            brakes = "Stock"
        elseif brakesMod == 0 then
            brakes = "Stage 1 Opgradering"
        elseif brakesMod == 1 then
            brakes = "Stage 2 Opgradering"
        elseif brakesMod == 2 then
            brakes = "Stage 3 Opgradering"
        end
    end

    local transmission = "Stock"
    local transMod = GetVehicleMod(vehicle, 13)
    if transMod > 0 then
        if transMod == -1 then
            transmission = "Stock"
        elseif transMod == 0 then
            transmission = "Stage 1 Opgradering"
        elseif transMod == 1 then
            transmission = "Stage 2 Opgradering"
        elseif transMod == 2 then
            transmission = "Stage 3 Opgradering"
        end
    end

    local suspension = "Stock"
    local susMod = GetVehicleMod(vehicle, 15)
    if susMod > -1 then
        if susMod == -1 then
            suspension = "Stock"
        elseif susMod == 0 then
            suspension = "Stage 1 Opgradering"
        elseif susMod == 1 then
            suspension = "Stage 2 Opgradering"
        elseif susMod == 2 then
            suspension = "Stage 3 Opgradering"
        elseif susMod == 3 then
            suspension = "Stage 4 Opgradering"
        end
    end

    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Køretøj: " .. plate,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 2,
            header = "Motor: " .. engine,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 3,
            header = "Transmission: " .. transmission,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 4,
            header = "Suspension: " .. suspension,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 5,
            header = "Bremser: " .. brakes,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 6,
            header = "Turbo: " .. turbo,
            txt = "",
            isMenuHeader = true
        },
        {
            id = 7,
            header = "< Tilbage",
            txt = "",
            params = {
                event = "craft:vehmenu",
            }
        },
    })
end)

-- VEHICLE HEALTH/STATUS
RegisterNetEvent('craft:vehstatus', function()

    local statusList = exports['qb-mechanicjob']:GetVehicleStatusList(plate)
    fuel = exports['LegacyFuel']:GetFuel(vehicle)
    vehicle = QBCore.Functions.GetClosestVehicle()
    plate = GetVehicleNumberPlateText(vehicle)
    engineHealth = GetVehicleEngineHealth(vehicle)
    vehTemp = GetVehicleEngineTemperature(vehicle)
    bodyHealth = GetVehicleBodyHealth(vehicle)
    fuelHealth = exports['LegacyFuel']:GetFuel(vehicle)
    tankHealth = GetVehiclePetrolTankHealth(vehicle)

    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Motor Helbred",
            txt = "Status: " .. math.ceil(engineHealth / 10) .. "% / 100.0%",
        },
        {
            id = 2,
            header = "Karosseri Tilstand",
            txt = "Status: " .. math.ceil(bodyHealth / 10) .. "% / 100.0%",
        },
        {
            id = 3,
            header = "Benzin Tank",
            txt = "Status: " .. math.ceil(fuelHealth) .. ".0% / 100.0%",
        },
        {
            id = 4,
            header = "Motor Temperatur",
            txt = "Status: " .. math.ceil(vehTemp) .. "° C",
        },

        {
            id = 5,
            header = "Luk Menu",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

function getItemsNeeded (part)
    local txt = ''
    for item, amount in pairs(Config.parts[part].costs) do
        txt = txt .. ' | ' .. amount .. 'x ' .. QBCore.Shared.Items[item].label
    end
    return string.sub(txt, 3)
end
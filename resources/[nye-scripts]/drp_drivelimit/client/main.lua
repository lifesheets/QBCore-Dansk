--[[
███╗░░░███╗░█████╗░░██████╗░███╗░░██╗██╗░░░██╗░██████╗░░░██╗░██╗░░░██╗██╗░█████╗░░░███╗░░███████╗
████╗░████║██╔══██╗██╔════╝░████╗░██║██║░░░██║██╔════╝██████████╗░██╔╝██║██╔══██╗░████║░░╚════██║
██╔████╔██║███████║██║░░██╗░██╔██╗██║██║░░░██║╚█████╗░╚═██╔═██╔═╝██╔╝░██║╚██████║██╔██║░░░░░░██╔╝
██║╚██╔╝██║██╔══██║██║░░╚██╗██║╚████║██║░░░██║░╚═══██╗██████████╗███████║░╚═══██║╚═╝██║░░░░░██╔╝░
██║░╚═╝░██║██║░░██║╚██████╔╝██║░╚███║╚██████╔╝██████╔╝╚██╔═██╔══╝╚════██║░█████╔╝███████╗░░██╔╝░░
╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚═════╝░╚═╝░░╚══╝░╚═════╝░╚═════╝░░╚═╝░╚═╝░░░░░░░░╚═╝░╚════╝░╚══════╝░░╚═╝░░░
]]--

local QBCore = exports['qb-core']:GetCoreObject()

local usingLimit = false

RegisterCommand('cc', function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(playerPed, false)
    local maxSpeed = GetVehicleHandlingFloat(veh,"CHandlingData","fInitialDriveMaxFlatVel")
    local fart = args[1]

    if IsPedInAnyVehicle(playerPed, false) then
        if GetPedInVehicleSeat(veh, -1) then
            if fart == '50' then
                SetVehicleMaxSpeed(veh, 13.488889)
                QBCore.Functions.Notify("Begrænsning sat til 50 km/t.", "success")
                QBCore.Functions.Notify("Fart Begrænser: Tryk X for at slå fra")
                usingLimit = true
            elseif fart == '80' then
                SetVehicleMaxSpeed(veh, 21.822222)
                QBCore.Functions.Notify("Begrænsning sat til 80 km/t.", "success")
                QBCore.Functions.Notify("Fart Begrænser: Tryk X for at slå fra")
                usingLimit = true
            elseif fart == '100' then
                SetVehicleMaxSpeed(veh, 27.377778)
                QBCore.Functions.Notify("Begrænsning sat til 100 km/t.", "success")
                QBCore.Functions.Notify("Fart Begrænser: Tryk X for at slå fra")
                usingLimit = true
            elseif fart == '130' then
                SetVehicleMaxSpeed(veh, 35.711111)
                QBCore.Functions.Notify("Begrænsning sat til 130 km/t.", "success")
                QBCore.Functions.Notify("Fart Begrænser: Tryk X for at slå fra")
                usingLimit = true
            elseif fart == nil and usingLimit then
                SetVehicleMaxSpeed(veh, maxSpeed)
                QBCore.Functions.Notify("Fart Begrænser: Slået fra!", "error")
                usingLimit = false
            elseif fart == nil then 
                QBCore.Functions.Notify("Fart Begrænser: Du kan vælge mellem 50, 80, 100 og 130 km/t", "error")
            else
                QBCore.Functions.Notify("Fart Begrænser: Du kan vælge mellem 50, 80, 100 og 130 km/t", "error")
            end
        else 
            QBCore.Functions.Notify("Du skal være på førersædet!", "error")
        end
    else
        QBCore.Functions.Notify("Du er ikke i et køretøj!", "error")
    end
    Citizen.Wait(1)

    while usingLimit == true do
        Citizen.Wait(1)
        if IsControlJustPressed(0, 105) then
            SetVehicleMaxSpeed(veh, maxSpeed)
            QBCore.Functions.Notify("Fart Begrænser: Slået fra!", "error")
            usingLimit = false
        end
    end
end)

-- Variables
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData() -- Just for resource restart (same as event handler)
local insideZones = {}

for name, shop in pairs(Config.Shops) do -- foreach shop
    insideZones[name] = false  -- default to not being in a shop
end

local testDriveVeh, inTestDrive = 0, false
local ClosestVehicle = 1
local zones = {}

function getShopInsideOf() 
    for name, shop in pairs(Config.Shops) do -- foreach shop
        if insideZones[name] then
            return name
        end
    end
    return nil
end

-- Handlers

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    local citizenid = PlayerData.citizenid
    local gameTime = GetGameTimer()
    TriggerServerEvent('qb-vehicleshop:server:addPlayer', citizenid, gameTime)
    TriggerServerEvent('qb-vehicleshop:server:checkFinance')
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    local citizenid = PlayerData.citizenid
    TriggerServerEvent('qb-vehicleshop:server:removePlayer', citizenid)
    PlayerData = {}
end)

-- Static Headers

local vehHeaderMenu = {
    {
        header = 'Køretøjsmuligheder',
        txt = 'Interager med køretøjer',
        icon = "fa-solid fa-car",
        params = {
            event = 'qb-vehicleshop:client:showVehOptions'
        }
    }
}

local financeMenu = {
    {
        header = 'Finansierede køretøjer',
        txt = 'Gennemse dine køretøjer',
        icon = "fa-solid fa-user-ninja",
        params = {
            event = 'qb-vehicleshop:client:getVehicles'
        }
    }
}

local returnTestDrive = {
    {
        header = 'Afslut prøvekørslen',
        icon = "fa-solid fa-flag-checkered",
        params = {
            event = 'qb-vehicleshop:client:TestDriveReturn'
        }
    }
}

-- Functions

local function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

local function comma_value(amount)
    local formatted = amount
    while true do
      formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
      if (k==0) then
        break
      end
    end
    return formatted
end

local function getVehName()
    return QBCore.Shared.Vehicles[Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle]["name"]
end

local function getVehPrice()
    return comma_value(QBCore.Shared.Vehicles[Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle]["price"])
end

local function getVehBrand()
    return QBCore.Shared.Vehicles[Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle]["brand"]
end

local function setClosestShowroomVehicle()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
    local closestShop = getShopInsideOf()
    for id, veh in pairs(Config.Shops[closestShop]["ShowroomVehicles"]) do
        local dist2 = #(pos - vector3(Config.Shops[closestShop]["ShowroomVehicles"][id].coords.x, Config.Shops[closestShop]["ShowroomVehicles"][id].coords.y, Config.Shops[closestShop]["ShowroomVehicles"][id].coords.z))
        if current ~= nil then
            if dist2 < dist then
                current = id
                dist = dist2
            end
        else
            dist = dist2
            current = id
        end
    end
    if current ~= ClosestVehicle then
        ClosestVehicle = current
    end
end

local function createTestDriveReturn()
    testDriveZone = BoxZone:Create(
        Config.Shops[getShopInsideOf()]["ReturnLocation"],
        3.0,
        5.0, {
        name="box_zone"
    })

    testDriveZone:onPlayerInOut(function(isPointInside)
        if isPointInside and IsPedInAnyVehicle(PlayerPedId()) then
			SetVehicleForwardSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 0)
            exports['qb-menu']:openMenu(returnTestDrive)
        else
            exports['qb-menu']:closeMenu()
        end
    end)
end

local function startTestDriveTimer(testDriveTime)
    local gameTimer = GetGameTimer()
    CreateThread(function()
        while inTestDrive do
            Wait(1)
            if GetGameTimer() < gameTimer+tonumber(1000*testDriveTime) then
                local secondsLeft = GetGameTimer() - gameTimer
                drawTxt('Testkørsel Tid: '..math.ceil(testDriveTime - secondsLeft/1000),4,0.5,0.93,0.50,255,255,255,180)
            end
        end
    end)
end

local function isInShop() 
    for shopName, isInside in pairs(insideZones) do
        if isInside then
            return true
        end
    end

    return false
end

local function createVehZones(shopName) -- This will create an entity zone if config is true that you can use to target and open the vehicle menu
    if not Config.UsingTarget then
        for i = 1, #Config.Shops[shopName]['ShowroomVehicles'] do
            zones[#zones+1] = BoxZone:Create(
                vector3(Config.Shops[shopName]['ShowroomVehicles'][i]['coords'].x,
                Config.Shops[shopName]['ShowroomVehicles'][i]['coords'].y,
                Config.Shops[shopName]['ShowroomVehicles'][i]['coords'].z),
                2.75,
                2.75, {
                name="box_zone",
                debugPoly=false,
            })
        end
        local combo = ComboZone:Create(zones, {name = "vehCombo", debugPoly = false})
        combo:onPlayerInOut(function(isPointInside)
            local insideShop = getShopInsideOf()
            if isPointInside then
                if PlayerData.job.name == Config.Shops[insideShop]['Job'] or Config.Shops[insideShop]['Job'] == 'none' then
                    exports['qb-menu']:showHeader(vehHeaderMenu)
                end
            else
                exports['qb-menu']:closeMenu()
            end
        end)
    else
        exports['qb-target']:AddGlobalVehicle({
            options = {
                {
                    type = "client",
                    event = "qb-vehicleshop:client:showVehOptions",
                    icon = "fas fa-car",
                    label = "Køretøj Interaktion",
                    canInteract = function(entity)
                        local closestShop = getShopInsideOf()
                        if (closestShop ~= nil) and (Config.Shops[closestShop]['Job'] == 'none' or PlayerData.job.name == Config.Shops[closestShop]['Job']) then
                            return true
                        end
                        return false
                    end
                },
            },
            distance = 2.0
        })
    end
end

-- Zones

function createFreeUseShop(shopShape, name)
    local zone = PolyZone:Create(shopShape, {  -- create the zone
        name= name,
        minZ = shopShape.minZ,
        maxZ = shopShape.maxZ
    })
    
    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            insideZones[name] = true
            CreateThread(function()
                while insideZones[name] do
                    setClosestShowroomVehicle()
                    vehicleMenu = {
                        {
                            isMenuHeader = true,
                            icon = "fa-solid fa-circle-info",
                            header = getVehBrand():upper().. ' '..getVehName():upper().. ' - ' ..getVehPrice().. ' DKK',
                        },
                        {
                            header = 'Prøvetur',
                            txt = 'Prøvkør det valgte køretøj',
                            icon = "fa-solid fa-car-on",
                            params = {
                                event = 'qb-vehicleshop:client:TestDrive',
                            }
                        },
                        {
                            header = "Køb Køretøj",
                            txt = 'Køb det valgte køretøj',
                            icon = "fa-solid fa-hand-holding-dollar",
                            params = {
                                isServer = true,
                                event = 'qb-vehicleshop:server:buyShowroomVehicle',
                                args = {
                                    buyVehicle = Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle
                                }
                            }
                        },
                        {
                            header = 'Finansier Køretøj',
                            txt = 'Finansier det valgte køretøj',
                            icon = "fa-solid fa-coins",
                            params = {
                                event = 'qb-vehicleshop:client:openFinance',
                                args = {
                                    price = getVehPrice(),
                                    buyVehicle = Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle
                                }
                            }
                        },
                        {
                            header = 'Skift Køretøj',
                            txt = 'Skift det valgte køretøj',
                            icon = "fa-solid fa-arrow-rotate-left",
                            params = {
                                event = 'qb-vehicleshop:client:vehCategories',
                            }
                        },
                    }
                    Wait(1000)
                end
            end)
        else
            insideZones[name] = false -- leave the shops zone
            ClosestVehicle = 1
        end
    end)
end

function createManagedShop(shopShape, name, jobName)
    local zone = PolyZone:Create(shopShape, {  -- create the zone
        name= name,
        minZ = shopShape.minZ,
        maxZ = shopShape.maxZ
    })
    
    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            insideZones[name] = true
            CreateThread(function()
                while insideZones[name] and PlayerData.job ~= nil and PlayerData.job.name == Config.Shops[name]['Job'] do
                    setClosestShowroomVehicle()
                    local closestShop = getShopInsideOf()
                    vehicleMenu = {
                        {
                            isMenuHeader = true,
                            icon = "fa-solid fa-circle-info",
                            header = getVehBrand():upper().. ' '..getVehName():upper().. ' - ' ..getVehPrice().. ' DKK',
                        },
                        {
                            header = 'Prøvetur',
                            txt = 'Tillad en spiller at prøvekøre',
                            icon = "fa-solid fa-user-plus",
                            params = {
                                event = 'qb-vehicleshop:client:openIdMenu',
                                args = {
                                    vehicle = Config.Shops[closestShop]["ShowroomVehicles"][ClosestVehicle].chosenVehicle,
                                    type = 'testDrive'
                                }
                            }
                        },
                        {
                            header = "Sælg Køretøj",
                            txt = 'Sælg Køretøj Til En Spiller',
                            icon = "fa-solid fa-cash-register",
                            params = {
                                event = 'qb-vehicleshop:client:openIdMenu',
                                args = {
                                    vehicle = Config.Shops[closestShop]["ShowroomVehicles"][ClosestVehicle].chosenVehicle,
                                    type = 'sellVehicle'
                                }
                            }
                        },
                        {
                            header = 'Finansier Køretøj',
                            txt = 'Finansier Køretøj Til En Spiller',
                            icon = "fa-solid fa-coins",
                            params = {
                                event = 'qb-vehicleshop:client:openCustomFinance',
                                args = {
                                    price = getVehPrice(),
                                    vehicle = Config.Shops[closestShop]["ShowroomVehicles"][ClosestVehicle].chosenVehicle
                                }
                            }
                        },
                        {
                            header = 'Skift Køretøj',
                            txt = 'Skift Det Valgte Køretøj',
                            icon = "fa-solid fa-arrow-rotate-left",
                            params = {
                                event = 'qb-vehicleshop:client:vehCategories',
                            }
                        },
                    }
                    Wait(1000)
                end
            end)
        else
            insideZones[name] = false -- leave the shops zone
            ClosestVehicle = 1
        end
    end)
end

for name, shop in pairs(Config.Shops) do 
    if shop['Type'] == 'free-use' then
        createFreeUseShop(shop['Zone']['Shape'], name)
    elseif shop['Type'] == 'managed' then
        createManagedShop(shop['Zone']['Shape'], name)
    end
end

-- Events

RegisterNetEvent('qb-vehicleshop:client:transferVehicle', function(buyerId, amount)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local plate = QBCore.Functions.GetPlate(vehicle)
    local tcoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(buyerId)))
    if #(GetEntityCoords(ped)-tcoords) < 5.0 then
        TriggerServerEvent('qb-vehicleshop:server:transferVehicle', plate, buyerId, amount)
    else
        QBCore.Functions.Notify('The person you are selling to is too far away.')
    end
end)

RegisterNetEvent('qb-vehicleshop:client:homeMenu', function()
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent('qb-vehicleshop:client:showVehOptions', function()
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent('qb-vehicleshop:client:TestDrive', function()
    if not inTestDrive and ClosestVehicle ~= 0 then
        inTestDrive = true
        local prevCoords = GetEntityCoords(PlayerPedId())
        QBCore.Functions.SpawnVehicle(Config.Shops[getShopInsideOf()]["ShowroomVehicles"][ClosestVehicle].chosenVehicle, function(veh)
            local closestShop = getShopInsideOf()
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            exports['LegacyFuel']:SetFuel(veh, 100)
            SetVehicleNumberPlateText(veh, 'TEST TUR')
            SetEntityAsMissionEntity(veh, true, true)
            SetEntityHeading(veh, Config.Shops[closestShop]["VehicleSpawn"].w)
            TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
            TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))
            testDriveVeh = veh
            QBCore.Functions.Notify('Du har '..Config.Shops[closestShop]["TestDriveTimeLimit"]..' minutter tilbage')
            SetTimeout(Config.Shops[closestShop]["TestDriveTimeLimit"] * 60000, function()
                if testDriveVeh ~= 0 then
                    testDriveVeh = 0
                    inTestDrive = false
                    QBCore.Functions.DeleteVehicle(veh)
                    SetEntityCoords(PlayerPedId(), prevCoords)
                    QBCore.Functions.Notify('Prøvetur er færdig')
                end
            end)
        end, Config.Shops[getShopInsideOf()]["VehicleSpawn"], false)
        createTestDriveReturn()
        startTestDriveTimer(Config.Shops[getShopInsideOf()]["TestDriveTimeLimit"] * 60)
    else
        QBCore.Functions.Notify('Allerede i prøvetur', 'error')
    end
end)

RegisterNetEvent('qb-vehicleshop:client:customTestDrive', function(data)
    if not inTestDrive then
        inTestDrive = true
        shopInsideOf = getShopInsideOf()
        local vehicle = data
        local prevCoords = GetEntityCoords(PlayerPedId())
        QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            local shopInsideOf = getShopInsideOf()
            exports['LegacyFuel']:SetFuel(veh, 100)
            SetVehicleNumberPlateText(veh, 'TEST TUR')
            SetEntityAsMissionEntity(veh, true, true)
            SetEntityHeading(veh, Config.Shops[shopInsideOf]["VehicleSpawn"].w)
            TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
            TriggerServerEvent('qb-vehicletuning:server:SaveVehicleProps', QBCore.Functions.GetVehicleProperties(veh))
            testDriveVeh = veh
            QBCore.Functions.Notify('Du har '..Config.Shops[shopInsideOf]["TestDriveTimeLimit"]..' minutter tilbage')
            SetTimeout(Config.Shops[shopInsideOf]["TestDriveTimeLimit"] * 60000, function()
                if testDriveVeh ~= 0 then
                    testDriveVeh = 0
                    inTestDrive = false
                    QBCore.Functions.DeleteVehicle(veh)
                    SetEntityCoords(PlayerPedId(), prevCoords)
                    QBCore.Functions.Notify('Prøvetur færdig')
                end
            end)
        end, Config.Shops[shopInsideOf]["VehicleSpawn"], false)
        createTestDriveReturn()
        startTestDriveTimer(Config.Shops[shopInsideOf]["TestDriveTimeLimit"] * 60)
    else
        QBCore.Functions.Notify('Allerede i prøvetur', 'error')
    end
end)

RegisterNetEvent('qb-vehicleshop:client:TestDriveReturn', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if veh == testDriveVeh then
        testDriveVeh = 0
        inTestDrive = false
        QBCore.Functions.DeleteVehicle(veh)
        exports['qb-menu']:closeMenu()
        testDriveZone:destroy()
    else
        QBCore.Functions.Notify('Dette er ikke dit prøvekøretøj', 'error')
    end
end)

RegisterNetEvent('qb-vehicleshop:client:vehCategories', function()
    local categoryMenu = {
        {
            header = '< Gå Tilbage',
            icon = "fa-solid fa-angle-left",
            params = {
                event = 'qb-vehicleshop:client:homeMenu'
            }
        }
    }
    for k,v in pairs(Config.Shops[getShopInsideOf()]['Categories']) do
        categoryMenu[#categoryMenu + 1] = {
            header = v,
            icon = "fa-solid fa-circle",
            params = {
                event = 'qb-vehicleshop:client:openVehCats',
                args = {
                    catName = k
                }
            }
        }
    end
    exports['qb-menu']:openMenu(categoryMenu)
end)

RegisterNetEvent('qb-vehicleshop:client:openVehCats', function(data)
    local vehicleMenu = {
        {
            header = '< Gå Tilbage',
            icon = "fa-solid fa-angle-left",
            params = {
                event = 'qb-vehicleshop:client:vehCategories'
            }
        }
    }
    for k,v in pairs(QBCore.Shared.Vehicles) do
        if QBCore.Shared.Vehicles[k]["category"] == data.catName and QBCore.Shared.Vehicles[k]["shop"] == getShopInsideOf() then
            vehicleMenu[#vehicleMenu + 1] = {
                header = v.name,
                txt = 'Pris: '..v.price..'DKK',
                icon = "fa-solid fa-car-side",
                params = {
                    isServer = true,
                    event = 'qb-vehicleshop:server:swapVehicle',
                    args = {
                        toVehicle = v.model,
                        ClosestVehicle = ClosestVehicle,
                        ClosestShop = getShopInsideOf()
                    }
                }
            }
        end
    end
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent('qb-vehicleshop:client:openFinance', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = getVehBrand():upper().. ' ' ..data.buyVehicle:upper().. ' - ' ..data.price.. ' DKK',
        submitText = "Bekræft",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'downPayment',
                text = 'Udbetalingsbeløb - Min ' ..Config.MinimumDown..'% af prisen'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'paymentAmount',
                text = 'Samlede Betalinger - Min '..Config.MaximumPayments
            }
        }
    })
    if dialog then
        if not dialog.downPayment or not dialog.paymentAmount then return end
        TriggerServerEvent('qb-vehicleshop:server:financeVehicle', dialog.downPayment, dialog.paymentAmount, data.buyVehicle)
    end
end)

RegisterNetEvent('qb-vehicleshop:client:openCustomFinance', function(data)
    TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
    local dialog = exports['qb-input']:ShowInput({
        header = getVehBrand():upper().. ' ' ..data.vehicle:upper().. ' - ' ..data.price.. ' DKK',
        submitText = "Bekræft",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'downPayment',
                text = 'Udbetalingsbeløb Min. 10% af pris'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'paymentAmount',
                text = 'Samlede Betalinger - Max '..Config.MaximumPayments
            },
            {
                text = "Spiller ID (#)",
                name = "playerid", 
                type = "number",
                isRequired = true
            }
        }
    })
    if dialog then
        if not dialog.downPayment or not dialog.paymentAmount or not dialog.playerid then return end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('qb-vehicleshop:server:sellfinanceVehicle', dialog.downPayment, dialog.paymentAmount, data.vehicle, dialog.playerid)
    end
end)

RegisterNetEvent('qb-vehicleshop:client:swapVehicle', function(data)
    local shopName = data.ClosestShop
    if Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].chosenVehicle ~= data.toVehicle then
        local closestVehicle, closestDistance = QBCore.Functions.GetClosestVehicle(vector3(Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.x, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.y, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.z))
        if closestVehicle == 0 then return end
        if closestDistance < 5 then QBCore.Functions.DeleteVehicle(closestVehicle) end
        Wait(50)
        local model = GetHashKey(data.toVehicle)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(50)
        end
        local veh = CreateVehicle(model, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.x, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.y, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.z, false, false)
        SetModelAsNoLongerNeeded(model)
        SetVehicleOnGroundProperly(veh)
        SetEntityInvincible(veh,true)
        SetEntityHeading(veh, Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].coords.w)
        SetVehicleDoorsLocked(veh, 3)
        FreezeEntityPosition(veh, true)
        SetVehicleNumberPlateText(veh, 'KØB MIG')
        Config.Shops[shopName]["ShowroomVehicles"][data.ClosestVehicle].chosenVehicle = data.toVehicle
    end
end)

RegisterNetEvent('qb-vehicleshop:client:buyShowroomVehicle', function(vehicle, plate)
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, Config.Shops[getShopInsideOf()]["VehicleSpawn"].w)
        SetEntityAsMissionEntity(veh, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(veh))
    end, Config.Shops[getShopInsideOf()]["VehicleSpawn"], true)
end)

RegisterNetEvent('qb-vehicleshop:client:getVehicles', function()
    QBCore.Functions.TriggerCallback('qb-vehicleshop:server:getVehicles', function(vehicles)
        local ownedVehicles = {}
        for k,v in pairs(vehicles) do
            if v.balance ~= 0 then
                local name = QBCore.Shared.Vehicles[v.vehicle]["name"]
                local plate = v.plate:upper()
                ownedVehicles[#ownedVehicles + 1] = {
                    header = ''..name..'',
                    txt = 'Plade: ' ..plate,
                    icon = "fa-solid fa-car-side",
                    params = {
                        event = 'qb-vehicleshop:client:getVehicleFinance',
                        args = {
                            vehiclePlate = plate,
                            balance = v.balance,
                            paymentsLeft = v.paymentsleft,
                            paymentAmount = v.paymentamount
                        }
                    }
                }
            end
        end
        exports['qb-menu']:openMenu(ownedVehicles)
    end)
end)

RegisterNetEvent('qb-vehicleshop:client:getVehicleFinance', function(data)
    local vehFinance = {
        {
            header = '< Gå Tilbage',
            params = {
                event = 'qb-vehicleshop:client:getVehicles'
            }
        },
        {
            isMenuHeader = true,
            icon = "fa-solid fa-sack-dollar",
            header = 'Samlet resterende saldo',
            txt = ''..comma_value(data.balance)..'DKK'
        },
        {
            isMenuHeader = true,
            icon = "fa-solid fa-hashtag",
            header = 'Samlede resterende betalinger',
            txt = ''..data.paymentsLeft..''
        },
        {
            isMenuHeader = true,
            icon = "fa-solid fa-sack-dollar",
            header = 'Tilbagevendende betalingsbeløb',
            txt = ''..comma_value(data.paymentAmount)..'DKK'
        },
        {
            header = 'Foretag en betaling',
            icon = "fa-solid fa-hand-holding-dollar",
            params = {
                event = 'qb-vehicleshop:client:financePayment',
                args = {
                    vehData = data,
                    paymentsLeft = data.paymentsleft,
                    paymentAmount = data.paymentamount
                }
            }
        },
        {
            header = 'Afbetal køretøj',
            icon = "fa-solid fa-hand-holding-dollar",
            params = {
                isServer = true,
                event = 'qb-vehicleshop:server:financePaymentFull',
                args = {
                    vehBalance = data.balance,
                    vehPlate = data.vehiclePlate
                }
            }
        },
    }
    exports['qb-menu']:openMenu(vehFinance)
end)

RegisterNetEvent('qb-vehicleshop:client:financePayment', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = 'Køretøjsbetaling',
        submitText = "Foretag betaling",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'paymentAmount',
                text = 'Betalingsbeløb (DKK)'
            }
        }
    })
    if dialog then
        if not dialog.paymentAmount then return end
        TriggerServerEvent('qb-vehicleshop:server:financePayment', dialog.paymentAmount, data.vehData)
    end
end)

RegisterNetEvent('qb-vehicleshop:client:openIdMenu', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = QBCore.Shared.Vehicles[data.vehicle]["name"],
        submitText = "Bekræft",
        inputs = {
            {
                text = "Spiller ID (#)",
                name = "playerid", 
                type = "number",
                isRequired = true
            }
        }
    })
    if dialog then
        if not dialog.playerid then return end
        if data.type == 'testDrive' then
            TriggerServerEvent('qb-vehicleshop:server:customTestDrive', data.vehicle, dialog.playerid)
        elseif data.type == 'sellVehicle' then
            TriggerServerEvent('qb-vehicleshop:server:sellShowroomVehicle', data.vehicle, dialog.playerid)
        end
    end
end)

-- Threads

CreateThread(function()
    for k,v in pairs(Config.Shops) do
        if v.showBlip then
	    local Dealer = AddBlipForCoord(Config.Shops[k]["Location"])
	    SetBlipSprite (Dealer, 326)
            SetBlipDisplay(Dealer, 4)
            SetBlipScale  (Dealer, 0.75)
	    SetBlipAsShortRange(Dealer, true)
	    SetBlipColour(Dealer, 3)
            BeginTextCommandSetBlipName("STRING")
	    AddTextComponentSubstringPlayerName(Config.Shops[k]["ShopLabel"])
	    EndTextCommandSetBlipName(Dealer)
	end
    end
end)

CreateThread(function()
    local financeZone = BoxZone:Create(Config.FinanceZone, 2.0, 2.0, {
        name="financeZone",
        offset={0.0, 0.0, 0.0},
        scale={1.0, 1.0, 1.0},
        debugPoly=false,
    })

    financeZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            exports['qb-menu']:showHeader(financeMenu)
        else
            exports['qb-menu']:closeMenu()
        end
    end)
end)

CreateThread(function()
    for k,v in pairs(Config.Shops) do
        for i = 1, #Config.Shops[k]['ShowroomVehicles'] do
            local model = GetHashKey(Config.Shops[k]["ShowroomVehicles"][i].defaultVehicle)
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(0)
            end
            local veh = CreateVehicle(model, Config.Shops[k]["ShowroomVehicles"][i].coords.x, Config.Shops[k]["ShowroomVehicles"][i].coords.y, Config.Shops[k]["ShowroomVehicles"][i].coords.z, false, false)
            SetModelAsNoLongerNeeded(model)
            SetEntityAsMissionEntity(veh, true, true)
            SetVehicleOnGroundProperly(veh)
            SetEntityInvincible(veh,true)
            SetVehicleDirtLevel(veh, 0.0)
            SetVehicleDoorsLocked(veh, 3)
            SetEntityHeading(veh, Config.Shops[k]["ShowroomVehicles"][i].coords.w)
            FreezeEntityPosition(veh,true)
            SetVehicleNumberPlateText(veh, 'KØB MIG')
        end
			
        createVehZones(k)
    end
end)

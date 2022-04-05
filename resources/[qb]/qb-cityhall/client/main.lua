local QBCore = exports['qb-core']:GetCoreObject()
local inCityhallPage = false
local qbCityhall = {}

qbCityhall.Open = function()
    SendNUIMessage({
        action = "open"
    })
    SetNuiFocus(true, true)
    inCityhallPage = true
end

qbCityhall.Close = function()
    SendNUIMessage({
        action = "close"
    })
    SetNuiFocus(false, false)
    inCityhallPage = false
end

DrawText3Ds = function(coords, text)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(coords.x, coords.y, coords.z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    inCityhallPage = false
end)

local inRange = false

CreateThread(function()
    CityhallBlip = AddBlipForCoord(Config.Cityhall.coords)
    SetBlipSprite (CityhallBlip, 487)
    SetBlipDisplay(CityhallBlip, 4)
    SetBlipScale  (CityhallBlip, 0.65)
    SetBlipAsShortRange(CityhallBlip, true)
    SetBlipColour(CityhallBlip, 0)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Rådhuset")
    EndTextCommandSetBlipName(CityhallBlip)
end)

local creatingCompany = false
local currentName = nil

CreateThread(function()
    while true do

        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        inRange = false

        local dist = #(pos - Config.Cityhall.coords)
        local dist2 = #(pos - Config.DrivingSchool.coords)

        if dist < 20 then
            inRange = true
            DrawMarker(2, Config.Cityhall.coords.x, Config.Cityhall.coords.y, Config.Cityhall.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 155, 152, 234, 155, false, false, false, true, false, false, false)
            if #(pos - vector3(Config.Cityhall.coords.x, Config.Cityhall.coords.y, Config.Cityhall.coords.z)) < 1.5 then
                DrawText3Ds(Config.Cityhall.coords, '~g~E~w~ - Rådhus menu')
                if IsControlJustPressed(0, 38) then
                    qbCityhall.Open()
                end
            end
        end

        if not inRange then
            Wait(1000)
        end

        Wait(2)
    end
end)

RegisterNetEvent('qb-cityhall:client:getIds', function()
    TriggerServerEvent('qb-cityhall:server:getIDs')
end)

RegisterNetEvent('qb-cityhall:client:sendDriverEmail', function(charinfo)
    SetTimeout(math.random(2500, 4000), function()
        local gender = "Hr"
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "Fru"
        end
        local charinfo = QBCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "Kommune",
            subject = "Anmodning om køretimer",
            message = "Hej " .. gender .. " " .. charinfo.lastname .. ",<br /><br />Vi har lige modtaget en besked om, at nogen vil tage køretimer<br />Hvis du er villig til at undervise, så kontakt os:<br />Navn: <strong>".. charinfo.firstname .. " " .. charinfo.lastname .. "</strong><br />Telefon Nummer: <strong>"..charinfo.phone.."</strong><br/><br/>Venlig hilsen,<br />DarkRP kommune",
            button = {}
        })
    end)
end)

local idTypes = {
    ["id_card"] = {
        label = "ID Kort",
        item = "id_card"
    },
    ["driver_license"] = {
        label = "Kørekort",
        item = "driver_license"
    },
    ["weaponlicense"] = {
        label = "Våben licens",
        item = "weaponlicense"
    }
}

RegisterNUICallback('requestId', function(data)
    if inRange then
        local idType = data.idType

        TriggerServerEvent('qb-cityhall:server:requestId', idTypes[idType])
        QBCore.Functions.Notify('Du har modtaget dit '..idTypes[idType].label..' for 50KR', 'success', 3500)
    else
        QBCore.Functions.Notify('This will not work', 'error')
    end
end)

RegisterNUICallback('requestLicenses', function(data, cb)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local licensesMeta = PlayerData.metadata["licences"]
    local availableLicenses = {}

    for type,_ in pairs(licensesMeta) do
        if licensesMeta[type] then
            local licenseType = nil
            local label = nil

            if type == "driver" then
                licenseType = "driver_license"
                label = "Kørekort"
            elseif type == "weapon" then
                licenseType = "weaponlicense"
                label = "Våben licens"
            end

            availableLicenses[#availableLicenses+1] = {
                idType = licenseType,
                label = label
            }
        end
    end
    cb(availableLicenses)
end)

RegisterNUICallback('applyJob', function(data)
    if inRange then
        TriggerServerEvent('qb-cityhall:server:ApplyJob', data.job)
    else
        QBCore.Functions.Notify('Virker desværre ikke ...', 'error')
    end
end)

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = QBCore.Functions.GetPlayerData().job
local shownBossMenu = false

-- UTIL
local function CloseMenuFull()
    exports['qb-menu']:closeMenu()
    shownBossMenu = false
end

local function DrawText3D(v, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(v, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 0)
    ClearDrawOrigin()
end

local function comma_value(amount)
    local formatted = amount
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('qb-bossmenu:client:OpenMenu', function()
    if not PlayerJob.name or not PlayerJob.isboss then return end

    local bossMenu = {
        {
            header = "Boss Menu - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
        },
        {
            header = "📋 Administrer Medarbejdere",
            txt = "Tjek din medarbejderliste",
            params = {
                event = "qb-bossmenu:client:employeelist",
            }
        },
        {
            header = "💛 Hyr Medarbejdere",
            txt = "Hyr Borgere i Nærheden",
            params = {
                event = "qb-bossmenu:client:HireMenu",
            }
        },
        {
            header = "🗄️ Lageradgang",
            txt = "Åben Lager",
            params = {
                event = "qb-bossmenu:client:Stash",
            }
        },
        {
            header = "🚪 Outfits",
            txt = "Se Gemte Outfits",
            params = {
                event = "qb-bossmenu:client:Wardrobe",
            }
        },
        {
            header = "💰 Pengestyring",
            txt = "Tjek din virksomhedsbalance",
            params = {
                event = "qb-bossmenu:client:SocietyMenu",
            }
        },
        {
            header = "Luk",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
    }
    exports['qb-menu']:openMenu(bossMenu)
end)

RegisterNetEvent('qb-bossmenu:client:employeelist', function()
    local EmployeesMenu = {
        {
            header = "Administrer Medarbejdere - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
        },
    }
    QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetEmployees', function(cb)
        for _, v in pairs(cb) do
            EmployeesMenu[#EmployeesMenu + 1] = {
                header = v.name,
                txt = v.grade.name,
                params = {
                    event = "qb-bossmenu:client:ManageEmployee",
                    args = {
                        player = v,
                        work = PlayerJob
                    }
                }
            }
        end
        EmployeesMenu[#EmployeesMenu + 1] = {
            header = "< Tilbage",
            params = {
                event = "qb-bossmenu:client:OpenMenu",
            }
        }
        exports['qb-menu']:openMenu(EmployeesMenu)
    end, PlayerJob.name)
end)

RegisterNetEvent('qb-bossmenu:client:ManageEmployee', function(data)
    local EmployeeMenu = {
        {
            header = "Administrer " .. data.player.name .. " - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
        },
    }
    for k, v in pairs(QBCore.Shared.Jobs[data.work.name].grades) do
        EmployeeMenu[#EmployeeMenu + 1] = {
            header = v.name,
            txt = "Grad: " .. k,
            params = {
                isServer = true,
                event = "qb-bossmenu:server:GradeUpdate",
                args = {
                    cid = data.player.empSource,
                    grado = tonumber(k),
                    nomegrado = v.name
                }
            }
        }
    end
    EmployeeMenu[#EmployeeMenu + 1] = {
        header = "Fyr Medarbejder",
        params = {
            isServer = true,
            event = "qb-bossmenu:server:FireEmployee",
            args = data.player.empSource
        }
    }
    EmployeeMenu[#EmployeeMenu + 1] = {
        header = "< Tilbage",
        params = {
            event = "qb-bossmenu:client:OpenMenu",
        }
    }
    exports['qb-menu']:openMenu(EmployeeMenu)
end)

RegisterNetEvent('qb-bossmenu:client:Stash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. PlayerJob.name, {
        maxweight = 4000000,
        slots = 25,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. PlayerJob.name)
end)

RegisterNetEvent('qb-bossmenu:client:Wardrobe', function()
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end)

RegisterNetEvent('qb-bossmenu:client:HireMenu', function()
    local HireMenu = {
        {
            header = "Hyr Medarbejder - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
        },
    }
    QBCore.Functions.TriggerCallback('qb-bossmenu:getplayers', function(players)
        for _, v in pairs(players) do
            if v and v ~= PlayerId() then
                HireMenu[#HireMenu + 1] = {
                    header = v.name,
                    txt = "Borger ID: " .. v.citizenid .. " - ID: " .. v.sourceplayer,
                    params = {
                        isServer = true,
                        event = "qb-bossmenu:server:HireEmployee",
                        args = v.sourceplayer
                    }
                }
            end
        end
        HireMenu[#HireMenu + 1] = {
            header = "< Tilbage",
            params = {
                event = "qb-bossmenu:client:OpenMenu",
            }
        }
        exports['qb-menu']:openMenu(HireMenu)
    end)
end)

RegisterNetEvent('qb-bossmenu:client:SocietyMenu', function()
    QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetAccount', function(cb)
        local SocietyMenu = {
            {
                header = "Balance: " .. comma_value(cb) .. " DKK - " .. string.upper(PlayerJob.label),
                isMenuHeader = true,
            },
            {
                header = "💸 Udbetal Penge",
                txt = "Udbetal Penge",
                params = {
                    event = "qb-bossmenu:client:SocetyDeposit",
                    args = comma_value(cb)
                }
            },
            {
                header = "💸 Hæv",
                txt = "Hæv penge fra konto",
                params = {
                    event = "qb-bossmenu:client:SocetyWithDraw",
                    args = comma_value(cb)
                }
            },
            {
                header = "< Return",
                params = {
                    event = "qb-bossmenu:client:OpenMenu",
                }
            },
        }
        exports['qb-menu']:openMenu(SocietyMenu)
    end, PlayerJob.name)
end)

RegisterNetEvent('qb-bossmenu:client:SocetyDeposit', function(money)
    local deposit = exports['qb-input']:ShowInput({
        header = "Indsæt Penge <br> Tilgængelig Balance: " .. money .. " DKK",
        submitText = "Bekræft",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Beløb'
            }
        }
    })
    if deposit then
        if not deposit.amount then return end
        TriggerServerEvent("qb-bossmenu:server:depositMoney", tonumber(deposit.amount))
    end
end)

RegisterNetEvent('qb-bossmenu:client:SocetyWithDraw', function(money)
    local withdraw = exports['qb-input']:ShowInput({
        header = "Hæv Penge <br> Tilgængelig Balance: " .. money .. " DKK",
        submitText = "Bekræft",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Beløb'
            }
        }
    })
    if withdraw then
        if not withdraw.amount then return end
        TriggerServerEvent("qb-bossmenu:server:withdrawMoney", tonumber(withdraw.amount))
    end
end)

-- MAIN THREAD
CreateThread(function()
    if Config.UseTarget then
        for key, data in pairs(Config.BossMenuZones) do
            exports['qb-target']:AddBoxZone(key.."-BossMenu", data.coords, data.length, data.width, {
                name = key.."-BossMenu",
                heading = data.heading,
                -- debugPoly = true,
                minZ = data.minZ,
                maxZ = data.maxZ,
            }, {
                options = {
                    {
                        type = "client",
                        event = "qb-bossmenu:client:OpenMenu",
                        icon = "fas fa-sign-in-alt",
                        label = "Boss Menu",
                        job = data.job,
                    },
                },
                distance = 2.5
            })
        end
    else
        while true do
            local wait = 2500
            local pos = GetEntityCoords(PlayerPedId())
            local inRangeBoss = false
            local nearBossmenu = false
            if PlayerJob then
                wait = 0
                for k, v in pairs(Config.BossMenus) do
                    if k == PlayerJob.name and PlayerJob.isboss then
                        if #(pos - v) < 5.0 then
                            inRangeBoss = true
                            if #(pos - v) <= 1.5 then
                                nearBossmenu = true
                                if not shownBossMenu then DrawText3D(v, "~b~E~w~ - Åbn Job Management") end
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-bossmenu:client:OpenMenu")
                                end
                            end
                            
                            if not nearBossmenu and shownBossMenu then
                                CloseMenuFull()
                                shownBossMenu = false
                            end
                        end
                    end
                end
                if not inRangeBoss then
                    Wait(1500)
                    if shownBossMenu then
                        CloseMenuFull()
                        shownBossMenu = false
                    end
                end
            end
            Wait(wait)
        end
    end
end)
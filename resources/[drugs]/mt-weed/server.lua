--[[

███╗░░░███╗░█████╗░░██████╗░███╗░░██╗██╗░░░██╗░██████╗░░░██╗░██╗░░░██╗██╗░█████╗░░░███╗░░███████╗
████╗░████║██╔══██╗██╔════╝░████╗░██║██║░░░██║██╔════╝██████████╗░██╔╝██║██╔══██╗░████║░░╚════██║
██╔████╔██║███████║██║░░██╗░██╔██╗██║██║░░░██║╚█████╗░╚═██╔═██╔═╝██╔╝░██║╚██████║██╔██║░░░░░░██╔╝
██║╚██╔╝██║██╔══██║██║░░╚██╗██║╚████║██║░░░██║░╚═══██╗██████████╗███████║░╚═══██║╚═╝██║░░░░░██╔╝░
██║░╚═╝░██║██║░░██║╚██████╔╝██║░╚███║╚██████╔╝██████╔╝╚██╔═██╔══╝╚════██║░█████╔╝███████╗░░██╔╝░░
╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚═════╝░╚═╝░░╚══╝░╚═════╝░╚═════╝░░╚═╝░╚═╝░░░░░░░░╚═╝░╚════╝░╚══════╝░░╚═╝░░░
                                            Magnus#4917
]]
local QBCore = exports['qb-core']:GetCoreObject()

-- Apanhar Plantas
RegisterServerEvent('mt-weed:server:Apanhar', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local quantity = math.random(1, 2)
	if (60 >= math.random(1, 100)) then
        if Player.Functions.AddItem("og_kush_weed", math.random(1,2)) then   
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["og_kush_weed"], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Dine lommer er fulde..', 'error')
        end		
	else
        TriggerClientEvent('QBCore:Notify', src, 'Du ødelagde planten..', 'error')
    end
end)

-- Cortar plantas de weed em sacos
RegisterServerEvent('mt-weed:server:CortarWeed', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
    local removeAmount = 10
    local returnAmount = math.random (20,30)
	local returnAmount2 = math.random (30,50)
    local baggieAmount = 30
	local baggieAmount2 = 50
    local packageTime = 7500
    if args == 1 then 
        local cocaine = Player.Functions.GetItemByName("og_kush_weed") 
        if cocaine ~= nil then
            if cocaine.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("empty_bag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("og_kush_weed", removeAmount)
						Player.Functions.RemoveItem("empty_bag", returnAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['og_kush_weed'], "remove", removeAmount)
						TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_bag'], "remove", returnAmount)
                        TriggerClientEvent('pogressBar:drawBar', src, packageTime, 'Skærer Cannabis..')
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('weedbaggy', returnAmount, nil, info, {["quality"] = 100}) then
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weedbaggy"], "add", returnAmount)
								TriggerClientEvent('QBCore:Notify', src, 'Du skar en cannabis plante!', 'success')
                                TriggerClientEvent('mt-weed:client:MenuCorte', src)
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'Dine lommer er fulde..', 'error')
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "Du skal have mindst 30 tomme poser.", 'error')
                        TriggerClientEvent('mt-weed:client:MenuCorte', src)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "Du skal have mindst 30 tomme poser..", "error")
                    TriggerClientEvent('mt-weed:client:MenuCorte', src)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "Du har ikke nok cannabis planter..", 'error')
                TriggerClientEvent('mt-weed:client:MenuCorte', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "Du har ikke en cannbis plante..", "error")
            TriggerClientEvent('mt-weed:client:MenuCorte', src)
        end
    end
end)

-- Usar kit de corte
QBCore.Functions.CreateUseableItem("drug_cuttingkit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local scaleCheck = Player.Functions.GetItemByName('drug_cuttingkit')
    if scaleCheck ~= nil then
        TriggerClientEvent('mt-weed:client:MenuCorte', source)
    else
        TriggerClientEvent('QBCore:Notify', source, "Du har ikke en vægt", 'error')
    end
end)

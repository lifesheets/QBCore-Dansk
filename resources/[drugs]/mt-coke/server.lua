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

-- Criar item usavel para spawn da mesa
QBCore.Functions.CreateUseableItem('coke_table', function(source, item)
    TriggerClientEvent('mt-coke:client:ColocarMesa', source)
end)

-- Evento de processo
RegisterNetEvent('mt-coke:server:ProcessarCoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local coke_leaf = Player.Functions.GetItemByName('coke_leaf')
    local empty_bag = Player.Functions.GetItemByName('empty_bag')
    if coke_leaf ~= nil and empty_bag ~= nil then

        if coke_leaf.amount >= 20 and empty_bag.amount >= 30 then
            Player.Functions.RemoveItem('coke_leaf', 10)
            Player.Functions.RemoveItem('empty_bag', 30)
            Player.Functions.AddItem('cokebaggy', 30)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cokebaggy'], "add")
            --QBCore.Functions.Notify('Cocaine processed!', 'success')
        else
            --QBCore.Functions.Notify('You do not have the rigth items!', 'error')
        end
    else
        --QBCore.Functions.Notify('you need atleast 30 Coke Empty Bags and 20 Coke Leafs!', 'error')
    end
end)

-- Apanhar coke
RegisterNetEvent('mt-coke:server:ApanharCoke', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('coke_leaf', 5)
end)
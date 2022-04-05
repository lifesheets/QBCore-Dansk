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
-- List of washers. The table key is the washerId.
local washers = {
    [1] = {washing = false, pickup = false, cleaned = 0},
    [2] = {washing = false, pickup = false, cleaned = 0},
    [3] = {washing = false, pickup = false, cleaned = 0},
    [4] = {washing = false, pickup = false, cleaned = 0},
}

-- Callback to check if the passed washerId is already washing.
QBCore.Functions.CreateCallback("laundry:isWashing", function(source, cb, washerId)
    cb(washers[washerId].washing)
end)

-- Callback check to see if the passed washerId is ready for collection/pickup.
QBCore.Functions.CreateCallback("laundry:isReady", function(source, cb, washerId)
    cb(washers[washerId].pickup)
end)

-- Start the washer if it is not already started.
RegisterServerEvent("laundry:startwasher", function(data)
    local src = source
    if not washers[data.id].washing then
        wash(data.id, src)
    else 
        TriggerClientEvent('QBCore:Notify', src, "Vaskemaskinen er allerede startet!", 'error')
    end
end)

-- Collect any waiting money from the washer.
RegisterServerEvent("laundry:collect", function(data)
    src = source
    local player = QBCore.Functions.GetPlayer(src)

    if washers[data.id].pickup then 
        if washers[data.id].cleaned > 0 then
            player.Functions.AddMoney("cash", washers[data.id].cleaned, "Penge Vasket")
            washers[data.id].cleaned = 0
            washers[data.id].pickup = false
            washers[data.id].washing = false
        else 
            TriggerClientEvent('QBCore:Notify', src, "Der er ingen rene penge at samle ind!", 'error')
            washers[data.id].cleaned = 0
            washers[data.id].pickup = false
            washers[data.id].washing = false
        end
    else 
        TriggerClientEvent('QBCore:Notify', src, "Denne vaskemaskine er i gang med at rense!", 'error')
    end
end)


-- Get the stash items for the passed washerId: This function was taken from qb-inventory and modifed.
function GetWasherItems(washerId)
	local items = {}
    local stash = 'washer'..washerId
	local result = MySQL.Sync.fetchAll("SELECT items FROM stashitems WHERE stash=?", { stash })
    Wait(500)
	if result[1] ~= nil then 
		if result[1].items ~= nil then
			result[1].items = json.decode(result[1].items)
			if result[1].items ~= nil then 
				for k, item in pairs(result[1].items) do
					local itemInfo = QBCore.Shared.Items[item.name:lower()]
					items[item.slot] = {
						name = itemInfo["name"],
						amount = tonumber(item.amount),
						info = item.info ~= nil and item.info or "",
						label = itemInfo["label"],
						description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
						weight = itemInfo["weight"], 
						type = itemInfo["type"], 
						unique = itemInfo["unique"], 
						useable = itemInfo["useable"], 
						image = itemInfo["image"],
						slot = item.slot,
					}
				end
			end
		end
	end
	return items
end


function wash(washerId, source)
    local stash = 'washer'..washerId
    local items = GetWasherItems(washerId)
    local cleaned = 0

    for item, data in pairs(items) do
        if data.name == "markedbills" then
            --cleaned = cleaned + (1000 * data.amount) -- This gives $1000 per bag.
            cleaned = cleaned + (data.info.worth * data.amount) -- This gives the worth amount per bag.
        end 
    end

    if cleaned > 0 then 
        washers[washerId].washing = true
        TriggerClientEvent('QBCore:Notify', source, "Vaskemaskinen er færdig om 5 minutter.", 'primary')

        cleaned = math.floor((cleaned * 0.8)+0.5) -- Returns 80%

        Wait(10 * 30000)
        print("[LAUNDRY]: CLEANED "..cleaned)
        washers[washerId].cleaned = cleaned
        washers[washerId].pickup = true

        MySQL.Sync.fetchAll("UPDATE stashitems SET items = '[]' WHERE stash = ?", { stash })
    else 
        TriggerClientEvent('QBCore:Notify', source, "Der er ikke noget at vaske!", 'error')
    end
end

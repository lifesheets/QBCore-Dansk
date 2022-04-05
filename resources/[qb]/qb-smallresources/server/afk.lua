local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
    local src = source
	DropPlayer(src, 'Du Er Blevet Kicket For At Være AFK')
end)

QBCore.Functions.CreateCallback('qb-afkkick:server:GetPermissions', function(source, cb)
    local src = source
    local group = QBCore.Functions.GetPermission(src)
    cb(group)
end)

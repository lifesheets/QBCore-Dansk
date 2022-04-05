local QBCore = exports['qb-core']:GetCoreObject()

--[[ COMMANDS ]]--

RegisterCommand('clear', function(source, args, rawCommand)
    TriggerClientEvent('chat:client:ClearChat', source)
end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
	local msg = rawCommand:sub(4)
	local name = GetPlayerName(source)
        TriggerClientEvent('chat:addMessage', -1, {
        template = '<div class="chat-message ooc"><b>OOC '..name..':</b> {0}</div>',
        args = { msg }
    })
end, false)


------------------------------------
------------------------------------
---- DONT TOUCH ANY OF THIS IF YOU DON'T KNOW WHAT YOU ARE DOING
---- THESE ARE **NOT** CONFIG VALUES, USE THE CONVARS IF YOU WANT TO CHANGE SOMETHING
----
----
---- If you are a developer and want to change something, consider writing a plugin instead:
---- https://easyadmin.readthedocs.io/en/latest/plugins/
----
------------------------------------
------------------------------------

-- Chat Reminder Code
function sendRandomReminder()
	reminderTime = GetConvarInt("ea_chatReminderTime", 0)
	if reminderTime ~= 0 and #ChatReminders > 0 then
		local reminder = ChatReminders[ math.random( #ChatReminders ) ] -- select random reminder from table
		local adminNames = ""
		local t = {}
		for i,_ in pairs(OnlineAdmins) do
			table.insert(t, getName(i))
		end
		for i,n in ipairs(t) do 
			if i == 1 then
				adminNames = n
			elseif i == #t then
				adminNames = adminNames.." "..n
			else
				adminNames = adminNames.." "..n..","
			end
		end
		t=nil
		
		if adminNames == "" then adminNames = "@admins" end -- if no admins are online just print @admins
		reminder = string.gsub(reminder, "@admins", adminNames)
		
		reminder = string.gsub(reminder, "@bancount", #blacklist)
		
		reminder = string.gsub(reminder, "@time", os.date("%X", os.time()))
		reminder = string.gsub(reminder, "@date", os.date("%x", os.time()))
		TriggerClientEvent("chat:addMessage", -1, { args = { "EasyAdmin", reminder } })
	end
end

Citizen.CreateThread(function()
	--Wait(10000)
	reminderTime = GetConvarInt("ea_chatReminderTime", 0)
	if reminderTime ~= 0 then
		while true do 
			Wait(reminderTime*60000)
			sendRandomReminder()
		end
	else
		while true do
			Wait(20000)
			sendRandomReminder() -- check for changes in the convar
		end
	end
end)

Citizen.CreateThread(function()
	backupInfos = LoadResourceFile(GetCurrentResourceName(), "backups/_backups.json")
	
	while true do 
		repeat
			Wait(5000)
		until blacklist
		if backupInfos == nil then 
			lastBackupTime = 0
		else
			backupData = json.decode(backupInfos)
			lastBackupTime = backupData.lastBackup
		end
		if (GetConvarInt("ea_backupFrequency", 72) ~= 0) and (lastBackupTime+(GetConvarInt("ea_backupFrequency", 72)*3600) < os.time()) then
			createBackup()
		end
		Wait(120000)
	end
end)


function loadBackupName(name)
	local backup = LoadResourceFile(GetCurrentResourceName(), "backups/"..name)
	if backup then
		local backupJson = json.decode(backup)
		if backupJson then
			PrintDebugMessage("Loading Backup..")
			for i,ban in pairs(blacklist) do
				UnbanId(ban.banid)
				PrintDebugMessage("removing ban "..ban.banid, 4)
				Wait(50)
			end
			
			for i,ban in pairs(backupJson) do
				addBan(ban)
				PrintDebugMessage("adding ban "..ban.banid, 4)
				TriggerEvent("ea_data:addBan", ban)
				Wait(50)
			end
			local saved = SaveResourceFile(GetCurrentResourceName(), "banlist.json", json.encode(blacklist, {indent = true}), -1)
			if not saved then
				PrintDebugMessage("^1Saving banlist.json failed! Please check if EasyAdmin has Permission to write in its own folder!^7", 1)
			end
			updateBlacklist()
			PrintDebugMessage("Backup should be loaded!")
		else
			PrintDebugMessage("^1EasyAdmin:^7 Backup Could not be loaded, in most cases this comes from there being a formatting error, please use a JSON Validator on the file and fix the errors!")
		end
		
	else
		PrintDebugMessage("^1EasyAdmin:^7 Backup Name Invalid or missing from Backups.")
	end
end


function createBackup()
	local backupTime = os.time()
	local backupDate = os.date("%H_%M_%d_%m_%Y")
	local backupName = "banlist_"..backupDate..".json"
	local resourceName = GetCurrentResourceName()
	PrintDebugMessage("Creating Banlist Backup to "..backupName, 3)
	
	local saved = SaveResourceFile(resourceName, "backups/"..backupName, json.encode(blacklist, {indent = true}), -1)
	
	if not saved then
		PrintDebugMessage("^1Saving banlist backup failed! Please check if EasyAdmin has Permission to write in the backups folder!^7", 1)
	end
	
	backupInfos = LoadResourceFile(resourceName, "backups/_backups.json")
	if backupInfos then
		backupData = json.decode(backupInfos)
		table.insert(backupData.backups, {id = getNewBackupid(backupData), backupFile = backupName, backupTimestamp = backupTime, backupDate = backupDate})
		
		
		if #backupData.backups > GetConvarInt("ea_maxBackupCount", 10) then
			deleteBackup(backupData,1)
		end
		backupData.lastBackup = backupTime
		SaveResourceFile(resourceName, "backups/_backups.json", json.encode(backupData, {indent = true}))
		
	else
		local backupData = {lastBackup = backupTime, backups = {}}
		table.insert(backupData.backups, {id = getNewBackupid(backupData), backupFile = backupName, backupTimestamp = backupTime, backupDate = backupDate})
		SaveResourceFile(resourceName, "backups/_backups.json", json.encode(backupData, {indent = true}))
	end
	
	return id,timestamp
end

function deleteBackup(backupData,id)
	local expiredBackup = backupData.backups[id]
	table.remove(backupData.backups, id)
	
	local backupFileName = expiredBackup.backupFile
	
	local fullResourcePath = GetResourcePath(GetCurrentResourceName())
	os.remove(fullResourcePath.."/backups/"..backupFileName)
	PrintDebugMessage("Removed Backup "..backupFileName, 3)
	
end

function getNewBackupid(backupData)
	if backupData then
		local lastBackup = backupData.lastbackup
		local backups = backupData.backups
		return #backups+1
	else
		return 0
	end
end


function getAllPlayerIdentifiers(playerId) --Gets all info that could identify a player
	local identifiers = GetPlayerIdentifiers(playerId)
	local tokens = {}
	if GetConvar("ea_useTokenIdentifiers", "true") == "true" then
		if not GetNumPlayerTokens or not GetPlayerToken then
			PrintDebugMessage("Server Version is below artifact 3335, disabling Token identifiers, please consider updating your FXServer!", 1)
			SetConvar("ea_useTokenIdentifiers", "false")
			PrintDebugMessage("Set ea_useTokenIdentifiers to false for this session.", 1)
			return identifiers
		end
		for i=0,GetNumPlayerTokens(playerId) do
			table.insert(tokens, GetPlayerToken(playerId, i))
		end
	end
	return mergeTables(identifiers, tokens)
end
exports('getAllPlayerIdentifiers', getAllPlayerIdentifiers)


function checkForChangedIdentifiers(playerIds, bannedIds)
	local unbannedIds = {}
	for _,playerId in pairs(playerIds) do
		local thisIdBanned = false
		for _,bannedId in pairs(bannedIds) do
			if playerId == bannedId then
				thisIdBanned = true
			end
		end
		if not thisIdBanned then --They have a new/changed identifier
			table.insert(unbannedIds, playerId)
		end
	end
	return unbannedIds
end


AddEventHandler('playerDropped', function (reason)
	if OnlineAdmins[source] then
		OnlineAdmins[source] = nil
	end
	if FrozenPlayers[source] then
		FrozenPlayers[source] = nil
		for i,_ in pairs(OnlineAdmins) do 
			TriggerLatentClientEvent("EasyAdmin:SetPlayerFrozen", i, 1000, source, nil)
		end
	end
	if MutedPlayers[source] then
		MutedPlayers[source] = nil
		for i,_ in pairs(OnlineAdmins) do 
			TriggerLatentClientEvent("EasyAdmin:SetPlayerMuted", i, 1000, source, nil)
		end
	end
	PrintDebugMessage(source.." disconnected.", 4)
end)


RegisterServerEvent("EasyAdmin:GetInfinityPlayerList", function()
	PrintDebugMessage(getName(source, true).." requested Playerlist.", 4)
	if IsPlayerAdmin(source) then
		local l = {}
		local players = GetPlayers()
		
		for i, player in pairs(players) do
			local player = tonumber(player)
			cachePlayer(player)
			for i, cached in pairs(CachedPlayers) do
				if (cached.id == player) then
					table.insert(l, {id = cached.id, name = cached.name, immune = cached.immune})
				end
			end
		end
		
		-- each player is more or less 2000bytes big.
		TriggerLatentClientEvent("EasyAdmin:GetInfinityPlayerList", source, 200000, l) 
	end
end)

function GetOnlineAdmins()
	return OnlineAdmins
end
exports('GetOnlineAdmins', GetOnlineAdmins)

function IsPlayerAdmin(pid)
	return OnlineAdmins[pid]
end
exports('IsPlayerAdmin', IsPlayerAdmin)


RegisterCommand("ea_addShortcut", function(source, args, rawCommand)
	if args[2] and DoesPlayerHavePermission(source, "server.shortcut.add") then
		local shortcut = args[1]
		local text = table.concat(args, " ", 2)
		
		PrintDebugMessage("added '"..shortcut.." -> "..text.."' as a shortcut", 3)
		MessageShortcuts[shortcut] = text
		
		for i,_ in pairs(OnlineAdmins) do 
			TriggerLatentClientEvent("EasyAdmin:fillShortcuts", i, 10000, MessageShortcuts)
		end
	end
end)

RegisterCommand("ea_addReminder", function(source, args, rawCommand)
	if args[1] and DoesPlayerHavePermission(source, "server.reminder.add") then
		local text = string.gsub(rawCommand, "ea_addReminder ", "")
		local text = string.gsub(text, '"', '')
		
		PrintDebugMessage("added '"..text.."' as a Chat Reminder", 3)
		table.insert(ChatReminders, text)
	end
end, false)

RegisterCommand("ea_createBackup", function(source, args, rawCommand)
	if DoesPlayerHavePermission(source, "server") then
		createBackup()
	end
end, false)

RegisterCommand("ea_loadBackup", function(source,args,rawCommand)
	if DoesPlayerHavePermission(source, "server") and args[1] then
		loadBackupName(args[1])
	end
end,false)

RegisterCommand("ea_printIdentifiers", function(source,args,rawCommand)
	if source == 0 and args[1] then -- only let Console run this command
		local id = tonumber(args[1])
		print(json.encode(CachedPlayers[id].identifiers)) -- puke all identifiers into console
	end
end,false)

Citizen.CreateThread(function()
	
	
	RegisterCommand("ea_generateSupportFile", function(source, args, rawCommand)
		if DoesPlayerHavePermission(source, "server") then
			print("Creating Support File....^7\n")
			
			local supportData = {}
			
			print("Collecting EasyAdmin Config....^7\n")
			
			local version,ismaster = GetVersion()
			supportData.config = {
				gamename = GetConvar("gamename", "not-rdr3"),
				version = version,
				ismaster = tostring(ismaster),
				ea_moderationNotification = GetConvar("ea_moderationNotification", "false"),
				ea_screenshoturl = GetConvar("ea_screenshoturl", 'https://wew.wtf/upload.php'),
				onesync = GetConvar("onesync", "off"),
				steam_webApiKey = GetConvar("steam_webApiKey", ""),
				ea_LanguageName = GetConvar("ea_LanguageName", "en"),
				ea_enableDebugging = GetConvar("ea_enableDebugging", "false"),
				ea_logLevel = GetConvar("ea_logLevel", 1),
				ea_minIdentifierMatches = GetConvarInt("ea_minIdentifierMatches", 2),
				ea_defaultKey = GetConvar("ea_defaultKey", "none"),
				ea_alwaysShowButtons = GetConvar("ea_alwaysShowButtons", "false"),
				ea_enableCallAdminCommand = GetConvar("ea_enableCallAdminCommand", "true"),
				ea_enableReportCommand = GetConvar("ea_enableReportCommand", "true"),
				ea_defaultMinReports = GetConvarInt("ea_defaultMinReports", 3),
				ea_MinReportPlayers = GetConvarInt("ea_MinReportPlayers", 12),
				ea_MinReportModifierEnabled = GetConvar("ea_MinReportModifierEnabled", "true"),
				ea_ReportBanTime = GetConvarInt("ea_ReportBanTime", 86400),
				ea_custombanlist = GetConvar("ea_custombanlist", "false"),
				ea_maxWarnings = GetConvarInt("ea_maxWarnings", 3),
				ea_warnAction = GetConvar("ea_warnAction", "kick"),
				ea_warningBanTime = GetConvarInt("ea_warningBanTime", 604800),
				ea_enableSplash = GetConvar("ea_enableSplash", "true"),
				ea_playerCacheExpiryTime = GetConvarInt("ea_playerCacheExpiryTime", 900),
				ea_chatReminderTime = GetConvarInt("ea_chatReminderTime", 0),
				ea_backupFrequency = GetConvarInt("ea_backupFrequency", 72),
				ea_maxBackupCount = GetConvarInt("ea_maxBackupCount", 10),
				ea_useTokenIdentifiers = GetConvar("ea_useTokenIdentifiers", "true"),
				ea_enableTelemetry = GetConvar("ea_enableTelemetry", "true"),
			}
			
			if supportData.config.steam_webApiKey ~= "" then
				supportData.config.steam_webApiKey = "CENSORED"
			end
			
			for i,v in pairs(supportData.config) do
				PrintDebugMessage(i.." = "..v, 4)
			end
			
			
			print("Collecting Server Config....^7\n")
			
			local path = GetResourcePath(GetCurrentResourceName())
			local occurance = string.find(path, "/resources", 1, true)
			local path = string.reverse(string.sub(string.reverse(path), -occurance))
			
			local blacklistedPhrases = {"mysql", "mariadb", "licensekey", "SentryIO", "mongodb", "tebex", "endpoint_add", "ac_webhook"}
			local servercfg = io.open(path.."server.cfg")
			if servercfg then
				supportData.serverconfig = "# Some lines may have been stripped for privacy, this is intentional. #\n # Generated by EasyAdmin "..GetVersion().." on "..formatDateString(os.time()).." #\n"
				line = servercfg:read("*line")
				while line do
					local addLine = true
					for i, blacklisted in pairs(blacklistedPhrases) do
						if string.find(string.lower(line), string.lower(blacklisted)) then
							addLine = false
						end
						if string.find(line, "ea_moderationNotification") then
							line = "set ea_moderationNotification 'CENSORED BY EASYADMIN'"
						elseif string.find(line, "steam_webApiKey") then 
							line = "steam_webApiKey 'CENSORED BY EASYADMIN'"
						elseif string.find(line, "ea_screenshoturl") then
							line = "ea_screenshoturl 'CENSORED BY EASYADMIN'"
						end
					end
					if addLine then
						supportData.serverconfig = supportData.serverconfig.."\n"..line
					else
						PrintDebugMessage("Skipped line "..line.." for privacy.", 4)
					end
					line = servercfg:read("*line")
				end
				servercfg:close()
			end
			
			local permissions = io.open(path.."easyadmin_permissions.cfg")
			if permissions then
				supportData.serverconfig = supportData.serverconfig.."\n#### The following are the contents of the easyadmin_permissions.cfg ####\n"..permissions:read("*a")
				permissions:close()
			end
			
			print("Collecting Banlist....^7\n")
			
			supportData.banlist = LoadResourceFile(GetCurrentResourceName(), "banlist.json")
			
			print("Collecting Players....^7\n")
			
			local players = {}
			for i, player in pairs(GetPlayers()) do
				players[player] = GetPlayerIdentifiers(player)
			end
			
			supportData.players = players
			
			print("Saving to support.json....^7\n")
			
			local saved = SaveResourceFile(GetCurrentResourceName(), "support.json", json.encode(supportData, {indent = true}), -1)
			
			if not saved then
				PrintDebugMessage("^1Saving support.json failed! Please check if EasyAdmin has Permission to write in its own folder!^7", 1)
			end
			
			
			print("Done! Please upload the support.json in "..GetResourcePath(GetCurrentResourceName()).." to the Discord!^7\n")
		end
	end, false)
	
end)

Citizen.CreateThread(function()
	
	if not CachedPlayers or GetVersion() == nil then
		print("^7--------------------------------------------------------------")
		print("^1EasyAdmin self-test failed! Your EasyAdmin **will not work**, likely you edited some files and broke EasyAdmin in the progress, please reinstall EasyAdmin.")
		print("^7--------------------------------------------------------------")
		return 
	end
	
	
	if GetConvar("gamename", "not-rdr3") == "rdr3" then 
		RedM = true
		PrintDebugMessage("Starting in rdr3 Mode.", 4)
	else
		RedM = false
		PrintDebugMessage("Starting in gta5 Mode.", 4)
	end
	

	local legacyFiles = {
		'__resource.lua',
		'version.json',
		'admin_server.lua',
		'admin_client.lua',
		'gui_c.lua',
		'util_shared.lua'
	}

	for i,file in pairs(legacyFiles) do
		local fileExists = LoadResourceFile(GetCurrentResourceName(), file)
		if fileExists then
			os.remove(GetResourcePath(GetCurrentResourceName()).."/"..file)
			PrintDebugMessage("Found legacy "..file.." file in EasyAdmin Folder and attempted deletion.", 2)
		end
	end
	
	AnonymousAdmins = {}
	
	local strfile = LoadResourceFile(GetCurrentResourceName(), "language/"..GetConvar("ea_LanguageName", "en")..".json")
	if strfile then
		strings = json.decode(strfile)[1]
	else
		strings = {language=GetConvar("ea_LanguageName", "en")}
	end
	
	
	moderationNotification = GetConvar("ea_moderationNotification", "false")
	reportNotification = GetConvar("ea_reportNotification", "false")
	detailNotification = GetConvar("ea_detailNotification", "false")
	minimumMatchingIdentifierCount = GetConvarInt("ea_minIdentifierMatches", 2)
	
	
	RegisterServerEvent('EasyAdmin:amiadmin', function()
		local source = source 
		
		cachePlayer(source) -- this will do nothing if player is already cached.
		
		if CachedPlayers[source].lastPermRequest and CachedPlayers[source].lastPermRequest+10 > os.time() then
			PrintDebugMessage(getName(source).." hit Permission Check Ratelimit! "..CachedPlayers[source].lastPermRequest+10-os.time().." seconds left.", 3)
			return
		end

		if GetConvar("ea_botToken", "") ~= "" then
			exports[GetCurrentResourceName()]:syncDiscordRoles(source)
		end
		CachedPlayers[source].lastPermRequest = os.time()
		
		local identifiers = getAllPlayerIdentifiers(source)
		local perms = {}
		for perm,val in pairs(permissions) do
			local thisPerm = DoesPlayerHavePermission(source, perm)
			if perm == "player.screenshot" and not screenshots then
				thisPerm = false
			end
			if string.find(perm, "server.permissions") and disablePermissionEditor then
				thisPerm = false
			end
			--if (perm == "teleport" or perm == "spectate") and infinity then
			--if (perm == "spectate") and infinity then
			--	thisPerm = false
			--end 
			if thisPerm == true then
				OnlineAdmins[source] = true 
			end
			perms[perm] = thisPerm
			PrintDebugMessage("Processed Perm "..perm.." for "..getName(source, true)..", result: "..tostring(thisPerm), 3)
		end
		
		TriggerLatentClientEvent("EasyAdmin:adminresponse", source, 10000, perms)
		
		if (DoesPlayerHavePermission(source, "player.ban.temporary") or DoesPlayerHavePermission(source, "player.ban.permanent")) then
			TriggerClientEvent('chat:addSuggestion', source, '/ban', GetLocalisedText("chatsuggestionban"), { {name='player id', help="the player's server id"}, {name='reason', help="your reason."} } )
		end
		if DoesPlayerHavePermission(source, "player.kick") then
			TriggerClientEvent('chat:addSuggestion', source, '/kick', GetLocalisedText("chatsuggestionkick"), { {name='player id', help="the player's server id"}, {name='reason', help="your reason."}} )
		end
		TriggerClientEvent('chat:addSuggestion', source, '/easyadmin', "EasyAdmin Menu")
		

		if RedM then
			-- give player the right settings to work with
			local key = GetConvar("ea_defaultKey", "none")
			
			TriggerClientEvent("EasyAdmin:SetSetting", source, "button", key)
		end
		
		if GetConvar("ea_alwaysShowButtons", "false") == "true" then
			TriggerClientEvent("EasyAdmin:SetSetting", source, "forceShowGUIButtons", true)
		else
			TriggerClientEvent("EasyAdmin:SetSetting", source, "forceShowGUIButtons", false)
		end
		if updateAvailable then
			TriggerClientEvent("EasyAdmin:SetSetting", source, "updateAvailable", updateAvailable)
		end
		
		-- if you remove this code then you're a killjoy, can't we have nice things? just once? it's not like this changes the whole admin menu or how it behaves, its a single subtitle.
		if os.date("%d/%m") == "22/08" then
			local age = tonumber(os.date("%Y"))-2017 local ordinal = "th" last_digit = age % 10 if last_digit == 1 and age ~= 11 then ordinal = 'st' elseif last_digit == 2 and age ~= 12 then ordinal = 'nd' elseif last_digit == 3 and age ~= 13 then ordinal = 'rd' end
			TriggerClientEvent("EasyAdmin:SetSetting", source, "alternativeTitle", "~b~Today is EasyAdmin's "..age..""..ordinal.." birthday! :)")
		elseif os.date("%m") == "06" and (tonumber(os.date("%d")) >= 1 and tonumber(os.date("%d")) <= 7)  then
			TriggerClientEvent("EasyAdmin:SetSetting", source, "alternativeLogo", "pride")
		end
		
		
		if (infinity) then 
			TriggerClientEvent("EasyAdmin:SetSetting", source, "infinity", true)
		end
		
		TriggerLatentClientEvent("EasyAdmin:fillShortcuts", source, 10000, MessageShortcuts)
		
		TriggerLatentClientEvent("EasyAdmin:SetLanguage", source, 10000, strings)
		
	end)
	
	RegisterServerEvent("EasyAdmin:kickPlayer", function(playerId,reason)
		if DoesPlayerHavePermission(source, "player.kick") and not CachedPlayers[playerId].immune then
			reason = formatShortcuts(reason)
			SendWebhookMessage(moderationNotification,string.format(GetLocalisedText("adminkickedplayer"), getName(source, false, true), getName(playerId, true, true), reason), "kick", 16711680)
			PrintDebugMessage("Kicking Player "..getName(source, true).." for "..reason, 3)
			DropPlayer(playerId, string.format(GetLocalisedText("kicked"), getName(source), reason) )
		elseif CachedPlayers[playerId].immune then
			TriggerClientEvent('QBCore:Notify', source, GetLocalisedText("adminimmune"))
		end
	end)
	
	RegisterServerEvent("EasyAdmin:requestSpectate", function(playerId)
		if DoesPlayerHavePermission(source, "player.spectate") then
			PrintDebugMessage("Player "..getName(source,true).." Requested Spectate to "..getName(playerId,true), 3)
			local tgtCoords = GetEntityCoords(GetPlayerPed(playerId))
			TriggerClientEvent("EasyAdmin:requestSpectate", source, playerId, tgtCoords)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText('spectatedplayer'), getName(source, false, true), getName(playerId, true, true)), "spectate", 16777214)
		end
	end)
	
	function cleanupArea(type)
		if (onesync ~= "off" and onesync ~= "legacy") then
			if type == "cars" then
				local toDelete = GetAllVehicles()
				PrintDebugMessage("server-known vehicles: "..table_to_string(toDelete), 4)
				for _,veh in pairs(toDelete) do
					PrintDebugMessage("starting deletion for veh "..veh, 4)
					if DoesEntityExist(veh) and not IsPedAPlayer(GetPedInVehicleSeat(veh, -1)) then
						PrintDebugMessage("deleting veh "..veh, 3)
						DeleteEntity(veh)
					end
				end
			elseif type == "peds" then
				local toDelete = GetAllPeds()
				PrintDebugMessage("server-known peds: "..table_to_string(toDelete), 4)
				for _,ped in pairs(toDelete) do
					PrintDebugMessage("starting deletion for ped "..ped, 4)
					if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
						PrintDebugMessage("deleting ped "..ped, 3)
						DeleteEntity(ped)
					end
				end
			elseif type == "props" then
				local toDelete = GetAllObjects()
				PrintDebugMessage("server-known props: "..table_to_string(toDelete), 4)
				for _,object in pairs(toDelete) do
					PrintDebugMessage("starting deletion for object "..object, 4)
					if DoesEntityExist(object) then
						PrintDebugMessage("deleting object "..object, 3)
						DeleteEntity(object)
					end
				end
			end
			return true
		else
			return false
		end
	end
	exports('cleanupArea', cleanupArea)


	RegisterServerEvent("EasyAdmin:requestCleanup", function(type)
		if DoesPlayerHavePermission(source, "server.cleanup."..type) then
			PrintDebugMessage("Player "..getName(source,true).." Requested Cleanup for "..type, 3)
			cleanupArea(type)
			
			
			TriggerClientEvent("EasyAdmin:requestCleanup", source, type)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText('admincleanedup'), getName(source, false, true), type), "cleanup", 16777214)
		end
	end)
	
	RegisterServerEvent("EasyAdmin:SetGameType", function(text)
		if DoesPlayerHavePermission(source, "server.convars") then
			PrintDebugMessage("Player "..getName(source,true).." set Gametype to "..text, 3)
			SetGameType(text)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText('adminchangedconvar'), getName(source, false, true), "gametype", text), "settings", 16777214)
		end
	end)
	
	RegisterServerEvent("EasyAdmin:SetMapName", function(text)
		if DoesPlayerHavePermission(source, "server.convars") then
			PrintDebugMessage("Player "..getName(source,true).." set Map Name to "..text, 3)
			SetMapName(text)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText('adminchangedconvar'), getName(source, false, true), "mapname", text), "settings", 16777214)
		end
	end)
	
	RegisterServerEvent("EasyAdmin:StartResource", function(text)
		if DoesPlayerHavePermission(source, "server.resources.start") then
			PrintDebugMessage("Player "..getName(source,true).." started Resource "..text, 3)
			StartResource(text)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText('adminstartedresource'), getName(source, false, true), text), "settings", 65280)
		end
	end)
	
	RegisterServerEvent("EasyAdmin:StopResource", function(text)
		if DoesPlayerHavePermission(source, "server.resources.stop") then
			PrintDebugMessage("Player "..getName(source,true).." stopped Resource "..text, 3)
			StopResource(text)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText('adminstoppedresource'), getName(source, false, true), text), "settings", 16711680)
		end
	end)
	
	RegisterServerEvent("EasyAdmin:SetConvar", function(convarname, convarvalue)
		if DoesPlayerHavePermission(source, "server.convars") then
			PrintDebugMessage("Player "..getName(source,true).." set convar "..convarname.. " to "..convarvalue, 3)
			SetConvar(convarname, convarvalue)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText('adminchangedconvar'), getName(source, false, true), convarname, convarvalue), "settings", 16777214)
		end
	end)
	
	
	------------------------------ COMMANDS

	RegisterCommand("spectate", function(source, args, rawCommand)
		if(source == 0) then
			Citizen.Trace(GetLocalisedText("badidea")) -- Maybe should be it's own string saying something like "only players can do this" or something
		end
		
		PrintDebugMessage("Player "..getName(source,true).." Requested Spectate on "..getName(args[1],true), 3)
		
		if args[1] and tonumber(args[1]) and DoesPlayerHavePermission(source, "player.spectate") then
			if getName(args[1]) then
				TriggerClientEvent("EasyAdmin:requestSpectate", source, args[1])
			else
				TriggerClientEvent('QBCore:Notify', source, GetLocalisedText("playernotfound"))
			end
		end
	end, false)
	
	RegisterCommand("teleport", function(source, args, rawCommand)
		if args[1] and DoesPlayerHavePermission(source, "player.teleport.single") then
			PrintDebugMessage("Player Requested Teleport something", 3)
			-- not yet
		end
	end, false)
	
	RegisterCommand("setgametype", function(source, args, rawCommand)
		if args[1] and DoesPlayerHavePermission(source, "server.convars") then
			PrintDebugMessage("Player "..getName(source,true).." set Gametype to "..args[1], 3)
			SetGameType(args[1])
		end
	end, false)
	
	RegisterCommand("setmapname", function(source, args, rawCommand)
		if args[1] and DoesPlayerHavePermission(source, "server.convars") then
			PrintDebugMessage("Player "..getName(source,true).." set Map Name to "..args[1], 3)
			SetMapName(args[1])
		end
	end, false)
	
	RegisterCommand("slap", function(source, args, rawCommand)
		if args[1] and args[2] and DoesPlayerHavePermission(source, "player.slap") then
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText("adminslappedplayer"), getName(source, false, true), getName(args[1], true, true), args[2]), "slap", 16711680)
			PrintDebugMessage("Player "..getName(source,true).." slapped "..getName(args[1],true).." for "..args[2].." HP", 3)
			TriggerClientEvent("EasyAdmin:SlapPlayer", args[1], args[2])
		end
	end, false)	
	
	
	--- Commands for Normal Users

	RegisterServerEvent("EasyAdmin:TeleportPlayerToCoords", function(playerId,tgtCoords)
		if DoesPlayerHavePermission(source, "player.teleport.single") then
			PrintDebugMessage("Player "..getName(source,true).." requsted teleport to "..tgtCoords.x..", "..tgtCoords.y..", "..tgtCoords.z, 3)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			local playerName = getName(playerId, true, true)
			if playerId == -1 then
				playerName = GetLocalisedText("allplayers")
			end
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText("teleportedtoplayer"), playerName, getName(source, false, true)), "teleport", 16777214)
			TriggerClientEvent("EasyAdmin:TeleportRequest", playerId, false, tgtCoords)
		end
	end)
	
	RegisterServerEvent("EasyAdmin:TeleportAdminToPlayer", function(id)
		if not CachedPlayers[id].dropped and DoesPlayerHavePermission(source, "player.teleport.single") then
			local tgtPed = GetPlayerPed(id)
			local tgtCoords = GetEntityCoords(tgtPed)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText("teleportedtoplayer"), getName(source, false, true), getName(id, true, true)), "teleport", 16777214)
			TriggerClientEvent('EasyAdmin:TeleportRequest', source, id,tgtCoords)
		else
			print('EASYADMIN FAILED TO TELEPORT'..source..' TO ID: '..id)
		end
	end)
	
	RegisterServerEvent("EasyAdmin:TeleportPlayerBack", function(id)
		if not CachedPlayers[id].dropped and DoesPlayerHavePermission(source, "player.teleport.single") then
			TriggerClientEvent('EasyAdmin:TeleportPlayerBack', id)
		end
	end)

	function slapPlayer(playerId,slapAmount)
		if not CachedPlayers[playerId].immune then
			TriggerClientEvent("EasyAdmin:SlapPlayer", playerId, slapAmount)
			return true
		else
			return false
		end
	end
	exports('slapPlayer', slapPlayer)
	
	RegisterServerEvent("EasyAdmin:SlapPlayer", function(playerId,slapAmount)
		if DoesPlayerHavePermission(source, "player.slap") and slapPlayer(playerId, slapAmount) then
			PrintDebugMessage("Player "..getName(source,true).." slapped "..getName(playerId,true).." for "..slapAmount.." HP", 3)
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText("adminslappedplayer"), getName(source, false, true), getName(playerId, true, true), slapAmount), "slap", 16777214)
		elseif CachedPlayers[playerId].immune then
			TriggerClientEvent('QBCore:Notify', source, GetLocalisedText("adminimmune"))
		end
	end)
	

	function freezePlayer(playerId, toggle)
		if not toggle then toggle = not FrozenPlayers[playerId] end
		if not CachedPlayers[playerId].immune then
			FrozenPlayers[playerId] = (toggle == true or nil)
			TriggerClientEvent("EasyAdmin:FreezePlayer", playerId, toggle)
			for i,_ in pairs(OnlineAdmins) do 
				TriggerLatentClientEvent("EasyAdmin:SetPlayerFrozen", i, 1000, playerId, (toggle == true or nil))
			end
			return true
		else
			return false
		end
	end
	exports('freezePlayer', freezePlayer)

	RegisterServerEvent("EasyAdmin:FreezePlayer", function(playerId,toggle)
		if DoesPlayerHavePermission(source, "player.freeze") and not CachedPlayers[playerId].immune then
			local preferredWebhook = detailNotification ~= "false" and detailNotification or moderationNotification
			freezePlayer(playerId, toggle)
			if toggle then
				SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText("adminfrozeplayer"), getName(source, false, true), getName(playerId, true, true)), "freeze", 16777214)
				PrintDebugMessage("Player "..getName(source,true).." froze "..getName(playerId,true), 3)
			else
				SendWebhookMessage(preferredWebhook,string.format(GetLocalisedText("adminunfrozeplayer"), getName(source, false, true), getName(playerId, true, true)), "freeze", 16777214)
				PrintDebugMessage("Player "..getName(source,true).." unfroze "..getName(playerId,true), 3)
			end
		elseif CachedPlayers[playerId].immune then
			TriggerClientEvent('QBCore:Notify', source, GetLocalisedText("adminimmune"))
		end
	end)
	
	RegisterServerEvent("EasyAdmin:TakeScreenshot", function(playerId)
		if scrinprogress then
			TriggerClientEvent('QBCore:Notify', source, GetLocalisedText("screenshotinprogress"))
			return
		end
		local src=source
		local playerId = playerId
		local invokingResource
		if GetInvokingResource() and GetInvokingResource() ~= GetCurrentResourceName() then
			invokingResource = "`"..GetInvokingResource().."`"
		end
		
		if DoesPlayerHavePermission(source, "player.screenshot") then
			scrinprogress = true
			thistemporaryevent = RegisterServerEvent("EasyAdmin:TookScreenshot", function(result)
				if result == "ERROR" then return false end
				
				res = matchURL(tostring(result)) 
				
				PrintDebugMessage("Screenshot taken, result:\n "..res, 4)
				SendWebhookMessage(moderationNotification, string.format(GetLocalisedText("admintookscreenshot"), invokingResource or getName(src), getName(playerId, true, true), res), "screenshot", 16777214, "Screenshot Captured", res)
				TriggerClientEvent('chat:addMessage', src, { template = '<img src="{0}" style="max-width: 400px;" />', args = { res } })
				TriggerClientEvent("chat:addMessage", src, { args = { "EasyAdmin", string.format(GetLocalisedText("screenshotlink"), res) } })
				PrintDebugMessage("Screenshot for Player "..getName(playerId,true).." done, "..res.." requsted by"..getName(src,true), 3)
				scrinprogress = false
				RemoveEventHandler(thistemporaryevent)
			end)
			
			TriggerClientEvent("EasyAdmin:CaptureScreenshot", playerId)
			local timeoutwait = 0
			repeat
				timeoutwait=timeoutwait+1
				Wait(5000)
				if timeoutwait == 5 then
					RemoveEventHandler(thistemporaryevent)
					scrinprogress = false -- cancel screenshot, seems like it failed
					PrintDebugMessage("Screenshot timed out", 4)
					TriggerClientEvent('QBCore:Notify', src, "Screenshot Failed!")
				end
			until not scrinprogress
		end
	end)
	
	RegisterServerEvent("EasyAdmin:mutePlayer", function(playerId)
		local src = source
		if DoesPlayerHavePermission(src,"player.mute") and not CachedPlayers[playerId].immune then
			local muted = mutePlayer(playerId, not MutedPlayers[playerId])

			if muted then
				if MutedPlayers[playerId] then
					TriggerClientEvent('QBCore:Notify', src, getName(playerId) .. " " .. GetLocalisedText("playermuted"))
					SendWebhookMessage(moderationNotification,string.format(GetLocalisedText("adminmutedplayer"), getName(source, false, true), getName(playerId, false, true)), "mute", 16777214)
				else
					TriggerClientEvent('QBCore:Notify', src, getName(playerId) .. " " .. GetLocalisedText("playerunmuted"))
					SendWebhookMessage(moderationNotification,string.format(GetLocalisedText("adminunmutedplayer"), getName(source, false, false), getName(playerId, false, true)), "mute", 16777214)
				end
			else
				-- todo: handle false retval
			end
		end
	end)

	function mutePlayer(playerId, toggle)
		if not CachedPlayers[playerId].immune then 
			if toggle and not MutedPlayers[playerId] then
				MutedPlayers[playerId] = true
				if MumbleSetPlayerMuted then -- workaround for outdated servers
					MumbleSetPlayerMuted(playerId, true)
				end
				PrintDebugMessage("muted "..getName(playerId,true), 3)
				for i,_ in pairs(OnlineAdmins) do 
					TriggerLatentClientEvent("EasyAdmin:SetPlayerMuted", i, 1000, playerId, (MutedPlayers[playerId] == true or nil))
				end
				return true
			elseif not toggle and MutedPlayers[playerId] then
				MutedPlayers[playerId] = nil
				if MumbleSetPlayerMuted then -- workaround for outdated servers
					MumbleSetPlayerMuted(playerId, false)
				end
				PrintDebugMessage("unmuted "..getName(playerId,true), 3)
				for i,_ in pairs(OnlineAdmins) do 
					TriggerLatentClientEvent("EasyAdmin:SetPlayerMuted", i, 1000, playerId, (MutedPlayers[playerId] == true or nil))
				end
				return true
			else 
				return false
			end
		else
			return false
		end
	end
	exports('mutePlayer', mutePlayer)
	
	RegisterServerEvent("EasyAdmin:SetAnonymous", function(playerId)
		if DoesPlayerHavePermission(source, "anon") then
			if AnonymousAdmins[source] then
				AnonymousAdmins[source] = nil
				PrintDebugMessage("Player "..getName(source,true).." un-anoned themself", 3)
			else
				AnonymousAdmins[source] = true
				PrintDebugMessage("Player "..getName(source,true).." anoned themself", 3)
			end
		end
	end)
	
	---------------------------------- PERMISSION EDITOR	
	local add_aces = {}
	local add_principals = {}
	function readAcePermissions()
		Citizen.CreateThread(function()
			add_aces, add_principals, execs = FindInfosinFile("server.cfg")
			for i, config in pairs(execs) do
				local tempaces, tempprincipals, _ = FindInfosinFile(config)
				add_aces = mergeTables(add_aces, tempaces)
				add_principals = mergeTables(add_principals, tempprincipals)
			end
		end)
	end
	
	function FindInfosinFile(filename)
		local path = GetResourcePath(GetCurrentResourceName())
		local occurance = string.find(path, "/resources", 1, true)
		local path = string.reverse(string.sub(string.reverse(path), -occurance))
		
		local filename = filename
		
		local lines = {}
		local needsExec = true
		local needsResourcePerms = true
		
		if filename == "server.cfg" then 
			needsResourcePerms = false
		elseif filename == "easyadmin_permissions.cfg" then
			needsExec = false
		else
			needsResourcePerms, needsExec = false, false
		end
		local changes = false
		local aces, principals, execs = {}, {}, {}
		
		PrintDebugMessage("reading "..filename, 4)
		
		local file = io.open(filename, "r")
		if file then
			line = file:read("*line")
			while line do
				table.insert(lines,line)
				line = file:read("*line")
			end
			file:close()
			
			for i, line in pairs(lines) do 
				if filename == "server.cfg" then
					needsResourcePerms = false
					if string.find(line, "exec easyadmin_permissions.cfg", 1, true) then
						needsExec = false
					end
				elseif filename == "easyadmin_permissions.cfg" then
					needsExec = false
					if string.find(line, "add_ace resource."..GetCurrentResourceName().." command.add_ace allow", 1, true) then
						needsResourcePerms = false
					end
				else
					local broken = false
					-- remove broken lines
					if string.find(line, "exec easyadmin_permissions.cfg", 1, true) then
						RemoveFromFile(filename, "exec easyadmin_permissions.cfg")
					elseif string.find(line, "add_ace resource."..GetCurrentResourceName().." command.", 1, true) then
						RemoveFromFile(filename, line)
					end 
				end
				local oldline = line
				line = string.gsub(line, "	", " ") -- convert tabs to spaces
				line = string.gsub(line, "  ", " ") -- and then multiple spaces to a single space
				if not (string.sub(line, 1, 1) == "#" or string.sub(line, 2, 2) == "#") then -- we dont want comments
					if string.sub(line, 1, 7) == "add_ace" then -- make sure the first few characters match the command we are looking for
						line = (string.split(line, "#")[1] or line) -- in case there are comments AFTER our commands, strip them out
						line = string.sub(line, 9, 999) -- strip add_ace, we dont need it
						local t = {file = filename, oldline = oldline} -- prepare our list of permissions
						if #(string.split(line, " ")) >= 3 then -- skip invalid/broken lines
							for i,word in pairs(string.split(line, " ")) do
								if i>3 then break end -- we dont count past 3
								table.insert(t,word) -- insert individual "part" of the command
							end
							table.insert(aces,t)
						end
					elseif string.sub(line, 1, 13) == "add_principal" then
						line = (string.split(line, "#")[1] or line)
						line = string.sub(line, 15, 999) -- strip add_principal, we dont need it
						local t = {file = filename, oldline = oldline}
						if #(string.split(line, " ")) >= 2 then -- skip invalid/broken lines
							for i,word in pairs(string.split(line, " ")) do
								if i>2 then break end
								table.insert(t,word)
							end
							table.insert(principals,t)
						end
					elseif string.sub(line, 1, 4) == "exec" then
						line = (string.split(line, "#")[1] or line)
						line = string.sub(line, 6, 999) -- strip exec, we dont need it
						if line ~= "server.cfg" then
							table.insert(execs, line)
						end
					end
				end
			end
			
			if needsExec or needsResourcePerms or changes then
				local newLines = {}
				if needsExec then
					table.insert(newLines, "exec easyadmin_permissions.cfg")
					table.insert(execs, "easyadmin_permissions.cfg")
					PrintDebugMessage("Did not find `exec easyadmin_permissions.cfg`, added it automatically", 4)
					changes=true
				end
				if needsResourcePerms then
					table.insert(newLines, "# This file was generated automatically by EasyAdmin #")
					table.insert(newLines, "add_ace resource."..GetCurrentResourceName().." command.add_ace allow")
					table.insert(newLines, "add_ace resource."..GetCurrentResourceName().." command.remove_ace allow")
					table.insert(newLines, "add_ace resource."..GetCurrentResourceName().." command.add_principal allow")
					table.insert(newLines, "add_ace resource."..GetCurrentResourceName().." command.remove_principal allow")
					PrintDebugMessage("Did not find `add_ace resource."..GetCurrentResourceName().."` lines, added them automatically", 4)
					changes=true
				end
				local output = "\n"
				if changes then
					local file = io.open(filename, "a+") -- reopen in write mode
					for i, line in pairs(newLines) do
						output=output..line.."\n"
					end
					file:write(output) -- write our lines
					file:close()
				end
			end
			
			for i,ace in pairs(aces) do 
				PrintDebugMessage("parsed ace ^1"
				..tostring(ace[1]).." "
				..tostring(ace[2]).." "
				..tostring(ace[3]).."^7 in "
				..filename.."\n", 4)
			end
			
			for i,ace in pairs(principals) do 
				PrintDebugMessage("parsed principal ^1"
				..tostring(ace[1]).." "
				..tostring(ace[2]).."^7 in "
				..filename.."\n", 4)
			end
			
			for i,ace in pairs(execs) do 
				PrintDebugMessage("parsed exec ^1"
				..tostring(ace).."^7 in "
				..filename.."\n", 4)
			end
			
			return aces, principals, execs
		else 
			if filename == "easyadmin_permissions.cfg" then
				local file = io.open(filename, "w")
				local newLines = {}
				table.insert(newLines, "add_ace resource."..GetCurrentResourceName().." command.add_ace allow")
				table.insert(newLines, "add_ace resource."..GetCurrentResourceName().." command.remove_ace allow")
				table.insert(newLines, "add_ace resource."..GetCurrentResourceName().." command.add_principal allow")
				table.insert(newLines, "add_ace resource."..GetCurrentResourceName().." command.remove_principal allow")
				local output = ""
				for i, line in pairs(newLines) do
					output=output..line.."\n"
				end
				file:write(output) -- write our lines
				file:close()
			end
			PrintDebugMessage(filename.." cannot be read, bailing.", 4)
			return {}, {}, {}
		end
	end
	
	Citizen.CreateThread(function()
		lockedFiles = {}
		function AddToFile(filename, args)
			if not GetInvokingResource() or GetInvokingResource() == GetCurrentResourceName() then -- sorry, but i _really_ dont want other resources hooking into easyadmins file edit functions.

				local path = GetResourcePath(GetCurrentResourceName())
				local occurance = string.find(path, "/resources", 1, true)
				local path = string.reverse(string.sub(string.reverse(path), -occurance))
				
				
				local args = args
				local filename = filename
				while lockedFiles[filename] do
					Wait(100)
				end
				lockedFiles[filename] = true
				
				
				local file = io.open(filename, "a")
				if file then
					file:write("\n"..args) -- write our lines
					file:close()
				else 
					PrintDebugMessage(filename.." cannot be read, bailing.", 4)
					return {}, {}, {}
				end
				Wait(500) -- without waiting after saving a file it sometimes does not properly save, some OS limitation maybe?
				lockedFiles[filename] = false
			end
		end
		exports('AddToFile', AddToFile)
		
		function RemoveFromFile(filename, args)
			if not GetInvokingResource() or GetInvokingResource() == GetCurrentResourceName() then -- sorry, but i _really_ dont want other resources hooking into easyadmins file edit functions.

				local path = GetResourcePath(GetCurrentResourceName())
				local occurance = string.find(path, "/resources", 1, true)
				local path = string.reverse(string.sub(string.reverse(path), -occurance))
				
				local args = args
				local filename = filename
				while lockedFiles[filename] do
					Wait(100)
				end
				lockedFiles[filename] = true
				
				local file = io.open(filename, "r")
				local lines = {}
				if file then
					local line = file:read("*line")
					while line do
						if line == args or (filename == "easyadmin_permissions.cfg" and line == "") then -- skip lines we dont want, incl. empty lines
						else
							table.insert(lines, line)
						end
						line = file:read("*line")
					end
					file:close()
					local output = ""
					for i, line in pairs(lines) do
						output=output..line.."\n"
					end
					local file = io.open(filename, "w")
					file:write(output) -- write our lines
					file:close()
				else 
					PrintDebugMessage(filename.." cannot be read, bailing.", 4)
					return {}, {}, {}
				end
				Wait(500) -- without waiting after saving a file it sometimes does not properly save, some OS limitation maybe?
				lockedFiles[filename] = false
			end
		end
		exports('RemoveFromFile', RemoveFromFile)
	end)
	
	RegisterServerEvent("EasyAdmin:getServerAces", function()
		if DoesPlayerHavePermission(source, "server.permissions.read") then
			TriggerLatentClientEvent("EasyAdmin:getServerAces", source, 100000, add_aces, add_principals)
		end
	end)
	
	RegisterServerEvent("EasyAdmin:setServerAces", function(aces,principals)
		if DoesPlayerHavePermission(source, "server.permissions.write") then
			local source=source
			local aces=aces
			local principals=principals
			-- reconfigure aces
			for i, ace in pairs(add_aces) do
				
				if not aces[i] then
					if not ace.file then ace.file = "easyadmin_permissions.cfg" end
					
					ExecuteCommand("remove_ace "..ace[1].." "..ace[2].." "..ace[3])
					RemoveFromFile(ace.file, ace.oldline or "add_ace "..ace[1].." "..ace[2].." "..ace[3])
					
					
					PrintDebugMessage("Executed remove_ace "..ace[1].." "..ace[2].." "..ace[3], 4)
				elseif aces[i][1] ~= ace[1] or aces[i][2] ~= ace[2] or aces[i][3] ~= ace[3] then
					if not ace.file then ace.file = "easyadmin_permissions.cfg" end
					if not aces[i].file then aces[i].file = "easyadmin_permissions.cfg" end
					ExecuteCommand("remove_ace "..ace[1].." "..ace[2].." "..ace[3])
					RemoveFromFile(ace.file, ace.oldline or "add_ace "..ace[1].." "..ace[2].." "..ace[3])
					
					ExecuteCommand("add_ace "..aces[i][1].." "..aces[i][2].." "..aces[i][3])
					AddToFile(aces[i].file, "add_ace "..aces[i][1].." "..aces[i][2].." "..aces[i][3])
					
					
					PrintDebugMessage("Executed remove_ace "..ace[1].." "..ace[2].." "..ace[3], 4)
					PrintDebugMessage("Executed add_ace "..aces[i][1].." "..aces[i][2].." "..aces[i][3], 4)
				end
			end
			for i, ace in pairs(aces) do
				if not add_aces[i] then
					if not ace.file then ace.file = "easyadmin_permissions.cfg" end
					
					ExecuteCommand("add_ace "..ace[1].." "..ace[2].." "..ace[3])
					AddToFile(ace.file, "add_ace "..ace[1].." "..ace[2].." "..ace[3])
					
					PrintDebugMessage("Executed add_ace "..ace[1].." "..ace[2].." "..ace[3], 4)
				end
			end
			-- reconfigure principals
			for i, principal in pairs(add_principals) do
				
				-- set file as our permissions file in case its unset
				
				if not principals[i] then
					if not principal.file then principal.file = "easyadmin_permissions.cfg" end
					
					ExecuteCommand("remove_principal "..principal[1].." "..principal[2])
					RemoveFromFile(principal.file, principal.oldline or "add_principal "..principal[1].." "..principal[2])
					
					PrintDebugMessage("Executed remove_principal "..principal[1].." "..principal[2], 4)
				elseif principals[i][1] ~= principal[1] or principals[i][2] ~= principal[2] then
					if not principal.file then principal.file = "easyadmin_permissions.cfg" end
					if not principals[i].file then principals[i].file = "easyadmin_permissions.cfg" end
					
					ExecuteCommand("remove_principal "..principal[1].." "..principal[2])
					RemoveFromFile(principal.file, principal.oldline or "add_principal "..principal[1].." "..principal[2])
					
					
					ExecuteCommand("add_principal "..principals[i][1].." "..principals[i][2])
					AddToFile(principals[i].file, "add_principal "..principals[i][1].." "..principals[i][2])
					
					PrintDebugMessage("Executed remove_principal "..principal[1].." "..principal[2], 4)
					PrintDebugMessage("Executed add_principal "..principals[i][1].." "..principals[i][2], 4)
				end
			end
			for i, principal in pairs(principals) do
				if not add_principals[i] then
					if not principal.file then principal.file = "easyadmin_permissions.cfg" end
					ExecuteCommand("add_principal "..principal[1].." "..principal[2])
					AddToFile(principal.file, "add_principal "..principal[1].." "..principal[2])
					
					PrintDebugMessage("Executed add_principal "..principal[1].." "..principal[2], 4)
				end
			end
			
			
			add_aces = aces
			add_principals = principals
			SendWebhookMessage(moderationNotification,string.format(GetLocalisedText("admineditedpermissions"), getName(source, false, true)), "permissions", 16777214)
			TriggerLatentClientEvent("EasyAdmin:getServerAces", source, 100000, add_aces, add_principals)
		end
	end)

	
	-- Very basic function that turns "source" into a useable player name.
	function getName(src,anonymousdisabled,identifierenabled)
		local identifierPref = GetConvar("ea_logIdentifier", "steam")
		if identifierPref == "false" then identifierenabled = false end;
		local identifiers, identifier = {}, "~No Identifier~"
		if (src == 0 or src == "") then
			return "Console"
		else
			if AnonymousAdmins[src] and not anonymousdisabled then
				return GetLocalisedText("anonymous")
			elseif CachedPlayers[src] and CachedPlayers[src].name then
				if CachedPlayers[src].identifiers then
					identifiers = CachedPlayers[src].identifiers
					for i = 1, #identifiers do
						if identifiers[i]:match(identifierPref) then
							identifier = identifiers[i]
						end
					end
				end
				if identifierenabled then
					return (string.format("%s [ %s ]", CachedPlayers[src].name, identifier))
				else
					return CachedPlayers[src].name
				end
			elseif (GetPlayerName(src)) then
				identifiers = getAllPlayerIdentifiers(src)
				for i = 1, #identifiers do
					if identifiers[i]:match(identifierPref) then
						identifier = identifiers[i]
					end
				end
				if identifierPref == "discord" and identifier ~= "~No Identifier~" then
					identifier = string.gsub(identifier, "discord:", "")
					identifier = "<@"..identifier..">"
				end
				if identifierenabled then
					return (string.format("%s [ %s ]", GetPlayerName(src), identifier))
				else
					return GetPlayerName(src)
				end
			else
				return "Unknown - " .. src
			end
		end
	end
	exports('getName', getName)
	
	RegisterServerEvent("EasyAdmin:warnPlayer", function(id, reason)
		local src = source
		if DoesPlayerHavePermission(src,"player.warn") and not CachedPlayers[id].immune then
			reason = formatShortcuts(reason)
			local maxWarnings = GetConvarInt("ea_maxWarnings", 3)
			if not WarnedPlayers[id] then
				WarnedPlayers[id] = {name = getName(id, true), identifiers = getAllPlayerIdentifiers(id), warns = 0}
			end
			WarnedPlayers[id].warns = WarnedPlayers[id].warns+1
			TriggerClientEvent('chat:addMessage', id, { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(253, 53, 53, 0.6); border-radius: 5px;"><i class="fas fa-user-crown"></i> {0} </div>',
				args = {  string.format(GetLocalisedText("warned"), reason, WarnedPlayers[id].warns, maxWarnings) }, color = { 255, 255, 255 } 
			})
			TriggerClientEvent("txAdminClient:warn", id, getName(src), string.format(GetLocalisedText("warned"), reason, WarnedPlayers[id].warns, maxWarnings), GetLocalisedText("warnedtitle"), GetLocalisedText("warnedby"),GetLocalisedText("warndismiss"))
			SendWebhookMessage(moderationNotification,string.format(GetLocalisedText("adminwarnedplayer"), getName(src, false, true), getName(id, true, true), reason, WarnedPlayers[id].warns, maxWarnings), "warn", 16711680)
			if WarnedPlayers[id].warns >= maxWarnings then
				if GetConvar("ea_warnAction", "kick") == "kick" then
					SendWebhookMessage(moderationNotification,string.format(GetLocalisedText("adminkickedplayer"), getName(src, false, true), getName(id, true, true), reason), "kick", 16711680)
					DropPlayer(id, GetLocalisedText("warnkicked"))
					WarnedPlayers[id] = nil
				elseif GetConvar("ea_warnAction", "kick") == "ban" then
					local bannedIdentifiers = CachedPlayers[id].identifiers or getAllPlayerIdentifiers(id)
					local bannedUsername = CachedPlayers[id].name or getName(id, true)
					local expires = os.time()+GetConvarInt("ea_warningBanTime", 604800)
					
					reason = GetLocalisedText("warnbanned").. string.format(GetLocalisedText("reasonadd"), CachedPlayers[id].name, getName(source, true) )
					local ban = {banid = GetFreshBanId(), name = bannedUsername,identifiers = bannedIdentifiers,  banner = getName(source, true), reason = reason, expire = expires }
					updateBlacklist( ban )
					
					
					
					PrintDebugMessage("Player "..getName(source,true).." warnbanned player "..CachedPlayers[id].name.." for "..reason, 3)
					SendWebhookMessage(moderationNotification,string.format(GetLocalisedText("adminbannedplayer"), getName(source, false, true), bannedUsername, reason, formatDateString( expires ), tostring(ban.banid) ), "ban", 16711680)
					DropPlayer(id, string.format(GetLocalisedText("banned"), reason, formatDateString( expires ) ) )
					WarnedPlayers[id] = nil
					
				end
			end
		elseif CachedPlayers[id].immune then
			TriggerClientEvent('QBCore:Notify', source, GetLocalisedText("adminimmune"))
		end
	end)

	function warnPlayerExport(src, id, reason)
		if not CachedPlayers[id].immune then
			local maxWarnings = GetConvarInt("ea_maxWarnings", 3)
			if not WarnedPlayers[id] then
				WarnedPlayers[id] = {name = getName(id, true), identifiers = getAllPlayerIdentifiers(id), warns = 0}
			end
			WarnedPlayers[id].warns = WarnedPlayers[id].warns+1
			TriggerClientEvent('chat:addMessage', id, { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(253, 53, 53, 0.6); border-radius: 5px;"><i class="fas fa-user-crown"></i> {0} </div>',
				args = {  string.format(GetLocalisedText("warned"), reason, WarnedPlayers[id].warns, maxWarnings) }, color = { 255, 255, 255 } 
			})
			SendWebhookMessage(moderationNotification,string.format(GetLocalisedText("adminwarnedplayer"), src, getName(id, true, true), reason, WarnedPlayers[id].warns, maxWarnings), "warn", 16711680)
			TriggerClientEvent("txAdminClient:warn", id, src, string.format(GetLocalisedText("warned"), reason, WarnedPlayers[id].warns, maxWarnings), GetLocalisedText("warnedtitle"), GetLocalisedText("warnedby"),GetLocalisedText("warndismiss"))
			if WarnedPlayers[id].warns >= maxWarnings then
				if GetConvar("ea_warnAction", "kick") == "kick" then
					SendWebhookMessage(moderationNotification,string.format(GetLocalisedText("adminkickedplayer"), src, getName(id, true, true), reason), "kick", 16711680)
					DropPlayer(id, GetLocalisedText("warnkicked"))
					WarnedPlayers[id] = nil
				elseif GetConvar("ea_warnAction", "kick") == "ban" then
					local expires = os.time()+GetConvarInt("ea_warningBanTime", 604800)
					addBanExport(id, reason, formatDateString(expires), src)
					WarnedPlayers[id] = nil
				end
			end
			return true
		else
			return false
		end
	end

	exports('warnPlayer', warnPlayerExport)

	function getPlayerWarnings(playerId)
		if not WarnedPlayers[playerId] then
			return 0
		else
			return WarnedPlayers[id].warns
		end
	end
	exports('getPlayerWarnings', getPlayerWarnings)
	
	AddEventHandler("EasyAdmin:GetVersion", function(cb)
		cb(GetVersion())
	end)
	
	
	
	local chatEventsSupported = false
	
	pcall(function() -- this will prevent our script from erroring if the exports are missing, also mutes any errors.
		if exports.chat.registerMessageHook and exports.chat.registerMode then
			chatEventsSupported = true
		end
	end)
	
	
	
	if chatEventsSupported then
		exports.chat:registerMessageHook(function(source, outMessage, hookRef)
			if MutedPlayers[source] then
				hookRef.cancel()
				TriggerClientEvent('QBCore:Notify', source, getName(source) .. ", " .. GetLocalisedText("playermute"))
			end
		end)
	else
		AddEventHandler('chatMessage', function(source, name, msg)
			if MutedPlayers[source] then
				CancelEvent()
				TriggerClientEvent("chat:addMessage", source, { args = { "EasyAdmin", GetLocalisedText("playermute") } })
				TriggerClientEvent('QBCore:Notify', source, getName(source) .. ", " .. GetLocalisedText("playermute"))
			end
		end)
	end
	
	
	if GetConvar("ea_enableChat", "true") == "true" and chatEventsSupported then
		exports.chat:registerMode({
			name = "admins",
			displayName = "Admin Chat",
			color = "#19A2E3",
			seObject = "easyadmin.server.chat",
			cb = function(source, message, cbs)
				cbs.updateMessage({
					template = "^5[ADMIN CHAT]^7" .. ' {}'
				})
				
				cbs.setSeObject("easyadmin.server.chat")
			end
		})
	end

	
	function sendTelemetry()
		local data = {}
		data.version, data.unstable = GetVersion()
		data.servername = GetConvar("sv_hostname", "Default FXServer")
		data.usercount = #GetPlayers()
		data.bancount = #blacklist
		data.time = os.time()
		if os.getenv('OS') then
			data.os = os.getenv('OS')
		else
			local os_release = io.open("/etc/os-release")
			if os_release then
				data.os = string.split(os_release:read("*a"), '"')[2]
			else
				local issue = io.open("/etc/issue")
				if issue then
					data.os = issue:read("*a")
				else 
					data.os = "unknown"
				end
			end
		end
		
		data.zap = GetConvar("is_zap", "false")
		PerformHttpRequest("https://telemetry.blumlaut.me/ingest.php?data="..json.encode(data), nil, "POST")
		PrintDebugMessage("Sent Telemetry:\n "..table_to_string(data), 4)
	end
end)

Citizen.CreateThread(function()
	while true do
		PerformHttpRequest("https://api.github.com/repos/Blumlaut/EasyAdmin/releases/latest", checkVersion, "GET")
		Wait(3600000)
	end
end)

Citizen.CreateThread(function()
	function HTTPRequest(url, ...)
		local err,response,headers
		
		PerformHttpRequest(url, function(e,r,h)
			err,response,headers = e,r,h
		end, ...)
		repeat
			Wait(10)
		until (response)
		
		return response
	end
	exports('HTTPRequest', HTTPRequest)
end)

Citizen.CreateThread(function()
	
	AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
		local player = source
		local numIds = getAllPlayerIdentifiers(player)
		local matchingIdentifierCount = 0
		local matchingIdentifiers = {}
		local showProgress = GetConvar("ea_presentDeferral", "true")
		
		deferrals.defer()
		Wait(0)
		local deferralText = string.format(GetLocalisedText("deferral"), 0)
		if showProgress == "false" then
			deferralText = deferralText:sub(1, -6)
		end
		
		deferrals.update(deferralText)
		PrintDebugMessage(getName(player).."'s Identifiers:\n "..table_to_string(numIds), 3)
		if not blacklist then
			print("^1-^2-^3-^4-^5-^6-^8-^9-^1-^2-^3-^4-^5-^6-^8-^9-^1-^2-^3-^3!^1FATAL ERROR^3!^3-^2-^1-^9-^8-^6-^5-^4-^3-^2-^1-^9-^8-^6-^5-^4-^3-^2-^7\n")
			print("EasyAdmin: ^1Failed^7 to load Banlist!\n")
			print("EasyAdmin: Please check this error soon, ^1Bans *will not* work!^7\n")
			print("^1-^2-^3-^4-^5-^6-^8-^9-^1-^2-^3-^4-^5-^6-^8-^9-^1-^2-^3-^3!^1FATAL ERROR^3!^3-^2-^1-^9-^8-^6-^5-^4-^3-^2-^1-^9-^8-^6-^5-^4-^3-^2-^7\n")
			deferrals.done("\n\nEasyAdmin: A fatal error occured, please contact a Server Administrator to resolve this issue.")
			return
		end
		Wait(0)
		
		for bi,blacklisted in ipairs(blacklist) do
			if showProgress == "true" then
				if bi % 12 == 0 then -- only update on every 12th ban
					Wait(0)
					deferrals.update(string.format(GetLocalisedText("deferral"), math.round(bi/#blacklist*100)))
				end
			end
			for i,theId in ipairs(numIds) do
				for ci,identifier in ipairs(blacklisted.identifiers) do
					if identifier == theId and matchingIdentifiers[theId] ~= true then
						matchingIdentifierCount = matchingIdentifierCount+1 
						matchingIdentifiers[theId] = true -- make sure we remember the identifier for later
						PrintDebugMessage("IDENTIFIER MATCH! "..identifier.." Required: "..matchingIdentifierCount.."/"..minimumMatchingIdentifierCount, 3)
						local notBannedIds = checkForChangedIdentifiers(numIds, blacklisted.identifiers)
						if matchingIdentifierCount >= minimumMatchingIdentifierCount then
							if #notBannedIds > 0 then
								local newBanData = blacklisted
								newBanData.identifiers = mergeTables(blacklisted.identifiers, notBannedIds) -- add newly found identifiers to the existing ban
								updateBan(blacklisted.banid,newBanData) -- send it off!
							end
							PrintDebugMessage("Connection of "..getName(player).." Declined, Banned for "..blacklist[bi].reason..", Ban ID: "..blacklist[bi].banid.."\n", 3)
							deferrals.done(string.format( GetLocalisedText("bannedjoin"), blacklist[bi].reason, formatDateString(blacklist[bi].expire), blacklist[bi].banid))
							return
						end
					end
				end
			end
		end
		
		deferrals.done()
	end)
	
end)


curVersion, isMaster = GetVersion()
local resourceName = "EasyAdmin ("..GetCurrentResourceName()..")"
function checkVersion()
	local remoteVersion,remoteURL = getLatestVersion()

	if isMaster then
		PrintDebugMessage("You are using an unstable version of EasyAdmin, if this was not your intention, please download the latest stable version from "..remoteURL, 1)
	end
	if curVersion ~= remoteVersion and tonumber(curVersion) < tonumber(remoteVersion) then
		print("\n--------------------------------------------------------------------------")
		print("\n"..resourceName.." is outdated.\nNewest Version: "..remoteVersion.."\nYour Version: "..curVersion.."\nPlease update it from "..remoteURL)
		print("\n--------------------------------------------------------------------------")
		updateAvailable = remoteVersion
	elseif tonumber(curVersion) > tonumber(remoteVersion) then
		print("Your version of "..resourceName.." seems to be higher than the current stable version.")
	end
	
	if GetResourceState("screenshot-basic") == "missing" then 
		PrintDebugMessage("screenshot-basic is not installed, screenshots unavailable", 3)
	else
		StartResource("screenshot-basic")
		screenshots = true
	end
	
	local onesync = GetConvar("onesync", "off")
	if (onesync ~= "off" and onesync ~= "legacy") then 
		PrintDebugMessage("Onesync is Infinity", 3)
		infinity = true
	end
	
	if GetConvar("ea_defaultKey", "none") == "none" and RedM then
		PrintDebugMessage("ea_defaultKey is not defined, EasyAdmin can only be opened using the /easyadmin command, to define a key:\nhttps://easyadmin.readthedocs.io/en/latest", 1)
	end
	
	readAcePermissions()
end


Citizen.CreateThread(function()
	function getLatestVersion()
		local latestVersion,latestURL
		
		PerformHttpRequest("https://api.github.com/repos/Blumlaut/EasyAdmin/releases/latest", function(err,response,headers)
			if err == 200 then
				local data = json.decode(response)
				latestVersion = data.tag_name
				latestURL = data.html_url
			else
				latestVersion = GetVersion()
				latestURL = "https://github.com/Blumlaut/EasyAdmin"
			end		
			PrintDebugMessage("Version check returned "..err..", Local Version: "..GetVersion()..", Remote Version: "..latestVersion, 4)
		end, "GET")
		
		repeat
			Wait(50)
		until (latestVersion and latestURL)
		return latestVersion, latestURL
	end
	exports('getLatestVersion', getLatestVersion)

end)

Citizen.CreateThread(function()
	repeat
		Wait(1000)
	until updateBlacklist
	if GetConvar("ea_enableTelemetry", "true") == "true" then
		Citizen.CreateThread(function()
			while true do
				if GetConvar("ea_enableTelemetry", "true") == "false" then
					return -- stop telemetry if it gets disabled at runtime
				end
				sendTelemetry()
				Wait(math.random(6600000, 12000000))
			end
		end)
	end
	while true do
		updateBlacklist()
		Wait(300000)
	end
end)


---------------------------------- END USEFUL

if GetConvar("ea_enableSplash", "true") == "true" then
	local version,master = GetVersion()
	if master then version = version.." (UNSTABLE PRE-RELEASE!)" end
	print("EasyAdmin Version ^3"..version.."^7")
	PrintDebugMessage("Initialised.", 4)
end


-- DO NOT TOUCH THESE
-- DO NOT TOUCH THESE
-- DO NOT TOUCH THESE
-- DO NOT TOUCH THESE
MutedPlayers = {} -- DO NOT TOUCH THIS
OnlineAdmins = {} -- DO NOT TOUCH THIS
ChatReminders = {} -- DO NOT TOUCH THIS
MessageShortcuts = {} -- DO NOT TOUCH THIS
WarnedPlayers = {} -- DO NOT TOUCH THIS
reports = {} -- DO NOT TOUCH THIS
FrozenPlayers = {}
-- DO NOT TOUCH THESE
-- DO NOT TOUCH THESE
-- DO NOT TOUCH THESE
-- DO NOT TOUCH THESE

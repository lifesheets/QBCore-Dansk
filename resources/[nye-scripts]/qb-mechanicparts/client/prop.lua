local holdingPackage          = false
local dropkey 	= 58 -- Key to drop/get the props
local closestEntity = 0


-- Proplist, you can add as much as you want
attachPropList = {
	{["model"] = 'prop_cs_trolley_01',				["name"] = "trolley", 		["bone"] = 28422, ["x"] = 0.0,	["y"] = -0.6,	["z"] = -0.8,	["xR"] = -180.0,["yR"] = -165.0,["zR"] = 90.0, 	["anim"] = 'hold' }, -- Done Werkstattwagen
	{["model"] = 'prop_tool_box_04',				["name"] = "ferramentas", 	["bone"] = 28422, ["x"] = 0.4,	["y"] = -0.1,	["z"] = -0.1,	["xR"] = 315.0,	["yR"] = 288.0, ["zR"] = 0.0, 	["anim"] = 'pick' }, -- Done Werkzeugkasten
	{["model"] = "imp_prop_impexp_car_door_04a",			["name"] = "porta", 		["bone"] = 28422, ["x"] = -0.5,	["y"] = -0.15,	["z"] = 0.4,	["xR"] = 0.0,	["yR"] = 0.0, 	["zR"] = 90.0 , ["anim"] = 'hold' }, -- Done Fahrzeugtür
	{["model"] = "imp_prop_impexp_front_bars_01a",			["name"] = "barra", 		["bone"] = 28422, ["x"] = 0.0,	["y"] = -0.25,	["z"] = -0.1,	["xR"] = 0.0,	["yR"] = 0.0, 	["zR"] = 0.0 , 	["anim"] = 'hold' }, -- Done Kuhfänger
	{["model"] = "imp_prop_impexp_bonnet_03a",			["name"] = "bonnet", 		["bone"] = 28422, ["x"] = 0.2,	["y"] = 0.2,	["z"] = -0.1,	["xR"] = -0.0,	["yR"] = 0.0, 	["zR"] = 180.0 ,["anim"] = 'hold' }, -- Done Motorhaube
	{["model"] = "imp_prop_impexp_front_bumper_02a",		["name"] = "parachoques", 	["bone"] = 28422, ["x"] = 0.0,	["y"] = 0.1,	["z"] = 0.05,	["xR"] = 0.0,	["yR"] = 0.0, 	["zR"] = 0.0 , 	["anim"] = 'hold' }, -- Done Frontschürze
	{["model"] = "prop_car_battery_01",				["name"] = "bateria", 		["bone"] = 28422, ["x"] = 0.0,	["y"] = -0.1,	["z"] = -0.05,	["xR"] = 0.0,	["yR"] = 0.0, 	["zR"] = 0.0 , 	["anim"] = 'hold' }, -- Done Autobatterie
	{["model"] = "prop_wheel_tyre",					["name"] = "pneu", 		["bone"] = 28422, ["x"] = 0.0,	["y"] = -0.1,	["z"] = -0.05,	["xR"] = 0.0,	["yR"] = 0.0, 	["zR"] = 0.0 , 	["anim"] = 'hold' }, -- Done Reifen
	{["model"] = "prop_car_engine_01",				["name"] = "engine", 		["bone"] = 28422, ["x"] = -0.1,	["y"] = -0.19,	["z"] = -0.05,	["xR"] = 0.0,	["yR"] = 0.0, 	["zR"] = -90.0 , 	["anim"] = 'hold' }, -- Done Motor
	{["model"] = "imp_prop_impexp_radiator_02",				["name"] = "turbo", 		["bone"] = 28422, ["x"] = -0.01,	["y"] = -0.19,	["z"] = -0.2,	["xR"] = 0.0,	["yR"] = 0.0, 	["zR"] = -0.2 , 	["anim"] = 'hold' }, -- Done Motor
	{["model"] = "imp_prop_impexp_brake_caliper_01a",				["name"] = "brake", 		["bone"] = 28422, ["x"] = 0.21,	["y"] = -0.01,	["z"] = -0.01,	["xR"] = 315.0,	["yR"] = 288.0, ["zR"] = 0.0, 	["anim"] = 'pick' }, -- Done Motor
	{["model"] = "imp_prop_impexp_gearbox_01",				["name"] = "transmission", 		["bone"] = 28422, ["x"] = -0.01,	["y"] = -0.19,	["z"] = -0.2,	["xR"] = 0.0,	["yR"] = 10.0, 	["zR"] = -90.0 , 	["anim"] = 'hold' }, -- Done Motor

}
--[[
prop_cs_trolley_01 for springs
]]
RegisterNetEvent('inrp_propsystem:attachProp')
AddEventHandler('inrp_propsystem:attachProp', function(attachModelSent,boneNumberSent,x,y,z,xR,yR,zR)

    closestEntity = 0
    holdingPackage = true
    local attachModel = GetHashKey(attachModelSent)
    SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263) 
    local bone = GetPedBoneIndex(GetPlayerPed(-1), boneNumberSent)
    RequestModel(attachModel)
    while not HasModelLoaded(attachModel) do
        Wait(0)
    end
    closestEntity = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
	for i=1 ,#attachPropList , 1 do
		if (attachPropList[i].model == attachModelSent) and (attachPropList[i].anim == 'hold') then
			holdAnim()
		end
	end
	Wait(200)
    AttachEntityToEntity(closestEntity, GetPlayerPed(-1), bone, x, y, z, xR, yR, zR, 1, 1, 0, true, 2, 1)
end)


function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

function holdAnim()
    loadAnimDict( "anim@heists@box_carry@" )
	TaskPlayAnim((GetPlayerPed(-1)),"anim@heists@box_carry@","idle",4.0, 1.0, -1,49,0, 0, 0, 0)
end

function removeAttachedProp()
    if DoesEntityExist(closestEntity) then
        DeleteEntity(closestEntity)
    end
end


function removeall()
    TriggerEvent("b1g_props:client:RemoveItems",false)
	ClearPedTasks(GetPlayerPed(-1))
	ClearPedSecondaryTask(GetPlayerPed(-1))
end

RegisterNetEvent('b1g_props:client:attach')
AddEventHandler('b1g_props:client:attach', function(item)
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		TriggerEvent('QBCore:Notify', 'You cant use this in a car', 'error')
	else
		for i=1 ,#attachPropList , 1 do
			if (attachPropList[i].model == item) then
				TriggerEvent("inrp_propsystem:attachProp",attachPropList[i].model, attachPropList[i].bone, attachPropList[i].x, attachPropList[i].y, attachPropList[i].z, attachPropList[i].xR, attachPropList[i].yR, attachPropList[i].zR)
			end
		end
	end
end)

RegisterNetEvent("b1g_props:client:RemoveItems")
AddEventHandler("b1g_props:client:RemoveItems", function(sentinfo)
    SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("weapon_unarmed"), 1)
	removeAttachedProp()
	holdingPackage = false
	ClearPedTasks(GetPlayerPed(-1))
	ClearPedSecondaryTask(GetPlayerPed(-1))
end)

--[[ if you wanna test specific props use this Thread. usage /["name"] in chat
CreateThread( function()
	for i=1, #attachPropList, 1 do
		RegisterCommand(attachPropList[i].name, function(source, args, raw)
			local arg = args[1]

			if arg == nil then
				TriggerEvent('b1g_props:client:attach',attachPropList[i].model)
			end

		end, false)
	end
	RegisterCommand('removeprops', function(source, args, raw)
			TriggerEvent('b1g_props:client:RemoveItems',false)
	end, false)
end)

]]

CreateThread(function() while true do Wait(30000) collectgarbage() end end) -- Prevents RAM LEAKS :)

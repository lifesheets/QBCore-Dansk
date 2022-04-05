Citizen.CreateThread(function()
  RequestIpl("gabz_import_milo_")
  
    interiorID = GetInteriorAtCoords(941.00840000, -972.66450000, 39.14678000)
    
    
  if IsValidInterior(interiorID) then
    --EnableInteriorProp(interiorID, "basic_style_set")
    --EnableInteriorProp(interiorID, "urban_style_set")		
    EnableInteriorProp(interiorID, "branded_style_set")
    EnableInteriorProp(interiorID, "car_floor_hatch")
    RefreshInterior(interiorID)
  end
end)


-- This prison has been made by Bobo Boss

Citizen.CreateThread(function()
	RequestIpl("bobo_prison_milo_")
	interiorID = GetInteriorAtCoords(1756.861, 2486.683, 48.37542) 
	ActivateInteriorEntitySet(interiorID, "shell")
    ActivateInteriorEntitySet(interiorID, "bobo_prison_shell")
    RefreshInterior(interiorID)
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1772.5219726563,2483.5825195313,45.598968505859, true ) < 80 then
      ClearAreaOfPeds(1772.5219726563,2483.5825195313,45.598968505859, 58.0, 0)
    end
  end
end)
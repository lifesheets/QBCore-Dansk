function AddTextEntry(k, v)
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), k, v)
 end
 
 local fivem_title = "~b~Server Navn"
 local map_category = "~bold~~g~Map"
 
 local game_category = "~bold~~b~Spil"
 local disconnect_submenu = "~o~Gå tilbage til serverlisten"
 local closegame_submenu = "~r~Luk FiveM"
 
 local info_category = "~bold~~p~Logs"
 local statistics_category = "~bold~~o~Statistikker"
 local settings_category = "~bold~~c~Indstillinger"
 local gallery_category = "~bold~~g~Galleri"
 local rockstar_editor_category = "~bold~~o~∑ Editor"
 
 local fivem_key_config_submenu = "FiveM Keys"
 
 Citizen.CreateThread(function()
    AddTextEntry('FE_THDR_GTAO', fivem_title)
    AddTextEntry('PM_SCR_MAP', map_category)
    AddTextEntry('PM_SCR_GAM', game_category)
    AddTextEntry('PM_PANE_LEAVE', disconnect_submenu)
    AddTextEntry('PM_PANE_QUIT', closegame_submenu)
    AddTextEntry('PM_SCR_STA', statistics_category)
    AddTextEntry('PM_SCR_SET', settings_category)
    AddTextEntry('PM_SCR_GAL', gallery_category)
    AddTextEntry('PM_SCR_RPL', rockstar_editor_category)
    AddTextEntry('PM_SCR_CFX', fivem_key_config_submenu) -- to check
    AddTextEntry('PM_SCR_INF', info_category)
 end)

 function SetHeading(slot, str)
   BeginScaleformMovieMethodOnFrontendHeader('SET_HEADING_DETAILS_CUSTOM')
   ScaleformMovieMethodAddParamInt(slot)
   ScaleformMovieMethodAddParamTextureNameString(str)
   EndScaleformMovieMethod()
end
Citizen.CreateThread(function()
   while true do
       if GetPauseMenuState() > 0 then
           SetHeading(0, '~r~Server Navn')
           SetHeading(1, '~b~Indsæt discord link her')
           SetHeading(2, '~o~Whitelisted')
       end
       Citizen.Wait(100)
   end
end)
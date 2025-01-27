local QBCore = exports['qb-core']:GetCoreObject()

vehicleDevMode = false

local devMainMenu = MenuV:CreateMenu(false, 'Developer Menu', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'devMenu')
local cameraDevMenu = MenuV:CreateMenu(false, 'Camera Dev Menu', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'cameraMenu')

local coords_button = devMainMenu:AddButton({ icon = '🔎', label = 'Copy Coords to Clipboard', description = 'vector3() CTRL+V 😸' })
    coords_button:On("select", function()
        CopyToClipboard('coords')
    end)

local heading_button = devMainMenu:AddButton({ icon = '🧭', label = 'Copy Heading to Clipboard', description = 'int CTRL+V 🐵' })
    heading_button:On("select", function()
        CopyToClipboard('heading')
    end)

local vehicleDev_button = devMainMenu:AddButton({ icon = '🚘', label = 'Vehicle Dev Mode', description = 'see vehicle specific information' })
    vehicleDev_button:On("select", function()
        vehicleDevMode = not vehicleDevMode
        ToggleVehicleDeveloperMode()
    end)

local cameraDev_button = devMainMenu:AddButton({ icon = '🎦', label = 'Camera Dev Mode', value = cameraDevMenu, description = 'Tool for setting up camera specifics' })
    local createCamera_button = cameraDevMenu:AddButton({ icon = '➕', label = 'Create New Camera', description = 'Create a controllable camera' })
        createCamera_button:On("select", function()
            CreateCamera()
        end)
    local fov_range = cameraDevMenu:AddRange({ icon = '👓', label = 'FOV', min = 1, max = 130, value = 40, description = string.format('Current FOV: %s', 40), saveOnUpdate = true })
        fov_range:On('update', function(item, key, value, oldValue)
            fov_range.Description = string.format('Current FOV: %s', value)
            UpdateFov(value)
        end)
    local copyCamCoords_button = cameraDevMenu:AddButton({ icon = '📎', label = 'Copy Coords', description = 'Copy coordinates to clipboard' })
        copyCamCoords_button:On("select", function()
            CopyToClipboard('camCoords')
        end)
    local copyCamRot_button = cameraDevMenu:AddButton({ icon = '📎', label = 'Copy Rotation', description = 'Copy rotation to clipboard' })
        copyCamRot_button:On("select", function()
            CopyToClipboard('camRot')
        end)
    local destroyCamera_button = cameraDevMenu:AddButton({ icon = '❌', label = 'Destroy Camera', description = 'Remove the active camera' })
        destroyCamera_button:On("select", function()
            DestroyCamera()
        end)


RegisterNetEvent('qb-devmenu:OpenMenu')
AddEventHandler('qb-devmenu:OpenMenu', function()
    MenuV:OpenMenu(devMainMenu)
end)
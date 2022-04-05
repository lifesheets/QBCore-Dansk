Config = {}
Config.UsingTarget = false -- If you are using qb-target (uses entity zones to target vehicles)
Config.Commission = 0.10 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-29.53, -1103.67, 26.42) -- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'managed',  -- no player interaction is required to purchase a car  NORMAL = free-use
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the shop
                vector2(-56.727394104004, -1086.2325439453),
                vector2(-60.612808227539, -1096.7795410156),
                vector2(-58.26834487915, -1100.572265625),
                vector2(-35.927803039551, -1109.0034179688),
                vector2(-34.427627563477, -1108.5111083984),
                vector2(-32.02657699585, -1101.5877685547),
                vector2(-33.342102050781, -1101.0377197266),
                vector2(-31.292987823486, -1095.3717041016)
            },
            ['minZ'] = 25.0,  -- min height of the shop zone
            ['maxZ'] = 28.0  -- max height of the shop zone
        },
        ['Job'] = 'cardealer', -- Name of job or none NORMAL = none
        ['ShopLabel'] = 'Bilforhandler', -- Blip name
        ['showBlip'] = true,  --- true or false
        ['Categories'] = { -- Categories available to browse
            ['sportsclassics'] = 'Sportsklassikere',
            ['sedans'] = 'Sedaner',
            ['coupes'] = 'Coupéer',
            ['suvs'] = 'SUVer',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muskel',
            ['compacts'] = 'Kompakte',
--            ['motorcycles'] = 'Motorcycles',
            ['vans'] = 'Varevogne',
            ['cycles'] = 'Cykler'
        },
        ['TestDriveTimeLimit'] = 1.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-45.65, -1093.66, 25.44, 69.5), -- where the vehicle will spawn on display
                defaultVehicle = 'baller', -- Default display vehicle
                chosenVehicle = 'baller', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-48.27, -1101.86, 25.44, 294.5),
                defaultVehicle = 'schafter2',
                chosenVehicle = 'schafter2',
            },
            [3] = {
                coords = vector4(-39.6, -1096.01, 25.44, 66.5),
                defaultVehicle = 'blista',
                chosenVehicle = 'blista',
            },
            [4] = {
                coords = vector4(-44.28, -1102.47, 25.44, 298.5),
                defaultVehicle = 'outlaw',
                chosenVehicle = 'outlaw',
            }
        },
    },
   ['motorcycle'] = {
        ['Type'] = 'managed',  -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(264.90832519531, -1146.4946289062),
                vector2(265.10403442383, -1180.2321777344),
                vector2(310.36700439453, -1179.3811035156),
                vector2(310.45639038086, -1140.2353515625)
            },
            ['minZ'] = 28.425001144409,
            ['maxZ'] = 31.077966690063
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Motorcykel Forhandler',
        ['showBlip'] = true,  --- true or false
        ['Categories'] = {
            ['motorcycles'] = 'Motorcykler'
        },
        ['TestDriveTimeLimit'] = 1.5,
        ['Location'] = vector3(264.91, -1153.07, 29.29),
        ['ReturnLocation'] = vector3(289.85, -1162.95, 29.3),
        ['VehicleSpawn'] = vector4(262.15, -1150.03, 29.29, 184.42),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(299.42, -1154.43, 28.52, 144.64),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati',
            },
            [2] = {
                coords = vector4(290.39, -1153.83, 28.52, 178.26),
                defaultVehicle = 'bf400',
                chosenVehicle = 'bf400',
            },
        }
    },  -- Add your next table under this comma
    ['luxury'] = {
        ['Type'] = 'managed',  -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-1260.6973876953, -349.21334838867),
                vector2(-1268.6248779297, -352.87365722656),
                vector2(-1274.1533203125, -358.29794311523),
                vector2(-1273.8425292969, -362.73715209961),
                vector2(-1270.5701904297, -368.6716003418),
                vector2(-1266.0561523438, -375.14080810547),
                vector2(-1244.3684082031, -362.70278930664),
                vector2(-1249.8704833984, -352.03326416016),
                vector2(-1252.9503173828, -345.85726928711)
            },
            ['minZ'] = 36.646457672119,
            ['maxZ'] = 37.516143798828
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Luksus Køretøjer',
        ['showBlip'] = true,  --- true or false
        ['Categories'] = {
            ['super'] = 'Super',
            ['sports'] = 'Sport'
        },
        ['TestDriveTimeLimit'] = 1.5,
        ['Location'] = vector3(-1255.6, -361.16, 36.91),
        ['ReturnLocation'] = vector3(-1231.46, -349.86, 37.33),
        ['VehicleSpawn'] = vector4(-1231.46, -349.86, 37.33, 26.61),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1265.31, -354.44, 36.91 - 1.0, 205.08),
                defaultVehicle = 'italirsx',
                chosenVehicle = 'italirsx',
            },
            [2] = {
                coords = vector4(-1270.06, -358.55, 36.91 - 1.0, 247.08),
                defaultVehicle = 'italigtb',
                chosenVehicle = 'italigtb',
            },
            [3] = {
                coords = vector4(-1269.21, -365.03, 36.91 - 1.0, 297.12),
                defaultVehicle = 'nero',
                chosenVehicle = 'nero',
            },
        }
    } -- Add your next table under this comma
}

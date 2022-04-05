Config = {}

Config.Products = {
    ["normal"] = {
        [1] = {
            name = "tosti",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "water_bottle",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "kurkakola",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "twerks_candy",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "snikkel_candy",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "sandwich",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "beer",
            price = 7,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "whiskey",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "vodka",
            price = 12,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "bandage",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "lighter",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "rolling_paper",
            price = 2,
            amount = 5000,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "phone",
            price = 850,
            amount = 100,
            info = {},
            type = "item",
            slot = 13,
        },
    },
    ["hardware"] = {
        [1] = {
            name = "lockpick",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_wrench",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_hammer",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "repairkit",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
            requiredJob = { "mechanic", "police" }
        },
        [5] = {
            name = "screwdriverset",
            price = 350,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "phone",
            price = 850,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "radio",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "firework1",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "firework2",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "firework3",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "firework4",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "fitbit",
            price = 400,
            amount = 150,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "cleaningkit",
            price = 150,
            amount = 150,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "advancedrepairkit",
            price = 500,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
            requiredJob = { "mechanic" }
        },        
    },
    ["weedshop"] = {
        [1] = {
            name = "joint",
            price = 10,
            amount = 1000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_poolcue",
            price = 100,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 20,
            amount = 1000,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "empty_weed_bag",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "rolling_paper",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 5,
        },
    },
    ["gearshop"] = {
        [1] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "jerry_can",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["leisureshop"] = {
        [1] = {
            name = "parachute",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },    
        [3] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        -- [4] = {
        --     name = "smoketrailred",
        --     price = 250,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 4,
        -- },
    },
    ["weapons"] = {
        [1] = {
            name = "weapon_knife",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_bat",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_hatchet",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
            requiredJob = { "mechanic", "police" }
        },
        [4] = {
            name = "weapon_pistol",
            price = 2500,
            amount = 5,
            info = {},
            type = "item",
            slot = 4,
            requiresLicense = true
        },
        [5] = {
            name = "weapon_snspistol",
            price = 1500,
            amount = 5,
            info = {},
            type = "item",
            slot = 5,
            requiresLicense = true
        },
        [6] = {
            name = "weapon_vintagepistol",
            price = 4000,
            amount = 5,
            info = {},
            type = "item",
            slot = 6,
            requiresLicense = true
        },
        [7] = {
            name = "pistol_ammo",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 7,
            requiresLicense = true
        },
    },
    ["hunting"] = {
        [1] = {
            name = "huntingbait",
            price = 500,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
    },
    ["coffeeplace"] = {
        [1] = {
            name = "coffee",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "lighter",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["casino"] = {
        [1] = {
            name = 'casinochips',
            price = 100,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 1,
        }
    },
    ["mekaniker"] = {
        [1] = {
            name = 'engine0',
            price = 5000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 1,
            requiredJob = { "mechanic" },
        },
        [2] = {
            name = 'engine1',
            price = 10000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 2,
            requiredJob = { "mechanic" },
        },
        [3] = {
            name = 'engine2',
            price = 15000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 3,
            requiredJob = { "mechanic" },
        },
        [4] = {
            name = 'engine3',
            price = 20000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 4,
            requiredJob = { "mechanic" },
        },
        [5] = {
            name = 'engine4',
            price = 25000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 5,
            requiredJob = { "mechanic" },
        },
        [6] = {
            name = 'brake0',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 6,
            requiredJob = { "mechanic" },
        },
        [7] = {
            name = 'brake1',
            price = 4000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 7,
            requiredJob = { "mechanic" },
        },
        [8] = {
            name = 'brake2',
            price = 6000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 8,
            requiredJob = { "mechanic" },
        },
        [9] = {
            name = 'transmission0',
            price = 4000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 9,
            requiredJob = { "mechanic" },
        },
        [10] = {
            name = 'transmission1',
            price = 8000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 10,
            requiredJob = { "mechanic" },
        },
        [11] = {
            name = 'transmission2',
            price = 12000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 11,
            requiredJob = { "mechanic" },
        },
        [12] = {
            name = 'transmission3',
            price = 16000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 12,
            requiredJob = { "mechanic" },
        },
        [13] = {
            name = 'suspension0',
            price = 1000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 13,
            requiredJob = { "mechanic" },
        },
        [14] = {
            name = 'suspension1',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 14,
            requiredJob = { "mechanic" },
        },
        [15] = {
            name = 'suspension2',
            price = 3000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 15,
            requiredJob = { "mechanic" },
        },
        [16] = {
            name = 'suspension3',
            price = 4000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 16,
            requiredJob = { "mechanic" },
        },
        [17] = {
            name = 'suspension4',
            price = 5000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 17,
            requiredJob = { "mechanic" },
        },
        [18] = {
            name = 'turbo0',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 18,
            requiredJob = { "mechanic" },
        },
        [19] = {
            name = 'turbo1',
            price = 10000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 19,
            requiredJob = { "mechanic" },
        },
        [20] = {
            name = 'windowtint0',
            price = 1000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 20,
            requiredJob = { "mechanic" },
        },
         [21] = {
            name = 'windowtint1',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 21,
            requiredJob = { "mechanic" },
        },
        [22] = {
            name = 'windowtint2',
            price = 3000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 22,
            requiredJob = { "mechanic" },
        },
        [23] = {
            name = 'windowtint3',
            price = 4000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 23,
            requiredJob = { "mechanic" },
        },
        [24] = {
            name = 'windowtint4',
            price = 5000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 24,
            requiredJob = { "mechanic" },
        },
        [25] = {
            name = 'stock',
            price = 1000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 25,
            requiredJob = { "mechanic" },
        },
        [26] = {
            name = 'white',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 26,
            requiredJob = { "mechanic" },
        },
        [27] = {
            name = 'blue',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 27,
            requiredJob = { "mechanic" },
        },
        [28] = {
            name = 'electricblue',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 28,
            requiredJob = { "mechanic" },
        },
        [29] = {
            name = 'mintgreen',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 29,
            requiredJob = { "mechanic" },
        },
        [30] = {
            name = 'limegreen',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 30,
            requiredJob = { "mechanic" },
        },
        [31] = {
            name = 'yellow',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 31,
            requiredJob = { "mechanic" },
        },
        [32] = {
            name = 'goldenshower',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 32,
            requiredJob = { "mechanic" },
        },
        [33] = {
            name = 'orange',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 33,
            requiredJob = { "mechanic" },
        },
        [34] = {
            name = 'red',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 34,
            requiredJob = { "mechanic" },
        },
        [35] = {
            name = 'ponypink',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 35,
            requiredJob = { "mechanic" },
        },
        [36] = {
            name = 'hotpink',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 36,
            requiredJob = { "mechanic" },
        },
        [37] = {
            name = 'purple',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 37,
            requiredJob = { "mechanic" },
        },
        [38] = {
            name = 'blacklight',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 38,
            requiredJob = { "mechanic" },
        },
        [39] = {
            name = 'spoiler0',
            price = 1000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 39,
            requiredJob = { "mechanic" },
        },
        [40] = {
            name = 'spoiler1',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 40,
            requiredJob = { "mechanic" },
        },
        [41] = {
            name = 'spoiler2',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 41,
            requiredJob = { "mechanic" },
        },
        [42] = {
            name = 'spoiler3',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 42,
            requiredJob = { "mechanic" },
        },
        [43] = {
            name = 'spoiler4',
            price = 2000,
            amount = 10,
            info = {},
            type = 'item',
            slot = 43,
            requiredJob = { "mechanic" },
        },
        [44] = {
            name = 'nitrous',
            price = 10000,
            amount = 25,
            info = {},
            type = 'item',
            slot = 44,
            requiredJob = { "mechanic" },
        },
        [45] = {
            name = 'repairkit',
            price = 1000,
            amount = 100,
            info = {},
            type = 'item',
            slot = 45,
            requiredJob = { "mechanic" },
        },
        [46] = {
            name = 'advancedrepairkit',
            price = 2000,
            amount = 50,
            info = {},
            type = 'item',
            slot = 46,
            requiredJob = { "mechanic" },
        },
        [47] = {
            name = 'cleaningkit',
            price = 500,
            amount = 150,
            info = {},
            type = 'item',
            slot = 47,
            requiredJob = { "mechanic" },
        },
        [48] = {
            name = 'tunerlaptop',
            price = 3000,
            amount = 15,
            info = {},
            type = 'item',
            slot = 48,
            requiredJob = { "mechanic" },
        },
    }
}

Config.Locations = {
    -- 24/7 Locations
    ["247supermarket"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(25.7, -1347.3, 29.49),
            [2] = vector3(25.7, -1344.99, 29.49)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["247supermarket2"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-3038.71, 585.9, 7.9),
            [2] = vector3(-3041.04, 585.11, 7.9)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["247supermarket3"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-3241.47, 1001.14, 12.83),
            [2] = vector3(-3243.98, 1001.35, 12.83)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["247supermarket4"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1728.66, 6414.16, 35.03),
            [2] = vector3(1729.72, 6416.27, 35.03)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["247supermarket5"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1697.99, 4924.4, 42.06),
            [2] = vector3(1699.44, 4923.47, 42.06)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["247supermarket6"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1961.48, 3739.96, 32.34),
            [2] = vector3(1960.22, 3742.12, 32.34)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["247supermarket7"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(547.79, 2671.79, 42.15),
            [2] = vector3(548.1, 2669.38, 42.15)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["247supermarket8"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(2679.25, 3280.12, 55.24),
            [2] = vector3(2677.13, 281.38, 55.24)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["247supermarket9"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(2557.94, 382.05, 108.62),
            [2] = vector3(2555.53, 382.18, 108.62)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["247supermarket10"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(373.55, 325.56, 103.56),
            [2] = vector3(374.29, 327.9, 103.56)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },

    -- LTD Gasoline Locations
    ["ltdgasoline"] = {
        ["label"] = "LTD Gasolin",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-48.44, -1757.86, 29.42),
            [2] = vector3(-47.23, -1756.58, 29.42)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["ltdgasoline2"] = {
        ["label"] = "LTD Gasolin",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-707.41, -912.83, 19.21),
            [2] = vector3(-707.32, -914.65, 19.21)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["ltdgasoline3"] = {
        ["label"] = "LTD Gasolin",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-1820.33, 792.66, 138.1),
            [2] = vector3(-1821.55, 793.98, 138.1)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["ltdgasoline4"] = {
        ["label"] = "LTD Gasolin",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1163.7, -323.92, 69.2),
            [2] = vector3(1163.4, -322.24, 69.2)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },

    -- Rob's Liquor Locations
    ["robsliquor"] = {
        ["label"] = "Rob's Spiritus",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-1222.77, -907.19, 12.32)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["robsliquor2"] = {
        ["label"] = "Rob's Spiritus",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-1487.7, -378.53, 40.16)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["robsliquor3"] = {
        ["label"] = "Rob's Spiritus",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-2967.79, 391.64, 15.04)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["robsliquor4"] = {
        ["label"] = "Rob's Spiritus",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1165.28, 2709.4, 38.15)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
    ["robsliquor5"] = {
        ["label"] = "Rob's Spiritus",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(1135.66, -982.76, 46.41)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },

    -- Hardware Store Locations
    ["hardware"] = {
        ["label"] = "Hardware Butik",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(45.55, -1749.01, 29.6)
        },
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
        ["blipsprite"] = 402
    },
    ["hardware2"] = {
        ["label"] = "Hardware Butik",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(2747.8, 3472.86, 55.67)
        },
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
        ["blipsprite"] = 402
    },
    ["hardware3"] = {
        ["label"] = "Hardware Butik",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(-421.84, 6136.09, 31.78)
        },
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
        ["blipsprite"] = 402
    },

    -- Ammunation Locations
    ["ammunation"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-662.1, -935.3, 21.8)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110
    },
    ["ammunation2"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(810.2, -2157.3, 29.6)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110
    },
    ["ammunation3"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(1693.4, 3759.5, 34.7)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110
    },
    ["ammunation4"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-330.2, 6083.8, 31.4)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110
    },
    ["ammunation5"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(252.3, -50.0, 69.9)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110
    },
    ["ammunation6"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(22.0, -1107.2, 29.8)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110
    },
    ["ammunation7"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(2567.6, 294.3, 108.7)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110
    },
    ["ammunation8"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-1117.5, 2698.6, 18.5)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110
    },
    ["ammunation9"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(842.4, -1033.4, 28.1)
        },
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110
    },

    -- Casino Locations
    ["casino"] = {
        ["label"] = "Diamant Kasino",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(948.3834, 34.21247, 71.839)
        },
        ["products"] = Config.Products["casino"],
        ["showblip"] = true,
        ["blipsprite"] = 617
    },
    ["casino2"] = {
        ["label"] = "Kasino Bar",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(936.1185, 28.61719, 71.833)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },

    -- Weedshop Locations
    ["weedshop"] = {
        ["label"] = "Superfly",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = vector3(-1172.43, -1572.24, 4.66)
        },
        ["products"] = Config.Products["weedshop"],
        ["showblip"] = true,
        ["blipsprite"] = 140
    },

    -- Bean Coffee Locations
--[[    ["beancoffee"] = {
        ["label"] = "Bean Machine Coffee",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-633.72, 236.15, 81.88)           -- Bliver ikke brugt da man ikke kan komme ind i butikken
        },
        ["products"] = Config.Products["coffeeplace"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },]]

    -- Sea Word Locations
    ["seaword1"] = {
        ["label"] = "Hav Verden",
        ["type"] = "sea",
        ["coords"] = {
            [1] = vector3(-1686.9, -1072.23, 13.15)
        },
        ["products"] = Config.Products["gearshop"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },

    -- Leisure Shop Locations
    ["leisureshop"] = {
        ["label"] = "Fritidsbutik",
        ["type"] = "leisure",
        ["coords"] = {
            [1] = vector3(-1505.91, 1511.78, 115.29)
        },
        ["products"] = Config.Products["leisureshop"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },

    -- Local Store Locations
--[[    ["delvecchioliquor"] = {
        ["label"] = "Del Vecchio Liquor",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-159.36, 6321.59, 31.58),                 -- Bliver ikke brugt da man ikke kan komme ind i butikken
            [2] = vector3(-160.66, 6322.85, 31.58)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },]]
    ["donscountrystore"] = {
        ["label"] = "24/7 Supermarked",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(161.41, 6640.78, 31.69),
            [2] = vector3(163.04, 6642.45, 31.70)
        },
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52
    },
--[[    ["hunting"] = {
        ["label"] = "Hunting Store",
        ["type"] = "normal",
        ["coords"] = {
            [1] = vector3(-679.3, 5834.4, 17.33)
        },
        ["products"] = Config.Products["hunting"],
        ["showblip"] = false,
        ["blipsprite"] = 52
    },]]
    ["mekaniker"] = {
        ["label"] = "Mekaniker Butik",
        ["type"] = "mekaniker",
        ["coords"] = {
            [1] = vector3(537.21, -166.66, 54.49),
        },
        ["products"] = Config.Products["mekaniker"],
        ["showblip"] = false,
        ["blipsprite"] = 52
    },
}

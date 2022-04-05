Config = {}

----------optional section for shop to sell items-------------
Config.shop = {
    name = "CPU Butik",
    coords = vector3(-618.75, -267.63, 38.8),
}

Config.ShopItems = {
    label = "Digital Den",
    items = {
        [1] = {
            name = "standard_cpu",
            price = 10000,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "e2_cpu",
            price = 20000,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "quantum_cpu",
            price = 30000,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
    },
    slots = 3
}
----------------------------end of optional section--------------

Config.ExitCoords = vector4(-185.3246, -759.1964, 30.454008, 334.09106) -- coords to enter the mining facility


Config.MiningLab = {

    coords = vector3(2155.0, 2921.08, -81.08),
    mining_time =
    {
        ["Standard CPU"] = 180, -- mining time for different rigs in seconds.  --180
        ["E2 CPU"] = 300, -- 300
        ["Quantum CPU"] = 480, -- 480
    }
}

-- rewards for each rig in crypto-------
Config.Reward = {
    ["standard_cpu"] = math.random(01,25)/500,
    ["e2_cpu"] = math.random(25,75)/500,
    ["quantum_cpu"] = math.random(75,125)/500,
}


--[[Config.Reward = {
    ["standard_cpu"] = math.random(1,3),
    ["e2_cpu"] = math.random(4,6),
    ["quantum_cpu"] = math.random(7,9),
}]]

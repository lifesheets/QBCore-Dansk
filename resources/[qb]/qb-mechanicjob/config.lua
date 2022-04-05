Config = {}

Config.AttachedVehicle = nil

Config.AuthorizedIds = {
    "insertcitizenidhere",
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = "Motor",
    ["body"] = "Karosseri",
    ["radiator"] = "Radiator",
    ["axle"] = "Drivaksel",
    ["brakes"] = "Bremser",
    ["clutch"] = "Kobling",
    ["fuel"] = "Benzintank",
}

Config.RepairCost = {
    ["body"] = "plastic",
    ["radiator"] = "plastic",
    ["axle"] = "steel",
    ["brakes"] = "iron",
    ["clutch"] = "aluminum",
    ["fuel"] = "plastic",
}

Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 2,
    },
    ["body"] = {
        item = "plastic",
        costs = 3,
    },
    ["radiator"] = {
        item = "steel",
        costs = 5,
    },
    ["axle"] = {
        item = "aluminum",
        costs = 7,
    },
    ["brakes"] = {
        item = "copper",
        costs = 5,
    },
    ["clutch"] = {
        item = "copper",
        costs = 6,
    },
    ["fuel"] = {
        item = "plastic",
        costs = 5,
    },
}

Config.Businesses = {
    "Auto Repair",
}

Config.Plates = {
    [1] = {
--        coords = vector4(-340.95, -128.24, 39, 160.46),
        coords = vector4(545.04, -189.28, 54.49, 248.06),
        AttachedVehicle = nil,
    },
}

Config.Locations = {
    ["exit"] = vector3(-339.04, -135.53, 39),
    ["stash"] = vector3(539.7, -166.71, 54.49),
    ["duty"] = vector3(547.2, -182.1, 54.49), 
    ["vehicle"] = vector4(543.32, -209.0, 53.73, 181.88), 
}

Config.Vehicles = {
    ["flatbed"] = "Automester Ladvogn",
    ["towtruck"] = "Towtruck",
    ["burrito4"] = "Automester Varevogn",
--    ["blista"] = "Blista",
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Drivaksel",
    ["brakes"] = "Bremser",
    ["clutch"] = "Kobling",
    ["fuel"] = "Benzintank",
}

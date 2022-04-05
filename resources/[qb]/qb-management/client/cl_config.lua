-- Zones for Menues

Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = vector3(459.0193, -979.9127, 25.3074),
    ['ambulance'] = vector3(305.03, -598.67, 43.29),
    ['realestate'] = vector3(-124.786, -641.486, 168.820),
    ['taxi'] = vector3(903.32, -170.55, 74.0),
    ['cardealer'] = vector3(-32.0, -1114.2, 26.4),
    ['mechanic'] = vector3(-347.41, -133.48, 39.01)
}

Config.BossMenuZones = {
    ['MRPD'] = { 
        coords = vector3(461.45, -986.2, 30.73), length = 0.35, width = 0.45, heading = 351.0, minZ = 30.58, maxZ = 30.68,
        job = { ['police'] = 4, ['sasp'] = 1, ['bcso'] = 5 },
    },
    ['Pillbox'] = { 
        coords = vector3(335.46, -594.52, 43.28), length = 1.2, width = 0.6, heading = 341.0, minZ = 43.13, maxZ = 43.73,
        job = { ['ambulance'] = 5 },
    },
    ['Dynasty8'] = { 
        coords = vector3(-716.11, 261.21, 84.14), length = 0.6, width = 1.0, heading = 25.0, minZ = 83.943, maxZ = 84.74,
        job = { ['realestate'] = 0 },
    },
    ['Taxi'] = { 
        coords = vector3(907.24, -150.19, 74.17), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57,
        job = { ['taxi'] = 4 },
    },
    ['PDM'] = { 
        coords = vector3(-27.47, -1107.13, 27.27), length = 2.4, width = 1.05, heading = 340.0, minZ = 27.07, maxZ = 27.67,
        job = { ['pdmdealer'] = 4 },
    },
    ['LSC'] = { 
        coords = vector3(-339.53, -156.44, 44.59), length = 1.15, width = 2.6, heading = 353.0, minZ = 43.59, maxZ = 44.99,
        job = { ['mechanic'] = 4 },
    },
}

Config.GangMenus = {
    ['lostmc'] = vector3(0, 0, 0),
    ['ballas'] = vector3(0,0, 0),
    ['vagos'] = vector3(0, 0, 0),
    ['cartel'] = vector3(0, 0, 0),
    ['families'] = vector3(0, 0, 0),
}

Config.GangMenuZones = {
    --[[ 
    ['gangname'] = { 
        coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0,
        gang = { ['gangname'] = 4 },
    }, 
    ]]
}
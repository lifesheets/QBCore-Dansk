local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['testwebhook'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['playermoney'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['playerinventory'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['robbing'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['cuffing'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['drop'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['trunk'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['stash'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['glovebox'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['banking'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['shops'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['dealers'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['storerobbery'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['powerplants'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['death'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['joinleave'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['ooc'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['report'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['me'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['pmelding'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['112'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['bans'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['anticheat'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['weather'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['moneysafes'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['bennys'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['bossmenu'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['robbery'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['casino'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['traphouse'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['911'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['palert'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
    ['house'] = 'https://discord.com/api/webhooks/931907671945256990/732lqHPQLoYhn5gy6EmaNiwauGi1M9PBmQ7C2vzXd-91vDU93ee-RuRm-rjVTEaS21JS',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)        
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'Server Navn Logs',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/560848407414177792/969335083888705536/ting2.png',
            },
        }
    }
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'DRP Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'DRP Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Discord Webhook (Kun God)', {}, false, function(source, args)
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')

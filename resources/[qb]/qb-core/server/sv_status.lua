function sendToDiscord(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["url"] = "https://cfx.re/join/SKIFT_DETTE", -- Hvis du skriver IP:PORT til serveren i en browser så burde linken være oppe i toppen ;)
              ["thumbnail"] = {
                  ["url"] = "https://kb.dexserver.com/wp-content/uploads/2021/08/Screenshot_103.png", -- Udskift dette med et link af dit server logo
              },
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
                  ["icon_url"] = "https://kb.dexserver.com/wp-content/uploads/2021/08/Screenshot_103.png", -- Det lille logo
                },
          }
      }
  
    PerformHttpRequest('WEBHOOK_LINK_HER', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end

  sendToDiscord(16753920, "Server Status", [[Serveren er nu oppe!```yaml
connect cfx.re/join/SKIFT_DETTE```]], "Lavet af Magnus#4917")
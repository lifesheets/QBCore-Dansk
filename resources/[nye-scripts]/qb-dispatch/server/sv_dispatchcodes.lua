
--[[
	["vehicleshots"] -> dispatchcodename that you pass with the event of AlertGunShot
	displayCode -> Code to be displayed on the blip message
	description -> Description of the blip message
	radius -> to draw a circle with radius around blip
	recipientList -> list of job names that can see the blip
	blipSprite -> blip sprite
	blipColour -> blip colour
	blipScale -> blip scale
	blipLength -> time in seconds at which the blip will fade down, lower the time, faster it will fade. Cannot be 0
]]--

dispatchCodes = {

    ["vehicleshots"] =  {displayCode = '10-13', description = "Skud affyret fra køretøj", radius = 0, recipientList = {'police'}, blipSprite = 119, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
	["shooting"] =  {displayCode = '10-13', description ="Skud Affyret", radius = 0, recipientList = {'police'}, blipSprite = 110, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
	["speeding"] =  {displayCode = '10-13', description = "Speeding", radius = 0, recipientList = {'police'}, blipSprite = 326, blipColour = 84, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
    ["fight"] =  {displayCode = '10-10', description = "Slåskamp I Kamp", radius = 0, recipientList = {'police'}, blipSprite = 685, blipColour = 69, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
	["civdown"] =  {displayCode = '10-69', description = "Borger Nede", radius = 0, recipientList = {'ambulance'}, blipSprite = 126, blipColour = 3, blipScale = 1.5, blipLength = 2, sound = "dispatch"},
	["911call"] =  {displayCode = '911', description = "112 Opkald", radius = 0, recipientList = {'police', 'ambulance'}, blipSprite = 480, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
	["311call"] =  {displayCode = '911', description = "112 Opkald", radius = 0, recipientList = {'police', 'ambulance'}, blipSprite = 480, blipColour = 3, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
	["officerdown"] =  {displayCode = '10-99', description = "Betjent Nede", radius = 15, recipientList = {'police'}, blipSprite = 526, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "panicbutton"},
	["emsdown"] =  {displayCode = '10-99', description = "EMS Nede", radius = 15, recipientList = {'police', 'ambulance'}, blipSprite = 526, blipColour = 3, blipScale = 1.5, blipLength = 2, sound = "panicbutton"},
    ["storerobbery"] =  {displayCode = '10-90', description = "Butiksrøveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 52, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
	["bankrobbery"] =  {displayCode = '10-90', description = "Fleeca Bank Røveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 2, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["paletobankrobbery"] =  {displayCode = '10-90', description = "Paleto Bank Røveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 12, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["pacificbankrobbery"] =  {displayCode = '10-90', description = "Pacific Bank Røveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 5, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["prisonbreak"] =  {displayCode = '10-90', description = "Prison Break i Gang", radius = 0, recipientList = {'police'}, blipSprite = 189, blipColour = 59, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["vangelicorobbery"] =  {displayCode = '10-90', description = "Vangelico Røveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 434, blipColour = 5, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["houserobbery"] =  {displayCode = '10-90', description = "Husrøveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 40, blipColour = 5, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
	["suspicioushandoff"] =  {displayCode = '10-60', description = "Mistænkelig overdragelse", radius = 0, recipientList = {'police'}, blipSprite = 469, blipColour = 52, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
	-- Rainmad Heists
	["artgalleryrobbery"] =  {displayCode = '10-90', description = "Kunstgalleri Røveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 269, blipColour = 59, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["humanelabsrobbery"] =  {displayCode = '10-90', description = "Humane Labs Røveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 499, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["trainrobbery"] =  {displayCode = '10-90', description = "Togrøveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 667, blipColour = 78, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["vanrobbery"] =  {displayCode = '10-90', description = "Security Van Røveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 67, blipColour = 59, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["undergroundrobbery"] =  {displayCode = '10-90', description = "Underground Tunnels Røveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 486, blipColour = 59, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["drugboatrobbery"] =  {displayCode = '10-31', description = "Suspicious Activity On Boat", radius = 0, recipientList = {'police'}, blipSprite = 427, blipColour = 26, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["unionrobbery"] =  {displayCode = '10-90', description = "Union Depository Røveri i Gang", radius = 0, recipientList = {'police'}, blipSprite = 500, blipColour = 60, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
	["carboosting"] =  {displayCode = '10-50', description = "Car Boosting In Progress", radius = 0, recipientList = {'police'}, blipSprite = 595, blipColour = 60, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
}

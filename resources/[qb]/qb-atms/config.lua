Config = {}

Config.DailyLimit = 250000
--Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.UseTarget = GetConvar('UseTargetATM', 'false') == 'true'
Config.ATMModels = {
    "prop_atm_01",
    "prop_atm_02",
    "prop_atm_03",
    "prop_fleeca_atm"
}

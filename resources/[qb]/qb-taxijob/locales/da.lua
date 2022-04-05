local Translations = {
    error = {
        ["already_mission"] = "Du Laver Allerede En NPC Mission",
        ["not_in_taxi"] = "Du Er Ikke I En Taxa", 
        ["missing_meter"] = "Dette Køretøj Har Ingen Taxa Meter",
        ["no_vehicle"] = "Du Er Ikke I Et Køretøj", 
        ["not_active_meter"] = "Taxa Meteret Er Ikke Aktivt", 
        ["no_meter_sight"] = "Ingen Taxa Meter I Sigte", 
    },
    success = {},
    info = {
        ["person_was_dropped_off"] = "Personen Blev Afleveret!",
        ["npc_on_gps"] = "NPC'en Er Angivet På Din GPS", 
        ["go_to_location"] = "Bring NPC'en Til Den Specificerede Placering", 
        ["vehicle_parking"] = "[E] Køretøjs Parking", 
        ["job_vehicles"] = "[E] Job Køretøjer",
        ["drop_off_npc"] = "[E] Drop NPC Af",
        ["call_npc"] = "[E] kald NPC",
        ["blip_name"] = "Taxa Garage",
        ["taxi_label_1"] = "Standard Taxa", 
    },
    menu = {
        ["taxi_menu_header"] = "Taxa Køretøjer", 
        ["close_menu"] = "⬅ Luk Menu", 
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true,
})
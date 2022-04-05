local Translations = {
    error = {
        ["invalid_job"] = "Jeg tror ikke at jeg arbejder her...",
        ["invalid_items"] = "Du har ikke de rigtige ting!",
        ["no_items"] = "Du har ikke nogen ting!",
    },
    progress = {
        ["pick_grapes"] = "Plukker vindruer..",
        ["process_grapes"] = "Behandler druer ..",
    },
    task = {
        ["start_task"] = "[E] For At Starte",
        ["load_ingrediants"] = "[E] Indlæs Ingredienser",
        ["wine_process"] = "[E] Start Vinprocessen",
        ["get_wine"] = "[E] Få Vin",
        ["make_grape_juice"] = "[E] Lav Druesaft",
        ["countdown"] = "Tid Tilbage %{time}s",
        ['cancel_task'] = "Du har annulleret opgaven"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
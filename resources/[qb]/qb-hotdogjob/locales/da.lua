local Translations = {
    error = {
        no_money = 'Ikke nok penge',
        too_far = 'Du er for langt væk fra din pølsevogn',
        no_stand = 'Du har ikke en pølsevogn',
        cust_refused = 'Kunden nægtede!',
        no_stand_found = 'Din pølsevogn var ingen steder at se, du vil ikke modtage dit depositum tilbage!',
        no_more = 'Du har ikke %{value} mere om dette foran rådet',
        deposit_notreturned = 'Du havde ikke en pølsevogn',
    },
    success = {
        deposit = 'Du har betalt et depositum på $250!',
        deposit_returned = 'Dit depositum på $250 er blevet returneret!',
        sold_hotdogs = '%{value} x Hotdog(\'s) er blevet solgt for $%{value2}',
        made_hotdog = 'Du lavede en %{value} Hotdog',
        made_luck_hotdog = 'Du lavede %{value} x %{value2} Hotdogs',
    },
    info = {
        command = "Slet pølsevogn (Kun Admin)",
        blip_name = 'Pølsevogn',
        start_working = '[~g~E~s~] Begynd at arbejde',
        start_work = 'Begynd at arbejde',
        stop_working = '[~g~E~s~] Stop med at arbejde',
        stop_work = 'Stop med at arbejde',
        grab_stall = '[~g~G~s~] Tag pølsevognen',
        drop_stall = '[~g~G~s~] Giv Slip',
        grab = 'Tag pølsevogn',
        selling_prep = '[~g~E~s~] Hotdog forberedelse [Salg: ~g~Sælger~w~]',
        not_selling = '[~g~E~s~] Hotdog forberedelse [Salg: ~r~Sælger Ikke~w~]',
        sell_dogs = '[~g~7~s~] Sælg %{value} x Hotdogs for $%{value2} / [~g~8~s~] Afvis',
        admin_removed = "Pølsevogn blev fjernet",
        label_a = "Perfekt (A)",
        label_b = "Rare (B)",
        label_c = "Almindelig (C)"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
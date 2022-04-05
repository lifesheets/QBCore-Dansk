local Translations = {
    error = {
        not_enough = "Du har ikke nok penge..",
        no_slots = "Der Er Ingen Pladser Tilbage",
        occured = "Der Er Opstået En Fejl",
        have_keys = "Denne Person Har Allerede Nøgler",
        p_have_keys = "%{value} Denne Person Har Allerede Nøgler",
        not_owner = "Du Ejer Ikke Et Fældehus Eller Er Ikke Ejeren",
        not_online = "Denne Person Er Ikke I Byen",
        no_money = "Der Er Ikke Penge I Skabet",
        incorrect_code = "Denne Kode Er Forkert",
        up_to_6 = "Du Kan Give Op til 6 Personer Adgang Til Fældehuset!",
        cancelled = "Opkøb annulleret",
    },
    success = {
        added = "%{value} Er Blevet Tilføjet Til Fældehuset!",
    },
    info = {
        enter = "Gå ind i fældehuset",
        give_keys = "Giv Nøgler Til Fældehus",
        pincode = "Fældehus Pinkode: %{value}",
        taking_over = "Tager Over",
        pin_code_see = "~b~G~w~ - Se Pinkode",
        pin_code = "Pinkode: %{value}",
        multikeys = "~b~/multikeys~w~ [id] - For At Give Nøgler",
        take_cash = "~b~E~w~ - Tag Penge (~g~$%{value}~w~)",
        inventory = "~b~H~w~ - Se Inventar",
        take_over = "~b~E~w~ - Tag Over (~g~5000,-~w~)",
        leave = "~b~E~w~ - Forlad",
    }
}

if GetConvar('qb_locale', 'en') == 'da' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })    
end
local Translations = {
    error = {
        not_authorized = "Ikke autoriseret"
    },
    success = {},
    info = {},
    general = {
        locking = "~r~Låser..",
        unlocking = "~g~Oplåser..",
        locked = "~r~Låst",
        unlocked = "~g~Oplåst",
        locked_button = "[~g~E~w~] - Låst",
        unlocked_button = "[~g~E~w~] - Oplåst"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
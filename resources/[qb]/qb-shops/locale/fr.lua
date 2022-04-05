local Translations = {
    info = {
        interact = "~g~E~w~ - Magasin"
    },
    error = {
        dealer_decline = "Le vendeur refuse de vous montrer des armes à feu",
        talk_cop = "Parlez aux forces de l'ordre pour avoir un permis de port d\'arme"
    },
    success = {
        dealer_verify = "Le vendeur verifie votre permis."
    },
}

Lang = Locale:new({phrases = Translations}) 

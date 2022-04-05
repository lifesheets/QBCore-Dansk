local Translations = {
    error = {
        not_your_vehicle = 'Dette er ikke dit køretøj..',
        vehicle_does_not_exist = 'Køretøj findes ikke',
        not_enough_money = 'Du har ikke nok penge',
        finish_payments = 'Du skal afslutte med at betale af på dette køretøj, før du kan sælge det..',
        no_space_on_lot = 'Der er ikke plads til din bil på grunden!'
    },
    success = {
        sold_car_for_price = 'Du har solgt din bil for $%{value}',
        car_up_for_sale = 'Din bil er sat til salg! Pris - %{value} DKK',
        vehicle_bought = 'Køretøj Købt'
    },
    info = {
        confirm_cancel = '~g~Y~w~ - Bekræft / ~r~N~w~ - Annuller ~g~',
        vehicle_returned = 'Dit køretøj er returneret',
        used_vehicle_lot = 'Brugte Køretøjer',
        sell_vehicle_to_dealer = '[~g~E~w~] - Sælg køretøj til forhandler for ~g~$%{value}',
        view_contract = '[~g~E~w~] - Se Køretøjskontrakt',
        cancel_sale = '[~r~G~w~] - Annuller bilsalg',
        model_price = '%{value}, Pris: ~g~%{value2} DKK',
        are_you_sure = 'Er du sikker på, at du ikke længere vil sælge dit køretøj?',
        yes_no = '[~g~7~w~] - Ja | [~r~8~w~] - Nej',
        place_vehicle_for_sale = '[~g~E~w~] - Placer køretøj til salg'
    },
    charinfo = {
        firstname = 'not',
        lastname = 'known',
        account = 'Account not known..',
        phone = 'telephone number not known..'
    },
    mail = {
        sender = 'Brugte Køretøjer',
        subject = 'Du har solgt et køretøj!',
        message = 'Du fik $%{value} fra salget af din %{value2}.'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
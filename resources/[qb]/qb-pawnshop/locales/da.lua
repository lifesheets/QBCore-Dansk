local Translations = {
    error = {
        negative = 'Forsøger at sælge et negativt beløb?',
        no_melt = 'Du gav mig ikke noget at smelte...',
        no_items = 'Ikke nok ting',
    },
    success = {
        sold = 'Du har solgt %{value} x %{value2} for $%{value3}',
        items_received = 'Du fik %{value} x %{value2}',
    },
    info = {
        title = 'Pawn Shop',
        subject = 'Smelter Ting',
        message = 'Vi er færdige med at smelte dine varer. Du kan til enhver tid komme og hente dem.',
        open_pawn = 'Åben Pawn Shoppen',
        sell = 'Sælg Ting',
        sell_pawn = 'Sælg Ting Til Pawn Shoppen',
        melt = 'Smelt Ting',
        melt_pawn = 'Åbn Smelteværkstedet',
        melt_pickup = 'Tag Smeltede Ting',
        pawn_closed = 'Pawnshoppen er lukket. Kom tilbage imellem %{value}:00 - %{value2}:00',
        sell_items = 'Salgspris $%{value}',
        back = '⬅ Gå Tilbage',
        melt_item = 'Smelt %{value}',
        max = 'Max beløb %{value}',
        submit = 'Smelt',
        melt_wait = 'Giv mig %{value} minutter og jeg får dine ting smeltet',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
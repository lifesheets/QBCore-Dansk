local Translations = {
    error = {
        license_already = 'Borgeren har allerede en licens',
        error_license = 'Borgeren har ikke den licens',
        no_camera = 'Kameraet eksisterer ikke',
        blood_not_cleared = 'Blodet er IKKE renset',
        bullet_casing_not_removed = 'Kuglehuse er IKKE fjernet',
        none_nearby = 'Ingen i nærheden!',
        canceled = 'Annulleret..',
        time_higher = 'Tiden skal være højere end 0',
        amount_higher = 'Beløbet skal være højere end 0',
        vehicle_cuff = 'Du kan ikke lægge nogen i håndjern i et køretøj',
        no_cuff = 'Du har ikke håndjern på dig',
        no_impound = 'Der er ingen beslaglagte køretøjer',
        no_spikestripe = 'Kan ikke placere flere pigstrimler',
        error_license_type = 'Ugyldig licenstype',
        rank_license = 'Du er ikke en høj nok rang til at give en licens',
        revoked_license = 'Du har fået tilbagekaldt en licens',
        rank_revoke = 'Du er ikke en høj nok rang til at tilbagekalde en licens',
        on_duty_police_only = 'Kun for Politi på job',
        vehicle_not_flag = 'Køretøjet er ikke markeret',
        not_towdriver = 'Ikke en trækvognschauffør',
        not_lawyer = 'Personen er ikke advokat',
        no_anklet = 'Denne person har ikke en fodlænke på.',
        have_evidence_bag = 'Du skal have en tom bevispose med',
        no_driver_license = 'Intet kørekort',
        not_cuffed_dead = 'Borgeren er ikke i håndjern eller død',
    },
    success = {
        uncuffed = 'Dine håndjern er blevet taget af',
        granted_license = 'Du har fået en licens',
        grant_license = 'Du har givet en licens',
        revoke_license = 'Du tilbagekaldte en licens',
        tow_paid = 'Du blev betalt 500 DKK',
        blood_clear = 'Blodet renset',
        bullet_casing_removed = 'Kuglehuse fjernet...',
        anklet_taken_off = 'Din ankeltracker er taget af.',
        took_anklet_from = 'Du tog %{firstname} %{lastname}s tracker af',
        put_anklet = 'Du fik en ankeltracker på.',
        put_anklet_on = 'Du tog en ankeltracker på %{firstname} %{lastname}',
        vehicle_flagged = 'Køretøj %{plate} er blevet markeret for %{reason}',
        impound_vehicle_removed = 'Køretøj taget ud af beslaglæggelse!',
    },
    info = {
        mr = 'Hr.',
        mrs = 'Fru.',
        impound_price = 'Pris borgeren betaler for at få køretøjet ud af beslaglæggelsen (Kan være 0)',
        plate_number = 'Nummerpladenummer',
        flag_reason = 'Årsag til markering af køretøj',
        camera_id = 'Kamera ID',
        callsign_name = 'Navn på dit kaldesignal',
        poobject_object = 'Objekttype til spawn eller \'delete\' for at slette',
        player_id = 'ID af Borger',
        citizen_id = 'Borger ID af Spiller',
        dna_sample = 'DNA Prøve',
        jail_time = 'Tid personen skal være i fængsel',
        jail_time_no = 'Fængselstiden skal være højere end 0',
        license_type = 'Licens Type (driver/weapon)',
        ankle_location = 'Ankel Tracker Lokation',
        cuff = 'Du er i håndjern!',
        cuffed_walk = 'Du er i håndjern, men du kan gå',
        vehicle_flagged = 'Køretøj %{vehicle} er markeret for: %{reason}',
        unflag_vehicle = 'Køretøj %{vehicle} er ikke markeret',
        tow_driver_paid = 'Du betalte bugseringsvognschaufføren',
        paid_lawyer = 'Du betalte en advokat',
        vehicle_taken_depot = 'Køretøj taget i depot for $%{price}',
        vehicle_seized = 'Køretøj beslaglagt',
        stolen_money = 'Du har stjålet %{stolen} DKK',
        cash_robbed = 'Du er blevet røvet for %{money} DKK',
        driving_license_confiscated = 'Dit kørekort er blevet konfiskeret',
        cash_confiscated = 'Dine kontanter blev konfiskeret',
        being_searched = 'Du bliver søgt',
        cash_found = 'Fandt %{cash} DKK på borgeren',
        sent_jail_for = 'Du sendte personen i fængsel i %{time} måneder',
        fine_received = 'Du fik en bøde på %{fine} DKK',
        blip_text = 'Politi Alarm - %{text}',
        jail_time_input = 'Fængselstid',
        submit = 'Indsend',
        time_months = 'Tid i Måneder',
        bill = 'Regning',
        amount = 'Beløb',
        police_plate = 'DRPD', --Should only be 4 characters long
        vehicle_info = 'Motor: %{value} % | Tank: %{value2} %',
        evidence_stash = 'Bevis Stash | %{value}',
        slot = 'Slot nr. (1,2,3)',
        current_evidence = '%{value} | Skuffe %{value2}',
        on_duty = '[~g~E~s~] - Gå på job',
        off_duty = '[~r~E~s~] - Gå af job',
        onoff_duty = '~g~På~s~/~r~Af~s~ Job',
        stash = 'Stash %{value}',
        delete_spike = '[~r~E~s~] Fjern Spike Strip',
        close_camera = 'Luk Kamera',
        bullet_casing = '[~g~G~s~] Kuglehus %{value}',
        casing = 'Kuglehus',
        blood = 'Blod',
        blood_text = '[~g~G~s~] Blod %{value}',
        fingerprint_text = '[~g~G~s~] Fingeraftryk',
        fingerprint = 'Fingeraftryk',
        store_heli = '[~g~E~s~] Parker Helikopter',
        take_heli = '[~g~E~s~] Tag Helikopter',
        impound_veh = '[~g~E~s~] - Beslaglæg køretøj',
        store_veh = '[~g~E~s~] - Parker Køretøj',
        armory = 'Våben',
        enter_armory = '[~g~E~s~] Våben',
        finger_scan = 'Fingeraftryksscanning',
        scan_fingerprint = '[~g~E~s~] Scan Fingeraftryk',
        trash = 'Skrald',
        trash_enter = '[~g~E~s~] Skraldespand',
        stash_enter = '[~g~E~s~] Gå ind i skabet',
        target_location = 'Placeringen af %{firstname} %{lastname} er markeret på dit kort',
        anklet_location = 'Anklet lokation',
        new_call = 'Nyt Opkald',
        officer_down = 'Betjent %{lastname} | %{callsign} Nede'
    },
    evidence = {
        red_hands = 'Røde hænder',
        wide_pupils = 'Brede Pupiller',
        red_eyes = 'Røde Øjne',
        weed_smell = 'Lugter af hamp',
        gunpowder = 'Krudt i tøj',
        chemicals = 'lugter kemisk',
        heavy_breathing = 'Ånder tungt',
        sweat = 'Sveder meget',
        handbleed = 'Blod på hænder',
        confused = 'Forvirret',
        alcohol = 'Lugter af alkohol',
        heavy_alcohol = 'Dufter meget af alkohol',
        agitated = 'Ophidset - Tegn på meth-brug',
        serial_not_visible = 'Serienummer kan ikke ses...',
    },
    menu = {
        garage_title = 'Politi Køretøjer',
        close = '⬅ Luk Menu',
        impound = 'Beslaglagte Køretøjer',
        pol_impound = 'Politi Impound',
        pol_garage = 'Politi Garage',
        pol_armory = 'Politi Armory',
    },
    email = {
        sender = 'Den Centrale Retlige Inddrivelsesmyndighed',
        subject = 'Gældsinddrivelse',
        message = 'Kære %{value}. %{value2}, <br /><br />Den Centrale Retlige Inddrivelsesmyndighed opkrævet de bøder, du modtog fra politiet.<br />Der er <strong>%{value3} DKK</strong> trukket fra din konto.<br /><br />Med venlig hilsen,<br />Hr. Jens Sørensen',
    },
    commands = {
        place_spike = 'Placer Spike Strip (Kun Politi)',
        license_grant = 'Giv en licens til nogen',
        license_revoke = 'Tilbagekald en licens fra nogen',
        place_object = 'Placer/slet et objekt (Kun Politi)',
        cuff_player = 'Placer en person i håndjern (Kun Politi)',
        escort = 'Eskorter person',
        callsign = 'Giv dig selv et kaldesignal',
        clear_casign = 'Clear Area of Casings (Kun Politi)',
        jail_player = 'Sæt person i fængsel (Kun Politi)',
        unjail_player = 'Løslad person fra fængsel (Kun Politi)',
        clearblood = 'Ryd området for blod (Kun Politi)',
        seizecash = 'Beslaglæg Kontanter (Kun Politi)',
        softcuff = 'Bløde Håndjern (Kun Politi)',
        camera = 'Se Sikkerhedskamera (Kun Politi)',
        flagplate = 'Marker en nummerplade (Kun Politi)',
        unflagplate = 'Fjern markering fra en nummerplade (Kun Politi)',
        plateinfo = 'Kør en plade (Kun Politi)',
        depot = 'Beslaglæg med pris (Kun Politi)',
        impound = 'Beslaglæd et køretøj (Kun Politi)',
        paytow = 'Betal trækfører (Kun Politi)',
        paylawyer = 'Betal Advokat (Kun Politi og Dommer)',
        anklet = 'Fastgør sporing-anklet (Kun Politi)',
        ankletlocation = 'Få placeringen af ​​en persons fodlænke',
        removeanklet = 'Fjern Tracking Anklet (Kun Politi)',
        drivinglicense = 'Beslaglæg kørekort (Kun Politi)',
        takedna = 'Tag en DNA-prøve fra en person (tom bevispose nødvendig) (Kun Politi)',
        police_report = 'Politi Rapport',
        message_sent = 'Besked der skal sendes',
        civilian_call = 'Borger Opkald',
        emergency_call = 'Nyt 112 Opkald',
    },
    progressbar = {
        blood_clear = 'Fjerner Blod...',
        bullet_casing = 'Fjerner kuglehylstre..',
        robbing = 'Røver Person...',
        place_object = 'Placerer objekt..',
        remove_object = 'Fjerner objekt..',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
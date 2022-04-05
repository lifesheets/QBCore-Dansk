local Translations = {
    info = {
        loc1_label = 'Lokation 1',
        task_label = 'Hammer',
        details_view = '[~g~E~s~] Se Detaljer',
        exercises = 'Øvelser: %{value}/%{value2}',
        details_hide = '[~g~E~s~] Skjul Detaljer',
        project_completed = '%{value}: ~g~Udført~s~',
        project_notcompleted = '%{value}: ~r~Ikke Udført~s~',
        project_end = '[~g~G~s~] Slut Projekt',
        complete_task = '[~g~E~s~] Fuldfør Opgave'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
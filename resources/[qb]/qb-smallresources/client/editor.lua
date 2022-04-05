RegisterCommand("record", function(source , args)
    StartRecording(1)
    QBCore.Functions.Notify("Optagelse Startet!", "success")
end)

RegisterCommand("clip", function(source , args)
    StartRecording(0)
end)

RegisterCommand("saveclip", function(source , args)
    StopRecordingAndSaveClip()
    QBCore.Functions.Notify("Gemt Optagelse!", "success")
end)

RegisterCommand("delclip", function(source , args)
    StopRecordingAndDiscardClip()
    QBCore.Functions.Notify("Slettede Optagelse!", "error")
end)

RegisterCommand("editor", function(source , args)
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    QBCore.Functions.Notify("Ses senere!", "error")
end)

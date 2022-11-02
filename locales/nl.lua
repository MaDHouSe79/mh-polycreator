local Translations = {
    notify = {
        ['no_zone_name'] = "Geen zone name",
        ['zone_already_exsist'] = "This zone name already exsist.",
        ['zone_saved'] = "The zone is saved in (configs/zones.lua) file..",
    },
    data = {
        ['created_by'] = "Gemaakt door: %{name} - Datum: %{date}",
        ['created_zone'] = "Zone: %{zone} in Straat: %{street}",
        ['create_zone'] = "Maak zone [naam]",
        ['type_zone_name'] = "Type a zone name.",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

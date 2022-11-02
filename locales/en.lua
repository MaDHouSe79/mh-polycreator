local Translations = {
    notify = {
        ['no_zone_name'] = "No zone name",
        ['zone_already_exsist'] = "This zone name already exsist.",
        ['zone_saved'] = "The zone is saved in (configs/zones.lua) file..",
    },
    data = {
        ['created_zone'] = "Created By: %{name} - Date: %{date}",
        ['created_by'] = "Zone: %{zone} in Street: %{street}",
        ['create_zone'] = "Create zone [name]",
        ['type_zone_name'] = "Type a zone name.",
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
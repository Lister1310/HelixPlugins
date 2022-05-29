local PLUGIN = PLUGIN
PLUGIN.name = "D-Flag"
PLUGIN.description = "The flag under which the character will not be banned forever after death."
PLUGIN.author = "Lister"

ix.flag.Add("D", "The flag at which the character will not be banned forever.")

ix.config.SetDefault("permakill", true, "Whether or not permakill is activated on the server.", nil, {
    category = "Permakill"
})

ix.config.SetDefault("permakillWorld", true, "Whether or not world and self damaged produce permanent death.", nil, {
    category = "Permakill"
})

ix.config.Set("permakill", true, "Whether or not permakill is activated on the server.", nil, {
    category = "Permakill"
})

ix.config.Set("permakillWorld", true, "Whether or not world and self damaged produce permanent death.", nil, {
    category = "Permakill"
})

function PLUGIN:ShouldPermakillCharacter(client, character, inflictor, attacker)
    if (character:HasFlags("D")) then return false end
end

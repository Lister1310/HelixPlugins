PLUGIN.name = "Family Sharing Protection"
PLUGIN.description = "Prevents banned SteamIDs from using Steam Family Sharing to bypass bans."
PLUGIN.author = "Lister"
PLUGIN.KickMessage = "Family accounts not allowed!"

if SERVER then
    -- SteamID64 Whitelist
    local steamidwhitelist = {
        ["12345678901234567"] = true
    }

    function PLUGIN:PlayerInitialSpawn(client)
	if !steamidwhitelist[client:SteamID64()] and !client:IsBot() and client:OwnerSteamID64() != client:SteamID64() then
	    client:Kick(PLUGIN.KickMessage)
	end
    end
end

PLUGIN.name = "Inventory clear"
PLUGIN.description = "Clear inventory after character death"
PLUGIN.author = "Lister"

ix.config.Add("Clear Inventory", false, "Clear all Inventory items after character death?", nil, {
	category = "Inventory"
})

ix.config.Add("Clear Equipped", false, "Clear only equipped items after character death?", nil, {
	category = "Inventory"
})

function PLUGIN:PlayerDeath(client)
	local character = client:GetCharacter()
	local inventory = character:GetInventory()
	local items = inventory:GetItems()
	
	if ix.config.Get("Clear Inventory", true) then
		for k, v in pairs(items) do
			v:Remove()
		end
	elseif ix.config.Get("Clear Equipped", true) then
		for a, b in pairs(items) do
			if b:GetData("equip") == true then
            	b:Remove()
        	end
        end
	end
end

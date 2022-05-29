ENT.PrintName = "Car dealer"
ENT.Author = "Lister"
ENT.Category = "Helix"
ENT.Type = "ai"
ENT.Base = "base_ai" 
ENT.Spawnable = true
ENT.AdminOnly = true

if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/Combine_Soldier.mdl")
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
        self:SetMoveType(MOVETYPE_VPHYSICS)
    end

    function ENT:Use(client)	
    	local character = client:GetCharacter()
	
	if (client and character) then	
	    net.Start("CarDealerUsed")
	    net.Send(client)
	end
    end
end

if (CLIENT) then
    function ENT:OnPopulateEntityInfo(container)
	local carDealerName = container:AddRow("carDealerName")
	carDealerName:SetImportant()
	carDealerName:SetText(L("cardealerName"))
	carDealerName:SizeToContents()

	local carDealerDesc = container:AddRow("carDealerDesc")
	carDealerDesc:SetText(L("cardealerDesc"))
	carDealerDesc:SizeToContents()
    end
end

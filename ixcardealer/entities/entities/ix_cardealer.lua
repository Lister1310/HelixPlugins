ENT.PrintName = "Car dealer"
ENT.Author = "Lister"
ENT.Category = "Helix"
ENT.Type = "ai"
ENT.Base = "base_ai" 
ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/Combine_Soldier.mdl")
	    self:SetSolid(SOLID_BBOX)
	    self:SetUseType(SIMPLE_USE)
	   	self:SetCollisionGroup(COLLISION_GROUP_NONE)
        self:SetMoveType(MOVETYPE_VPHYSICS)
	end

	function ENT:Use(client)	
		net.Start("CarDealerUsed")
	    net.Send(client)
    end
end

if CLIENT then
	function ENT:OnPopulateEntityInfo(container)
	   local cardealername = container:AddRow("cardealername")
	   cardealername:SetImportant()
	   cardealername:SetText(L("cardealerName"))
	   cardealername:SizeToContents()

	   local cardealerdesc = container:AddRow("cardealerdesc")
	   cardealerdesc:SetText(L("cardealerDesc"))
	   cardealerdesc:SizeToContents()
    end
end

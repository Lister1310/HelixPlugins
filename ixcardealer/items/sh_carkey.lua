ITEM.name = "Car keys"
ITEM.model = Model("models/props_c17/TrapPropeller_Lever.mdl")
ITEM.description = "Keys from the purchased car."

ITEM.functions.LockFunction = {
    name = "Lock",
    icon = "icon16/car.png",
    OnRun = function(itemTable)
		local client = itemTable.player
		local data = {}
		    data.start = client:GetShootPos()
		    data.endpos = data.start + client:GetAimVector() * 96
		    data.filter = client

		local target = util.TraceLine(data).Entity
        if (IsValid(target) and client == simfphys.EntityOwner) then
			if target then
				target:Lock()
			end
			target:EmitSound("doors/door_latch3.wav")
        end

        return false
    end
}

ITEM.functions.OpenFunction = {
    name = "Open",
    icon = "icon16/car.png",
    OnRun = function(itemTable)
		local client = itemTable.player
		local data = {}
		    data.start = client:GetShootPos()
		    data.endpos = data.start + client:GetAimVector() * 96
		    data.filter = client

		local target = util.TraceLine(data).Entity
        if (IsValid(target) and client == simfphys.EntityOwner) then
			if target then
				target:UnLock()
			end
			target:EmitSound("doors/door_latch3.wav")
        end

        return false
    end
}
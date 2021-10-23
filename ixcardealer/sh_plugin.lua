PLUGIN.name = "IxCarDealer"
PLUGIN.description = "Plugin for buying cars from a car dealer"
PLUGIN.author = "Lister"

IxCarDealer = IxCarDealer or {}
IxCarDealer.Cars = {
    {
        name = "Van",
        description = "Here's the van.",
        model = "models/blu/van/pw_van.mdl",
        classname = "gmod_sent_vehicle_fphysics_base",
        spawnname = "sim_fphys_pwvan",
        price = "100",
        spawnpos = Vector(174, 215, 31),
        angle = Angle(0, 180, 0)
    }
}

function PLUGIN:SaveData()
    local data = {}
        for k, v in ipairs(ents.FindByClass("ix_cardealer")) do
            data[#data + 1] =
            {
                pos = v:GetPos(),
                angles = v:GetAngles()
            }
        end

    self:SetData(data)
end

function PLUGIN:LoadData()
    for k, v in ipairs(self:GetData() or {}) do
        local entity = ents.Create("ix_cardealer")
        entity:SetPos(v.pos)
        entity:SetAngles(v.angles)
        entity:Spawn()
    end
end

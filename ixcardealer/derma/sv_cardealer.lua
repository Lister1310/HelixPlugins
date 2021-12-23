util.AddNetworkString("CarDealerUsed")
util.AddNetworkString("ixMoneyTake")
net.Receive("ixMoneyTake", function(len, player)
    local id = net.ReadUInt(32)
    local CarData = IxCarDealer.Cars[id]
        
    if !CarData then
        return
    end
        
    local pricecar = tonumber(CarData.price)
    local character = player:GetCharacter()
    local wallet = character:GetMoney()
    local spawnname = CarData.spawnname
    local spwn = CarData.spawnpos
    local ang = CarData.angle
        
    if pricecar > wallet then
        return player:Notify("You don't have enough funds to rent a car!")
    end

    character:TakeMoney(pricecar)
    player:Notify("You have buy successfully "..CarData.name.." for "..pricecar..ix.currency.symbol.."!")

    simfphys.SpawnVehicleSimple(spawnname, spwn, ang)
    simfphys.EntityOwner = player
end)

util.AddNetworkString("CarDealerUsed")
util.AddNetworkString("ixMoneyTake")
net.Receive("ixMoneyTake", function(len, player)
    local id = net.ReadInt(32)
    local CarData = IxCarDealer.Cars[id]
    local pricecar = tonumber(CarData.price)
    local character = player:GetCharacter()
    local wallet = character:GetMoney()
    local spawnname = CarData.spawnname
    local spwn = CarData.spawnpos
    local ang = CarData.angle

    if pricecar > wallet then
        return player:Notify("You don't have enough funds to rent a car!")
    end

    if !character:GetInventory():HasItem("carkey") then
        character:GetInventory():Add("carkey", 1)
    end

    player:GetCharacter():TakeMoney(pricecar)
    player:Notify("You have buy successfully "..CarData.name.." for "..pricecar..ix.currency.symbol.."!")

    simfphys.SpawnVehicleSimple(spawnname, spwn, ang)
    simfphys.EntityOwner = player
end)
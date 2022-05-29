util.AddNetworkString("CarDealerUsed")
util.AddNetworkString("ixMoneyTake")
net.Receive("ixMoneyTake", function(len, player)
    local id = net.ReadUInt(32)
    local carData = IxCarDealer.Cars[id]
        
    if (!carData) then return end
        
    local priceCar = tonumber(carData.price)
    local character = player:GetCharacter()
    local wallet = character:GetMoney()
    local spawnName = carData.spawnname
    local spwn = carData.spawnpos
    local ang = carData.angle
        
    if (priceCar > wallet) then
        return player:Notify("You don't have enough funds to rent a car!")
    end

    character:TakeMoney(priceCar)
    player:Notify("You have buy successfully "..carData.name.." for "..priceCar.." "..ix.currency.symbol.."!")

    simfphys.SpawnVehicleSimple(spawnName, spwn, ang)
    simfphys.EntityOwner = player
end)

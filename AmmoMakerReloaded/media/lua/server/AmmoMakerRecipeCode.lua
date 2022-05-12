--Made by Snake

function AMReturnCork(items, result, player)
    player:getInventory():AddItem("Base.Corks");
end

function AMReturnAmmoPliers(items, result, player)
    player:getInventory():AddItem("AmmoMaker.AmmoPliers");
	player:getInventory():AddItem(instanceItem("Base.Screws"));
	player:getInventory():AddItem(instanceItem("Base.Screws"));
end

function AMStrengthxp1(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Strength, 1);
end

function AMStrengthxp2(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Strength, 2);
end

function AMStrengthxp3(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Strength, 3);
end

function AMWeldingxp3(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 3);
end

function AMWeldingstrxp1(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 1);
	player:getXp():AddXP(Perks.Strength, 1);
end

function AMDismantle_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "InventoryContainer") then
        return sourceItem:getContentsWeight() == 0 and not sourceItem:isEquipped()
    end
    return true
end

function Dismantleshotgunshells_OnCreate(items, result, player)
	player:getInventory():AddItem("Base.GunPowder");
end

function Dismantle556ammo_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.GunPowder",3);
end

function Dismantle762ammo_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.GunPowder",4);
end

function AMWSAXP1(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 1);
	player:getXp():AddXP(Perks.Strength, 1);
	player:getXp():AddXP(Perks.AMReloading, 1);
end

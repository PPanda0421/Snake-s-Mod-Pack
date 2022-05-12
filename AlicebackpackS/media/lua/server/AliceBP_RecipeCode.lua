function MUReturnMilitiaPouch1(items, result, player)
    player:getInventory():AddItem("AliceBP.MilitiaPouch1");
end

function MUReturnMilitiaPouch2(items, result, player)
    player:getInventory():AddItem("AliceBP.MilitiaPouch2");
end

function MUReturnSupportBackpack(items, result, player)
    player:getInventory():AddItem("AliceBP.SupportBackpack");
end

function UpgradeAlice_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "InventoryContainer") then
        return sourceItem:getContentsWeight() == 0 and not sourceItem:isEquipped()
    end
    return true
end

function ABPCreateSpear_TestIsValid(sourceItem, result)
	local playerObj = getSpecificPlayer(0);
	local containerList = ArrayList.new();
    for i,v in ipairs(getPlayerInventory(playerObj:getPlayerNum()).inventoryPane.inventoryPage.backpacks) do
        --        if v.inventory ~= self.character:getInventory() then -- owner inventory already check in RecipeManager
        containerList:add(v.inventory);
        --        end
    end
    for i,v in ipairs(getPlayerLoot(playerObj:getPlayerNum()).inventoryPane.inventoryPage.backpacks) do
        containerList:add(v.inventory);
    end
	local items = {"HuntingKnife","KitchenKnife","SharpedStone","FlintKnife","MeatCleaver","Machete","KnifeDepostador"};
    for i=0,containerList:size()-1 do
		local container = containerList:get(i);
		for x=0,container:getItems():size() - 1 do
			local baseItem = container:getItems():get(x);
			local index = 0;
			for i=1,#items do
				index = index + 1;
				if baseItem:getType() == items[index] then
					return false;
				end
			end
		end
	end
    return true
end
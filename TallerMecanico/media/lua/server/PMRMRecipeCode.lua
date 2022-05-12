require "recipecode" --Made by Snake

function XP_Mechanics5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 5);
end

function XP_Mechanics10(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 10);
end

function Give5MWXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 5);
	player:getXp():AddXP(Perks.Mechanics, 5);
end

function Give10MWXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.MetalWelding, 10);
	player:getXp():AddXP(Perks.Mechanics, 10);
end

function Give3MXP(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Mechanics, 3);
end
function SawTire_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
		local rolls = 0;
		local item = items:get(i)
        if item:getType() == "DismountedTire" then
			if item:getCondition() and item:getCondition() >= 40 then
				local number = item:getCondition()*0.04;
				rolls = math.floor(number);
			end
			if rolls > 0 then
				for i=1,rolls do
					player:getInventory():AddItem("Base.TireRubber");
				end
			end
		end
	end
end

function ReadTire_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "UnknownTire" then
			local tires = {};
			tires.item = {'OldTire1','OldTire2','OldTire3','NormalTire1','NormalTire2','NormalTire3','ModernTire1','ModernTire2','ModernTire3'}
			local TireItem = InventoryItemFactory.CreateItem("Base." .. tires.item[ZombRand(1, #tires.item +1)]);
			if TireItem ~= nil then
				if TireItem:getCondition() ~= nil then
					TireItem:setCondition(ZombRand(80,101))
				end
			end
			player:getInventory():AddItem(TireItem);
        end
    end
end

function ReadDismountedTire_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "PMRMTire" then
			local tires = {};
			tires.item = {"OldTire1","OldTire2","OldTire3","NormalTire1","NormalTire2","NormalTire3","ModernTire1","ModernTire2","ModernTire3"}
			local Type = tires.item[ZombRand(1, #tires.item +1)]
			local data = result:getModData()
			if not data.TireType then
				data.TireType = Type;
			end
			local extraname = "";
			local spec = "";
			if PMRMTireDef[Type] then
				extraname = getText(PMRMTireDef[Type].translation);
				spec = getText(PMRMTireDef[Type].transspec)
				if not data.TireName then
					data.TireName = getItemNameFromFullType("Base.".. Type) .. " " .. spec;
				end
			end
			result:setCondition(ZombRand(101))
			result:setName(getItemNameFromFullType("Base.DismountedTire") .. " " .. extraname);
        end
    end
end

function DismountGasTank_OnTest(sourceItem, result)
		if sourceItem:getFullType() == "Base.SmallGasTank1" or
		  sourceItem:getFullType() == "Base.NormalGasTank1" or
		  sourceItem:getFullType() == "Base.BigGasTank1" or
		  sourceItem:getFullType() == "Base.SmallGasTank2" or
		  sourceItem:getFullType() == "Base.NormalGasTank2" or
		  sourceItem:getFullType() == "Base.BigGasTank2" or
		  sourceItem:getFullType() == "Base.SmallGasTank3" or
		  sourceItem:getFullType() == "Base.NormalGasTank3" or
		  sourceItem:getFullType() == "Base.BigGasTank3" then
			return sourceItem:getItemCapacity() <= 0;
		end
    return true
end
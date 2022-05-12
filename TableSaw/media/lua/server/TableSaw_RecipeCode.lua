function TableSawReturnRope2(items, result, player)
    player:getInventory():AddItems("Base.Rope",2);
	--UntiePlanks_OnCreate(items,result,player);
end

function TableSawReturnRope3(items, result, player)
    player:getInventory():AddItems("Base.Rope",3);
	--UntiePlanks_OnCreate(items,result,player);
end

function TableSawReturnRope4(items, result, player)
    player:getInventory():AddItems("Base.Rope",4);
	--UntiePlanks_OnCreate(items,result,player);
end

function TiePlanks_TestIsValid(sourceItem, result)
	return sourceItem:getCondition() == sourceItem:getConditionMax();
end

function UntieSticks_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
		if items:get(i):getType() == "StickStacks" then
			player:getInventory():AddItems("Base.ThreadPieces", 3);
		end
	end
end

function CreateClub_OnCreate(items, result, player, selectedItem)
    local conditionMax = 2 + player:getPerkLevel(Perks.Woodwork);
    conditionMax = ZombRand(conditionMax, conditionMax + 2);
    if conditionMax > result:getConditionMax() then
        conditionMax = result:getConditionMax();
    end
    if conditionMax < 2 then
        conditionMax = 2;
    end
    result:setCondition(conditionMax)
    
    for i=0,items:size() - 1 do
        if instanceof (items:get(i), "HandWeapon") then
            items:get(i):setCondition(items:get(i):getCondition() - 1);
        end
    end
end
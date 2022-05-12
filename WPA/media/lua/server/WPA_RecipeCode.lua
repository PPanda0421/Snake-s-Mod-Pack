function DismantleBlackBriefcase_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "InventoryContainer") then
        return sourceItem:getContentsWeight() == 0 and not sourceItem:isEquipped()
    end
    return true
end

function WPA_ThreeXP_Electricity(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Electricity, 3);
end

function WPA_FiveXP_Electricity(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Electricity, 5);
end

function WPA_ThreeXP_Weapons(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Aiming, 3);
	player:getXp():AddXP(Perks.Reloading, 3);
	player:getXp():AddXP(Perks.Maintenance, 3);
end

function WPA_FourXP_Weapons(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Aiming, 4);
	player:getXp():AddXP(Perks.Reloading, 4);
	player:getXp():AddXP(Perks.Maintenance, 4);
end

function WPA_FiveXP_Weapons(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Aiming, 5);
	player:getXp():AddXP(Perks.Reloading, 5);
	player:getXp():AddXP(Perks.Maintenance, 5);
	player:getXp():AddXP(Perks.Carpentry, 5);
end

function WPAMakeWeapon_OnCreate(items, result, player)
    local hammer = player:getInventory():contains("Hammer");

    if instanceof(result, "HandWeapon") then
        local condPerc = ZombRand(5 + (player:getPerkLevel(Perks.Carpentry) * 5), 10 + (player:getPerkLevel(Perks.Carpentry) * 10));
        if not hammer then
            condPerc = condPerc - 20;
        end

		local chance3 = ZombRand(5,10);
        if player:HasTrait("whandler") or player:HasTrait("whandler2") then
            condPerc = 100;
	    elseif player:HasTrait("Lucky") and not player:HasTrait("Handy") then
	        condPerc = condPerc + (chance3 * 2);
        elseif player:HasTrait("Unlucky") and not player:HasTrait("Handy") then
            condPerc = condPerc - (chance3 / 2);
        elseif player:HasTrait("Lucky") and player:HasTrait("Handy") then
            condPerc = condPerc + (chance3 * 5);
        elseif player:HasTrait("Unlucky") and player:HasTrait("Handy") then
            condPerc = condPerc + chance3;
        elseif player:HasTrait("Handy") and not player:HasTrait("Lucky") then
            condPerc = condPerc + (chance3 * 4);
        elseif player:HasTrait("Handy") and not player:HasTrait("Unlucky") then
            condPerc = condPerc + chance3;
        end

        if condPerc < 5 then
            condPerc = 5;
        elseif condPerc > 100 then
            condPerc = 100;
        end
        result:setCondition(round(result:getConditionMax() * (condPerc/100)));
    end
end

function WPAPistol_OnTest(sourceItem, result)
    if sourceItem:getType() == "Pistol" then
        return sourceItem:getCondition() == 0 --and 
		    --sourceItem:getCanon() == nil and 
			--sourceItem:getSling() == nil and 
			--sourceItem:getStock() == nil and 
			--sourceItem:getScope() == nil and 
			--sourceItem:getRecoilpad() == nil;
    end
    return true
end

function WPAPistol_OnCreate(items, result, player)

    local player = getPlayer();
	local inv = player:getInventory();
    local success = ZombRand(0,100);
	local chance = ZombRand(20,33);

    if player:HasTrait("whandler") or player:HasTrait("whandler2") then
        success = 100;
	elseif player:HasTrait("Lucky") then
	    success = success + chance;
    elseif player:HasTrait("Unlucky") then
        success = success - chance;
    end

    if success < 0 then
	    success = 0;
	elseif success > 100 then
	    success = 100;
	end

	if success <= 50 then
	    inv:AddItem("WPA.PistolPart1");
	elseif success <= 55 then
	    inv:AddItem("WPA.PistolPart2");
	elseif success <= 60 then
	    inv:AddItem("WPA.PistolPart3");
	elseif success <= 65 then
	    inv:AddItem("WPA.PistolPart4");
	elseif success <= 70 then
	    inv:AddItem("WPA.PistolPart5");
	elseif success >= 71 then
	
		local nz = ZombRand(0,10);
        local chance2 = ZombRand(1,3);
		
        if player:HasTrait("whandler") or player:HasTrait("whandler2") then
            nz = 7 + chance2;
	    elseif player:HasTrait("Lucky") then
	        nz = nz + chance2;
        elseif player:HasTrait("Unlucky") then
            nz = nz - chance2;
        end

        if nz < 0 then
	        nz = 0;
	    elseif nz > 10 then
	        nz = 10;
	    end
		
		if nz <= 7 then
		   inv:AddItem("WPA.PistolPart1");
			inv:AddItem("WPA.PistolPart2");
			inv:AddItem("WPA.PistolPart5");
		elseif nz == 8 then
		    inv:AddItem("WPA.PistolPart1");
			inv:AddItem("WPA.PistolPart2");
			inv:AddItem("WPA.PistolPart3");
			inv:AddItem("WPA.PistolPart5");
		elseif nz == 9 then
		    inv:AddItem("WPA.PistolPart1");
			inv:AddItem("WPA.PistolPart2");
			inv:AddItem("WPA.PistolPart3");
            inv:AddItem("WPA.PistolPart4");
		else
		    inv:AddItem("WPA.PistolPart1");
			inv:AddItem("WPA.PistolPart2");
			inv:AddItem("WPA.PistolPart3");
            inv:AddItem("WPA.PistolPart4");
            inv:AddItem("WPA.PistolPart5");
		end
	else
	    inv:AddItem("Base.Screws");
    end
end

function WPAVarmint_OnTest(sourceItem, result)
    if sourceItem:getFullType() == "Base.VarmintRifle" then
        return sourceItem:getCondition() == 0 and 
		    sourceItem:getCanon() == nil and 
			sourceItem:getSling() == nil and 
			sourceItem:getStock() == nil and 
			sourceItem:getScope() == nil and 
			sourceItem:getRecoilpad() == nil
    end
    return true
end

function WPAVarmint_OnCreate(items, result, player)

    local player = getPlayer();
	local inv = player:getInventory();
    local success = ZombRand(0,100);
	local chance = ZombRand(20,33);

    if player:HasTrait("whandler") or player:HasTrait("whandler2") then
        success = 100;
	elseif player:HasTrait("Lucky") then
	    success = success + chance;
    elseif player:HasTrait("Unlucky") then
        success = success - chance;
    end

    if success < 0 then
	    success = 0;
	elseif success > 100 then
	    success = 100;
	end

	if success <= 50 then
	    inv:AddItem("WPA.223Part1");
	elseif success <= 55 then
	    inv:AddItem("WPA.223Part2");
	elseif success <= 60 then
	    inv:AddItem("WPA.223Part3");
	elseif success <= 65 then
	    inv:AddItem("WPA.223Part4");
	elseif success <= 70 then
	    inv:AddItem("WPA.223Part5");
	elseif success >= 71 then
	
		local nz = ZombRand(0,10);
        local chance2 = ZombRand(1,3);
		
        if player:HasTrait("whandler") or player:HasTrait("whandler2") then
            nz = 7 + chance2;
	    elseif player:HasTrait("Lucky") then
	        nz = nz + chance2;
        elseif player:HasTrait("Unlucky") then
            nz = nz - chance2;
        end

        if nz < 0 then
	        nz = 0;
	    elseif nz > 10 then
	        nz = 10;
	    end
		
		if nz <= 7 then
		    inv:AddItem("WPA.223Part1");
			inv:AddItem("WPA.223Part2");
			inv:AddItem("WPA.223Part5");
		elseif nz == 8 then
		    inv:AddItem("WPA.223Part1");
			inv:AddItem("WPA.223Part2");
			inv:AddItem("WPA.223Part3");
			inv:AddItem("WPA.223Part5");
		elseif nz == 9 then
		    inv:AddItem("WPA.223Part1");
			inv:AddItem("WPA.223Part2");
			inv:AddItem("WPA.223Part3");
            inv:AddItem("WPA.223Part4");
		else
		    inv:AddItem("WPA.223Part1");
			inv:AddItem("WPA.223Part2");
			inv:AddItem("WPA.223Part3");
            inv:AddItem("WPA.223Part4");
            inv:AddItem("WPA.223Part5");
		end
	else
	    inv:AddItem("Base.Screws");
    end
end

function WPAHunting_OnTest(sourceItem, result)
    if sourceItem:getFullType() == "Base.HuntingRifle" then
        return sourceItem:getCondition() == 0 and 
		    sourceItem:getCanon() == nil and 
			sourceItem:getSling() == nil and 
			sourceItem:getStock() == nil and 
			sourceItem:getScope() == nil and 
			sourceItem:getRecoilpad() == nil
    end
    return true
end

function WPAHunting_OnCreate(items, result, player)

    local player = getPlayer();
	local inv = player:getInventory();
    local success = ZombRand(0,100);
	local chance = ZombRand(20,33);

    if player:HasTrait("whandler") or player:HasTrait("whandler2") then
        success = 100;
	elseif player:HasTrait("Lucky") then
	    success = success + chance;
    elseif player:HasTrait("Unlucky") then
        success = success - chance;
    end

    if success < 0 then
	    success = 0;
	elseif success > 100 then
	    success = 100;
	end

	if success <= 50 then
	    inv:AddItem("WPA.308Part1");
	elseif success <= 55 then
	    inv:AddItem("WPA.308Part2");
	elseif success <= 60 then
	    inv:AddItem("WPA.308Part3");
	elseif success <= 65 then
	    inv:AddItem("WPA.308Part4");
	elseif success <= 70 then
	    inv:AddItem("WPA.308Part5");
	elseif success >= 71 then
	
		local nz = ZombRand(0,10);
        local chance2 = ZombRand(1,3);
		
        if player:HasTrait("whandler") or player:HasTrait("whandler2") then
            nz = 7 + chance2;
	    elseif player:HasTrait("Lucky") then
	        nz = nz + chance2;
        elseif player:HasTrait("Unlucky") then
            nz = nz - chance2;
        end

        if nz < 0 then
	        nz = 0;
	    elseif nz > 10 then
	        nz = 10;
	    end
		
		if nz <= 7 then
		    inv:AddItem("WPA.308Part1");
			inv:AddItem("WPA.308Part2");
			inv:AddItem("WPA.308Part5");
		elseif nz == 8 then
		    inv:AddItem("WPA.308Part1");
			inv:AddItem("WPA.308Part2");
			inv:AddItem("WPA.308Part3");
			inv:AddItem("WPA.308Part5");
		elseif nz == 9 then
		    inv:AddItem("WPA.308Part1");
			inv:AddItem("WPA.308Part2");
			inv:AddItem("WPA.308Part3");
            inv:AddItem("WPA.308Part4");
		else
		    inv:AddItem("WPA.308Part1");
			inv:AddItem("WPA.308Part2");
			inv:AddItem("WPA.308Part3");
            inv:AddItem("WPA.308Part4");
            inv:AddItem("WPA.308Part5");
		end
	else
	    inv:AddItem("Base.Screws");
    end
end

function WPAShotgun_OnTest(sourceItem, result)
    if sourceItem:getFullType() == "Base.Shotgun" then
        return sourceItem:getCondition() == 0 and 
		    sourceItem:getCanon() == nil and 
			sourceItem:getSling() == nil and 
			sourceItem:getStock() == nil and 
			sourceItem:getScope() == nil and 
			sourceItem:getRecoilpad() == nil
    end
    return true
end

function WPAShotgun_OnCreate(items, result, player)

    local player = getPlayer();
	local inv = player:getInventory();
    local success = ZombRand(0,100);
	local chance = ZombRand(20,33);

    if player:HasTrait("whandler") or player:HasTrait("whandler2") then
        success = 100;
	elseif player:HasTrait("Lucky") then
	    success = success + chance;
    elseif player:HasTrait("Unlucky") then
        success = success - chance;
    end

    if success < 0 then
	    success = 0;
	elseif success > 100 then
	    success = 100;
	end

	if success <= 50 then
	    inv:AddItem("WPA.ShotPart1");
	elseif success <= 55 then
	    inv:AddItem("WPA.ShotPart2");
	elseif success <= 60 then
	    inv:AddItem("WPA.ShotPart3");
	elseif success <= 65 then
	    inv:AddItem("WPA.ShotPart4");
	elseif success <= 70 then
	    inv:AddItem("WPA.ShotPart5");
	elseif success >= 71 then
	
		local nz = ZombRand(0,10);
        local chance2 = ZombRand(1,3);
		
        if player:HasTrait("whandler") or player:HasTrait("whandler2") then
            nz = 7 + chance2;
	    elseif player:HasTrait("Lucky") then
	        nz = nz + chance2;
        elseif player:HasTrait("Unlucky") then
            nz = nz - chance2;
        end

        if nz < 0 then
	        nz = 0;
	    elseif nz > 10 then
	        nz = 10;
	    end
		
		if nz <= 7 then
		    inv:AddItem("WPA.ShotPart1");
			inv:AddItem("WPA.ShotPart2");
			inv:AddItem("WPA.ShotPart5");
		elseif nz == 8 then
		    inv:AddItem("WPA.ShotPart1");
			inv:AddItem("WPA.ShotPart2");
			inv:AddItem("WPA.ShotPart3");
			inv:AddItem("WPA.ShotPart5");
		elseif nz == 9 then
		    inv:AddItem("WPA.ShotPart1");
			inv:AddItem("WPA.ShotPart2");
			inv:AddItem("WPA.ShotPart3");
            inv:AddItem("WPA.ShotPart4");
		else
		    inv:AddItem("WPA.ShotPart1");
			inv:AddItem("WPA.ShotPart2");
			inv:AddItem("WPA.ShotPart3");
            inv:AddItem("WPA.ShotPart4");
            inv:AddItem("WPA.ShotPart5");
		end
	else
	    inv:AddItem("Base.Screws");
    end
end

function WPAShotgunSawnoff_OnTest(sourceItem, result)
    if sourceItem:getFullType() == "Base.ShotgunSawnoff" then
        return sourceItem:getCondition() == 0 and 
		    sourceItem:getCanon() == nil and 
			sourceItem:getSling() == nil and 
			sourceItem:getStock() == nil and 
			sourceItem:getScope() == nil and 
			sourceItem:getRecoilpad() == nil
    end
    return true
end

function WPAShotgunSawnoff_OnCreate(items, result, player)

    local player = getPlayer();
	local inv = player:getInventory();
    local success = ZombRand(0,100);
	local chance = ZombRand(20,33);

    if player:HasTrait("whandler") or player:HasTrait("whandler2") then
        success = 100;
	elseif player:HasTrait("Lucky") then
	    success = success + chance;
    elseif player:HasTrait("Unlucky") then
        success = success - chance;
    end

    if success < 0 then
	    success = 0;
	elseif success > 100 then
	    success = 100;
	end

	if success <= 50 then
	    inv:AddItem("WPA.ShotPart1");
	elseif success <= 55 then
	    inv:AddItem("WPA.ShotPart6");
	elseif success <= 60 then
	    inv:AddItem("WPA.ShotPart3");
	elseif success <= 65 then
	    inv:AddItem("WPA.ShotPart4");
	elseif success <= 70 then
	    inv:AddItem("WPA.ShotPart5");
	elseif success >= 71 then
	
		local nz = ZombRand(0,10);
        local chance2 = ZombRand(1,3);
		
        if player:HasTrait("whandler") or player:HasTrait("whandler2") then
            nz = 7 + chance2;
	    elseif player:HasTrait("Lucky") then
	        nz = nz + chance2;
        elseif player:HasTrait("Unlucky") then
            nz = nz - chance2;
        end

        if nz < 0 then
	        nz = 0;
	    elseif nz > 10 then
	        nz = 10;
	    end
		
		if nz <= 7 then
		    inv:AddItem("WPA.ShotPart1");
			inv:AddItem("WPA.ShotPart6");
			inv:AddItem("WPA.ShotPart5");
		elseif nz == 8 then
		    inv:AddItem("WPA.ShotPart1");
			inv:AddItem("WPA.ShotPart6");
			inv:AddItem("WPA.ShotPart3");
			inv:AddItem("WPA.ShotPart5");
		elseif nz == 9 then
		    inv:AddItem("WPA.ShotPart1");
			inv:AddItem("WPA.ShotPart6");
			inv:AddItem("WPA.ShotPart3");
            inv:AddItem("WPA.ShotPart4");
		else
		    inv:AddItem("WPA.ShotPart1");
			inv:AddItem("WPA.ShotPart6");
			inv:AddItem("WPA.ShotPart3");
            inv:AddItem("WPA.ShotPart4");
            inv:AddItem("WPA.ShotPart5");
		end
	else
	    inv:AddItem("Base.Screws");
    end
end
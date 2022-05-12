function AM_FiveXP_Weapons(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Aiming, 5);
	player:getXp():AddXP(Perks.Reloading, 5);
	player:getXp():AddXP(Perks.BluntMaintenance, 5);
	player:getXp():AddXP(Perks.Woodwork, 5);
end

function AM_3XP_Weapons(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Reloading, 3);
end

function AMMakeWeapon_OnCreate(items, result, player)
    local hammer = player:getInventory():contains("Hammer");

    if instanceof(result, "HandWeapon") then
        local condPerc = ZombRand(5 + (player:getPerkLevel(Perks.Woodwork) * 5), 10 + (player:getPerkLevel(Perks.Woodwork) * 10));
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
require "XpSystem/XpUpdate";

xpUpdate.addpmrmrecipes = function(owner, checkstate)
	local recipestolearn = {};
	recipestolearn.recipes = {
		"Make FrontCarDoor1",
		"Make FrontCarDoor2",
		"Make FrontCarDoor3",
		"Make RearCarDoor1",
		"Make RearCarDoor2",
		"Make RearCarDoor3",
		"Make RearCarDoorDouble1",
		"Make RearCarDoorDouble2",
		"Make RearCarDoorDouble3",
		"Make SmallGasTank1",
		"Make SmallGasTank2",
		"Make SmallGasTank3",
		"Make NormalGasTank1",
		"Make NormalGasTank2",
		"Make NormalGasTank3",
		"Make BigGasTank1",
		"Make BigGasTank2",
		"Make BigGasTank3",
		"Make OldCarMuffler1",
		"Make OldCarMuffler2",
		"Make OldCarMuffler3",
		"Make NormalCarMuffler1",
		"Make NormalCarMuffler2",
		"Make NormalCarMuffler3",
		"Make ModernCarMuffler1",
		"Make ModernCarMuffler2",
		"Make ModernCarMuffler3",
		"Make TrunkDoor1",
		"Make TrunkDoor2",
		"Make TrunkDoor3",
		"Make Windshield1",
		"Make Windshield2",
		"Make Windshield3",
		"Make RearWindshield1",
		"Make RearWindshield2",
		"Make RearWindshield3",
		"Make FrontWindow1",
		"Make FrontWindow2",
		"Make FrontWindow3",
		"Make RearWindow1",
		"Make RearWindow2",
		"Make RearWindow3"
	}

	if recipestolearn then
		local index = 0;
		for i=1,#recipestolearn.recipes do
			index = index +1;
			local rcp = tostring(recipestolearn.recipes[index])
			if owner:isRecipeKnown(rcp) then
				--nothing
			else
				owner:getKnownRecipes():add(rcp);
			end
		end
		if checkstate == nil then
			if luautils.okRichModal then
				owner:playSound("EasterEggDito");
				luautils.okRichModal(" <CENTRE> <SIZE:medium>" .. getText("ContextMenu_NewContent") .. " <LINE> <IMAGECENTRE:media/ui/ContentUnlock.png> <LINE> <TEXT>" .. getText("ContextMenu_NewRecipesAvailable").. " <LINE>" .. getText("ContextMenu_TotalNewRecipes") .. " <RGB:0,0.8,0>" .. tostring(#recipestolearn.recipes), true, 320, 220);
			end
		end
	end
end
-- when you gain a level you could win or lose perks
xpUpdate.pmrmlevelPerk = function(owner, perk, level, addBuffer)
	-- first Strength skill, grant you some traits that gonna help you to carry more stuff, hitting harder, etc.
	if perk == Perks.Mechanics then
        -- now we add trait depending on your current lvl
        if level == 10 then
			if owner:getPerkLevel(Perks.MetalWelding) == 10 then
				if owner:HasTrait("Plater") then
					--nothing
				else
					owner:getTraits():add("Plater");
					xpUpdate.addpmrmrecipes(owner, nil);
				end
			end
        end
	end

	if perk == Perks.MetalWelding then
        -- now we add trait depending on your current lvl
        if level == 10 then
			if owner:getPerkLevel(Perks.Mechanics) == 10 then
				if owner:HasTrait("Plater") then
					--nothing
				else
					owner:getTraits():add("Plater");
					xpUpdate.addpmrmrecipes(owner, nil);
				end
			end
        end
	end

	-- we reset the xp multiplier for this perk
--	owner:getXp():getMultiplierMap():remove(perk);

	-- we add a "buffer" xp, so if you just get your lvl but you're still losing xp (if you've been lazy for a moment), you won't lose your lvl at the next tick
	if addBuffer then
--		owner:getXp():AddXP(perk, 5, false);
	end
end

Events.LevelPerk.Add(xpUpdate.pmrmlevelPerk);


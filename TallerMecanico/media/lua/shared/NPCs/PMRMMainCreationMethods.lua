-- Made by Snake

PMRMBaseGameCharacterDetails = {}

PMRMBaseGameCharacterDetails.DoTraits = function()

	local Plater = TraitFactory.addTrait("Plater", getText("UI_trait_Plater"), 0, getText("UI_trait_Platerdesc"), true);
	Plater:getFreeRecipes():add("Make FrontCarDoor1");
	Plater:getFreeRecipes():add("Make FrontCarDoor2");
	Plater:getFreeRecipes():add("Make FrontCarDoor3");
	Plater:getFreeRecipes():add("Make RearCarDoor1");
	Plater:getFreeRecipes():add("Make RearCarDoor2");
	Plater:getFreeRecipes():add("Make RearCarDoor3");
	Plater:getFreeRecipes():add("Make RearCarDoorDouble1");
	Plater:getFreeRecipes():add("Make RearCarDoorDouble2");
	Plater:getFreeRecipes():add("Make RearCarDoorDouble3");
	Plater:getFreeRecipes():add("Make SmallGasTank1");
	Plater:getFreeRecipes():add("Make SmallGasTank2");
	Plater:getFreeRecipes():add("Make SmallGasTank3");
	Plater:getFreeRecipes():add("Make NormalGasTank1");
	Plater:getFreeRecipes():add("Make NormalGasTank2");
	Plater:getFreeRecipes():add("Make NormalGasTank3");
	Plater:getFreeRecipes():add("Make BigGasTank1");
	Plater:getFreeRecipes():add("Make BigGasTank2");
	Plater:getFreeRecipes():add("Make BigGasTank3");
	Plater:getFreeRecipes():add("Make OldCarMuffler1");
	Plater:getFreeRecipes():add("Make OldCarMuffler2");
	Plater:getFreeRecipes():add("Make OldCarMuffler3");
	Plater:getFreeRecipes():add("Make NormalCarMuffler1");
	Plater:getFreeRecipes():add("Make NormalCarMuffler2");
	Plater:getFreeRecipes():add("Make NormalCarMuffler3");
	Plater:getFreeRecipes():add("Make ModernCarMuffler1");
	Plater:getFreeRecipes():add("Make ModernCarMuffler2");
	Plater:getFreeRecipes():add("Make ModernCarMuffler3");
	Plater:getFreeRecipes():add("Make TrunkDoor1");
	Plater:getFreeRecipes():add("Make TrunkDoor2");
	Plater:getFreeRecipes():add("Make TrunkDoor3");
	Plater:getFreeRecipes():add("Make Windshield1");
	Plater:getFreeRecipes():add("Make Windshield2");
	Plater:getFreeRecipes():add("Make Windshield3");
	Plater:getFreeRecipes():add("Make RearWindshield1");
	Plater:getFreeRecipes():add("Make RearWindshield2");
	Plater:getFreeRecipes():add("Make RearWindshield3");
	Plater:getFreeRecipes():add("Make FrontWindow1");
	Plater:getFreeRecipes():add("Make FrontWindow2");
	Plater:getFreeRecipes():add("Make FrontWindow3");
	Plater:getFreeRecipes():add("Make RearWindow1");
	Plater:getFreeRecipes():add("Make RearWindow2");
	Plater:getFreeRecipes():add("Make RearWindow3");

	TraitFactory.sortList();

end

PMRMBaseGameCharacterDetails.checkstate  = function()
	local pl = getSpecificPlayer(0);
	local mw = pl:getPerkLevel(Perks.MetalWelding);
	local mc = pl:getPerkLevel(Perks.Mechanics);
	if pl:HasTrait("Plater") then
		xpUpdate.addpmrmrecipes(pl, true)
	elseif mw == 10 and mc == 10 then
		pl:getTraits():add("Plater");
		xpUpdate.addpmrmrecipes(pl, nil)
	end
end

Events.OnGameBoot.Add(PMRMBaseGameCharacterDetails.DoTraits);
Events.OnGameStart.Add(PMRMBaseGameCharacterDetails.checkstate);

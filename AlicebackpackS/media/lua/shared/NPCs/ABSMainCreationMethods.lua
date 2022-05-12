-- Made by Snake

ABSBaseGameCharacterDetails = {}

ABSBaseGameCharacterDetails.DoTraits = function()
    TraitFactory.addTrait("Strongback", getText("UI_trait_Strongback"), 4, getText("UI_trait_StrongbackDesc"), false, false);
	TraitFactory.addTrait("Metalstrongback", getText("UI_trait_Metalstrongback"), 6, getText("UI_trait_MetalstrongbackDesc"), false, false);
	TraitFactory.addTrait("Metalstrongback2", getText("UI_trait_Metalstrongback"), 0, getText("UI_trait_MetalstrongbackDesc"), true);
	TraitFactory.addTrait("Strongback2", getText("UI_trait_Strongback"), 0, getText("UI_trait_StrongbackDesc"), true);
	
	TraitFactory.setMutualExclusive("Strongback", "Metalstrongback");
	TraitFactory.setMutualExclusive("Strongback2", "Metalstrongback");
	TraitFactory.setMutualExclusive("Strongback2", "Strongback");
	TraitFactory.setMutualExclusive("Metalstrongback2", "Strongback");
	TraitFactory.setMutualExclusive("Metalstrongback2", "Metalstrongback");
	TraitFactory.setMutualExclusive("Metalstrongback2", "Strongback2");

	-- MUTUALLY EXCLUSIVE STRONGBACK
	TraitFactory.setMutualExclusive("Strongback", "Very Underweight");
	TraitFactory.setMutualExclusive("Strongback", "Weak");
	TraitFactory.setMutualExclusive("Strongback", "Feeble");
	TraitFactory.setMutualExclusive("Strongback", "Unfit");
	-- MUTUALLY EXCLUSIVE STRONGBACK2
	TraitFactory.setMutualExclusive("Strongback2", "Very Underweight");
	TraitFactory.setMutualExclusive("Strongback2", "Weak");
	TraitFactory.setMutualExclusive("Strongback2", "Feeble");
	TraitFactory.setMutualExclusive("Strongback2", "Unfit");
	-- MUTUALLY EXCLUSIVE METALSTRONGBACK
	TraitFactory.setMutualExclusive("Metalstrongback", "Very Underweight");
	TraitFactory.setMutualExclusive("Metalstrongback", "Underweight");
	TraitFactory.setMutualExclusive("Metalstrongback", "Weak");
	TraitFactory.setMutualExclusive("Metalstrongback", "Feeble");
	TraitFactory.setMutualExclusive("Metalstrongback", "Unfit");
	TraitFactory.setMutualExclusive("Metalstrongback", "Out of Shape");
	-- MUTUALLY EXCLUSIVE METALSTRONGBACK2
	TraitFactory.setMutualExclusive("Metalstrongback2", "Very Underweight");
	TraitFactory.setMutualExclusive("Metalstrongback2", "Underweight");
	TraitFactory.setMutualExclusive("Metalstrongback2", "Weak");
	TraitFactory.setMutualExclusive("Metalstrongback2", "Feeble");
	TraitFactory.setMutualExclusive("Metalstrongback2", "Unfit");
	TraitFactory.setMutualExclusive("Metalstrongback2", "Out of Shape");

	TraitFactory.sortList();
	
end

ABSBaseGameCharacterDetails.DoProfessions = function()

    local veteran = ProfessionFactory.getProfession("veteran");
	veteran:addFreeTrait("Metalstrongback2");

    local lumberjack = ProfessionFactory.getProfession("lumberjack");
	lumberjack:addFreeTrait("Metalstrongback2");

    local fitnessInstructor = ProfessionFactory.getProfession("fitnessInstructor");
	fitnessInstructor:addFreeTrait("Strongback2");

	local profList = ProfessionFactory.getProfessions()
	for i=1,profList:size() do
		local prof = profList:get(i-1)
		BaseGameCharacterDetails.SetProfessionDescription(prof)
	end
end

ABSBaseGameCharacterDetails.checkstate  = function(playernum, character)
	local player = getSpecificPlayer(playernum);
	if player:getDescriptor():getProfession() == "veteran" or player:getDescriptor():getProfession() == "lumberjack" then
		--Rasgos
		if not player:HasTrait("Metalstrongback2") then
			player:getTraits():add("Metalstrongback2");
		end
	elseif player:getDescriptor():getProfession() == "fitnessInstructor" then
		--Rasgos
		if not player:HasTrait("Strongback2") then
			player:getTraits():add("Strongback2");
		end
	end
	if player:HasTrait("Strongback") or player:HasTrait("Strongback2") then
		player:setMaxWeightBase(player:getMaxWeightBase() * 1.25);
	elseif player:HasTrait("Metalstrongback") or player:HasTrait("Metalstrongback2") then
	    player:setMaxWeightBase(player:getMaxWeightBase() * 1.5);
	end
end

Events.OnGameBoot.Add(ABSBaseGameCharacterDetails.DoTraits);
Events.OnGameBoot.Add(ABSBaseGameCharacterDetails.DoProfessions);
Events.OnCreatePlayer.Add(ABSBaseGameCharacterDetails.checkstate)
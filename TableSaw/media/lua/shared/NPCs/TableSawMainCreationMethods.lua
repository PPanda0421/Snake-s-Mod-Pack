-- Made by Snake

TSBaseGameCharacterDetails = {}

TSBaseGameCharacterDetails.DoTraits = function()
	
	local mcloggingfree = TraitFactory.addTrait("mclogging", getText("UI_trait_mclogging"), 0, getText("UI_trait_mcloggingDesc"), true);
	mcloggingfree:getFreeRecipes():add("Craft Table Saw");
	
	local mclogging = TraitFactory.addTrait("mclogging2", getText("UI_trait_mclogging"), 2, getText("UI_trait_mcloggingDesc"), false);
	mclogging:getFreeRecipes():add("Craft Table Saw");

	TraitFactory.setMutualExclusive("mclogging", "mclogging2");

    TraitFactory.sortList();
end

TSBaseGameCharacterDetails.DoProfessions = function()

    local carpenter = ProfessionFactory.getProfession("carpenter");
	carpenter:addFreeTrait("mclogging");

	local profList = ProfessionFactory.getProfessions()
	for i=1,profList:size() do
		local prof = profList:get(i-1)
		BaseGameCharacterDetails.SetProfessionDescription(prof)
	end
end

TSBaseGameCharacterDetails.checkstate  = function()
	local player = getSpecificPlayer(0);
	if player:getDescriptor():getProfession() == "carpenter" then
		--Rasgos
		if not player:HasTrait("mclogging") then
			player:getTraits():add("mclogging");
		end
		--Recetas de mclogging
		TSBaseGameCharacterDetails.AddmcloggingRecipes(player);
	end
end

function TSBaseGameCharacterDetails:AddmcloggingRecipes(player)
	local pl = player;
	local plrecipe;
	if pl ~= nil then
		plrecipe = pl:getKnownRecipes();
	end
	if plrecipe == nil then
		plrecipe = getPlayer():getKnownRecipes();
	end
	if not plrecipe:contains("Craft Table Saw") then
		plrecipe:add("Craft Table Saw");
	end
end

Events.OnGameBoot.Add(TSBaseGameCharacterDetails.DoTraits);
Events.OnGameBoot.Add(TSBaseGameCharacterDetails.DoProfessions);
Events.OnGameStart.Add(TSBaseGameCharacterDetails.checkstate);
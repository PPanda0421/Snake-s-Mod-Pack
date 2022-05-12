-- Made by Snake

WPABaseGameCharacterDetails = {}

WPABaseGameCharacterDetails.DoTraits = function()

	local Silmaker = TraitFactory.addTrait("Silmaker", getText("UI_trait_Silmaker"), 0, getText("UI_trait_Silmakerdesc"), true);
	Silmaker:getFreeRecipes():add("Craft sponge tube");
	Silmaker:getFreeRecipes():add("Craft Silencer");
	Silmaker:getFreeRecipes():add("Craft Rifle Silencer");

	local Whandler = TraitFactory.addTrait("whandler", getText("UI_trait_whandler"), 0, getText("UI_trait_whandlerdesc"), true);
    Whandler:getFreeRecipes():add("Make laser light combo");
	Whandler:getFreeRecipes():add("Make military tactical scope");
	Whandler:getFreeRecipes():add("Make shotgun laser light combo");
    Whandler:getFreeRecipes():add("Dismantle tactical flashlight");
	Whandler:getFreeRecipes():add("Dismantle laser");
    Whandler:getFreeRecipes():add("Dismantle stealth tactical scope");
	Whandler:getFreeRecipes():add("Dismantle shotgun tactical light");

	local Whandler2 = TraitFactory.addTrait("whandler2", getText("UI_trait_whandler"), 4, getText("UI_trait_whandlerdesc"), false);
    Whandler2:getFreeRecipes():add("Make laser light combo");
	Whandler2:getFreeRecipes():add("Make military tactical scope");
	Whandler2:getFreeRecipes():add("Make shotgun laser light combo");
    Whandler2:getFreeRecipes():add("Dismantle tactical flashlight");
	Whandler2:getFreeRecipes():add("Dismantle laser");
    Whandler2:getFreeRecipes():add("Dismantle stealth tactical scope");
	Whandler2:getFreeRecipes():add("Dismantle shotgun tactical light");

    TraitFactory.setMutualExclusive("whandler", "whandler2");

	TraitFactory.sortList();

end

WPABaseGameCharacterDetails.DoProfessions = function()

    local engineer = ProfessionFactory.getProfession("engineer");
    engineer:addFreeTrait("Silmaker");
	engineer:addFreeTrait("whandler");

    local burglar = ProfessionFactory.getProfession("burglar");
    burglar:addFreeTrait("Silmaker");
	
    if SWPBaseGameCharacterDetails or AMBaseGameCharacterDetails then
	    local ammospecialist = ProfessionFactory.getProfession("ammospecialist");
		ammospecialist:addFreeTrait("whandler");	
	end

	local profList = ProfessionFactory.getProfessions()
	for i=1,profList:size() do
		local prof = profList:get(i-1)
		BaseGameCharacterDetails.SetProfessionDescription(prof)
	end
end

WPABaseGameCharacterDetails.checkstate  = function()
	--local player = getSpecificPlayer(0);
	--if player:HasTrait("whandler") or player:HasTrait("whandler2") then
	WPABaseGameCharacterDetails.RemoveObsoleteRecipes();
	--end
	
end
function WPABaseGameCharacterDetails:RemoveObsoleteRecipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	if plrecipe:contains("Dismantle pistol") then
		plrecipe:remove("Dismantle pistol");
	end
	if plrecipe:contains("Make pistol") then
		plrecipe:remove("Make pistol");
	end
	if plrecipe:contains("Dismantle Varmint Rifle") then
		plrecipe:remove("Dismantle Varmint Rifle");
	end
	if plrecipe:contains("Make Varmint Rifle") then
		plrecipe:remove("Make Varmint Rifle");
	end
	if plrecipe:contains("Dismantle Hunting Rifle") then
		plrecipe:remove("Dismantle Hunting Rifle");
	end
	if plrecipe:contains("Make Hunting Rifle") then
		plrecipe:remove("Make Hunting Rifle");
	end
	if plrecipe:contains("Dismantle Shotgun") then
		plrecipe:remove("Dismantle Shotgun");
	end
	if plrecipe:contains("Make Shotgun") then
		plrecipe:remove("Make Shotgun");
	end
	if plrecipe:contains("Dismantle Sawn Off Shotgun") then
		plrecipe:remove("Dismantle Sawn Off Shotgun");
	end
	if plrecipe:contains("Make Sawn Off Shotgun") then
		plrecipe:remove("Make Sawn Off Shotgun");
	end
end
Events.OnGameBoot.Add(WPABaseGameCharacterDetails.DoTraits);
Events.OnGameBoot.Add(WPABaseGameCharacterDetails.DoProfessions);
Events.OnGameStart.Add(WPABaseGameCharacterDetails.checkstate);

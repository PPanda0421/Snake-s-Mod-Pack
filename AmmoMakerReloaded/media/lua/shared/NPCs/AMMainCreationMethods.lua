-- Made by Snake

AMBaseGameCharacterDetails = {}

AMBaseGameCharacterDetails.DoTraits = function()
	
	local gunnuts = TraitFactory.addTrait("Gunnut", getText("UI_trait_gunnut"), 0, getText("UI_trait_gunnutdesc"), true);
	gunnuts:getFreeRecipes():add("Fix reloading tool");
	gunnuts:getFreeRecipes():add("Make liquid lead");
	gunnuts:getFreeRecipes():add("Make 9mm liquid lead");
	gunnuts:getFreeRecipes():add("Make cal.223 liquid lead");
	gunnuts:getFreeRecipes():add("Make cal.308 liquid lead");
	gunnuts:getFreeRecipes():add("Make pellets liquid lead");
	gunnuts:getFreeRecipes():add("Make 556x45mm liquid lead");
	gunnuts:getFreeRecipes():add("Make cal.38 liquid lead");
	gunnuts:getFreeRecipes():add("Make cal.44 liquid lead");
	gunnuts:getFreeRecipes():add("Make cal.45 liquid lead");
	gunnuts:getFreeRecipes():add("Make 762x39mm liquid lead");
	gunnuts:getFreeRecipes():add("Make 9mm Lead");
	gunnuts:getFreeRecipes():add("Make 9mm bullets");
	gunnuts:getFreeRecipes():add("Make cal.223 Lead");
	gunnuts:getFreeRecipes():add("Make bullets cal.223");
	gunnuts:getFreeRecipes():add("Make cal.308 Lead");
	gunnuts:getFreeRecipes():add("Make bullets cal.308");
	gunnuts:getFreeRecipes():add("Make shotgun pellets");
	gunnuts:getFreeRecipes():add("Make shotgun shells");
	gunnuts:getFreeRecipes():add("Make 556x45mm Lead");
	gunnuts:getFreeRecipes():add("Make 556x45mm bullets");
	gunnuts:getFreeRecipes():add("Make cal.38 Lead");
	gunnuts:getFreeRecipes():add("Make bullets cal.38");
	gunnuts:getFreeRecipes():add("Make cal.44 Lead");
	gunnuts:getFreeRecipes():add("Make bullets cal.44");
	gunnuts:getFreeRecipes():add("Make cal.45 Lead");
	gunnuts:getFreeRecipes():add("Make bullets cal.45");
	gunnuts:getFreeRecipes():add("Make 762x39mm Lead");
	gunnuts:getFreeRecipes():add("Make 762x39mm bullets");
	gunnuts:getFreeRecipes():add("Craft Reloading Table");
	gunnuts:getFreeRecipes():add("Dismantle weapons");
	gunnuts:getFreeRecipes():add("Ensamble M9");
	gunnuts:getFreeRecipes():add("Ensamble M1911");
	gunnuts:getFreeRecipes():add("Ensamble DE");
	gunnuts:getFreeRecipes():add("Ensamble Revolver");
	gunnuts:getFreeRecipes():add("Ensamble Revolver Long");
	gunnuts:getFreeRecipes():add("Ensamble Revolver Short");
	gunnuts:getFreeRecipes():add("Ensamble Revolver Shotgun");
	gunnuts:getFreeRecipes():add("Ensamble DoubleBarrelShotgun");
	gunnuts:getFreeRecipes():add("Ensamble VarmintRifle");
	gunnuts:getFreeRecipes():add("Ensamble HuntingRifle");
	gunnuts:getFreeRecipes():add("Ensamble AssaultRifle");
	gunnuts:getFreeRecipes():add("Ensamble AssaultRifle2");
	gunnuts:getFreeRecipes():add("Ensamble AK47");

	local leadwork2 = TraitFactory.addTrait("Leadwork2", getText("UI_trait_Leadwork2"), 2, getText("UI_trait_Leadwork2desc"), false);
    leadwork2:getFreeRecipes():add("Make liquid lead");
	leadwork2:getFreeRecipes():add("Make 9mm liquid lead");
	leadwork2:getFreeRecipes():add("Make cal.223 liquid lead");
	leadwork2:getFreeRecipes():add("Make cal.308 liquid lead");
	leadwork2:getFreeRecipes():add("Make pellets liquid lead");
	leadwork2:getFreeRecipes():add("Make 556x45mm liquid lead");
	leadwork2:getFreeRecipes():add("Make cal.38 liquid lead");
	leadwork2:getFreeRecipes():add("Make cal.44 liquid lead");
	leadwork2:getFreeRecipes():add("Make cal.45 liquid lead");
	leadwork2:getFreeRecipes():add("Make 762x39mm liquid lead");

	local leadwork = TraitFactory.addTrait("Leadwork", getText("UI_trait_Leadwork"), 0, getText("UI_trait_Leadworkdesc"), true);
	leadwork:getFreeRecipes():add("Fix reloading tool");
	leadwork:getFreeRecipes():add("Make liquid lead");
	leadwork:getFreeRecipes():add("Make 9mm liquid lead");
	leadwork:getFreeRecipes():add("Make cal.223 liquid lead");
	leadwork:getFreeRecipes():add("Make cal.308 liquid lead");
	leadwork:getFreeRecipes():add("Make pellets liquid lead");
	leadwork:getFreeRecipes():add("Make 556x45mm liquid lead");
	leadwork:getFreeRecipes():add("Make cal.38 liquid lead");
	leadwork:getFreeRecipes():add("Make cal.44 liquid lead");
	leadwork:getFreeRecipes():add("Make cal.45 liquid lead");
	leadwork:getFreeRecipes():add("Make 762x39mm liquid lead");

	local leadwork3 = TraitFactory.addTrait("Leadwork3", getText("UI_trait_Leadwork3"), 0, getText("UI_trait_Leadwork3desc"), true);
    leadwork3:getFreeRecipes():add("Make liquid lead");
	leadwork3:getFreeRecipes():add("Make 9mm liquid lead");
	leadwork3:getFreeRecipes():add("Make cal.223 liquid lead");
	leadwork3:getFreeRecipes():add("Make cal.308 liquid lead");
	leadwork3:getFreeRecipes():add("Make pellets liquid lead");
	leadwork3:getFreeRecipes():add("Make 556x45mm liquid lead");
	leadwork3:getFreeRecipes():add("Make cal.38 liquid lead");
	leadwork3:getFreeRecipes():add("Make cal.44 liquid lead");
	leadwork3:getFreeRecipes():add("Make cal.45 liquid lead");
	leadwork3:getFreeRecipes():add("Make 762x39mm liquid lead");


	local reloader = TraitFactory.addTrait("Reloader", getText("UI_trait_Reloader"), 0, getText("UI_trait_Reloaderdesc"), true);
	reloader:addXPBoost(Perks.AMReloading, 1);
	reloader:getFreeRecipes():add("Make 9mm Lead");
	reloader:getFreeRecipes():add("Make 9mm bullets");

	local shotgunman = TraitFactory.addTrait("Shotgunman", getText("UI_trait_shotgunman"), 4, getText("UI_trait_shotgunmandesc"), false);
	shotgunman:addXPBoost(Perks.Aiming, 1);
	shotgunman:getFreeRecipes():add("Make shotgun pellets");
	shotgunman:getFreeRecipes():add("Make shotgun shells");

	local reloaderint = TraitFactory.addTrait("Reloaderint", getText("UI_trait_Reloaderint"), 8, getText("UI_trait_Reloaderintdesc"), false);
	reloaderint:addXPBoost(Perks.AMReloading, 2);
	reloaderint:getFreeRecipes():add("Make 9mm Lead");
	reloaderint:getFreeRecipes():add("Make 9mm bullets");
	reloaderint:getFreeRecipes():add("Make cal.223 Lead");
	reloaderint:getFreeRecipes():add("Make cal.308 Lead");
	reloaderint:getFreeRecipes():add("Make bullets cal.223");
	reloaderint:getFreeRecipes():add("Make bullets cal.308");

	local reloaderint2 = TraitFactory.addTrait("Reloaderint2", getText("UI_trait_Reloaderint"), 0, getText("UI_trait_Reloaderintdesc"), true);
	reloaderint2:addXPBoost(Perks.AMReloading, 2);
	reloaderint2:getFreeRecipes():add("Make 9mm Lead");
	reloaderint2:getFreeRecipes():add("Make 9mm bullets");
	reloaderint2:getFreeRecipes():add("Make cal.223 Lead");
	reloaderint2:getFreeRecipes():add("Make cal.308 Lead");
	reloaderint2:getFreeRecipes():add("Make bullets cal.223");
	reloaderint2:getFreeRecipes():add("Make bullets cal.308");

	local militaryreloader = TraitFactory.addTrait("militaryreloader", getText("UI_trait_militaryreloader"), 0, getText("UI_trait_militaryreloaderdesc"), true);
	militaryreloader:getFreeRecipes():add("Dismantle weapons");
	militaryreloader:getFreeRecipes():add("Ensamble M9");
	militaryreloader:getFreeRecipes():add("Ensamble M1911");
	militaryreloader:getFreeRecipes():add("Ensamble DE");
	militaryreloader:getFreeRecipes():add("Ensamble Revolver");
	militaryreloader:getFreeRecipes():add("Ensamble Revolver Long");
	militaryreloader:getFreeRecipes():add("Ensamble Revolver Short");
	militaryreloader:getFreeRecipes():add("Ensamble Revolver Shotgun");
	militaryreloader:getFreeRecipes():add("Ensamble DoubleBarrelShotgun");
	militaryreloader:getFreeRecipes():add("Ensamble VarmintRifle");
	militaryreloader:getFreeRecipes():add("Ensamble HuntingRifle");
	militaryreloader:getFreeRecipes():add("Ensamble AssaultRifle");
	militaryreloader:getFreeRecipes():add("Ensamble AssaultRifle2");
	militaryreloader:getFreeRecipes():add("Ensamble AK47");

	local recicler = TraitFactory.addTrait("wrecicler", getText("UI_trait_wrecicler"), 0, getText("UI_trait_wreciclerdesc"), true);
	local recicler2 = TraitFactory.addTrait("wrecicler2", getText("UI_trait_wrecicler"), 4, getText("UI_trait_wreciclerdesc"), false);
	local recicler3 = TraitFactory.addTrait("wrecicler3", getText("UI_trait_wrecicler3"), -4, getText("UI_trait_wrecicler3desc"), false);
	
	local ammocount = TraitFactory.addTrait("ammocount", getText("UI_trait_ammocount"), 0, getText("UI_trait_ammocountdesc"), true);
	local ammocount2 = TraitFactory.addTrait("ammocount2", getText("UI_trait_ammocount"), 3, getText("UI_trait_ammocountdesc"), false);
	
	TraitFactory.setMutualExclusive("ammocount", "ammocount2");
	TraitFactory.setMutualExclusive("ammocount", "Deaf");
	TraitFactory.setMutualExclusive("ammocount2", "Deaf");
	TraitFactory.setMutualExclusive("ammocount", "HardOfHearing");
	TraitFactory.setMutualExclusive("ammocount2", "HardOfHearing");
	TraitFactory.setMutualExclusive("wrecicler", "wrecicler2");
	TraitFactory.setMutualExclusive("wrecicler", "wrecicler3");
	TraitFactory.setMutualExclusive("wrecicler2", "wrecicler3");
	TraitFactory.setMutualExclusive("Gunnut", "wrecicler3");
	TraitFactory.setMutualExclusive("Gunnut", "wrecicler2");
	TraitFactory.setMutualExclusive("Gunnut", "wrecicler");
	TraitFactory.setMutualExclusive("Gunnut", "Shotgunman");
	TraitFactory.setMutualExclusive("Gunnut", "Reloaderint");
	TraitFactory.setMutualExclusive("Gunnut", "Reloaderint2");
	TraitFactory.setMutualExclusive("Gunnut", "Leadwork2");
	TraitFactory.setMutualExclusive("Gunnut", "Leadwork3");
	TraitFactory.setMutualExclusive("Reloaderint", "Reloaderint2");
	TraitFactory.setMutualExclusive("Leadwork", "Leadwork2");
	TraitFactory.setMutualExclusive("Leadwork", "Leadwork3");
	TraitFactory.setMutualExclusive("Leadwork2", "Leadwork3");

	TraitFactory.sortList();
	
end

AMBaseGameCharacterDetails.DoProfessions = function()

    local repairman = ProfessionFactory.getProfession("repairman");
	repairman:addFreeTrait("Leadwork");

    local metalworker = ProfessionFactory.getProfession("metalworker");
	metalworker:addFreeTrait("Leadwork3");

    local engineer = ProfessionFactory.getProfession("engineer");
	engineer:addFreeTrait("Reloader");

    local veteran = ProfessionFactory.getProfession("veteran");
	veteran:addFreeTrait("Reloaderint2");
	veteran:addFreeTrait("wrecicler");
	veteran:addFreeTrait("militaryreloader");

	local ammospecialist = ProfessionFactory.addProfession("ammospecialist", getText("UI_prof_ammospecialist"), "profession_ammospecialist", -6);
	ammospecialist:addXPBoost(Perks.Aiming, 2);
	ammospecialist:addXPBoost(Perks.AMReloading, 3);
	ammospecialist:addFreeTrait("Gunnut");
	ammospecialist:addFreeTrait("ammocount");

	local profList = ProfessionFactory.getProfessions()
	for i=1,profList:size() do
		local prof = profList:get(i-1)
		BaseGameCharacterDetails.SetProfessionDescription(prof)
	end
end

AMBaseGameCharacterDetails.checkstate  = function()
	local player = getPlayer();
	if player:getDescriptor():getProfession() == "ammospecialist" then
		if not player:HasTrait("Gunnut") then
			player:getTraits():add("Gunnut");
		end
		if not player:HasTrait("ammocount") then
			player:getTraits():add("ammocount");
		end
		AMBaseGameCharacterDetails.AddGunnutRecipes();
	elseif player:getDescriptor():getProfession() == "veteran" then
		if not player:HasTrait("Reloaderint2") then
			player:getTraits():add("Reloaderint2");
		end
		if not player:HasTrait("wrecicler") then
			player:getTraits():add("wrecicler");
		end
		if not player:HasTrait("militaryreloader") then
			player:getTraits():add("militaryreloader");
		end
		if not player:HasTrait("ammocount") then
			player:getTraits():add("ammocount");
		end
		AMBaseGameCharacterDetails.AddReloaderint2Recipes();
		AMBaseGameCharacterDetails.AddmilitaryreloaderRecipes();
	elseif player:HasTrait("Leadwork") or player:HasTrait("Leadwork2") or player:HasTrait("Leadwork3")then
		AMBaseGameCharacterDetails.AddLeadWorkRecipes();
	end
end

function AMBaseGameCharacterDetails:AddGunnutRecipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	if not plrecipe:contains("Fix reloading tool") then
		plrecipe:add("Fix reloading tool");
	end
	if not plrecipe:contains("Make liquid lead") then
		plrecipe:add("Make liquid lead");
	end
	if not plrecipe:contains("Make 9mm liquid lead") then
		plrecipe:add("Make 9mm liquid lead");
	end
	if not plrecipe:contains("Make cal.223 liquid lead") then
		plrecipe:add("Make cal.223 liquid lead");
	end
	if not plrecipe:contains("Make cal.308 liquid lead") then
		plrecipe:add("Make cal.308 liquid lead");
	end
	if not plrecipe:contains("Make pellets liquid lead") then
		plrecipe:add("Make pellets liquid lead");
	end
	if not plrecipe:contains("Make 556x45mm liquid lead") then
		plrecipe:add("Make 556x45mm liquid lead");
	end
	if not plrecipe:contains("Make cal.38 liquid lead") then
		plrecipe:add("Make cal.38 liquid lead");
	end
	if not plrecipe:contains("Make cal.44 liquid lead") then
		plrecipe:add("Make cal.44 liquid lead");
	end
	if not plrecipe:contains("Make cal.45 liquid lead") then
		plrecipe:add("Make cal.45 liquid lead");
	end
	if not plrecipe:contains("Make 762x39mm liquid lead") then
		plrecipe:add("Make 762x39mm liquid lead");
	end
	if not plrecipe:contains("Make 9mm Lead") then
		plrecipe:add("Make 9mm Lead");
	end
	if not plrecipe:contains("Make 9mm bullets") then
		plrecipe:add("Make 9mm bullets");
	end
	if not plrecipe:contains("Make cal.223 Lead") then
		plrecipe:add("Make cal.223 Lead");
	end
	if not plrecipe:contains("Make bullets cal.223") then
		plrecipe:add("Make bullets cal.223");
	end
	if not plrecipe:contains("Make cal.308 Lead") then
		plrecipe:add("Make cal.308 Lead");
	end
	if not plrecipe:contains("Make bullets cal.308") then
		plrecipe:add("Make bullets cal.308");
	end
	if not plrecipe:contains("Make cal.38 Lead") then
		plrecipe:add("Make cal.38 Lead");
	end
	if not plrecipe:contains("Make bullets cal.38") then
		plrecipe:add("Make bullets cal.38");
	end
	if not plrecipe:contains("Make cal.44 Lead") then
		plrecipe:add("Make cal.44 Lead");
	end
	if not plrecipe:contains("Make bullets cal.44") then
		plrecipe:add("Make bullets cal.44");
	end
	if not plrecipe:contains("Make cal.45 Lead") then
		plrecipe:add("Make cal.45 Lead");
	end
	if not plrecipe:contains("Make bullets cal.45") then
		plrecipe:add("Make bullets cal.45");
	end
	if not plrecipe:contains("Make shotgun pellets") then
		plrecipe:add("Make shotgun pellets");
	end
	if not plrecipe:contains("Make shotgun shells") then
		plrecipe:add("Make shotgun shells");
	end
	if not plrecipe:contains("Make 556x45mm Lead") then
		plrecipe:add("Make 556x45mm Lead");
	end
	if not plrecipe:contains("Make 556x45mm bullets") then
		plrecipe:add("Make 556x45mm bullets");
	end
	if not plrecipe:contains("Make 762x39mm Lead") then
		plrecipe:add("Make 762x39mm Lead");
	end
	if not plrecipe:contains("Make 762x39mm bullets") then
		plrecipe:add("Make 762x39mm bullets");
	end
	if not plrecipe:contains("Craft Reloading Table") then
		plrecipe:add("Craft Reloading Table");
	end
	if not plrecipe:contains("Dismantle weapons") then
		plrecipe:add("Dismantle weapons");
	end
	if not plrecipe:contains("Ensamble M9") then
		plrecipe:add("Ensamble M9");
	end
	if not plrecipe:contains("Ensamble M1911") then
		plrecipe:add("Ensamble M1911");
	end
	if not plrecipe:contains("Ensamble DE") then
		plrecipe:add("Ensamble DE");
	end
	if not plrecipe:contains("Ensamble Revolver") then
		plrecipe:add("Ensamble Revolver");
	end
	if not plrecipe:contains("Ensamble Revolver Long") then
		plrecipe:add("Ensamble Revolver Long");
	end
	if not plrecipe:contains("Ensamble Revolver Short") then
		plrecipe:add("Ensamble Revolver Short");
	end
	if not plrecipe:contains("Ensamble Shotgun") then
		plrecipe:add("Ensamble Shotgun");
	end
	if not plrecipe:contains("Ensamble DoubleBarrelShotgun") then
		plrecipe:add("Ensamble DoubleBarrelShotgun");
	end
	if not plrecipe:contains("Ensamble VarmintRifle") then
		plrecipe:add("Ensamble VarmintRifle");
	end
	if not plrecipe:contains("Ensamble HuntingRifle") then
		plrecipe:add("Ensamble HuntingRifle");
	end
	if not plrecipe:contains("Ensamble AssaultRifle") then
		plrecipe:add("Ensamble AssaultRifle2");
	end
	if not plrecipe:contains("Ensamble AssaultRifle2") then
		plrecipe:add("Ensamble AssaultRifle2");
	end
	if not plrecipe:contains("Ensamble AK47") then
		plrecipe:add("Ensamble AK47");
	end
end

function AMBaseGameCharacterDetails:AddLeadWorkRecipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	if not plrecipe:contains("Make liquid lead") then
		plrecipe:add("Make liquid lead");
	end
	if not plrecipe:contains("Make 9mm liquid lead") then
		plrecipe:add("Make 9mm liquid lead");
	end
	if not plrecipe:contains("Make cal.223 liquid lead") then
		plrecipe:add("Make cal.223 liquid lead");
	end
	if not plrecipe:contains("Make cal.308 liquid lead") then
		plrecipe:add("Make cal.308 liquid lead");
	end
	if not plrecipe:contains("Make pellets liquid lead") then
		plrecipe:add("Make pellets liquid lead");
	end
	if not plrecipe:contains("Make 556x45mm liquid lead") then
		plrecipe:add("Make 556x45mm liquid lead");
	end
	if not plrecipe:contains("Make cal.38 liquid lead") then
		plrecipe:add("Make cal.38 liquid lead");
	end
	if not plrecipe:contains("Make cal.44 liquid lead") then
		plrecipe:add("Make cal.44 liquid lead");
	end
	if not plrecipe:contains("Make cal.45 liquid lead") then
		plrecipe:add("Make cal.45 liquid lead");
	end
	if not plrecipe:contains("Make 762x39mm liquid lead") then
		plrecipe:add("Make 762x39mm liquid lead");
	end
end

function AMBaseGameCharacterDetails:AddmilitaryreloaderRecipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	if not plrecipe:contains("Dismantle weapons") then
		plrecipe:add("Dismantle weapons");
	end
	if not plrecipe:contains("Ensamble M9") then
		plrecipe:add("Ensamble M9");
	end
	if not plrecipe:contains("Ensamble M1911") then
		plrecipe:add("Ensamble M1911");
	end
	if not plrecipe:contains("Ensamble DE") then
		plrecipe:add("Ensamble DE");
	end
	if not plrecipe:contains("Ensamble Revolver") then
		plrecipe:add("Ensamble Revolver");
	end
	if not plrecipe:contains("Ensamble Revolver Long") then
		plrecipe:add("Ensamble Revolver Long");
	end
	if not plrecipe:contains("Ensamble Revolver Short") then
		plrecipe:add("Ensamble Revolver Short");
	end
	if not plrecipe:contains("Ensamble Shotgun") then
		plrecipe:add("Ensamble Shotgun");
	end
	if not plrecipe:contains("Ensamble DoubleBarrelShotgun") then
		plrecipe:add("Ensamble DoubleBarrelShotgun");
	end
	if not plrecipe:contains("Ensamble VarmintRifle") then
		plrecipe:add("Ensamble VarmintRifle");
	end
	if not plrecipe:contains("Ensamble HuntingRifle") then
		plrecipe:add("Ensamble HuntingRifle");
	end
	if not plrecipe:contains("Ensamble AssaultRifle") then
		plrecipe:add("Ensamble AssaultRifle2");
	end
	if not plrecipe:contains("Ensamble AssaultRifle2") then
		plrecipe:add("Ensamble AssaultRifle2");
	end
	if not plrecipe:contains("Ensamble AK47") then
		plrecipe:add("Ensamble AK47");
	end
end

function AMBaseGameCharacterDetails:AddReloaderint2Recipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	if not plrecipe:contains("Make 9mm Lead") then
		plrecipe:add("Make 9mm Lead");
	end
	if not plrecipe:contains("Make 9mm bullets") then
		plrecipe:add("Make cal.223 Lead");
	end
	if not plrecipe:contains("Make cal.223 Lead") then
		plrecipe:add("Make cal.223 Lead");
	end
	if not plrecipe:contains("Make cal.308 Lead") then
		plrecipe:add("Make cal.308 Lead");
	end
	if not plrecipe:contains("Make bullets cal.223") then
		plrecipe:add("Make bullets cal.223");
	end
	if not plrecipe:contains("Make bullets cal.308") then
		plrecipe:add("Make bullets cal.308");
	end
end

Events.OnGameBoot.Add(AMBaseGameCharacterDetails.DoTraits);
Events.OnGameBoot.Add(AMBaseGameCharacterDetails.DoProfessions);
Events.OnGameStart.Add(AMBaseGameCharacterDetails.checkstate);
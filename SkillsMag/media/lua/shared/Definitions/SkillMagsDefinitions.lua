SkillMagsDefinitions = {};
--Sistema de datos de revistas de SkillMags.
SkillMagsDefinitions["SkillMagSprint"] = {perk= {Perks.Sprinting}}
SkillMagsDefinitions["SkillMagLightFoot"] = {perk= {Perks.Lightfoot}}
SkillMagsDefinitions["SkillMagNimble"] = {perk= {Perks.Nimble}}
SkillMagsDefinitions["SkillMagSneaking"] = {perk= {Perks.Sneak}}
SkillMagsDefinitions["SkillMagCarpentry"] = {perk= {Perks.Woodwork}}
SkillMagsDefinitions["SkillMagCooking"] = {perk= {Perks.Cooking}}
SkillMagsDefinitions["SkillMagFarming"] = {perk= {Perks.Farming}}
SkillMagsDefinitions["SkillMagFirstAid"] = {perk= {Perks.Doctor}}
SkillMagsDefinitions["SkillMagElectricity"] = {perk= {Perks.Electricity}}
SkillMagsDefinitions["SkillMagMetal"] = {perk= {Perks.MetalWelding}}
SkillMagsDefinitions["SkillMagFirearm"] = {perk= {Perks.Aiming}}
SkillMagsDefinitions["SkillMagReloading"] = {perk= {Perks.Reloading}}
SkillMagsDefinitions["SkillMagFishing"] = {perk= {Perks.Fishing}}
SkillMagsDefinitions["SkillMagTrapping"] = {perk= {Perks.Trapping}}
SkillMagsDefinitions["SkillMagForaging"] = {perk= {Perks.PlantScavenging}}
SkillMagsDefinitions["SkillMagMechanics"] = {perk= {Perks.Mechanics}}
SkillMagsDefinitions["SkillMagAxe"] = {perk= {Perks.Axe}}
SkillMagsDefinitions["SkillMagBlade"] = {perk= {Perks.LongBlade, Perks.SmallBlade}}
SkillMagsDefinitions["SkillMagBlunt"] = {perk= {Perks.Blunt, Perks.SmallBlunt}}
SkillMagsDefinitions["SkillMagSpear"] = {perk= {Perks.Spear}}
SkillMagsDefinitions["SkillMagMaintenance"] = {perk= {Perks.Maintenance}}
SkillMagsDefinitions["SkillMagTailor"] = {perk= {Perks.Tailoring}}
SkillMagsDefinitions["SkillMagAmmoReloading"] = {perk= {Perks.AMReloading}}
SkillMagsDefinitions["SkillMagHunting"] = {perk= {Perks.LGRHunting}}


SkillMagsDefinitions.items = {"Sprint","LightFoot","Nimble","Sneaking","Carpentry","Cooking","Farming","FirstAid","Electricity","Metal","Firearm","Reloading","Fishing","Trapping","Foraging","Mechanics","Blade","Blunt","Spear","Maintenance","Tailor"}

SkillMagsDefinitions.addModTable = function()
	if ISAMReloadingMenu then
		table.insert(SkillMagsDefinitions.items, "AmmoReloading");
	end
	if LeGourmet then
		table.insert(SkillMagsDefinitions.items, "Hunting");
	end
	--for i=1, #SkillMagsDefinitions.items do
	--	print(SkillMagsDefinitions.items[i]);
	--end
end

function SMDoTable()
	SkillMagsDefinitions.addModTable();
end

Events.OnGameStart.Add(SMDoTable)
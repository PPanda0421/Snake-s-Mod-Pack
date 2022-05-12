require "Foraging/forageDefinitions"

local function generateSkillMagsCustomDefs()
	local AnotherJunkItems = {
		rare = {
			chance = 10,
			xp = 5,
			items = {
				SkillMagSprint       = "SkillMag.SkillMagSprint",
				SkillMagLightFoot       = "SkillMag.SkillMagLightFoot",
				SkillMagNimble       = "SkillMag.SkillMagNimble",
				SkillMagSneaking       = "SkillMag.SkillMagSneaking",
				SkillMagCarpentry       = "SkillMag.SkillMagCarpentry",
				SkillMagCooking       = "SkillMag.SkillMagCooking",
				SkillMagFarming       = "SkillMag.SkillMagFarming",
				SkillMagFirstAid       = "SkillMag.SkillMagFirstAid",
				SkillMagElectricity       = "SkillMag.SkillMagElectricity",
				SkillMagMetal       = "SkillMag.SkillMagMetal",
				SkillMagFirearm       = "SkillMag.SkillMagFirearm",
				SkillMagReloading       = "SkillMag.SkillMagReloading",
				SkillMagFishing       = "SkillMag.SkillMagFishing",
				SkillMagTrapping       = "SkillMag.SkillMagTrapping",
				SkillMagForaging       = "SkillMag.SkillMagForaging",
				SkillMagMechanics       = "SkillMag.SkillMagMechanics",
				SkillMagAxe       = "SkillMag.SkillMagAxe",
				SkillMagBlade       = "SkillMag.SkillMagBlade",
				SkillMagBlunt       = "SkillMag.SkillMagBlunt",
				SkillMagSpear       = "SkillMag.SkillMagSpear",
				SkillMagMaintenance       = "SkillMag.SkillMagMaintenance",
				SkillMagTailor       = "SkillMag.SkillMagTailor",
			},
		},
		epic = {
			chance = 5,
			xp = 20,
			items = {
				SkillMagPackage    = "SkillMag.SkillMagPackage",
			},
		},
	};
    for _, spawnTable in pairs(AnotherJunkItems) do
        for itemName, itemFullName in pairs(spawnTable.items) do
            forageDefs[itemName] = {
                type = itemFullName,
                skill = 4,
                xp = spawnTable.xp,
                categories = { "Junk" },
                zones = {
                    Forest      = spawnTable.chance,
                    DeepForest  = spawnTable.chance,
                    Vegitation  = spawnTable.chance,
                    FarmLand    = spawnTable.chance,
                    Farm        = spawnTable.chance,
                    TrailerPark = spawnTable.chance,
                    TownZone    = spawnTable.chance,
                    Nav         = spawnTable.chance,
                },
                spawnFuncs = {},
                forceOutside = false,
                canBeAboveFloor = true,
            };
        end;
    end;
end

generateSkillMagsCustomDefs();
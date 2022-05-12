require "Foraging/forageDefinitions"
require "Foraging/ForageDefAmmoMaker"

scavenges.Dyes = {};
--local icons = {
--	Dyes = getTexture("media/textures/Foraging/pinIconDyes.png"),
--};

if forageCategories then
	forageCategories["Dyes"] = {
		name                    = "Dyes",
		typeCategory            = "Other",
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 1,
		categoryHidden          = true,
        validFloors = { "floors_exterior_natural", "blends_natural" },
        zoneChance = {
            DeepForest      = 35,
            Forest          = 25,
            Vegitation      = 15,
            FarmLand        = 15,
            Farm            = 15,
            TrailerPark     = 0,
            TownZone        = 0,
            Nav             = 0,
        },
	}
end
local function addSpecDef(_tname, _tspec, value)
	if forageSkills then
		if forageSkills[_tname] then
			if forageSkills[_tname].specialisations then
				if not forageSkills[_tname].specialisations[_tspec] then
					forageSkills[_tname].specialisations[_tspec] = value;
				end
			end
		end
	end
end

addSpecDef("farmer", "Dyes", 10)
addSpecDef("Formerscout", "Dyes", 10)
addSpecDef("Herbalist", "Dyes", 10)
addSpecDef("Hiker", "Dyes", 10)

if forageDefs then
	forageDefs.PlantRed = {
		type = "ColorDyes.PlantRed",
		minCount = 1,
		maxCount = 3,
		skill = 0,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantYellow = {
		type = "ColorDyes.PlantYellow",
		minCount = 1,
		maxCount = 3,
		skill = 0,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantBlue = {
		type = "ColorDyes.PlantBlue",
		minCount = 1,
		maxCount = 3,
		skill = 0,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantBlack = {
		type = "ColorDyes.PlantBlack",
		minCount = 1,
		maxCount = 3,
		skill = 2,
		perks       = { "PlantScavenging" },
		chance      = 2,
		xp          = 10,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantWhite = {
		type = "ColorDyes.PlantWhite",
		minCount = 1,
		maxCount = 3,
		skill = 2,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantOrange = {
		type = "ColorDyes.PlantOrange",
		minCount = 1,
		maxCount = 3,
		skill = 4,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantMagenta = {
		type = "ColorDyes.PlantMagenta",
		minCount = 1,
		maxCount = 3,
		skill = 6,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantGreen = {
		type = "ColorDyes.PlantGreen",
		minCount = 1,
		maxCount = 3,
		skill = 4,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantBrown = {
		type = "ColorDyes.PlantBrown",
		minCount = 1,
		maxCount = 3,
		skill = 7,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantCyan = {
		type = "ColorDyes.PlantCyan",
		minCount = 1,
		maxCount = 3,
		skill = 7,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantTurquoise = {
		type = "ColorDyes.PlantTurquoise",
		minCount = 1,
		maxCount = 3,
		skill = 8,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantPink = {
		type = "ColorDyes.PlantPink",
		minCount = 1,
		maxCount = 3,
		skill = 6,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantLightBrown = {
		type = "ColorDyes.PlantLightBrown",
		minCount = 1,
		maxCount = 3,
		skill = 8,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantLightBlue = {
		type = "ColorDyes.PlantLightBlue",
		minCount = 1,
		maxCount = 3,
		skill = 7,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PlantGrey = {
		type = "ColorDyes.PlantGrey",
		minCount = 1,
		maxCount = 3,
		skill = 5,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Dyes" },
		categories  = { "Dyes" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = { 9, 10, 11 },
		malusMonths = {},
		spawnFunc	= nil,
	}
end

local function generateTableSawCustomDefs()
	local junkItems = {
		rare = {
			chance = 10,
			xp = 10,
			items = {
				SawMag1     = "TableSaw.SawMag1",
				DyesMag     = "ColorDyes.DyesMag",
			},
		},
		epic = {
			chance = 5,
			xp = 15,
			items = {
				SawBlade     = "TableSaw.SawBlade",
				Turpentine     = "TableSaw.Turpentine",
				PlankStacks1     = "TableSaw.PlankStacks1",
				PlankStacks2     = "TableSaw.PlankStacks2",
				PlankStacks3     = "TableSaw.PlankStacks3",
			},
		},
		legendary = {
			chance = 1,
			xp = 20,
			items = {
				Engine     = "TableSaw.Engine",
				BaseballSawBat     = "TableSaw.BaseballSawBat",
				BaseballWireBat     = "TableSaw.BaseballWireBat",
				
			},
		},
	};
    for _, spawnTable in pairs(junkItems) do
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
                spawnFuncs = { doJunkWeaponSpawn },
                forceOutside = false,
                canBeAboveFloor = true,
            };
        end;
    end;
end

generateTableSawCustomDefs();
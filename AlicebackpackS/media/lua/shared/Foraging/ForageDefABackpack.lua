require "Foraging/forageDefinitions"
local function doJunkWeaponSpawnB(_character, _inventory, _itemDef, _items)
	for item in iterList(_items) do
		local conditionMax = item:getConditionMax();
		if conditionMax > 0 then
			item:setCondition(ZombRand(conditionMax) + 1); -- Randomize the weapon condition
		end;
	end;
	return _items; --custom spawn scripts must return an arraylist of items (or nil)
end

local function doClothingItemSpawnB(_character, _inventory, _itemDef, _items)
	for item in iterList(_items) do
		if not item:isCosmetic() then
			item:setWetness(ZombRandFloat(0.0, 100.0));
			item:setBloodLevel(ZombRandFloat(0.0, 100.0));
			item:setDirtyness(ZombRandFloat(0.0, 100.0));
			local conditionMax = item:getConditionMax();
			if conditionMax > 0 then
				item:setCondition(ZombRand(conditionMax) + 1);
			end;
		end;
	end;
	return _items; --custom spawn scripts must return an arraylist of items (or nil)
end

if forageDefs then
    forageDefs.MilitaryKnife       = {
		type       = "AliceBP.MilitaryKnife",
		minCount   = 1,
		maxCount   = 1,
		skill      = 0,
		perks      = { "PlantScavenging" },
		xp         = 5,
		categories = { "JunkWeapons" },
        zones = {
			DeepForest  = 15,
			Forest      = 15,
			Vegitation  = 15,
			FarmLand    = 15,
			Farm        = 15,
			TrailerPark = 15,
			TownZone    = 15,
			Nav         = 15,
        },
		spawnFuncs = { doJunkWeaponSpawnB },
		forceOutside = false,
		canBeAboveFloor = true,
		itemSizeModifier = 0.5,
		isItemOverrideSize = true,
    }
	forageDefs.MRE = {
		type = "AliceBP.MRE",
		xp = 10,
		categories = { "JunkFood" },
		zones = {
			TrailerPark = 1,
			TownZone    = 1,
			Nav         = 1,
		},
		forceOutside = false,
		canBeAboveFloor = true,
	};
end

local function generateABPCustomDefs()
	if forageDefs then
		local clothingItems = {
			rare = {
				chance = 1,
				xp = 5,
				items = {
					["MilitiaPouch1"]     = "AliceBP.MilitiaPouch1",
					["MilitiaPouch2"]     = "AliceBP.MilitiaPouch2",
					["SupportBackpack"]   = "AliceBP.SupportBackpack",
					["AlicePack"]         = "AliceBP.AlicePack",
				},
			},
		};
		for _, spawnTable in pairs(clothingItems) do
			for itemName, itemFullName in pairs(spawnTable.items) do
				forageDefs[itemName] = {
					type = itemFullName,
					skill = 0,
					xp = spawnTable.xp,
					categories = { "Clothing" },
					zones = {
						Vegitation  = spawnTable.chance,
						TrailerPark = spawnTable.chance,
						TownZone    = spawnTable.chance,
						Nav         = spawnTable.chance,
					},
					spawnFuncs = { doClothingItemSpawnB },
					forceOutside = false,
					canBeAboveFloor = true,
					itemSizeModifier = 0.5,
					isItemOverrideSize = true,
				};
			end;
		end;
	end;
end

generateABPCustomDefs();


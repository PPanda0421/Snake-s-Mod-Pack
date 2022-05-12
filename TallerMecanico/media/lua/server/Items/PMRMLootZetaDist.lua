require "Items/LZEEFunction"
-- Formato (Indumentaria, Item, Chance, Script Count, Nombre del mod)
PMRMLZ = {};
PMRMLZ.initTable = function()
	if LZFunc then
		local modname = "Pimp My Ride";
		LZFunc.LootZetaAddItemTable("Mechanic","TireGlue",15,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","GlassCutter",2,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","TireRubber",40,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","TireRubber",30,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","TireRubber",20,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","TireRubber",15,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","TireRubber",10,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","TireRubber",5,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","GlassGlue",10,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","BrakesPartsBox",5,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","SuspensionPartsBag",5,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","SuspensionParts",7.5,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","SuspensionParts",5,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","SuspensionParts",4,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","BrakesParts",7.5,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","BrakesParts",5,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","BrakesParts",4,false,modname);
		LZFunc.LootZetaAddItemTable("Mechanic","BatteryCleaner",10,false,modname);
	end
end

function PMRMDoLZTable()
	PMRMLZ.initTable();
end
PMRMDoLZTable()
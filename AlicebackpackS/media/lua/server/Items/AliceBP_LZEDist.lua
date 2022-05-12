require "Items/LZEEFunction"

-- Formato (Indumentaria, Item, Chance, Script Count, Nombre del mod)
function ABPDoLZTable()
	if LZFunc then
		LZFunc.LootZetaAddItemTable("AirCrew","AliceBP.MilitaryCanteenEmpty",8,false,"AliceBackPack");
		LZFunc.LootZetaAddItemTable("ArmyCamoDesert","AliceBP.MilitaryCanteenEmpty",8,false,"AliceBackPack");
		LZFunc.LootZetaAddItemTable("ArmyCamoGreen","AliceBP.MilitaryCanteenEmpty",8,false,"AliceBackPack");
	end
end

ABPDoLZTable()
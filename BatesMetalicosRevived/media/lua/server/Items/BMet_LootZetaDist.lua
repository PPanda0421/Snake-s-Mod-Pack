require "Items/LZEEFunction"

-- Formato (Indumentaria, Item, Chance, Script Count, Nombre del mod)
function BMetDoLZTable()
	if LZFunc then
		LZFunc.LootZetaAddItemTable("BaseballPlayer_KY","BatesMetalicos.MetalBaseballBat",5,false,"BatesMetalicos");
		LZFunc.LootZetaAddItemTable("BaseballPlayer_Rangers","BatesMetalicos.MetalBaseballBat",5,false,"BatesMetalicos");
	end
end
BMetDoLZTable()
require "Items/LZEEFunction"
-- Formato (Indumentaria, Item, Chance, Script Count, Nombre del mod)
function TSawDoLZTable()
	if LZFunc then
		LZFunc.LootZetaAddItemTable("Foreman","TableSaw.SawBlade",3,false,"TableSaw");
	end
end
TSawDoLZTable()
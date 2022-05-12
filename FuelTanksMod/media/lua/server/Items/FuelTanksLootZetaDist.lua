require "Items/LZEEFunction"
-- Formato (Indumentaria, Item, Chance, Script Count, Nombre del mod)
function FuelTanksDoLZTable()
	if LZFunc then
		LZFunc.LootZetaAddItemTable("Fossoil","FuelTanks.FuelMeter",15,false,"FuelTanks");
		LZFunc.LootZetaAddItemTable("Gas2Go","FuelTanks.FuelMeter",15,false,"FuelTanks");
		LZFunc.LootZetaAddItemTable("Survivalist02","FuelTanks.FuelMeter",10,false,"FuelTanks");
	end
end
FuelTanksDoLZTable()
require "Definitions/InventoryNoteDef"
if InventoryNoteDef then
	--Revistas
	table.insert(InventoryNoteDef.datamagnames, "FuelTanksMagI");
	InventoryNoteDef.magazines["FuelTanksMagI"] = {value = false, title = "FuelTanks.FuelTanksMag1"};

end
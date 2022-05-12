require "Definitions/InventoryNoteDef"
if InventoryNoteDef then
	--Revistas
	table.insert(InventoryNoteDef.datamagnames, "DyesMagI");
	InventoryNoteDef.magazines["SawMagI"] = {value = false, title = "ColorDyes.DyesMag"};
	
	table.insert(InventoryNoteDef.datamagnames, "DyesMagI");
	InventoryNoteDef.magazines["SawMagI"] = {value = false, title = "TableSaw.SawMag1"};

end
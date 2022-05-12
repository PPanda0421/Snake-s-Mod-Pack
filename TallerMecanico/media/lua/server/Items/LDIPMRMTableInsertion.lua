require "Definitions/InventoryNoteDef"
if InventoryNoteDef then
	--Revistas
	table.insert(InventoryNoteDef.datamagnames, "GlassMagI");
	InventoryNoteDef.magazines["GlassMagI"] = {value = false, title = "Base.GlassMag1"};

end
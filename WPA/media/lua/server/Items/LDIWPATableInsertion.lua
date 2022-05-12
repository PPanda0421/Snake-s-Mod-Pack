require "Definitions/InventoryNoteDef"
if InventoryNoteDef then

	--Revistas
	table.insert(InventoryNoteDef.datamagnames, "WeaponsMagazineI");
	InventoryNoteDef.magazines["WeaponsMagazineI"] = {value = false, title = "WPA.WeaponsMagazine"};

	table.insert(InventoryNoteDef.datamagnames, "WeaponsMagazineII");
	InventoryNoteDef.magazines["WeaponsMagazineII"] = {value = false, title = "WPA.WeaponsMagazine2"};
	
	table.insert(InventoryNoteDef.datamagnames, "WeaponsMagazineIII");
	InventoryNoteDef.magazines["WeaponsMagazineIII"] = {value = false, title = "WPA.WeaponsMagazine3"};
	
end
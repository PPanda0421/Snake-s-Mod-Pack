require "Items/LZEEFunction"
-- Formato (Indumentaria, Item, Chance, Script Count, Nombre del mod)
WPALZ = {};
WPALZ.initTable = function()
	if LZFunc then
		local modname = "WPA";
		LZFunc.LootZetaAddItemTable("Ghillie","WPA.SilencerRK",15,false,modname);
		LZFunc.LootZetaAddItemTable("Ghillie","WPA.SilencerRK",10,false,modname);
		LZFunc.LootZetaAddItemTable("Ghillie","WPA.Silencer3",10,false,modname);
		LZFunc.LootZetaAddItemTable("Survivalist03","WPA.SilencerRK",10,false,modname);
	end
end

function WPADoLZTable()
	WPALZ.initTable();
end
WPADoLZTable()
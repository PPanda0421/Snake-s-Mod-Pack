Events.OnGameStart.Add( function ()
	print ("Ammo Maker Reloaded: Buscando sistema de Mod Necroforge");
	if NecroList then
		print ("Items de Ammo Maker Reloaded agregados a Necroforge");
		if NecroList.Items.AK then	
		else
			NecroList.Items.AK = {"Weapons", nil, nil, getItemNameFromFullType("AmmoMaker.AK47"), "AmmoMaker.AK47", "Item_AK47", nil, nil, nil};
		end
		if NecroList.Items.AKMMag then	
		else
			NecroList.Items.AKMMag = {"Ammunition", "Weapons", nil, getItemNameFromFullType("AmmoMaker.AKMMag"), "AmmoMaker.AKMMag", "Item_AK47Mag", nil, nil, nil};
		end
		if NecroList.Items.AKAmmoBox then	
		else
			NecroList.Items.AKAmmoBox = {"Ammunition", "Weapons", nil, getItemNameFromFullType("AmmoMaker.762x39mmBox"), "AmmoMaker.762x39mmBox", "Item_Am762x39Box", nil, nil, nil};
		end
		if NecroList.Items.AKAmmo then	
		else
			NecroList.Items.AKAmmo = {"Ammunition", "Weapons", nil, getItemNameFromFullType("AmmoMaker.Ammo_762x39mm"), "AmmoMaker.Ammo_762x39mm", "Item_Am762x39Rounds", nil, nil, nil};
		end
	else
		print ("AMR: No se encuentra mod Necroforge, items de AmmoMakerReloaded no agregados a Necroforge.");
	end
end)
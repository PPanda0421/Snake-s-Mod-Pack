Events.OnGameStart.Add( function ()
	if NecroList then
		print ("Items de WPA agregados a Necroforge");
		if NecroList.Items.SilencerRK then	
		else
			NecroList.Items.SilencerRK = {"Weapons", nil, nil, getItemText("SS_Repair_Kit"), "WPA.SilencerRK", "Item_WPARepairKit", nil, nil, nil};
		end
		if NecroList.Items.Silencer1 then	
		else
			NecroList.Items.Silencer1 = {"Weapons", nil, nil, getItemText("Silencer"), "WPA.Silencer1", "Item_Silencer", nil, nil, nil};
		end
		if NecroList.Items.Silencer2 then	
		else
			NecroList.Items.Silencer2 = {"Weapons", nil, nil, getItemText("Home_Made_Silencer"), "WPA.Silencer2", "Item_HomeSilcencer", nil, nil, nil};
		end
		if NecroList.Items.Silencer3 then	
		else
			NecroList.Items.Silencer3 = {"Weapons", nil, nil, getItemText("Rifle_Silencer"), "WPA.Silencer3", "Item_SilencerRifle", nil, nil, nil};
		end
		if NecroList.Items.Silencer5 then	
		else
			NecroList.Items.Silencer5 = {"Weapons", nil, nil, getItemText("Shotgun_Silencer"), "WPA.Silencer5", "Item_ShotgunSilencer", nil, nil, nil};
		end
		if NecroList.Items.Silencer6 then	
		else
			NecroList.Items.Silencer6 = {"Weapons", nil, nil, getItemText("Homemade_Rifle_Silencer"), "WPA.Silencer6", "Item_HomeSilencer2", nil, nil, nil};
		end
		if NecroList.Items.M16x4Scope then	
		else
			NecroList.Items.M16x4Scope = {"Weapons", nil, nil, getItemText("M16_x4_Scope"), "WPA.M16x4Scope", "Item_M16_4x", nil, nil, nil};
		end
		if NecroList.Items.M16Reflex then	
		else
			NecroList.Items.M16Reflex = {"Weapons", nil, nil, getItemText("M16_Reflex_Sight"), "WPA.M16Reflex", "Item_M16Reflex", nil, nil, nil};
		end
		if NecroList.Items.M16Grip then	
		else
			NecroList.Items.M16Grip = {"Weapons", nil, nil, getItemText("M16_Hand_Grip"), "WPA.M16Grip", "Item_M16HandGrip", nil, nil, nil};
		end
		if NecroList.Items.M16Laser then	
		else
			NecroList.Items.M16Laser = {"Weapons", nil, nil, getItemText("M16_Laser"), "WPA.M16Laser", "Item_M16Laser", nil, nil, nil};
		end
	end
end)
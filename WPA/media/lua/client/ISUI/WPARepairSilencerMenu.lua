--Made by Snake
WPARepairSilencerMenu = {};


WPARepairSilencerMenu.doMenu = function(player, context, items)

	local Silencer = nil;
	local RepairKit = nil;
	
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if tempitem:getType() == "SilencerRK" then
			RepairKit = tempitem;
		end
		if tempitem:getType() == "SilencerAK" 
		  or tempitem:getType() == "Silencerm16" 
		  or tempitem:getType() == "Silencer1"
		  or tempitem:getType() == "Silencer2"
		  or tempitem:getType() == "Silencer3"
		  or tempitem:getType() == "Silencer5"
		  or tempitem:getType() == "Silencer6" then
			Silencer = tempitem;	
		end
	end
	local pl = getSpecificPlayer(player);
	if Silencer then
		local SData = Silencer:getModData();
		if not SData.SilencerDurability or SData.SilencerDurability == 100 then return end
		
		if not pl:getInventory():contains("SilencerRK") then
		return
		end
		
		local sitem2 = pl:getInventory():getItemFromType("SilencerRK");
		if sitem2:getUsedDelta() <= 0 then return end;

		if Silencer and sitem2:getUsedDelta() > 0 then
			local option = context:addOption(getText("ContextMenu_RepairSilencer"), Silencer, WPARepairSilencerMenu.RepairSilencer_OnCreate, player, sitem2);
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_RepairSilencer"));
			tooltip.description = tooltip.description .. getText("ContextMenu_RepairSilencerTT");
			tooltip:setTexture("media/textures/Item_WPARepairKit.png");
			option.toolTip = tooltip;
		end
	end
	
	if RepairKit and RepairKit:getUsedDelta() > 0 then
		if not (pl:getInventory():contains("SilencerAK") 
		  or pl:getInventory():contains("Silencerm16")
		  or pl:getInventory():contains("Silencer1")
		  or pl:getInventory():contains("Silencer2")
		  or pl:getInventory():contains("Silencer3")
		  or pl:getInventory():contains("Silencer5")
		  or pl:getInventory():contains("Silencer6")) then
			return 
		end
		local item1 = nil;
		local item2 = nil;
		local item3 = nil;
		local item4 = nil;
		local item5 = nil;
		local item6 = nil;
		local item7 = nil;

		if pl:getInventory():contains("SilencerAK") then
			item1 = pl:getInventory():getItemFromType("SilencerAK");
			if item1:getModData().SilencerDurability and item1:getModData().SilencerDurability < 100 then
				item1 = item1;
			else
				item1 = nil;
			end
		elseif pl:getInventory():contains("Silencerm16") then
			item2 = pl:getInventory():getItemFromType("Silencerm16");
			if item2:getModData().SilencerDurability and item2:getModData().SilencerDurability < 100 then
				item2 = item2;
			else
				item2 = nil;
			end
		elseif pl:getInventory():contains("Silencer1") then
			item3 = pl:getInventory():getItemFromType("Silencer1");
			if item3:getModData().SilencerDurability and item3:getModData().SilencerDurability < 100 then
				item3 = item3;
			else
				item3 = nil;
			end
		elseif pl:getInventory():contains("Silencer2") then
			item4 = pl:getInventory():getItemFromType("Silencer2");
			if item4:getModData().SilencerDurability and item4:getModData().SilencerDurability < 100 then
				item4 = item4;
			else
				item4 = nil;
			end
		elseif pl:getInventory():contains("Silencer3") then
			item5 = pl:getInventory():getItemFromType("Silencer3");
			if item5:getModData().SilencerDurability and item5:getModData().SilencerDurability < 100 then
				item5 = item5;
			else
				item5 = nil;
			end
		elseif pl:getInventory():contains("Silencer5") then
			item6 = pl:getInventory():getItemFromType("Silencer5");
			if item6:getModData().SilencerDurability and item6:getModData().SilencerDurability < 100 then
				item6 = item6;
			else
				item6 = nil;
			end
		elseif pl:getInventory():contains("Silencer6") then
			item7 = pl:getInventory():getItemFromType("Silencer6");
			if item7:getModData().SilencerDurability and item7:getModData().SilencerDurability < 100 then
				item7 = item7;
			else
				item7 = nil;
			end
		end
		if item1 ~= nil 
		  or item2 ~= nil
		  or item3 ~= nil
		  or item4 ~= nil
		  or item5 ~= nil
		  or item6 ~= nil
		  or item7 ~= nil then
			local option = context:addOption(getText("ContextMenu_RepairSilencer"), RepairKit, nil);
			local submenu = context:getNew(context)
			context:addSubMenu(option, submenu)
			if item1 ~= nil then
				local option2 = submenu:addOption(getItemText("AK_Silencer"), RepairKit, WPARepairSilencerMenu.RepairSilencer2_OnCreate, player, item1);
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				tooltip:setName(getText("ContextMenu_RepairS") .. " " .. getItemText("AK_Silencer"));
				tooltip.description = tooltip.description .. getText("ContextMenu_RepairSilencerTT");
				tooltip:setTexture("media/textures/Item_WPARepairKit.png");
				option2.toolTip = tooltip;
			end
			if item2 ~= nil then
				local option2 = submenu:addOption(getItemText("M16_Silencer"), RepairKit, WPARepairSilencerMenu.RepairSilencer2_OnCreate, player, item2);
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				tooltip:setName(getText("ContextMenu_RepairS") .. " " .. getItemText("M16_Silencer"));
				tooltip.description = tooltip.description .. getText("ContextMenu_RepairSilencerTT");
				tooltip:setTexture("media/textures/Item_WPARepairKit.png");
				option2.toolTip = tooltip;
			end
			if item3 ~= nil then
				local option2 = submenu:addOption(getItemText("Silencer"), RepairKit, WPARepairSilencerMenu.RepairSilencer2_OnCreate, player, item3);
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				tooltip:setName(getText("ContextMenu_RepairS") .. " " .. getItemText("Silencer"));
				tooltip.description = tooltip.description .. getText("ContextMenu_RepairSilencerTT");
				tooltip:setTexture("media/textures/Item_WPARepairKit.png");
				option2.toolTip = tooltip;
			end
			if item4 ~= nil then
				local option2 = submenu:addOption(getItemText("Home_Made_Silencer"), RepairKit, WPARepairSilencerMenu.RepairSilencer2_OnCreate, player, item4);
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				tooltip:setName(getText("ContextMenu_RepairS") .. " " .. getItemText("Home_Made_Silencer"));
				tooltip.description = tooltip.description .. getText("ContextMenu_RepairSilencerTT");
				tooltip:setTexture("media/textures/Item_WPARepairKit.png");
				option2.toolTip = tooltip;
			end
			if item5 ~= nil then
				local option2 = submenu:addOption(getItemText("Rifle_Silencer"), RepairKit, WPARepairSilencerMenu.RepairSilencer2_OnCreate, player, item5);
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				tooltip:setName(getText("ContextMenu_RepairS") .. " " .. getItemText("Rifle_Silencer"));
				tooltip.description = tooltip.description .. getText("ContextMenu_RepairSilencerTT");
				tooltip:setTexture("media/textures/Item_WPARepairKit.png");
				option2.toolTip = tooltip;
			end
			if item6 ~= nil then
				local option2 = submenu:addOption(getItemText("Shotgun_Silencer"), RepairKit, WPARepairSilencerMenu.RepairSilencer2_OnCreate, player, item6);
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				tooltip:setName(getText("ContextMenu_RepairS") .. " " .. getItemText("Shotgun_Silencer"));
				tooltip.description = tooltip.description .. getText("ContextMenu_RepairSilencerTT");
				tooltip:setTexture("media/textures/Item_WPARepairKit.png");
				option2.toolTip = tooltip;
			end
			if item7 ~= nil then
				local option2 = submenu:addOption(getItemText("Homemade_Rifle_Silencer"), RepairKit, WPARepairSilencerMenu.RepairSilencer2_OnCreate, player, item7);
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				tooltip:setName(getText("ContextMenu_RepairS") .. " " .. getItemText("Homemade_Rifle_Silencer"));
				tooltip.description = tooltip.description .. getText("ContextMenu_RepairSilencerTT");
				tooltip:setTexture("media/textures/Item_WPARepairKit.png");
				option2.toolTip = tooltip;
			end
		end
	end
end

WPARepairSilencerMenu.RepairSilencer_OnCreate = function(item, playernum, sitem2)

	local player = getSpecificPlayer(playernum)
	
	-- check if needs to be moved
	if luautils.haveToBeTransfered(player, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
	end
	
	if not item:isEquipped() then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, false))
	end
	if not sitem2:isEquipped() then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, sitem2, 50, false, false))
	end

    local time = 120;
	ISTimedActionQueue.add(RepairSilencerAction:new(player, item, sitem2, time));
end

WPARepairSilencerMenu.RepairSilencer2_OnCreate = function(item, playernum, sitem2)

	local player = getSpecificPlayer(playernum)
	
	-- check if needs to be moved
	if luautils.haveToBeTransfered(player, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
	end
	
	if not sitem2:isEquipped() then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, sitem2, 50, true, false))
	end
	if not item:isEquipped() then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, false, false))
	end

    local time = 120;
	ISTimedActionQueue.add(RepairSilencerAction:new(player, sitem2, item, time));
end

Events.OnFillInventoryObjectContextMenu.Add(WPARepairSilencerMenu.doMenu);
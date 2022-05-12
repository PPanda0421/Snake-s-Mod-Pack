TiresMenu = {};
TiresMenu.doBuildMenu = function(player, context, worldobjects)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local playerObj = getSpecificPlayer(player);
	if playerObj:getVehicle() then
		return
	end
	--local playerInv = playerObj:getInventory();
	local TMachine = nil;

	for i,v in ipairs(worldobjects) do
		for i=0,v:getSquare():getObjects():size()-1 do
			local object = v:getSquare():getObjects():get(i);
			if instanceof(object, "IsoObject") and
			  object:getSprite() and
			  object:getSprite():getProperties() and
			  ( object:getSprite():getProperties():Val("GroupName") == "Red" and object:getSprite():getProperties():Val("CustomName") == "Tire Machine") then
				
				TMachine = object;
				break;
			end
		end
	end

	if TMachine == nil then return;end
	
	if TMachine ~= nil then
		--Menu Contextual y funcion de tooltip
		-- Titulo y creacion de submenu
		local mult = 1;
		local FirstTitle = context:addOption(getText("ContextMenu_VulcanizeMachine"), worldobjects, nil);
		local SubMenu = context:getNew(context);
		context:addSubMenu(FirstTitle, SubMenu);

		local _option = SubMenu:addOption(getText("IGUI_DeflateTire"), TMachine, TiresMenu.Deflate, player);
		TiresMenu.HacerTooltip(TMachine, playerObj, _option, "Deflate");
		
		local _option2 = SubMenu:addOption(getText("ContextMenu_DismountTire"), TMachine, TiresMenu.Dismount, player);
		TiresMenu.HacerTooltip(TMachine, playerObj, _option2, "Dismount");

		local _option3 = SubMenu:addOption(getText("ContextMenu_RepairTire"), TMachine, TiresMenu.Repair, player);
		TiresMenu.HacerTooltip(TMachine, playerObj, _option3, "Repair");

		local _option4 = SubMenu:addOption(getText("ContextMenu_MountTire"), TMachine, TiresMenu.Mount, player);
		TiresMenu.HacerTooltip(TMachine, playerObj, _option4, "Mount");
		
	end
end
TiresMenu.HaveATire = function(TMachine)
	local Tire = false;
	if TMachine:getContainer() and TMachine:getContainer():getContentsWeight() > 0 then
		if TMachine:getContainer():contains("OldTire1") or
		  TMachine:getContainer():contains("OldTire2") or 
		  TMachine:getContainer():contains("OldTire3") or
		  TMachine:getContainer():contains("NormalTire1") or
		  TMachine:getContainer():contains("NormalTire2") or
		  TMachine:getContainer():contains("NormalTire3") or
		  TMachine:getContainer():contains("ModernTire1") or
		  TMachine:getContainer():contains("ModernTire2") or
		  TMachine:getContainer():contains("ModernTire3") then
			Tire = true
		end
	end
	return Tire;
end


TiresMenu.HacerTooltip = function(TMachine, playerObj, _option, action)
	--local playerInv = playerObj:getInventory();
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
    _option.toolTip = tooltip;
	local desc = "";
	if action == "Deflate" then
		tooltip:setName(getText("IGUI_DeflateTire"));
		desc = getText("ContextMenu_DeflateTireTT")
		tooltip:setTexture("media/ui/DeflateTire.png");
	elseif action == "Dismount" then
		tooltip:setName(getText("ContextMenu_DismountTire"));
		desc = getText("ContextMenu_DismantleTireTT");
		tooltip:setTexture("media/ui/DismantleTire.png");
	elseif action == "Mount" then
		tooltip:setName(getText("ContextMenu_MountTire"));
		desc = getText("ContextMenu_MountTireTT");
		tooltip:setTexture("media/ui/MountTire.png");
	elseif action == "Repair" then
		tooltip:setName(getText("ContextMenu_RepairTire"));
		desc = getText("ContextMenu_RepairTireTT");
		tooltip:setTexture("media/ui/RepairTire.png");
	end
	tooltip.description = "<RGB:1,1,0>" .. desc .. " <LINE>" .. " <RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>";

	--tooltip.description = tooltip.description ..  " <LINE>" .. TiresMenu.getTireDesc(TMachine);
	if action == "Repair" then
		--local RepairDescription = TiresMenu.DoRepairDesc(TMachine, _option, action);
		tooltip.description = tooltip.description .. getText("ContextMenu_Contains") .. " <LINE>" .. TiresMenu.DoRepairDesc(TMachine, _option, action);
	else
		local Tire = TiresMenu.HaveATire(TMachine);
		if Tire and action ~= "Mount" then
			tooltip.description = tooltip.description ..  getText("ContextMenu_Contains") .. " <LINE>" .. TiresMenu.getTireDesc(TMachine, _option, action);
		else
			if action ~= "Mount" then
				tooltip.description = tooltip.description .. " <RGB:0.8,0,0>" .. getText("ContextMenu_NotValidTire");
				_option.notAvailable = true;
			else
				tooltip.description = tooltip.description .. getText("ContextMenu_Contains") .. " <LINE>" .. TiresMenu.getItemsDesc(TMachine, _option, action, "DismountedTire") .. " <LINE> <LINE>" .. TiresMenu.getItemsDesc(TMachine, _option, action, "CarRim");
				tooltip.description = tooltip.description .. TiresMenu.checkTireData(TMachine, _option, action, "DismountedTire", "CarRim");
			end
		end
	end
	tooltip.footNote = "";
	if (SandboxVars.AllowExteriorGenerator and TMachine:getSquare():haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then
		tooltip.footNote = getText("IGUI_RadioPowerNearby");
	else
		tooltip.footNote = getText("IGUI_RadioRequiresPowerNearby");
		_option.notAvailable = true;
	end
end


TiresMenu.DoRepairDesc = function(TMachine, _option, action)
	local showitem = InventoryItemFactory.CreateItem("Base.DismountedTire")
	local Text = " <RGB:0.8,0,0>" .. showitem:getName() .. " 0/1";
	local ValidTire = false;
	if TMachine:getContainer() and TMachine:getContainer():getContentsWeight() > 0 then
		local it = TMachine:getContainer():getItems();
		local havemoreitems = false;
		if it:size() == 1 then
			--Nothing
		else
			havemoreitems = true;
		end
		for i = 0, it:size()-1 do
			local item = it:get(i);
			if item:getType() == "DismountedTire" then
				Text = " <RGB:0,0.8,0>" .. showitem:getName() .. " 1/1";
				local data = item:getModData();
				if data and data.TireName then
					Text = Text .. " <LINE> <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("ContextMenu_Type") .. " <RGB:1,1,1>" .. " " .. data.TireName;
					if item:getCondition() and item:getConditionMax() then
						Text = Text .. " <LINE> <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("Tooltip_weapon_Condition") .. ": " .. " <RGB:1,1,1>" .. tostring(item:getCondition()) .. "/" .. tostring(item:getConditionMax()) .. " <LINE>";
						if item:getCondition() >= item:getConditionMax() then
							Text = Text .. " <RGB:0.8,0,0>" .. getText("ContextMenu_FullyRepaired");
							_option.notAvailable = true;
						else
							ValidTire = true;
							Text = Text .. " <RGB:0,0.8,0>" .. "Ok";
						end
						if havemoreitems then
							Text = Text .. " <LINE>" .. " <RGB:0.8,0,0>" .. getText("ContextMenu_HaveMoreItems");
							_option.notAvailable = true;
						end
					end
				else
					Text = Text .. " <LINE> <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("ContextMenu_Type") .. " <RGB:0.8,0,0>" .. " " .. getText("ContextMenu_Unknown");
					_option.notAvailable = true;
				end	
			else
				_option.notAvailable = true;
			end
		end
	else
		_option.notAvailable = true;
	end
	local pl = getSpecificPlayer(0);
	local inv = pl:getInventory();
	local Rubberitem = InventoryItemFactory.CreateItem("Base.TireRubber")
	local First = " <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("IGUI_CraftUI_RequiredItems") .. " <LINE>";
	local TextB = " <LINE> <LINE>" .. First .. " <RGB:0.8,0,0>" .. Rubberitem:getName() .. " 0/1";
	local Rubber = inv:containsTypeRecurse("TireRubber");
	if Rubber then
		TextB = " <LINE> <LINE>" .. First .. " <RGB:0,0.8,0>" .. Rubberitem:getName() .. " 1/1" .. " <LINE>" .. " <RGB:0.15,0.3,0.63>" .. getText("ContextMenu_Repair20")
	else
		_option.notAvailable = true;
	end

	Text = Text .. TextB;
	return Text
end

TiresMenu.getTireDesc = function(TMachine, _option, action)
	local Text = "";
	if TMachine:getContainer() and TMachine:getContainer():getContentsWeight() > 0 then
		--local item = nil
		local it = TMachine:getContainer():getItems();
		--local items = {}
		for i = 0, it:size()-1 do
			local item = it:get(i);
			if item:getType() == "OldTire1" or
			  item:getType() == "OldTire2" or 
			  item:getType() == "OldTire3" or
			  item:getType() == "NormalTire1" or
			  item:getType() == "NormalTire2" or
			  item:getType() == "NormalTire3" or
			  item:getType() == "ModernTire1" or
			  item:getType() == "ModernTire2" or
			  item:getType() == "ModernTire3" then
				Text = " <RGB:1,1,1>" .. item:getName() .. " <LINE>";
				Text = Text .. " <RGB:0,0.8,0>" .. "Ok";
				if item:getCondition() and item:getConditionMax() then
					Text = Text .. " <LINE> <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("Tooltip_weapon_Condition") .. ": " .. " <RGB:1,1,1>" .. tostring(item:getCondition()) .. "/" .. tostring(item:getConditionMax()) .. " <LINE>";
					Text = Text .. " <RGB:0,0.8,0>" .. "Ok";

				end
				if item:getItemCapacity() ~= nil and item:getMaxCapacity() ~= nil then
					local itcap = item:getItemCapacity()
					local number = tonumber(string.format("%." .. (2 or 0) .. "f", (itcap)))
					if itcap < 0 then
						number = 0;
					end
					Text = Text .. " <LINE> <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("Tooltip_container_Capacity") .. ": " .. " <RGB:1,1,1>" .. tostring(number) .. "/" .. tostring(item:getMaxCapacity()) .. " <LINE>";
					if itcap > 0 then
						if action == "Dismount" then
							Text = Text .. " <RGB:0.8,0,0>" .. getText("ContextMenu_NeedtoDeflate") .. " <LINE>";
							_option.notAvailable = true;
						elseif action == "Deflate" then
							if itcap > 0 then
								Text = Text .. " <RGB:0,0.8,0>" .. "Ok";
							else
								Text = Text .. " <RGB:0,0.8,0>" .. "Cant deflate";
							end
						end
					else
						if action == "Deflate" then
							Text = Text .. " <RGB:0.8,0,0>" .. getText("ContextMenu_CantDeflate");
							_option.notAvailable = true;
						elseif action == "Dismount" then
							Text = Text .. " <RGB:0,0.8,0>" .. "Ok";
						end
					end
				end
			end
		end
	end
	return Text;
end

TiresMenu.getItemsDesc = function(TMachine, _option, action, iType)
	local showitem = InventoryItemFactory.CreateItem("Base." .. iType)
	local Text = " <RGB:0.8,0,0>" .. showitem:getName() .. " 0/1";
	if TMachine:getContainer() and TMachine:getContainer():getContentsWeight() > 0 then
		local it = TMachine:getContainer():getItems();
		for i = 0, it:size()-1 do
			local item = it:get(i);
			if item:getType() == iType then
				Text = " <RGB:0,0.8,0>" .. item:getName() .. " 1/1";
				local data = item:getModData();
				if data and data.TireName then
					Text = Text .. " <LINE> <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("ContextMenu_Type") .. " <RGB:1,1,1>" .. " " .. data.TireName;
					if item:getCondition() and item:getConditionMax() then
						Text = Text .. " <LINE> <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("Tooltip_weapon_Condition") .. ": " .. " <RGB:1,1,1>" .. tostring(item:getCondition()) .. "/" .. tostring(item:getConditionMax()) .. " <LINE>";
					end
				else
					Text = Text .. " <LINE> <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("ContextMenu_Type") .. " <RGB:0.8,0,0>" .. " " .. getText("ContextMenu_Unknown");
				end
			else
				_option.notAvailable = true;
			end
		end
	else
		_option.notAvailable = true;
	end
	return Text;
end

TiresMenu.checkTireData = function(TMachine, _option, action, iType1, iType2)
	local Text = "";
	if TMachine:getContainer() and TMachine:getContainer():getContentsWeight() > 0 then
		local it = TMachine:getContainer():getItems();
		local TireType1 = nil;
		local TireType2 = nil;
		for i = 0, it:size()-1 do
			local item = it:get(i);
			if item:getType() == iType1 then
				local data = item:getModData();
				if data and data.TireType then
					TireType1 = data.TireType;
				end
			end
			if item:getType() == iType2 then
				local data = item:getModData();
				if data and data.TireType then
					TireType2 = data.TireType;
				end
			end
		end
		if TireType1 ~= nil and TireType2 ~= nil then
			if TireType1 == TireType2 then
				--Allow
				Text = " <LINE>" .. " <RGB:0,0.8,0>" .. getText("ContextMenu_AllOk");
				_option.notAvailable = false;
			elseif TireType1 ~= TireType2 then
				Text = " <LINE>" .. " <RGB:0.8,0,0>" .. getText("ContextMenu_NeedSameType");
				_option.notAvailable = true;
			else
				_option.notAvailable = true;
			end
		else
			_option.notAvailable = true;
		end
	end
	return Text
end

TiresMenu.Dismount = function(TMachine, player)
	local playerObj = getSpecificPlayer(player);
	if TMachine and luautils.walkAdj(playerObj, TMachine:getSquare()) then
		ISTimedActionQueue.add(OnDismantleTireAction:new(playerObj, TMachine));
	end
end

TiresMenu.Deflate = function(TMachine, player)
	local playerObj = getSpecificPlayer(player);
	if TMachine and luautils.walkAdj(playerObj, TMachine:getSquare()) then
		ISTimedActionQueue.add(OnDeflateTireAction:new(playerObj, TMachine));
	end
end

TiresMenu.Mount = function(TMachine, player)
	local playerObj = getSpecificPlayer(player);
	if TMachine and luautils.walkAdj(playerObj, TMachine:getSquare()) then
		ISTimedActionQueue.add(OnMountTireAction:new(playerObj, TMachine));
	end
end

TiresMenu.Repair = function(TMachine, player)
	local playerObj = getSpecificPlayer(player);
	local playerinv = playerObj:getInventory();
	local item = nil;
	if playerinv:containsTypeRecurse("TireRubber") then
		item = playerObj:getInventory():getFirstTypeRecurse("TireRubber");
	end
	if TMachine and item ~= nil and luautils.walkAdj(playerObj, TMachine:getSquare()) then
		if luautils.haveToBeTransfered(playerObj, item) then
			ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
		end
		ISTimedActionQueue.add(OnRepairTireAction:new(playerObj, TMachine, item));
	end
end

Events.OnFillWorldObjectContextMenu.Add(TiresMenu.doBuildMenu);

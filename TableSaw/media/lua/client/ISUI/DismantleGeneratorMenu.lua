DismantleGeneratorMenu = {};

local function predicateNotBroken(item)
	return not item:isBroken()
end

DismantleGeneratorMenu.doBuildMenu = function(player, context, worldobjects)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory();
	local generator = nil;

	for _, object in ipairs(worldobjects) do
		if instanceof(object, "IsoGenerator") then
			generator = object;
			break;
		end
	end
	if generator == nil then return;end
	
	if generator ~= nil then
		--Menu Contextual y funcion de tooltip
		-- Titulo y creacion de menu
		local FirstTitle = context:addOption(getText("ContextMenu_DismantleGenerator"), generator, DismantleGeneratorMenu.onDismantle, playerObj);
		DismantleGeneratorMenu.HacerTooltip(generator, playerObj, FirstTitle);
	end
end

DismantleGeneratorMenu.HacerTooltip = function(generator, playerObj, _option)
	local playerInv = playerObj:getInventory();
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	tooltip:setName(getText("ContextMenu_DismantleGenerator"));
	tooltip.description = "<RGB:1,1,0>" .. getText("ContextMenu_DismantleGeneratorTT") .. " <LINE>" .. "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" ..  getText("Tooltip_craft_Needs") .. " : ";
	
	tooltip:setTexture(generator:getTextureName());
	tooltip.footNote = "";
	if playerInv:containsTypeEvalRecurse("Screwdriver", predicateNotBroken) then
		local item = playerInv:getFirstTypeEvalRecurse("Screwdriver", predicateNotBroken);
		tooltip.description = tooltip.description .. " <LINE> <RGB:0,0.8,0>" .. item:getDisplayName();
	else
		local itemtotranslate = InventoryItemFactory.CreateItem("Base.Screwdriver");
		tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0>" .. itemtotranslate:getDisplayName();
		_option.notAvailable = true;
	end
	if playerObj:getPerkLevel(Perks.Electricity) >= 6 then
		tooltip.description = tooltip.description .. " <LINE> <RGB:0,0.8,0>" .. getText("IGUI_perks_Electricity") .. " " .. tostring(playerObj:getPerkLevel(Perks.Electricity)) .. "/6" .. " <LINE> <LINE>";
	else
		_option.notAvailable = true;
		tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0>" .. getText("IGUI_perks_Electricity") .. " " .. tostring(playerObj:getPerkLevel(Perks.Electricity)) .. "/6" .. " <LINE> <LINE>";
	end
	
	if generator:isConnected() then
		_option.notAvailable = true;
		tooltip.description = tooltip.description ..  " <RGB:0.98,0.55,0>" .. getText("ContextMenu_Needtobedisconnected") .. " <LINE>";
	end
	if generator:isConnected() and generator:isActivated() then
		_option.notAvailable = true;
		tooltip.description = tooltip.description ..  " <RGB:0.98,0.55,0>" .. getText("ContextMenu_Needtobeoff") .. " <LINE>";
	end
	if generator:getFuel() > 0 then
		_option.notAvailable = true;
		tooltip.description = tooltip.description ..  " <RGB:0.98,0.55,0>" .. getText("ContextMenu_Needtobeempty") .. " <LINE>";
	end
	_option.toolTip = tooltip;
end

DismantleGeneratorMenu.onDismantle = function(generator, playerObj)

	local matitem = nil;
	local playerInv = playerObj:getInventory();
	if luautils.walkAdj(playerObj, generator:getSquare(), true) then
		if playerInv:containsTypeEvalRecurse("Screwdriver", predicateNotBroken) then
			local item = playerInv:getFirstTypeEvalRecurse("Screwdriver", predicateNotBroken);
			if luautils.haveToBeTransfered(playerObj, item) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
			end
			if not item:isEquipped() then
				ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, false))
			end
			ISTimedActionQueue.add(OnDismantleGenAction:new(playerObj, generator, item, 1500));
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(DismantleGeneratorMenu.doBuildMenu);

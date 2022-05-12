SawLogsMenu = {};

SawLogsMenu.doBuildMenu = function(player, context, worldobjects)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory();
	local tablesaw = nil;

	for _, object in ipairs(worldobjects) do
		if instanceof(object, "IsoObject") and object:getSprite() and object:getSprite():getProperties() and (object:getSprite():getProperties():Val("GroupName") == "HandMade" and object:getSprite():getProperties():Val("CustomName") == "Saw Table") then
			tablesaw = object;
			break;
		end
	end
	if tablesaw == nil then return;end
	
	if tablesaw ~= nil then
		--Menu Contextual y funcion de tooltip
		-- Titulo y creacion de submenu
		local FirstTitle = context:addOption(getText("ContextMenu_TableSaw"), worldobjects, nil);
		local SubMenu = context:getNew(context);
		context:addSubMenu(FirstTitle, SubMenu);
		local nm1 = nil;
		local nm2 = nil;
		if playerInv:containsTypeRecurse("Log") then
			nm1 = playerInv:FindAll("Base.Log");
		end
		if playerInv:containsTypeRecurse("Plank") then
			nm2 = playerInv:FindAll("Base.Plank");
		end
		if nm1 ~= nil and nm1:size() < 2 then
			local _option = SubMenu:addOption(getText("ContextMenu_SawLog"), tablesaw, SawLogsMenu.onSaw, playerObj, "Log", 1, 180);
			SawLogsMenu.HacerTooltip(tablesaw, playerInv, "Log", _option);
		elseif nm1 ~= nil and nm1:size() > 1 then

				local TitleOne = SubMenu:addOption(getText("ContextMenu_SawLogs"), worldobjects, nil);
				local SubMenu2 = context:getNew(SubMenu);
				context:addSubMenu(TitleOne, SubMenu2);
				local _option = SubMenu2:addOption(getText("ContextMenu_One"), tablesaw, SawLogsMenu.onSaw, playerObj, "Log", 1, 180);
				SawLogsMenu.HacerTooltip(tablesaw, playerInv, "Log", _option)

			
				local _option2 = SubMenu2:addOption(getText("ContextMenu_All"), tablesaw, SawLogsMenu.onSaw, playerObj, "Log", nm1:size(), 180);
				SawLogsMenu.HacerTooltip(tablesaw, playerInv, "Log", _option2)

		else
			local _option = SubMenu:addOption(getText("ContextMenu_SawLog"), tablesaw, SawLogsMenu.onSaw, playerObj, "Log", 1, 180);
			SawLogsMenu.HacerTooltip(tablesaw, playerInv, "Log", _option);
		end
		if nm2 ~= nil and nm2:size() < 2 then
			local _option2 = SubMenu:addOption(getText("ContextMenu_SawPlank"), tablesaw, SawLogsMenu.onSaw, playerObj, "Plank", 1, 120);
			SawLogsMenu.HacerTooltip(tablesaw, playerInv, "Plank", _option2);
		elseif nm2 ~= nil and nm2:size() > 1 then

				local TitleOne = SubMenu:addOption(getText("ContextMenu_SawPlank"), worldobjects, nil);
				local SubMenu2 = context:getNew(SubMenu);
				context:addSubMenu(TitleOne, SubMenu2);
				local _option = SubMenu2:addOption(getText("ContextMenu_One"), tablesaw, SawLogsMenu.onSaw, playerObj, "Plank", 1, 120);
				SawLogsMenu.HacerTooltip(tablesaw, playerInv, "Plank", _option)
				
				local _option2 = SubMenu2:addOption(getText("ContextMenu_All"), tablesaw, SawLogsMenu.onSaw, playerObj, "Plank", nm2:size(), 120);
				SawLogsMenu.HacerTooltip(tablesaw, playerInv, "Plank", _option2)

		else
			local _option2 = SubMenu:addOption(getText("ContextMenu_SawPlank"), tablesaw, SawLogsMenu.onSaw, playerObj, "Plank", 1, 120);
			SawLogsMenu.HacerTooltip(tablesaw, playerInv, "Plank", _option2);
		end
	end
end
SawLogsMenu.HacerTooltip = function(tablesaw, playerInv, item, _option)
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	tooltip:setName(getText("ContextMenu_Saw"..item));
	tooltip.description = "<RGB:1,1,0>" .. getText("ContextMenu_Saw"..item.."TT") .. " <LINE>" .. "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" ..  getText("Tooltip_craft_Needs") .. " : ";

	tooltip:setTexture("media/textures/Saw" .. item .. "Image.png");
	tooltip.footNote = "";
	if (SandboxVars.AllowExteriorGenerator and tablesaw:getSquare():haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then
		tooltip.footNote = getText("IGUI_RadioPowerNearby");
	else
		tooltip.footNote = getText("IGUI_RadioRequiresPowerNearby");
		_option.notAvailable = true;
	end
	local itemtotranslate = InventoryItemFactory.CreateItem("Base." .. item);
	if playerInv:containsTypeRecurse(item) then
		local nm = playerInv:FindAll("Base." .. item);
		tooltip.description = tooltip.description .. "<LINE> <RGB:0,0.8,0>" .. itemtotranslate:getDisplayName() .. ": ".. tostring(nm:size()) .. "/1"
	else
		tooltip.description = tooltip.description .. "<LINE> <RGB:1,0,0>" .. itemtotranslate:getDisplayName() .. ": 0/1"
		_option.notAvailable = true;
	end
	tooltip.description = tooltip.description .. getText("ContextMenu_Advice"..item);
	_option.toolTip = tooltip;
end

SawLogsMenu.onSaw = function(tablesaw, playerObj, item, directive, time)

	local matitem = nil;
	local playerInv = playerObj:getInventory();
	local stacks = playerInv:getItemsFromFullType("Base."..item, true);
	if tablesaw and luautils.walkAdj(playerObj, tablesaw:getSquare()) then
		if stacks:size() > 1 and directive > 1 then 
			for i=1,stacks:size() do
				local ItemBase = stacks:get(i-1)
				if not ItemBase:isEquipped() then
					ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, ItemBase, 50, true, false))
				end
				ISTimedActionQueue.add(OnSawAction:new(playerObj, tablesaw, ItemBase, time));
			end
		else
			if playerObj:getInventory():containsTypeRecurse(item) then
				matitem = playerObj:getInventory():getItemFromType(item);
			end
			if matitem ~= nil and not matitem:isEquipped() then
				ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, matitem, 50, true, false))
			end
			ISTimedActionQueue.add(OnSawAction:new(playerObj, tablesaw, matitem, time));
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(SawLogsMenu.doBuildMenu);

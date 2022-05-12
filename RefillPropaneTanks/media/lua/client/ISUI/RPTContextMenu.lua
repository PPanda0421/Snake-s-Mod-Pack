RPTMenu = {};

RPTMenu.initContextMenu = function(player, context, worldobjects)

	local playerObj = getSpecificPlayer(player)
	local item = nil;
	local propanetankobject = nil;
	for _, object in ipairs(worldobjects) do
		if instanceof(object, "IsoObject") and object:getSprite() and object:getSprite():getProperties() and (object:getSprite():getProperties():Val("CustomName") == "Propane Tank") then
			propanetankobject = object;
			break;
		end
	end

	if not propanetankobject then return end;

    local objectData = propanetankobject:getModData();
	
	if propanetankobject ~= nil then

		if not objectData.PropaneContent then
			objectData.PropaneContent = ZombRand(45,101);
			propanetankobject:transmitModData();
		end

		local ChargeOption = context:addOption(getText("ContextMenu_RechargeTank"), propanetankobject, RPTMenu.Recharge_OnCreate, getSpecificPlayer(player));
		local ChargeTooltip = ISWorldObjectContextMenu.addToolTip();
		ChargeTooltip:setName(getText("ContextMenu_RechargeTank"));
		local color = " <RGB:0,0.8,0> ";
		local inventory = getSpecificPlayer(player):getInventory();
	    if objectData.PropaneContent > 0 and inventory:contains("PropaneTank") then
			local tanks = getSpecificPlayer(player):getInventory():getItemsFromType("PropaneTank");
			for i=0, tanks:size() -1 do
				local item = tanks:get(i);
				if item:getUsedDelta() < 1 then
					ChargeOption.notAvailable = false;
					color = " <RGB:0,0.8,0> ";
					break;
				else
					ChargeOption.notAvailable = true;
					color = " <RGB:1,0,0> ";
				end
			end
		else
			ChargeOption.notAvailable = true;
			color = " <RGB:1,0,0> ";
		end
		local text1 = " <RGB:1,1,1> " .. getText("ContextMenu_RechargeTankTT") .. " <LINE>  <LINE>" .. getText("ContextMenu_TankContains") .. RPTMenu.getAmountColor(objectData) .. tostring(objectData.PropaneContent) .. "%" .. " <LINE>";
		local text2 = " <RGB:1,1,1> " .. getText("Tooltip_craft_Needs") .. ": ";
		local text3 = color .. getItemNameFromFullType("Base.PropaneTank") .. " " .. getText("ContextMenu_PropaneNonFull") .. " <LINE>";
		ChargeTooltip.description = text1 .. text2 .. text3;
	    ChargeTooltip:setTexture("pmrm_01_10");
        ChargeOption.toolTip = ChargeTooltip;
	end
end

RPTMenu.Recharge_OnCreate = function(propanetankobject, player)
	local PropaneTank = nil
	local equipped = player:getPrimaryHandItem();
	if equipped and equipped:getType() == "PropaneTank" and equipped:getUsedDelta() < 1 then
		PropaneTank = equipped
	end
	if not PropaneTank then
		local tanks = player:getInventory():getItemsFromType("PropaneTank")
		local usedDelta = -1
		for i=1,tanks:size() do
			local PropaneTank2 = tanks:get(i-1)
			if PropaneTank2:getUsedDelta() < 1 and PropaneTank2:getUsedDelta() > usedDelta then
				PropaneTank = PropaneTank2
				usedDelta = PropaneTank:getUsedDelta()
			end
		end
	end
	if not PropaneTank then
		return
	end
	if PropaneTank and luautils.walkAdj(player, propanetankobject:getSquare()) then
		ISInventoryPaneContextMenu.equipWeapon(PropaneTank, true, false, player:getPlayerNum())
		ISTimedActionQueue.add(ISTakePropane:new(player, propanetankobject, PropaneTank, 200))
	end
end

RPTMenu.getAmountColor = function(itemdata)
	local color = " <RGB:1,1,1> "
	if itemdata.PropaneContent then
		if itemdata.PropaneContent > 75 then
			color = " <RGB:0,0.8,0> "
		elseif itemdata.PropaneContent > 50 then
			color = " <RGB:0.15,0.3,0.63> "
		elseif itemdata.PropaneContent > 25 then
			color = " <RGB:0.8,0.8,0> "
		elseif itemdata.PropaneContent > 0 then
			color = " <RGB:0.98,0.55,0> "
		elseif itemdata.PropaneContent == 0 then
			color = " <RGB:1,0,0> "
		end
		return color;
	end
end
Events.OnFillWorldObjectContextMenu.Add(RPTMenu.initContextMenu);
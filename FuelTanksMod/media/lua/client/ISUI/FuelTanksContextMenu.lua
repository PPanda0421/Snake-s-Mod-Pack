FuelTanksMenu = {};

local function predicateNotEmpty(item)
	return item:getUsedDelta() > 0
end

local function predicateNotFull(item)
	return item:getUsedDelta() < 1
end

FuelTanksMenu.initContextMenu = function(player, context, worldobjects)

	local playerObj = getSpecificPlayer(player);
	if playerObj:getVehicle() then return end;
	local playerInv = playerObj:getInventory();
	local item = nil;
	local fueltankobject = nil;
	local fuelstation = nil;
	for _, object in ipairs(worldobjects) do
		if instanceof(object, "IsoObject") and object:getSprite() and object:getSprite():getProperties() and 
		  (object:getSprite():getProperties():Val("CustomName") == "Fuel Tank"
		  or object:getSprite():getProperties():Val("CustomName") == "Fuel Tank 2" 
		  or object:getSprite():getProperties():Val("CustomName") == "Fuel Tank 3" 
		  or object:getSprite():getProperties():Val("CustomName") == "Fuel Tank 4") then
			fueltankobject = object;
			break;
		end
		if object:getPipedFuelAmount() and playerInv:containsTypeRecurse("FuelMeter") and object:getSquare() and object:getSquare():getProperties():Is("fuelAmount") then
			fuelstation = object;
			break;
		end		
	end
	

	if not fueltankobject and not fuelstation then return end;
	
	if fueltankobject ~= nil then
		local objectData = fueltankobject:getModData();
		if not objectData.MaxCapacity then
			local FuelTankType = fueltankobject:getSprite():getProperties():Val("CustomName");
			objectData.MaxCapacity = FuelTanksMenu.setMaxCapacity(FuelTankType);
			fueltankobject:transmitModData();
		end
		if not objectData.Fuel then
			objectData.Fuel = 0;
			fueltankobject:transmitModData();
		end
		-- Titulo y creacion de submenu
		local FirstTitle = context:addOption(getText("ContextMenu_FuelTank"), worldobjects, nil);
		local SubMenu = context:getNew(context);
		context:addSubMenu(FirstTitle, SubMenu);
		--
		-- opciones
		local option1 = false;
		local option2 = false;
		-- Primer Submenu
		local desc1 = "";
		if objectData.Fuel >= 1 and objectData.MaxCapacity ~= nil and playerInv:containsTypeRecurse("EmptyPetrolCan") or playerInv:containsTypeEvalRecurse("PetrolCan", predicateNotFull) then
			option1 = true;
			desc1 = " <RGB:0,0.8,0> " .. getText("ContextMenu_TakeGasTT");
		elseif objectData.Fuel == 0 and objectData.MaxCapacity ~= nil and playerInv:containsTypeRecurse("EmptyPetrolCan") or playerInv:containsTypeEvalRecurse("PetrolCan", predicateNotFull) then
			desc1 = " <RGB:0.98,0.55,0> " .. getText("ContextMenu_TankEmptyTT");
			option1 = false;
		else
			option1 = false;
			if objectData.Fuel == 0 then
				desc1 = " <RGB:0.98,0.55,0> " .. getText("ContextMenu_TankEmptyTT");
			else
				desc1 = " <RGB:0.98,0.55,0> " .. getText("ContextMenu_NeedGasWithSpace");
			end
		end
		local name1 = getText("ContextMenu_TakeGasFromTank");
		local ChargeOption = SubMenu:addOption(name1, fueltankobject, FuelTanksMenu.FillGasCan_OnCreate, playerObj, fueltankobject:getSquare());
		FuelTanksMenu.addToolTip(ChargeOption, name1, desc1, fueltankobject:getTextureName(), objectData)
		if not option1 then
			ChargeOption.onSelect = nil;
			ChargeOption.notAvailable = true;
		end

		-- Segundo Submenu
		local desc2 = "";
		if objectData.Fuel < objectData.MaxCapacity and playerInv:containsTypeEvalRecurse("PetrolCan", predicateNotEmpty) then
			option2 = true;
			desc2 = " <RGB:0,0.8,0> " .. getText("ContextMenu_FillFTankTT");
		elseif objectData.Fuel == objectData.MaxCapacity and playerInv:containsTypeEvalRecurse("PetrolCan", predicateNotEmpty) then
			option2 = false;
			desc2 = " <RGB:0.98,0.55,0> " .. getText("ContextMenu_TankFullTT");
		else
			option2 = false;
			if objectData.Fuel == objectData.MaxCapacity then
				desc2 = " <RGB:0.98,0.55,0> " .. getText("ContextMenu_TankFullTT");
			else
				desc2 = " <RGB:0.98,0.55,0> " .. getText("ContextMenu_NeedGasCan");
			end
		end
		local petrolCan = playerInv:getFirstTypeEvalRecurse("PetrolCan", predicateNotEmpty);
		local name2 = getText("ContextMenu_FuelTankAddFuel");
		local TakeOption = SubMenu:addOption(name2, fueltankobject, FuelTanksMenu.onAddFuel, player);
		FuelTanksMenu.addToolTip(TakeOption, name2, desc2, fueltankobject:getTextureName(), objectData)
		if not option2 then
			TakeOption.onSelect = nil;
			TakeOption.notAvailable = true;
		end
	end
	if fuelstation ~= nil then
		local FirstTitle = context:addOption(getText("ContextMenu_FuelMeter"), fuelstation, FuelTanksMenu.onFuelMeter, playerObj, fuelstation:getSquare());
		-- if fuelstation:getSquare():DistToProper(playerObj:getSquare()) <= 1 then
			-- local name = getText("ContextMenu_FuelMeter");
			-- local desc = getText("Tooltip_FAmount") .. tostring(fuelstation:getPipedFuelAmount());
			-- FuelTanksMenu.addFuelToolTip(FirstTitle, name, desc)
		-- end
	end
end

FuelTanksMenu.addFuelToolTip = function(option, name, desc)
    local toolTip = ISWorldObjectContextMenu.addToolTip();
    toolTip:setName(name);
    toolTip.description = desc;
    toolTip:setTexture("media/textures/Item_FuelMeter.png");
	option.toolTip = toolTip;
    return toolTip;
end

FuelTanksMenu.addToolTip = function(option, name, desc, texture, objectData)
    local toolTip = ISWorldObjectContextMenu.addToolTip();
    toolTip:setName(name);
    toolTip.description = desc .. " <LINE>  <LINE>" .. " <RGB:1,1,1>" .. getText("ContextMenu_FuelTankMaxCapacity") .. " <RGB:0,0.8,0>" .. tostring(objectData.MaxCapacity) .. " <LINE> <RGB:1,1,1>" .. getText("ContextMenu_FuelTankContains") .. FuelTanksMenu.getAmountColor(objectData) .. tostring(FuelTanksMenu.CalculPercent(objectData.Fuel, objectData.MaxCapacity)) .. "%" .. " <LINE>";
    toolTip:setTexture(texture);
	option.toolTip = toolTip;
    return toolTip;
end

FuelTanksMenu.onFuelMeter = function(FuelObject, playerObj, square)
	local FuelMeter = false;
	local equipped = playerObj:getPrimaryHandItem()
	if equipped and equipped:getType() == "FuelMeter" then
		FuelMeter = true;
	end
	if luautils.walkAdj(playerObj, square) then
		if not FuelMeter then
			FuelMeter = playerObj:getInventory():getFirstTypeRecurse("FuelMeter")
			ISInventoryPaneContextMenu.equipWeapon(FuelMeter, true, false, playerObj:getPlayerNum())
		end
	end
	ISTimedActionQueue.add(FuelTanksShowInfo:new(playerObj, FuelObject, 200));
end

FuelTanksMenu.FillGasCan_OnCreate = function(FuelObject, playerObj, square)
	-- Prefer an equipped EmptyPetrolCan/PetrolCan, then the fullest PetrolCan, then any EmptyPetrolCan.
	local petrolCan = nil
	local equipped = playerObj:getPrimaryHandItem()
	if equipped and equipped:getType() == "PetrolCan" and equipped:getUsedDelta() < 1 then
		petrolCan = equipped
	elseif equipped and equipped:getType() == "EmptyPetrolCan" then
		petrolCan = equipped
	end
	if not petrolCan then
		local cans = playerObj:getInventory():getAllTypeEvalRecurse("PetrolCan", predicateNotFull)
		local usedDelta = -1
		for i=1,cans:size() do
			local petrolCan2 = cans:get(i-1)
			if petrolCan2:getUsedDelta() < 1 and petrolCan2:getUsedDelta() > usedDelta then
				petrolCan = petrolCan2
				usedDelta = petrolCan:getUsedDelta()
			end
		end
	end
	if not petrolCan then
		petrolCan = playerObj:getInventory():getFirstTypeRecurse("EmptyPetrolCan")
	end
	if petrolCan and luautils.walkAdj(playerObj, square) then
		ISInventoryPaneContextMenu.equipWeapon(petrolCan, true, false, playerObj:getPlayerNum())
		ISTimedActionQueue.add(FuelTanksTakeFuel:new(playerObj, FuelObject, square, petrolCan, 100))
	end
end

FuelTanksMenu.onAddFuel = function(fueltankobject, player)
	local petrolCan = nil
	local playerObj = getSpecificPlayer(player);
	local equipped = playerObj:getPrimaryHandItem()
	if equipped and equipped:getType() == "PetrolCan" and equipped:getUsedDelta() > 0 then
		petrolCan = equipped
	end
	if not petrolCan then
		local cans = playerObj:getInventory():getAllTypeEvalRecurse("PetrolCan", predicateNotEmpty)
		--local usedDelta = -1
		for i=1,cans:size() do
			local petrolCan2 = cans:get(i-1)
			if petrolCan2:getUsedDelta() > 0 then
				petrolCan = petrolCan2
				--usedDelta = petrolCan:getUsedDelta()
			end
		end
	end
	if luautils.walkAdj(playerObj, fueltankobject:getSquare()) then
		ISInventoryPaneContextMenu.equipWeapon(petrolCan, true, false, playerObj:getPlayerNum());
		ISTimedActionQueue.add(FuelTanksAddFuel:new(player, fueltankobject, petrolCan, 70 + (petrolCan:getUsedDelta() * 50)));
	end
end

FuelTanksMenu.setMaxCapacity = function(ObjectType)
	local MaxCapacity = 100;
	if ObjectType == "Fuel Tank" then
		MaxCapacity = 120;
	elseif ObjectType == "Fuel Tank 2" then
		MaxCapacity = 240;
	elseif ObjectType == "Fuel Tank 3" then
		MaxCapacity = 360;
	elseif ObjectType == "Fuel Tank 4" then
		MaxCapacity = 400;
	end
	return MaxCapacity
end

FuelTanksMenu.getAmountColor = function(itemdata)
	local color = " <RGB:1,1,1> "
	if itemdata.Fuel and itemdata.MaxCapacity then
		local percent = FuelTanksMenu.CalculPercent(itemdata.Fuel, itemdata.MaxCapacity)
		if percent > 75 then
			color = " <RGB:0,0.8,0> "
		elseif percent > 50 then
			color = " <RGB:0.15,0.3,0.63> "
		elseif percent > 25 then
			color = " <RGB:0.8,0.8,0> "
		elseif percent > 0 then
			color = " <RGB:0.98,0.55,0> "
		elseif percent == 0 then
			color = " <RGB:1,0,0> "
		end
		return color;
	end
end

FuelTanksMenu.CalculPercent = function(actual, total)
	local percent = tonumber(string.format("%." .. (2 or 0) .. "f", actual / total *100));
	return percent
end

Events.OnFillWorldObjectContextMenu.Add(FuelTanksMenu.initContextMenu);
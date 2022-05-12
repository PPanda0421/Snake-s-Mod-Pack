--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

PMRMISVehicleMenu = {}
PMRMISVehicleMenu.CantPaint = {
	"CarLights",
	"CarLightsPolice",
	"PickUpTruckLights",
	"PickUpTruckLightsFire",
	"PickUpTruckMccoy",
	"PickUpVanLights",
	"PickUpVanLightsFire",
	"PickUpVanLightsPolice",
	"PickUpVanMccoy",
	"StepVanMail",
	"VanAmbulance",
	"VanRadio",
	"VanSpiffo"
};

local function comparatorDrainableUsesInt(item1, item2)
    return item1:getDrainableUsesInt() - item2:getDrainableUsesInt()
end

function PMRMISVehicleMenu.recalculGeneralCondition(vehicle)
	if not vehicle then return; end
	local generalCondition = 0;
	local totalPart = 0;
	for i=1,vehicle:getPartCount() do
		local part = vehicle:getPartByIndex(i-1)
		local cond = part:getCondition();
		-- if we removed the item, condition should be 0
		if part:getItemType() and not part:getItemType():isEmpty() and not part:getInventoryItem() then
			cond = 0;
		end
		generalCondition = generalCondition + cond;
		totalPart = totalPart + 1;
	end
	generalCondition = round(generalCondition / totalPart, 2);
	return generalCondition
end
function PMRMISVehicleMenu.CrashedHelicopter(vehicle)
	local HList = {
		"Bell206LBMW",
		"Bell206LBMWCrashed",
		"Bell206LBMWFuselage",
		"Bell206LBMWTail",
		"Bell206Police",
		"Bell206PoliceCrashed",
		"Bell206PoliceFuselage",
		"Bell206PoliceTail",
		"OH58Rescue",
		"UH1H",
		"UH1HCrash",
		"UH1HFuselage",
		"UH1Hmedevac",
		"UH1Hmedevaccrash",
		"UH1HMedevacFuselage",
		"UH1HMedevacTail",
		"UH1HSurvivalist",
		"UH1Hsurvivalistcrash",
		"UH1HSurvivalistFuselage",
		"UH1HSurvivalistTail",
		"FEMASupplyDrop"
	};
	for i=1,#HList do
		--getPlayer():Say(HList[i])
		if string.match(vehicle:getScript():getName(), HList[i]) then
			return true;
		end
	end
	return false;
end

function PMRMISVehicleMenu.OnFillWorldObjectContextMenu(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local vehicle = playerObj:getVehicle()
	if not vehicle then
		if JoypadState.players[player+1] then
			local px = playerObj:getX()
			local py = playerObj:getY()
			local pz = playerObj:getZ()
			local sqs = {}
			sqs[1] = getCell():getGridSquare(px, py, pz)
			local dir = playerObj:getDir()
			if (dir == IsoDirections.N) then        sqs[2] = getCell():getGridSquare(px-1, py-1, pz); sqs[3] = getCell():getGridSquare(px, py-1, pz);   sqs[4] = getCell():getGridSquare(px+1, py-1, pz);
			elseif (dir == IsoDirections.NE) then   sqs[2] = getCell():getGridSquare(px, py-1, pz);   sqs[3] = getCell():getGridSquare(px+1, py-1, pz); sqs[4] = getCell():getGridSquare(px+1, py, pz);
			elseif (dir == IsoDirections.E) then    sqs[2] = getCell():getGridSquare(px+1, py-1, pz); sqs[3] = getCell():getGridSquare(px+1, py, pz);   sqs[4] = getCell():getGridSquare(px+1, py+1, pz);
			elseif (dir == IsoDirections.SE) then   sqs[2] = getCell():getGridSquare(px+1, py, pz);   sqs[3] = getCell():getGridSquare(px+1, py+1, pz); sqs[4] = getCell():getGridSquare(px, py+1, pz);
			elseif (dir == IsoDirections.S) then    sqs[2] = getCell():getGridSquare(px+1, py+1, pz); sqs[3] = getCell():getGridSquare(px, py+1, pz);   sqs[4] = getCell():getGridSquare(px-1, py+1, pz);
			elseif (dir == IsoDirections.SW) then   sqs[2] = getCell():getGridSquare(px, py+1, pz);   sqs[3] = getCell():getGridSquare(px-1, py+1, pz); sqs[4] = getCell():getGridSquare(px-1, py, pz);
			elseif (dir == IsoDirections.W) then    sqs[2] = getCell():getGridSquare(px-1, py+1, pz); sqs[3] = getCell():getGridSquare(px-1, py, pz);   sqs[4] = getCell():getGridSquare(px-1, py-1, pz);
			elseif (dir == IsoDirections.NW) then   sqs[2] = getCell():getGridSquare(px-1, py, pz);   sqs[3] = getCell():getGridSquare(px-1, py-1, pz); sqs[4] = getCell():getGridSquare(px, py-1, pz);
			end
			for _,sq in ipairs(sqs) do
				vehicle = sq:getVehicleContainer()
				if vehicle then
					return PMRMISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
				end
			end
			return
		end
		vehicle = IsoObjectPicker.Instance:PickVehicle(getMouseXScaled(), getMouseYScaled())
		if vehicle then
			return PMRMISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
		end
		return
	end
end

function PMRMISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
	local playerObj = getSpecificPlayer(player)
	--Check Fuel Tanks Mod
	if FuelTanksMenu then
		PMRMISVehicleMenu.FillPartMenu(player, context, nil, vehicle);
	end
	----------------------
	local Burnt = false;
	if string.match(vehicle:getScript():getName(), "Burnt") then
		Burnt = true;
	end
	local Trailer = false;
	if string.match(vehicle:getScript():getName(), "Trailer") then
		Trailer = true;
	end
	local Helicopter = PMRMISVehicleMenu.CrashedHelicopter(vehicle);

	if vehicle:getRust() == 1 and not Burnt then
		local option = context:addOption(getText("ContextMenu_RemoveRust"), playerObj, PMRMISVehicleMenu.onRemoveRust, vehicle)
		PMRMISVehicleMenu.HacerTooltip(playerObj, option);
	end

	if not vehicle:isEngineStarted() and not Burnt then
		if not Trailer then
			local Cond = 100;
			if Helicopter then
				Cond = 0;
			else
				Cond = PMRMISVehicleMenu.recalculGeneralCondition(vehicle);
			end
			
			if Cond < 20 then
				--playerObj:Say(tostring(Cond))
				local option = context:addOption(getText("ContextMenu_RemoveLowConditionVehicle"), playerObj, PMRMISVehicleMenu.onRemoveLowCondVehicle, vehicle, Helicopter);
				local toolTip = ISToolTip:new();
				toolTip:initialise();
				toolTip:setVisible(false);
				option.toolTip = toolTip;
				toolTip:setName(getText("ContextMenu_RemoveLowConditionVehicle"));
				toolTip.description = getText("Tooltip_removeLowCondVehicle") .. " <LINE> <LINE> ";
				
				if playerObj:getInventory():containsTypeRecurse("WeldingMask") then
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.WeldingMask") .. " 1/1";
				else
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.WeldingMask") .. " 0/1";
					option.notAvailable = true;
				end
				
				local blowTorch = ISBlacksmithMenu.getBlowTorchWithMostUses(playerObj:getInventory());
				if blowTorch then
					local blowTorchUseLeft = blowTorch:getDrainableUsesInt();
					if blowTorchUseLeft >= 20 then
						toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.BlowTorch") .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. 20;
					else
						toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. 20;
						option.notAvailable = true;
					end
				else
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " 0/20";
					option.notAvailable = true;
				end
			end
		end
		local square = PMRMISVehicleMenu.getNearbyPaintMachine(vehicle)
		if square then
			local PMachine = nil;
			for i=0,square:getObjects():size()-1 do
				local object = square:getObjects():get(i);
				if instanceof(object, "IsoObject") and
				  object:getSprite() and
				  object:getSprite():getProperties() and 
				  object:getSprite():getProperties():Val("CustomName") == "Paint Machine" then
					PMachine = object;
					break;
				end
			end
			if PMachine ~= nil then
				local objectData = PMachine:getModData();
				if objectData.Full then
					--if part:getContainerContentAmount() < part:getContainerCapacity() then
					local option = context:addOption(getText("ContextMenu_PaintVehicle"), playerObj, PMRMISVehicleMenu.onPaintVehicle, vehicle);
					local toolTip = ISToolTip:new();
					toolTip:initialise();
					toolTip:setVisible(false);
					option.toolTip = toolTip;
					toolTip:setName(getText("ContextMenu_PaintVehicle"));
					toolTip:setTexture("media/ui/PaintingMachine.png");
					toolTip.description = getText("ContextMenu_PaintVehicleDesc") .. " <LINE>";
					local CanPaint = PMRMISVehicleMenu.CheckVehicle(vehicle)
					if not CanPaint then
						toolTip.description = toolTip.description .. " <RGB:1,0,0>" .. getText("ContextMenu_CantPaintThisCar");
						option.notAvailable = true;
					else
						if vehicle:getRust() ~= 0 then
							toolTip.description = toolTip.description .. " <RGB:1,0,0>" .. getText("ContextMenu_NeedToRemoveRust");
							option.notAvailable = true;
						end
					end
					toolTip.footNote = getText("ContextMenu_AllFull");
				end
			end
			--playerObj:Say("Square!!!!")
		end
	end
end
function PMRMISVehicleMenu.CheckVehicle(vehicle)
	local CanPaint = true;
	local index = 0;
	for i = 1, #PMRMISVehicleMenu.CantPaint do
		index = index +1;
		local CarType = PMRMISVehicleMenu.CantPaint[index];
		if vehicle:getScript():getName() ~= nil and vehicle:getScript():getName() == CarType then
			CanPaint = false;
			break
		end
	end
	return CanPaint
end

function PMRMISVehicleMenu.FillPartMenu(playerIndex, context, slice, vehicle)
	local playerObj = getSpecificPlayer(playerIndex);
	local typeToItem = VehicleUtils.getItems(playerIndex)
	for i=1,vehicle:getPartCount() do
		local part = vehicle:getPartByIndex(i-1)
		if not vehicle:isEngineStarted() and part:isContainer() and part:getContainerContentType() == "Gasoline" then
			local square = PMRMISVehicleMenu.getNearbyFuelTank(vehicle)
			if square then
				local Tank = nil;
				for i=0,square:getObjects():size()-1 do
					local object = square:getObjects():get(i);
					if instanceof(object, "IsoObject") and
					  object:getSprite() and
					  object:getSprite():getProperties() and 
					  (object:getSprite():getProperties():Val("CustomName") == "Fuel Tank" or 
						object:getSprite():getProperties():Val("CustomName") == "Fuel Tank 2" or 
						object:getSprite():getProperties():Val("CustomName") == "Fuel Tank 3" or 	
						object:getSprite():getProperties():Val("CustomName") == "Fuel Tank 4") then
						Tank = object;
						break;
					end
				end
				if Tank ~= nil then
					local objectData = Tank:getModData();
					if objectData.Fuel and objectData.Fuel > 0 then
						if part:getContainerContentAmount() < part:getContainerCapacity() then
							if slice then
								slice:addSlice(getText("ContextMenu_VehicleRefuelFromTank"), getTexture("media/ui/vehicles/vehicle_refuel_from_pump.png"), ISVehiclePartMenu.onPumpGasoline, playerObj, part)
							else
								context:addOption(getText("ContextMenu_VehicleRefuelFromTank"), playerObj, PMRMISVehicleMenu.onPumpGasolineTank, part)
							end						
						end
						--playerObj:Say("Object")
					end
				end
				--playerObj:Say("Square!!!!")
			end
		end
	end
end

local function predicateBlowTorch(item)
	return item:getType() == "BlowTorch" and item:getDrainableUsesInt() >= 20
end

function PMRMISVehicleMenu.onRemoveLowCondVehicle(player, vehicle, Helicopter)
	if luautils.walkAdj(player, vehicle:getSquare()) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), predicateBlowTorch, true);
		local mask = player:getInventory():getFirstTypeRecurse("WeldingMask");
		if mask then
			ISInventoryPaneContextMenu.wearItem(mask, player:getPlayerNum());
		end
		ISTimedActionQueue.add(ISRemoveLowCondVehicle:new(player, vehicle, Helicopter));
	end
end

function PMRMISVehicleMenu.onPumpGasolineTank(playerObj, part)
	if playerObj:getVehicle() then
		ISVehicleMenu.onExit(playerObj)
	end
	local square = PMRMISVehicleMenu.getNearbyFuelTank(part:getVehicle())
	if square then
		local Tank = nil;
		for i=0,square:getObjects():size()-1 do
			local object = square:getObjects():get(i);
			if instanceof(object, "IsoObject") and
			  object:getSprite() and
			  object:getSprite():getProperties() and 
			  (object:getSprite():getProperties():Val("CustomName") == "Fuel Tank" or 
				object:getSprite():getProperties():Val("CustomName") == "Fuel Tank 2" or 
				object:getSprite():getProperties():Val("CustomName") == "Fuel Tank 3" or 	
				object:getSprite():getProperties():Val("CustomName") == "Fuel Tank 4") then
				Tank = object;
				break;
			end
		end
		if Tank ~= nil then
			local objectData = Tank:getModData();
			if objectData.Fuel and objectData.Fuel > 0 then
				local action = ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea())
				action:setOnFail(ISVehiclePartMenu.onPumpGasolinePathFail, playerObj)
				ISTimedActionQueue.add(action)
				ISTimedActionQueue.add(ISRefuelFromGasTank:new(playerObj, part, square, 100, Tank))
			end
		end
	--	local action = ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea())
	--	action:setOnFail(ISVehiclePartMenu.onPumpGasolinePathFail, playerObj)
	--	ISTimedActionQueue.add(action)
	--	ISTimedActionQueue.add(ISRefuelFromGasPump:new(playerObj, part, square, 100))
	end
end


function PMRMISVehicleMenu.getAcidWithMostUses(container)
    return container:getBestTypeEvalRecurse("AdvancedFishing.AcidC", comparatorDrainableUsesInt)
end

PMRMISVehicleMenu.HacerTooltip = function(playerObj, _option)
	local playerInv = playerObj:getInventory();
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	tooltip:setName(getText("ContextMenu_RemoveRust"));
	tooltip.description = " <RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" ..  getText("Tooltip_craft_Needs") .. " : ";
	local LGRMod = false
	if LGEPData then
		LGRMod = true;
	end
	if LGRMod then
		local item = playerInv:containsTypeRecurse("AcidC");
		local AcidC = false;
		if item ~= nil then
			AcidC = PMRMISVehicleMenu.getAcidWithMostUses(playerObj:getInventory());
		end
		if AcidC then
			local AcidCUseLeft = AcidC:getDrainableUsesInt();
			if AcidCUseLeft >= 5 then
				tooltip.description = tooltip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("AdvancedFishing.AcidC") .. getText("ContextMenu_Uses") .. " " .. AcidCUseLeft .. "/" .. 5;
			else
				tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0> " .. getItemNameFromFullType("AdvancedFishing.AcidC") .. getText("ContextMenu_Uses") .. " " .. AcidCUseLeft .. "/" .. 5;
				_option.notAvailable = true;
			end
		else
			tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0> " .. getItemNameFromFullType("AdvancedFishing.AcidC") .. " 0/5";
			_option.notAvailable = true;
		end	
	end
	
	if playerObj:getInventory():containsTypeRecurse("WeldingMask") then
		tooltip.description = tooltip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.WeldingMask") .. " 1/1";
	else
		tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0> " .. getItemNameFromFullType("Base.WeldingMask") .. " 0/1";
		_option.notAvailable = true;
	end
	local item2 = playerInv:containsTypeRecurse("BlowTorch");
	local blowTorch = false;
	if item2 ~= nil then
		blowTorch = ISBlacksmithMenu.getBlowTorchWithMostUses(playerObj:getInventory());
	end
	if blowTorch then
		local blowTorchUseLeft = blowTorch:getDrainableUsesInt();
		if blowTorchUseLeft >= 10 then
			tooltip.description = tooltip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.BlowTorch") .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. 10;
		else
			tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. 10;
			_option.notAvailable = true;
		end
	else
		tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " 0/10";
		_option.notAvailable = true;
	end
	local metalSheet = playerObj:getInventory():containsTypeRecurse("SheetMetal")
	local count = 0;
	if metalSheet then
		count = playerObj:getInventory():getCountTypeRecurse("SheetMetal")
	end
	if count < 1 then
		tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0> " .. getItemNameFromFullType("Base.SheetMetal") .. " " .. count .. "/" .. "1";
		isOk = false;
	else
		tooltip.description = tooltip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.SheetMetal") .. " " .. "1" .. "/" .. "1" ;
	end
	
	if playerObj:getPerkLevel(Perks.Mechanics) >= 3 then
		tooltip.description = tooltip.description .. " <LINE> <RGB:0,0.8,0>" .. getText("IGUI_perks_Mechanics") .. " " .. tostring(playerObj:getPerkLevel(Perks.Mechanics)) .. "/3";
	else
		_option.notAvailable = true;
		tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0>" .. getText("IGUI_perks_Mechanics") .. " " .. tostring(playerObj:getPerkLevel(Perks.Mechanics)) .. "/3";
	end
	if playerObj:getPerkLevel(Perks.MetalWelding) >= 6 then
		tooltip.description = tooltip.description .. " <LINE> <RGB:0,0.8,0>" .. getText("IGUI_perks_MetalWelding") .. " " .. tostring(playerObj:getPerkLevel(Perks.MetalWelding)) .. "/6" .. " <LINE> <LINE>";
	else
		_option.notAvailable = true;
		tooltip.description = tooltip.description .. " <LINE> <RGB:0.8,0,0>" .. getText("IGUI_perks_MetalWelding") .. " " .. tostring(playerObj:getPerkLevel(Perks.MetalWelding)) .. "/6" .. " <LINE> <LINE>";
	end
	_option.toolTip = tooltip;
end

function PMRMISVehicleMenu.onRemoveRust(playerObj, vehicle)
	if vehicle:getRust() == 1 then
		local matitem2 = nil;
		if playerObj:getInventory():containsTypeRecurse("WeldingMask") then
			matitem2 = playerObj:getInventory():getFirstTypeRecurse("WeldingMask");
		end
		if matitem2 ~= nil then
			if luautils.haveToBeTransfered(playerObj, matitem2) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, matitem2, matitem2:getContainer(), playerObj:getInventory()));
			end
            if instanceof(matitem2, "Clothing") then
                -- WeldingMask
                if not playerObj:isEquippedClothing(matitem2) then
                    ISInventoryPaneContextMenu.wearItem(matitem2, playerObj:getPlayerNum())
                end
            else
                ISWorldObjectContextMenu.equip(playerObj, playerObj:getSecondaryHandItem(), matitem2:getType(), false)
            end
		end
		local LGRMod = false
		if LGEPData then
			LGRMod = true;
		end
		if LGRMod then
			local haveitem = playerObj:getInventory():containsTypeRecurse("AcidC");
			local AcidC = false;
			if haveitem ~= nil then
				AcidC = PMRMISVehicleMenu.getAcidWithMostUses(playerObj:getInventory());
			end
			if AcidC then
				local AcidCUseLeft = AcidC:getDrainableUsesInt();
				if AcidCUseLeft >= 5 then
					local matitem = playerObj:getInventory():getFirstTypeRecurse("AcidC");
					if luautils.haveToBeTransfered(playerObj, matitem) then
						ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, matitem, matitem:getContainer(), playerObj:getInventory()));
					end
				end
			end
		end
		local item2 = playerObj:getInventory():containsTypeRecurse("BlowTorch");
		local blowTorch = false;
		if item2 ~= nil then
			blowTorch = ISBlacksmithMenu.getBlowTorchWithMostUses(playerObj:getInventory());
		end
		if blowTorch then
			local blowTorchUseLeft = blowTorch:getDrainableUsesInt();
			if blowTorchUseLeft >= 10 then
				local matitem = playerObj:getInventory():getFirstTypeRecurse("BlowTorch");
				if matitem ~= nil then
					if luautils.haveToBeTransfered(playerObj, matitem) then
						ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, matitem, matitem:getContainer(), playerObj:getInventory()));
					end
					if not matitem:isEquipped() then
						ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, matitem, 50, true, false))
					end	
				end
			end
		end
		local metalSheet = playerObj:getInventory():containsTypeRecurse("SheetMetal")
		local count = 0;
		if metalSheet then
			count = playerObj:getInventory():getCountTypeRecurse("SheetMetal")
		end
		if count >= 1 then
			local matitem = playerObj:getInventory():getFirstTypeRecurse("SheetMetal");
			if luautils.haveToBeTransfered(playerObj, matitem) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, matitem, matitem:getContainer(), playerObj:getInventory()));
			end
		end

		local area = ISRemoveRustAction.chooseArea(playerObj, vehicle)
		if not area then return end
		if playerObj:getVehicle() then
			PMRMISVehicleMenu.onExit(playerObj)
		end
		ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, vehicle, area.area))
		if area.done == false then
			area.done = true;
		end
		ISTimedActionQueue.add(ISRemoveRustAction:new(playerObj, vehicle, area.id, area.area))
	end
end

function PMRMISVehicleMenu.onPaintVehicle(playerObj, vehicle)
	PaintVehicleColor(vehicle)
end

function PMRMISVehicleMenu.getNearbyFuelTank(vehicle)
	local part = vehicle:getPartById("GasTank")
	if not part then return nil end
	local areaCenter = vehicle:getAreaCenter(part:getArea())
	if not areaCenter then return nil end
	local square = getCell():getGridSquare(areaCenter:getX(), areaCenter:getY(), vehicle:getZ())
	if not square then return nil end
	for dy=-2,2 do
		for dx=-2,2 do
			-- TODO: check line-of-sight between 2 squares
			local square2 = getCell():getGridSquare(square:getX() + dx, square:getY() + dy, square:getZ())
			if square2 and square2:getProperties():Is("CustomName") and string.match(square2:getProperties():Val("CustomName"), "Fuel Tank") then
				return square2
			end
		end
	end
end

function PMRMISVehicleMenu.getNearbyPaintMachine(vehicle)
	local part = vehicle:getPartById("GasTank")
	if not part then return nil end
	local areaCenter = vehicle:getAreaCenter(part:getArea())
	if not areaCenter then return nil end
	local square = getCell():getGridSquare(areaCenter:getX(), areaCenter:getY(), vehicle:getZ())
	if not square then return nil end
	for dy=-2,2 do
		for dx=-2,2 do
			-- TODO: check line-of-sight between 2 squares
			local square2 = getCell():getGridSquare(square:getX() + dx, square:getY() + dy, square:getZ())
			if square2 and square2:getProperties():Is("CustomName") and string.match(square2:getProperties():Val("CustomName"), "Paint Machine") then
				return square2
			end
		end
	end
end

-- function PMRMISVehicleMenu.onRemoveRust(playerObj, vehicle)
	-- local engineHood = nil;
	-- engineHood = vehicle:getPartById("EngineDoor");
	-- if playerObj:getVehicle() then
		-- PMRMISVehicleMenu.onExit(playerObj)
	-- end
	-- sendClientCommand(playerObj, "vehicle", "setRust", { vehicle = vehicle:getId(), rust = 0 })
-- end

Events.OnFillWorldObjectContextMenu.Add(PMRMISVehicleMenu.OnFillWorldObjectContextMenu)
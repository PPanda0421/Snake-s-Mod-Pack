FuelTankBuildMenu = {};
FuelTankBuildMenu.recipetext = "";

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

function FuelTankBuildMenu.weldingRodUses(torchUses)
    return math.floor((torchUses + 0.1) / 2)
end

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

local function comparatorDrainableUsesInt(item1, item2)
    return item1:getDrainableUsesInt() - item2:getDrainableUsesInt()
end

function FuelTankBuildMenu.getBlowTorchWithMostUses(container)
    return container:getBestTypeEvalRecurse("Base.BlowTorch", comparatorDrainableUsesInt)
end

function FuelTankBuildMenu.getFirstBlowTorchWithUses(container, uses)
    return container:getFirstTypeEvalArgRecurse("Base.BlowTorch", predicateDrainableUsesInt, uses)
end

FuelTankBuildMenu.getNumberofTorchUses = function(player)
	local torchuses = "4"
	if player:getPerkLevel(Perks.MetalWelding) < 5 then
		torchuses = "4"
	elseif player:getPerkLevel(Perks.MetalWelding) < 7 then
		torchuses = "8"
	elseif player:getPerkLevel(Perks.MetalWelding) < 10 then
		torchuses = "12"
	elseif player:getPerkLevel(Perks.MetalWelding) == 10 then
		torchuses = "12"
	end
	return torchuses
end

FuelTankBuildMenu.doBuildMenu = function(player, context, worldobjects, test, square, subMenu)
	local playerObj = getSpecificPlayer(player);
	local FuelTankSprite = FuelTankBuildMenu.getTankSprite(playerObj);
	local tooltipSprite = FuelTankSprite.southSprite;
	local FuelTankOption = subMenu:addOption(getText("ContextMenu_CraftFuelTank"), worldobjects, FuelTankBuildMenu.onFuelTank, player, FuelTankBuildMenu.getNumberofTorchUses(playerObj), FuelTankSprite);
	local ok = false;
	local toolTip = FuelTankBuildMenu.addToolTip(FuelTankOption, getText("ContextMenu_CraftFuelTank"), tooltipSprite);
	--local canDo, toolTip = FuelTankBuildMenu.checkMetalWeldingFurnitures(0,2,4,"Craft Fuel Tanks",5,4,3,playerObj,toolTip);
	if playerObj:getPerkLevel(Perks.MetalWelding) < 5 then
		local canDo, toolTip = FuelTankBuildMenu.checkMetalWeldingFurnitures(0,2,4,"Craft Fuel Tanks",5,4,3,playerObj,toolTip);
		ok = canDo;
	elseif playerObj:getPerkLevel(Perks.MetalWelding) < 7 then
		local canDo, toolTip = FuelTankBuildMenu.checkMetalWeldingFurnitures(4,2,6,"Craft Fuel Tanks",6,8,3,playerObj,toolTip);
		ok = canDo;
	elseif playerObj:getPerkLevel(Perks.MetalWelding) < 10 then
		local canDo, toolTip = FuelTankBuildMenu.checkMetalWeldingFurnitures(6,4,8,"Craft Fuel Tanks",8,12,3,playerObj,toolTip);
		ok = canDo;
	elseif playerObj:getPerkLevel(Perks.MetalWelding) == 10 then
		local canDo, toolTip = FuelTankBuildMenu.checkMetalWeldingFurnitures(6,4,8,"Craft Fuel Tanks",8,12,3,playerObj,toolTip);
		ok = canDo;
	else
		local canDo, toolTip = FuelTankBuildMenu.checkMetalWeldingFurnitures(0,2,4,"Craft Fuel Tanks",5,4,3,playerObj,toolTip);
		ok = canDo;
	end

	--(metalPipes, smallMetalSheet, metalSheet, hinge, scrapMetal, torchUse, skill, player, toolTip, metalBar)--
    if not ok then FuelTankOption.notAvailable = true; end
end

FuelTankBuildMenu.addToolTip = function(option, name, texture)
    local toolTip = ISToolTip:new();
    toolTip:initialise();
    toolTip:setVisible(false);
    toolTip:setName(name);
    toolTip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_FuelTankDesc");
    toolTip:setTexture(texture);
    toolTip.footNote = getText("Tooltip_craft_pressToRotate", Keyboard.getKeyName(getCore():getKey("Rotate building")))
	option.toolTip = toolTip;
    return toolTip;
end

-- **********************************************
-- **              *FURNITURE*                 **
-- **********************************************
FuelTankBuildMenu.onFuelTank = function(worldobjects, player, torchUse, sprite)
    local fueltank = ISFuelTank:new("Fuel Tank", sprite.sprite,sprite.northSprite);
    fueltank.noNeedHammer = true;
    fueltank.firstItem = "BlowTorch";
    fueltank.secondItem = "WeldingMask";
    fueltank.craftingBank = "BlowTorch";
	fueltank:setEastSprite(sprite.eastSprite);
	fueltank:setSouthSprite(sprite.southSprite);
	FuelTankBuildMenu.managemodData(fueltank, player)
	fueltank.modData["use:Base.BlowTorch"] = torchUse;
    fueltank.modData["use:Base.WeldingRods"] = FuelTankBuildMenu.weldingRodUses(torchUse);
	fueltank.health = FuelTankBuildMenu.setTankHealth(player);
	fueltank.actionAnim = "BlowTorch";
    fueltank.player = player
    getCell():setDrag(fueltank, player);
end

FuelTankBuildMenu.managemodData = function(fueltank, player)
	local playerObj = getSpecificPlayer(player);
	if playerObj:getPerkLevel(Perks.MetalWelding) < 5 then
		fueltank.modData["xp:MetalWelding"] = 10;
		--fueltank.modData["need:Base.MetalPipe"]= "4";
		fueltank.modData["need:Base.SmallSheetMetal"]= "2";
		fueltank.modData["need:Base.SheetMetal"]= "4";
		fueltank.modData["need:Base.ScrapMetal"]= "5";
	elseif playerObj:getPerkLevel(Perks.MetalWelding) < 7 then
		fueltank.modData["xp:MetalWelding"] = 20;
		fueltank.modData["need:Base.MetalPipe"]= "4";
		fueltank.modData["need:Base.SmallSheetMetal"]= "2";
		fueltank.modData["need:Base.SheetMetal"]= "6";
		fueltank.modData["need:Base.ScrapMetal"]= "6";
	elseif playerObj:getPerkLevel(Perks.MetalWelding) < 10 then
		fueltank.modData["xp:MetalWelding"] = 20;
		fueltank.modData["need:Base.MetalPipe"]= "6";
		fueltank.modData["need:Base.SmallSheetMetal"]= "4";
		fueltank.modData["need:Base.SheetMetal"]= "8";
		fueltank.modData["need:Base.ScrapMetal"]= "8";
	elseif playerObj:getPerkLevel(Perks.MetalWelding) == 10 then
		fueltank.modData["xp:MetalWelding"] = 20;
		fueltank.modData["need:Base.MetalPipe"]= "6";
		fueltank.modData["need:Base.SmallSheetMetal"]= "4";
		fueltank.modData["need:Base.SheetMetal"]= "8";
		fueltank.modData["need:Base.ScrapMetal"]= "8";
	end
end

FuelTankBuildMenu.setTankHealth = function(player)
	local playerObj = getSpecificPlayer(player);
	local spriteLvl = FuelTankBuildMenu.getSpriteLvl(playerObj);
	local health = 500;
	if spriteLvl == 1 then
		health = health * playerObj:getPerkLevel(Perks.MetalWelding) * spriteLvl
	elseif spriteLvl == 2 then
		health = health * playerObj:getPerkLevel(Perks.MetalWelding) * spriteLvl
	elseif spriteLvl == 3 then
		health = health * playerObj:getPerkLevel(Perks.MetalWelding) * spriteLvl
	elseif spriteLvl == 4 then
		health = health * playerObj:getPerkLevel(Perks.MetalWelding) * spriteLvl
	else
		
	end
	return health
end
-- **********************************************
-- **            SPRITE FUNCTIONS              **
-- **********************************************
FuelTankBuildMenu.getTankSprite = function(player)
	local spriteLvl = FuelTankBuildMenu.getSpriteLvl(player);
    local sprite = {};
    if spriteLvl == 1 then
        sprite.sprite = "fueltanks_01_3";
        sprite.northSprite = "fueltanks_01_2";
		sprite.eastSprite = "fueltanks_01_1";
		sprite.southSprite = "fueltanks_01_0";
    elseif spriteLvl == 2 then
        sprite.sprite = "fueltanks_01_7";
        sprite.northSprite = "fueltanks_01_6";
		sprite.eastSprite = "fueltanks_01_5";
		sprite.southSprite = "fueltanks_01_4";
    elseif spriteLvl == 3 then
        sprite.sprite = "fueltanks_01_11";
        sprite.northSprite = "fueltanks_01_10";
		sprite.eastSprite = "fueltanks_01_9";
		sprite.southSprite = "fueltanks_01_8";
    elseif spriteLvl == 4 then
        sprite.sprite = "fueltanks_01_15";
        sprite.northSprite = "fueltanks_01_14";
		sprite.eastSprite = "fueltanks_01_13";
		sprite.southSprite = "fueltanks_01_12";
    end
    return sprite;
end

FuelTankBuildMenu.getSpriteLvl = function(player)
	if player:getPerkLevel(Perks.MetalWelding) < 5 then
		return 1;
	elseif player:getPerkLevel(Perks.MetalWelding) < 7 then
		return 2;
	elseif player:getPerkLevel(Perks.MetalWelding) < 10 then
		return 3;
	else
		return 4;
	end
end

FuelTankBuildMenu.checkMetalWeldingFurnitures = function(metalPipes, smallMetalSheet, metalSheet, recipeknown, scrapMetal, torchUse, skill, player, toolTip, metalBar)
    if ISBuildMenu.cheat then
        return true, toolTip;
    end
	local result = true;
    local inv = player:getInventory();
    local isOk = true;
    local blowTorch = FuelTankBuildMenu.getFirstBlowTorchWithUses(inv, torchUse) or FuelTankBuildMenu.getBlowTorchWithMostUses(inv, torchUse)
    local weldingRods = inv:getUsesTypeRecurse("Base.WeldingRods")
	if recipeknown ~= nil then
		local recipes = player:getKnownRecipes();
		if recipeknown ~= "NONE" then
			if not recipes:contains(recipeknown) then
				result = false;
			else
				-- Snake:  This will be changed to false if we cannot build.
				result = true;
			end
		else
			result = true;
		end
		if recipes:contains(recipeknown) or recipeknown == "NONE" then
			toolTip.description = toolTip.description .. "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" ..  getText("Tooltip_craft_Needs") .. " : ";
			if not blowTorch then
				toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " 0" .. "/" .. torchUse;
				isOk = false;
			else
		--        toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemText("Blow Torch") .. " 1/1" ;
			end
			local rodUse = FuelTankBuildMenu.weldingRodUses(torchUse)
			if weldingRods <= 0 then
				toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.WeldingRods") .. " 0" .. "/" .. rodUse;
				isOk = false;
			else
				--        toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemText("Blow Torch") .. " 1/1" ;
			end
			if blowTorch then
				local blowTorchUseLeft = blowTorch:getDrainableUsesInt()
				if blowTorchUseLeft < torchUse then
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. torchUse;
					isOk = false;
				else
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. torchUse .. "/" .. torchUse;
				end
			end
			if weldingRods > 0 then
				if weldingRods < rodUse then
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.WeldingRods") .. " " .. getText("ContextMenu_Uses") .. " " .. weldingRods .. "/" .. rodUse;
					isOk = false;
				else
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.WeldingRods") .. " " .. getText("ContextMenu_Uses") .. " " .. rodUse .. "/" .. rodUse;
				end
			end
			if not inv:containsTypeRecurse("WeldingMask") then
				toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.WeldingMask") .. " 0/1" ;
				isOk = false;
			else
				toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.WeldingMask") .. " 1/1" ;
			end
			if metalBar and metalBar > 0 then
				if inv:getNumberOfItem("MetalBar", false, true) < metalBar then
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.MetalBar") .. " " .. inv:getNumberOfItem("MetalBar", false, true) .. "/" .. metalBar;
					isOk = false;
				else
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.MetalBar") .. " " .. metalBar .. "/" .. metalBar ;
				end
			end
			if metalPipes > 0 then
				if inv:getNumberOfItem("MetalPipe", false, true) < metalPipes then
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.MetalPipe") .. " " .. inv:getNumberOfItem("MetalPipe", false, true) .. "/" .. metalPipes;
					isOk = false;
				else
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.MetalPipe") .. " " .. metalPipes .. "/" .. metalPipes ;
				end
			end
			if smallMetalSheet > 0 then
				if inv:getNumberOfItem("SmallSheetMetal", false, true) < smallMetalSheet then
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. inv:getNumberOfItem("SmallSheetMetal", false, true) .. "/" .. smallMetalSheet;
					isOk = false;
				else
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. smallMetalSheet .. "/" .. smallMetalSheet ;
				end
			end
			if metalSheet > 0 then
				if inv:getNumberOfItem("SheetMetal", false, true) < metalSheet then
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.SheetMetal") .. " " .. inv:getNumberOfItem("SheetMetal", false, true) .. "/" .. metalSheet;
					isOk = false;
				else
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.SheetMetal") .. " " .. metalSheet .. "/" .. metalSheet ;
				end
			end
			if scrapMetal > 0 then
				if inv:getNumberOfItem("ScrapMetal", false, true) < scrapMetal then
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. inv:getNumberOfItem("ScrapMetal", false, true) .. "/" .. scrapMetal;
					isOk = false;
				else
					toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. scrapMetal .. "/" .. scrapMetal ;
				end
			end
			if player:getPerkLevel(Perks.MetalWelding) < skill then
				toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getText("IGUI_perks_MetalWelding") .. " " .. player:getPerkLevel(Perks.MetalWelding) .. "/" .. skill;
				isOk = false;
			else
				toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getText("IGUI_perks_MetalWelding") .. " " .. player:getPerkLevel(Perks.MetalWelding) .. "/" .. skill ;
			end
			toolTip.description = toolTip.description .. " <LINE>";
		end
		if recipeknown ~= "NONE" then
			FuelTankBuildMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				toolTip.description = toolTip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needrecipe") .. " " .. " <RGB:1,0,0>" .. FuelTankBuildMenu.recipetext;
				result = false;
				isOk = false;
			else
				toolTip.description = toolTip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needrecipe") .. " " .. " <RGB:0,1,0>" .. FuelTankBuildMenu.recipetext .. getText("Tooltip_ftalreadyknownrecipe");
			end
		end
	end
    if isOk then
        FuelTankBuildMenu.canDoSomething = true;
    end
    return isOk, toolTip;
end

-- **********************************************
-- **                  OTHER                   **
-- **********************************************


FuelTankBuildMenu.countMaterial = function(player, fullType)
    local inv = getSpecificPlayer(player):getInventory()
    local count = 0
    local items = inv:getItemsFromFullType(fullType, true)
    for i=1,items:size() do
        local item = items:get(i-1)
        if not instanceof(item, "InventoryContainer") or item:getInventory():getItems():isEmpty() then
            count = count + 1
        end
    end
    local type = string.split(fullType, "\\.")[2]
    for k,v in pairs(FuelTankBuildMenu.materialOnGround) do
        if k == type then count = count + v end
    end
    return count
end

FuelTankBuildMenu.requireHammer = function(option)
	if not FuelTankBuildMenu.hasHammer and not ISBuildMenu.cheat then
		option.notAvailable = true
		option.onSelect = nil
	end
end

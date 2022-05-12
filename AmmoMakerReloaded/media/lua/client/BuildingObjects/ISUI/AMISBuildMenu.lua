AMISBuildMenu = {};
AMISBuildMenu.planks = 0;
AMISBuildMenu.nails = 0;
AMISBuildMenu.screws = 0;
AMISBuildMenu.smetalsheet = 0;
AMISBuildMenu.rtool = 0;
AMISBuildMenu.woodWorkXp = 0;
AMISBuildMenu.recipetext = "";

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

AMISBuildMenu.doBuildMenu = function(player, context, worldobjects, test, square, subMenu)

	local AbuildOption = subMenu:addOption(getText("ContextMenu_ReloadTable"), worldobjects, nil);
	local WpsubMenu = subMenu:getNew(subMenu);
	context:addSubMenu(AbuildOption, WpsubMenu);
	local _name = getText("ContextMenu_Reloading_Table");
	local ReloadingTableSprite = AMISBuildMenu.getReloadingTableSprites(player);
	local reloadingTableOption = WpsubMenu:addOption(_name, worldobjects, AMISBuildMenu.onBuildDoubleTileContainer, square, ReloadingTableSprite, player);
	local tooltip = AMISBuildMenu.canBuild("Craft Reloading Table", 8,10,15,2,1,5,reloadingTableOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_ReloadingTableDesc") .. tooltip.description;
	tooltip:setTexture(ReloadingTableSprite.sprite1);
	AMISBuildMenu.requireHammer(reloadingTableOption)

	local _name2 = getText("ContextMenu_Reloading_Table2");
	local ReloadingTable2Sprite = AMISBuildMenu.getReloadingTable2Sprites(player);
	local reloadingTable2Option = WpsubMenu:addOption(_name2, worldobjects, AMISBuildMenu.onBuildDoubleTileContainer, square, ReloadingTable2Sprite, player);
	local tooltip = AMISBuildMenu.canBuild("Craft Reloading Table", 8,10,15,2,1,5,reloadingTable2Option, player);
	tooltip:setName(_name2);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_ReloadingTableDesc") .. tooltip.description;
	tooltip:setTexture(ReloadingTable2Sprite.sprite1);
	AMISBuildMenu.requireHammer(reloadingTable2Option)


end

function AMISBuildMenu.haveSomethingtoBuild(player)
--~ 	return true;
	return haveSomethingtoBuildAdvanced(player);
end

function haveSomethingtoBuildAdvanced(player)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	AMISBuildMenu.materialOnGround = buildUtil.checkMaterialOnGround(playerObj:getCurrentSquare())
	if ISBuildMenu.cheat then
		return true;
	end
	AMISBuildMenu.planks = 0;
	AMISBuildMenu.nails = 0;
	AMISBuildMenu.screws = 0;
	AMISBuildMenu.rtool = 0;
	AMISBuildMenu.smetalsheet = 0;
	AMISBuildMenu.hasHammer = playerInv:containsTypeEvalRecurse("BallPeenHammer", predicateNotBroken) or playerInv:containsTypeEvalRecurse("Hammer", predicateNotBroken) or playerInv:containsTypeEvalRecurse("HammerStone", predicateNotBroken)
	if AMISBuildMenu.hasHammer then
		-- most objects require a hammer
	else
		return false
	end
	AMISBuildMenu.planks = AMISBuildMenu.countMaterial(player, "Base.Plank")
	AMISBuildMenu.nails = AMISBuildMenu.countMaterial(player, "Base.Nails")
	AMISBuildMenu.screws = AMISBuildMenu.countMaterial(player, "Base.Screws")
	AMISBuildMenu.smetalsheet = AMISBuildMenu.countMaterial(player, "Base.SmallSheetMetal")
	AMISBuildMenu.rtool = AMISBuildMenu.countMaterial(player, "AmmoMaker.ReloadingTool")
	return true;
end

-- **********************************************
-- **              *FURNITURE*                 **
-- **********************************************

AMISBuildMenu.onBuildDoubleTileContainer = function(worldobjects, square, sprite, player)
	local _table = ISDoubleTileFurniture2:new("Reloading Table", sprite.sprite1, sprite.sprite2, sprite.northSprite1, sprite.northSprite2);

	_table.canBeAlwaysPlaced = false;
	_table.isContainer = true;
	_table.containerType = "reloading_table";
    _table.player = player;
	--if IsActivatedMod("Worse Searching") then
	--	_table.modData["searched"] = true;
	--end
	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_table.modData["xp:Woodwork"] = 5;
	_table.modData["need:Base.Plank"] = "8";
	_table.modData["need:Base.Nails"] = "10";
    _table.modData["need:Base.Screws"] = "15";
    _table.modData["need:Base.SmallSheetMetal"] = "2";
	_table.modData["need:AmmoMaker.ReloadingTool"] = "1";

	getCell():setDrag(_table, player);
end


-- **********************************************
-- **            SPRITE FUNCTIONS              **
-- **********************************************

AMISBuildMenu.getReloadingTableSprites = function(player)
	local sprite = {};

	sprite.sprite1 = "carpentry_03_1";
	sprite.sprite2 = "carpentry_03_0";
	sprite.northSprite1 = "carpentry_03_2";
	sprite.northSprite2 = "carpentry_03_3";
	
	return sprite;
end

AMISBuildMenu.getReloadingTable2Sprites = function(player)
	local sprite = {};

	sprite.sprite1 = "carpentry_03_7";
	sprite.sprite2 = "carpentry_03_6";
	sprite.northSprite1 = "carpentry_03_4";
	sprite.northSprite2 = "carpentry_03_5";
	
	return sprite;
end

-- **********************************************
-- **                  OTHER                   **
-- **********************************************

-- Create our toolTip, depending on the required material
AMISBuildMenu.canBuild = function(recipeknown, plankNb, nailsNb, screwsNb, smetalsheetNb, rtoolNb, carpentrySkill, option, player)
	-- create a new tooltip
	local tooltip = AMISBuildMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	if ISBuildMenu.cheat then
		return tooltip;
	end
	if recipeknown ~= nil then
		local recipes = getSpecificPlayer(player):getKnownRecipes();
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
			tooltip.description = "<LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
			if AMISBuildMenu.planks < plankNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Plank") .. " " .. AMISBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
				result = false;
			elseif plankNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Plank") .. " " .. plankNb .. " <LINE>";
			end
			if AMISBuildMenu.nails < nailsNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Nails") .. " " .. AMISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
				result = false;
			elseif nailsNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Nails") .. " " .. nailsNb .. " <LINE>";
			end
			if AMISBuildMenu.screws < screwsNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Screws") .. " " .. AMISBuildMenu.screws .. "/" .. screwsNb .. " <LINE>";
				result = false;
			elseif screwsNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Screws") .. " " .. screwsNb .. " <LINE>";
			end
			if AMISBuildMenu.smetalsheet < smetalsheetNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. AMISBuildMenu.smetalsheet .. "/" .. smetalsheetNb .. " <LINE>";
				result = false;
			elseif smetalsheetNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. smetalsheetNb .. " <LINE>";
			end
			if AMISBuildMenu.rtool < rtoolNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Reloading tool") .. " " .. AMISBuildMenu.rtool .. "/" .. rtoolNb .. " <LINE>";
				result = false;
			elseif rtoolNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Reloading tool") .. " " .. rtoolNb .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
				result = false;
			elseif carpentrySkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
			end
		end
		if recipeknown ~= "NONE" then
			AMISBuildMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. AMISBuildMenu.recipetext;
				result = false;
			else
				tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. AMISBuildMenu.recipetext .. getText("Tooltip_alreadyknownrecipe");
			end
		end
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end

AMISBuildMenu.addToolTip = function()
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	return toolTip;
end

AMISBuildMenu.countMaterial = function(player, fullType)
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
    for k,v in pairs(AMISBuildMenu.materialOnGround) do
        if k == type then count = count + v end
    end
    return count
end

AMISBuildMenu.requireHammer = function(option)
	if not AMISBuildMenu.hasHammer and not ISBuildMenu.cheat then
		option.notAvailable = true
		option.onSelect = nil
	end
end

local function IsActivatedMod(mod_Name)
    local mods = getActivatedMods();
    for i=0, mods:size()-1, 1 do
        if mods:get(i) == mod_Name then
            return true;
        end
    end
    return false;
end
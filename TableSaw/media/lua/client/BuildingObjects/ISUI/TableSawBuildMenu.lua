TableSawBuildMenu = {};
TableSawBuildMenu.planks = 0;
TableSawBuildMenu.nails = 0;
TableSawBuildMenu.engine = 0;
TableSawBuildMenu.smetalsheet = 0;
TableSawBuildMenu.sawblade = 0;
TableSawBuildMenu.electronicscrap = 0;
TableSawBuildMenu.scrapmetal = 0;
TableSawBuildMenu.woodWorkXp = 0;
TableSawBuildMenu.electricityXp = 0;
TableSawBuildMenu.recipetext = "";

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

TableSawBuildMenu.doBuildMenu = function(player, context, worldobjects, test, square, subMenu)
	local _name = getText("ContextMenu_TableSaw");
	local TableSawSprite = TableSawBuildMenu.getSprites(player);
	local TableSawOption = subMenu:addOption(_name, worldobjects, TableSawBuildMenu.onBuildTableSaw, square, TableSawSprite, player);
	local tooltip = TableSawBuildMenu.canBuild("Craft Table Saw",10,25,1,4,1,5,5,5,3,TableSawOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_TableSawDesc") .. tooltip.description;
	tooltip:setTexture(TableSawSprite.sprite);
	tooltip.footNote = getText("Tooltip_craft_pressToRotate", Keyboard.getKeyName(getCore():getKey("Rotate building")));
	TableSawBuildMenu.requireHammer(TableSawOption)

end

function TableSawBuildMenu.haveSomethingtoBuild(player)
--~ 	return true;
	return haveSomethingtoBuildTableSaw(player);
end

function haveSomethingtoBuildTableSaw(player)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	TableSawBuildMenu.materialOnGround = buildUtil.checkMaterialOnGround(playerObj:getCurrentSquare())
	if ISBuildMenu.cheat then
		return true;
	end
	TableSawBuildMenu.planks = 0;
	TableSawBuildMenu.nails = 0;
	TableSawBuildMenu.engine = 0;
	TableSawBuildMenu.smetalsheet = 0;
	TableSawBuildMenu.sawblade = 0;
	TableSawBuildMenu.electronicscrap = 0;
	TableSawBuildMenu.scrapmetal = 0;
	TableSawBuildMenu.hasHammer = playerInv:containsTypeEvalRecurse("BallPeenHammer", predicateNotBroken) or playerInv:containsTypeEvalRecurse("Hammer", predicateNotBroken) or playerInv:containsTypeEvalRecurse("HammerStone", predicateNotBroken)
	if TableSawBuildMenu.hasHammer then
		-- most objects require a hammer
	else
		return false
	end
	TableSawBuildMenu.planks = TableSawBuildMenu.countMaterial(player, "Base.Plank")
	TableSawBuildMenu.nails = TableSawBuildMenu.countMaterial(player, "Base.Nails")
	TableSawBuildMenu.engine = TableSawBuildMenu.countMaterial(player, "TableSaw.Engine")
	TableSawBuildMenu.smetalsheet = TableSawBuildMenu.countMaterial(player, "Base.SmallSheetMetal")
	TableSawBuildMenu.sawblade = TableSawBuildMenu.countMaterial(player, "TableSaw.SawBlade")
	TableSawBuildMenu.electronicscrap = TableSawBuildMenu.countMaterial(player, "Base.ElectronicsScrap")
	TableSawBuildMenu.scrapmetal = TableSawBuildMenu.countMaterial(player, "Base.ScrapMetal")
	return true;
end

-- **********************************************
-- **              *FURNITURE*                 **
-- **********************************************

TableSawBuildMenu.onBuildTableSaw = function(worldobjects, square, sprite, player)

	local _table = ISSimpleFurniture3:new("Saw Table", sprite.sprite, sprite.northSprite);

	_table:setEastSprite(sprite.eastSprite);
	_table:setSouthSprite(sprite.southSprite);
	_table.canBeAlwaysPlaced = false;
	_table.isContainer = true;
	_table.containerType = "saw_table";
    _table.player = player;

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_table.modData["xp:Woodwork"] = 5;
	_table.modData["xp:Electricity"] = 3;
	_table.modData["need:Base.Plank"] = "10";
	_table.modData["need:Base.Nails"] = "25";
    _table.modData["need:TableSaw.Engine"] = "1";
	_table.modData["need:TableSaw.SawBlade"] = "1";
    _table.modData["need:Base.SmallSheetMetal"] = "4";
	_table.modData["need:Base.ElectronicsScrap"] = "5";
	_table.modData["need:Base.ScrapMetal"] = "5";

	getCell():setDrag(_table, player);
end


-- **********************************************
-- **            SPRITE FUNCTIONS              **
-- **********************************************

TableSawBuildMenu.getSprites = function(player)
	local sprite = {};
	sprite.sprite = "carpentry_03_48";
	sprite.northSprite = "carpentry_03_50";
	sprite.southSprite = "carpentry_03_49";
	sprite.eastSprite = "carpentry_03_51";
	
	return sprite;
end


-- **********************************************
-- **                  OTHER                   **
-- **********************************************

-- Create our toolTip, depending on the required material
TableSawBuildMenu.canBuild = function(recipeknown, plankNb, nailsNb, engineNb, smetalsheetNb, sawbladeNb, electronicscrapNb, scrapmetalNb, carpentrySkill, electronicsSkill, option, player)
	-- create a new tooltip
	local tooltip = TableSawBuildMenu.addToolTip();
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
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" ..  getText("Tooltip_craft_Needs") .. " : <LINE>";
			-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
			if TableSawBuildMenu.planks < plankNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Plank") .. " " .. TableSawBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
				result = false;
			elseif plankNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Plank") .. " " .. plankNb .. " <LINE>";
			end
			if TableSawBuildMenu.nails < nailsNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Nails") .. " " .. TableSawBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
				result = false;
			elseif nailsNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Nails") .. " " .. nailsNb .. " <LINE>";
			end
			if TableSawBuildMenu.engine < engineNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Engine") .. " " .. TableSawBuildMenu.engine .. "/" .. engineNb .. " <LINE>";
				result = false;
			elseif engineNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Engine") .. " " .. engineNb .. " <LINE>";
			end
			if TableSawBuildMenu.smetalsheet < smetalsheetNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. TableSawBuildMenu.smetalsheet .. "/" .. smetalsheetNb .. " <LINE>";
				result = false;
			elseif smetalsheetNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. smetalsheetNb .. " <LINE>";
			end
			if TableSawBuildMenu.sawblade < sawbladeNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Saw blade") .. " " .. TableSawBuildMenu.sawblade .. "/" .. sawbladeNb .. " <LINE>";
				result = false;
			elseif sawbladeNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Saw blade") .. " " .. sawbladeNb .. " <LINE>";
			end
			if TableSawBuildMenu.electronicscrap < electronicscrapNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.ElectronicsScrap") .. " " .. TableSawBuildMenu.electronicscrap .. "/" .. electronicscrapNb .. " <LINE>";
				result = false;
			elseif electronicscrapNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.ElectronicsScrap") .. " " .. electronicscrapNb .. " <LINE>";
			end
			if TableSawBuildMenu.scrapmetal < scrapmetalNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. TableSawBuildMenu.scrapmetal .. "/" .. scrapmetalNb .. " <LINE>";
				result = false;
			elseif scrapmetalNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. scrapmetalNb .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
				result = false;
			elseif carpentrySkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Electricity) < electronicsSkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Electricity") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Electricity) .. "/" .. electronicsSkill .. " <LINE>";
				result = false;
			elseif electronicsSkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Electricity") .. " " .. electronicsSkill .. " <LINE>";
			end
		end
		if recipeknown ~= "NONE" then
			TableSawBuildMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needrecipe") .. " " .. " <RGB:1,0,0>" .. TableSawBuildMenu.recipetext;
				result = false;
			else
				tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needrecipe") .. " " .. " <RGB:0,1,0>" .. TableSawBuildMenu.recipetext .. getText("Tooltip_alreadyknownrecipe");
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

TableSawBuildMenu.addToolTip = function()
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	return toolTip;
end

TableSawBuildMenu.countMaterial = function(player, fullType)
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
    for k,v in pairs(TableSawBuildMenu.materialOnGround) do
        if k == type then count = count + v end
    end
    return count
end

TableSawBuildMenu.requireHammer = function(option)
	if not TableSawBuildMenu.hasHammer and not ISBuildMenu.cheat then
		option.notAvailable = true
		option.onSelect = nil
	end
end
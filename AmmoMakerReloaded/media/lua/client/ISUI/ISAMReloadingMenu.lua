ISAMReloadingMenu = {};

ISAMReloadingMenu.availableMaterialsList = {};

ISAMReloadingMenu.neededMaterials = {};

ISAMReloadingMenu.playerAimingSkill = 0;
ISAMReloadingMenu.playerReloadSkill = 0;
ISAMReloadingMenu.playerStrengthSkill = 0;

ISAMReloadingMenu.textAimingRed = "";
ISAMReloadingMenu.textAimingGreen = "";
ISAMReloadingMenu.textReloadingRed = "";
ISAMReloadingMenu.textReloadingGreen = "";
ISAMReloadingMenu.textStrengthRed = "";
ISAMReloadingMenu.textStrengthGreen = "";

ISAMReloadingMenu.textneedrecipered = "";
ISAMReloadingMenu.textneedrecipe = "";
ISAMReloadingMenu.recipetext = "";

ISAMReloadingMenu.text9mmDescription 		    = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo");
ISAMReloadingMenu.text38Description 		    = "<RGB:1,1,0>" .. getText("Tooltip_38Ammo");
ISAMReloadingMenu.text44Description 		    = "<RGB:1,1,0>" .. getText("Tooltip_44Ammo");
ISAMReloadingMenu.text45Description 		    = "<RGB:1,1,0>" .. getText("Tooltip_45Ammo");
ISAMReloadingMenu.text223Description 		    = "<RGB:1,1,0>" .. getText("Tooltip_223Ammo");
ISAMReloadingMenu.text308Description 		    = "<RGB:1,1,0>" .. getText("Tooltip_308Ammo");
ISAMReloadingMenu.textShotgunShellsDescription  = "<RGB:1,1,0>" .. getText("Tooltip_SSAmmo");
ISAMReloadingMenu.text556Description 		    = "<RGB:1,1,0>" .. getText("Tooltip_556Ammo");
ISAMReloadingMenu.text762Description 		    = "<RGB:1,1,0>" .. getText("Tooltip_762Ammo");
ISAMReloadingMenu.textliquidleadDescription	    = "<RGB:1,1,0>" .. getText("Tooltip_MakeLiquidLead");
ISAMReloadingMenu.text9mmDDescription 		    = "<RGB:1,1,0>" .. getText("Tooltip_D9mmAmmo");
ISAMReloadingMenu.text223mmDDescription         = "<RGB:1,1,0>" .. getText("Tooltip_D223Ammo");
ISAMReloadingMenu.text308mmDDescription         = "<RGB:1,1,0>" .. getText("Tooltip_D308Ammo");
ISAMReloadingMenu.textShotgunShellsDDescription = "<RGB:1,1,0>" .. getText("Tooltip_DSSAmmo");
ISAMReloadingMenu.textAmmo556DDescription       = "<RGB:1,1,0>" .. getText("Tooltip_556x45DAmmo");
ISAMReloadingMenu.text38mmDDescription         = "<RGB:1,1,0>" .. getText("Tooltip_D38Ammo");
ISAMReloadingMenu.text44mmDDescription         = "<RGB:1,1,0>" .. getText("Tooltip_D44Ammo");
ISAMReloadingMenu.text45mmDDescription         = "<RGB:1,1,0>" .. getText("Tooltip_D45Ammo");
ISAMReloadingMenu.textAmmo762DDescription       = "<RGB:1,1,0>" .. getText("Tooltip_762x39DAmmo");
ISAMReloadingMenu.textDismantlePistolDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantlePistol");
ISAMReloadingMenu.textDismantlePistol2Description      = "<RGB:1,1,0>" .. getText("Tooltip_DismantlePistol2");
ISAMReloadingMenu.textDismantlePistol3Description      = "<RGB:1,1,0>" .. getText("Tooltip_DismantlePistol3");
ISAMReloadingMenu.textDismantleRevolverDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleRevolver");
ISAMReloadingMenu.textDismantleRevolver_LongDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleRevolver_Long");
ISAMReloadingMenu.textDismantleRevolver_ShortDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleRevolver_Short");
ISAMReloadingMenu.textDismantleShotgunDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleShotgun");
ISAMReloadingMenu.textDismantleDoubleBarrelShotgunDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleDoubleBarrelShotgun");
ISAMReloadingMenu.textDismantleShotgunSawnoffDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleShotgunSawnoff");
ISAMReloadingMenu.textDismantleDoubleBarrelShotgunSawnoffDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleDoubleBarrelShotgunSawnoff");
ISAMReloadingMenu.textDismantleVarmintRifleDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleVarmintRifle");
ISAMReloadingMenu.textDismantleHuntingRifleDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleHuntingRifle");
ISAMReloadingMenu.textDismantleAssaultRifleDescription      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleAssaultRifle");
ISAMReloadingMenu.textDismantleAssaultRifle2Description      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleAssaultRifle2");
ISAMReloadingMenu.textDismantleAK47Description      = "<RGB:1,1,0>" .. getText("Tooltip_DismantleAK47");

ISAMReloadingMenu.textTooltipHeader = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_Materials_Needs") .. " : <LINE> ";

ISAMReloadingMenu.doBuildMenu = function(player, context, worldobjects)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local playerObj = getSpecificPlayer(player)

	local reloadingtable = nil;

	for _, object in ipairs(worldobjects) do
		if instanceof(object, "IsoObject") and object:getSprite() and object:getSprite():getProperties() and (object:getSprite():getProperties():Val("GroupName") == "Crafted" and object:getSprite():getProperties():Val("CustomName") == "Reloading Table") and object:getSquare():DistToProper(getSpecificPlayer(player):getSquare()) < 2 then
			reloadingtable = object;
			break;
		end
	end
	if reloadingtable == nil then return;end

	if reloadingtable ~= nil then
		
		ISAMReloadingMenu.playerAimingSkill = playerObj:getPerkLevel(Perks.Aiming);
		ISAMReloadingMenu.playerReloadingSkill = playerObj:getPerkLevel(Perks.Reloading);
		ISAMReloadingMenu.playerReloadSkill = playerObj:getPerkLevel(Perks.AMReloading);
		ISAMReloadingMenu.playerStrengthSkill = playerObj:getPerkLevel(Perks.Strength);
		ISAMReloadingMenu.buildMaterialsList(playerObj, reloadingtable);
		local craftOption = context:addOption(getText("ContextMenu_ReloadTable"), reloadingtable, nil);
		-- create a brand new context menu wich contain our different material (wood, stone etc.) to build
		local subMenu = ISContextMenu:getNew(context);
		
		ISAMReloadingMenu.textAimingRed = " <RGB:1,0,0>" .. getText("IGUI_perks_Aiming") .. " ";
		ISAMReloadingMenu.textAimingGreen = " <RGB:1,1,1>" .. getText("IGUI_perks_Aiming") .. " ";

		ISAMReloadingMenu.textReloading2Red = " <RGB:1,0,0>" .. getText("IGUI_perks_Reloading") .. " ";
		ISAMReloadingMenu.textReloading2Green = " <RGB:1,1,1>" .. getText("IGUI_perks_Reloading") .. " ";
		
		ISAMReloadingMenu.textReloadingRed = " <RGB:1,0,0>" .. getText("IGUI_perks_AMReloading") .. " ";
		ISAMReloadingMenu.textReloadingGreen = " <RGB:1,1,1>" .. getText("IGUI_perks_AMReloading") .. " ";
		
		ISAMReloadingMenu.textStrengthRed = " <RGB:1,0,0>" .. getText("IGUI_perks_Strength") .. " ";
		ISAMReloadingMenu.textStrengthGreen = " <RGB:1,1,1>" .. getText("IGUI_perks_Strength") .. " ";
		
		ISAMReloadingMenu.textneedrecipered = " <RGB:1,1,1>" .. getText("Tooltip_needrecipe");
		ISAMReloadingMenu.textneedrecipe =  " <RGB:1,1,1>" .. getText("Tooltip_needrecipe");
		
		context:addSubMenu(craftOption, subMenu);
		
		if ISAMReloadingMenu.playerReloadSkill < 1 then
			local _StudyOption = subMenu:addOption(getText("ContextMenu_Study"), reloadingtable, ISAMReloadingMenu.OnStudy, playerObj, reloadingtable:getSquare());
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_Study"));
			tooltip.description = getText("Tooltip_StudyTT");
			_StudyOption.toolTip = tooltip;
		end
		if ISAMReloadingMenu.playerReloadSkill >= 1 then
			local _AmmoOption = subMenu:addOption(getText("ContextMenu_Ammo"), reloadingtable, nil);
			local _AmmoSubMenu = subMenu:getNew(subMenu);
			context:addSubMenu(_AmmoOption, _AmmoSubMenu);
			ISAMReloadingMenu.AmmoMenuBuilder(_AmmoSubMenu, player, reloadingtable);
			
			local _DAOption = subMenu:addOption(getText("ContextMenu_DisarmAmmo"), reloadingtable, nil);
			local _DASubMenu = subMenu:getNew(subMenu);
			context:addSubMenu(_DAOption, _DASubMenu);
			ISAMReloadingMenu.DAMenuBuilder(_DASubMenu, player, reloadingtable);
		
			local DismantleOption = subMenu:addOption(getText("ContextMenu_WeaponsWork"), reloadingtable, nil);
			local _WeaponsSubMenu = subMenu:getNew(subMenu);
			context:addSubMenu(DismantleOption, _WeaponsSubMenu);
			ISAMReloadingMenu.WeaponsMenuBuilder(_WeaponsSubMenu, player, reloadingtable);
		
			local _LeadOption = subMenu:addOption(getText("ContextMenu_LeadTable"), reloadingtable, nil);
			local _LeadSubMenu = subMenu:getNew(subMenu);
			context:addSubMenu(_LeadOption, _LeadSubMenu);
			ISAMReloadingMenu.LeadMenuBuilder(_LeadSubMenu, player, reloadingtable);
		end
	end
end


ISAMReloadingMenu.OnStudy = function(Table, playerObj, square)
	if luautils.walkAdj(playerObj, square) then
		ISTimedActionQueue.add(RTStudyAction:new(playerObj, Table, 100))
	end
end

ISAMReloadingMenu.buildMaterialsList = function(playerObj, reloadingtable)

	-- Snake:  Calls up a list of what materials are in the player's square.
	--       Fortunately, there is a function in the base Project Zomboid code to
	--       handle this for us.
	--
	--       This also replaces all previously existing keys from the list so we
	--       don't have to worry about clearing the list first.  (Hopefully the
	--       LUA garbage collection does what it should with the old data.)
	ISAMReloadingMenu.availableMaterialsList = ISAMReloadingMenu.checkMaterialOnContainer(reloadingtable);
	--ISAMReloadingMenu.availableMaterialsList = {};

	-- Snake:  Get a list of items that are currently in the player's inventory.
	local _inventory = playerObj:getInventory();
    local _inventoryList = playerObj:getInventory():getItems();
	local _size = _inventoryList:size();
	local _currentItemType = "";
	local _currentItem = "";


	-- Snake:  Loop through the list and count up various item types.
	--       This is adding to the counts generated above from materials on the ground.
	--       The process is basically what buildUtil.checkMaterialOnGround uses.
	for i = 0, _size - 1 do
		_CurrentItem = _inventoryList:get(i);
		_currentItemType = _inventoryList:get(i):getType();

		if ISAMReloadingMenu.availableMaterialsList[_currentItemType] then
			if instanceof(_CurrentItem, "DrainableComboItem") then
                local drainable = _inventory:getItemFromType(_currentItemType);
                local useLeft = 0;
                if drainable then
                    useLeft = math.floor(drainable:getUsedDelta()/drainable:getUseDelta());
                    ISAMReloadingMenu.availableMaterialsList[_currentItemType] = ISAMReloadingMenu.availableMaterialsList[_currentItemType] + useLeft;
                end
			elseif instanceof(_CurrentItem, "HandWeapon") then
				if not _CurrentItem:isFavorite() and 
					not _CurrentItem:getScope() and
					not _CurrentItem:getClip() and
					not _CurrentItem:getSling() and
					not _CurrentItem:getStock() and
					not _CurrentItem:getCanon() and
					not _CurrentItem:getRecoilpad() and
					((not _CurrentItem:haveChamber() and _CurrentItem:getCurrentAmmoCount() <= 0) or (_CurrentItem:haveChamber() and not _CurrentItem:isRoundChambered() and _CurrentItem:getCurrentAmmoCount() <= 0)) then
					if playerObj:getPrimaryHandItem() ~= nil and playerObj:getPrimaryHandItem() == _CurrentItem then
						ISAMReloadingMenu.availableMaterialsList[_currentItemType] = ISAMReloadingMenu.availableMaterialsList[_currentItemType] + 1;
					end
				end
            else
				-- Snake:  Add one to the count of an existing entry.
				ISAMReloadingMenu.availableMaterialsList[_currentItemType] = ISAMReloadingMenu.availableMaterialsList[_currentItemType] + 1;
			end
		else
			if instanceof(_CurrentItem, "DrainableComboItem") then
                local drainable = _inventory:getItemFromType(_currentItemType);
                local useLeft = 0;
                if drainable then
                    useLeft = math.floor(drainable:getUsedDelta()/drainable:getUseDelta());
                    ISAMReloadingMenu.availableMaterialsList[_currentItemType] = useLeft;
                end
			elseif instanceof(_CurrentItem, "HandWeapon") then
				if not _CurrentItem:isFavorite() and 
					not _CurrentItem:getScope() and
					not _CurrentItem:getClip() and
					not _CurrentItem:getSling() and
					not _CurrentItem:getStock() and
					not _CurrentItem:getCanon() and
					not _CurrentItem:getRecoilpad() and 
					((not _CurrentItem:haveChamber() and _CurrentItem:getCurrentAmmoCount() <= 0) or (_CurrentItem:haveChamber() and not _CurrentItem:isRoundChambered() and _CurrentItem:getCurrentAmmoCount() <= 0)) then
					if playerObj:getPrimaryHandItem() ~= nil and playerObj:getPrimaryHandItem() == _CurrentItem then
						ISAMReloadingMenu.availableMaterialsList[_currentItemType] = 1;
					end
				end
            else
			-- Snake:  Add a new entry.
				ISAMReloadingMenu.availableMaterialsList[_currentItemType] = 1;
			end
		end
	end
end

ISAMReloadingMenu.canMakeAmmo = function(aimingSkillRequired, reloadingSkillRequired, strenghtSkillRequired, recipeknown, option, player)

	-- Snake:  Create a tooltip and add it to our current menu option.
	local _tooltip = ISToolTip:new();
	_tooltip:initialise();
	_tooltip:setVisible(false);
	option.toolTip = _tooltip;
	
	local _canBuildResult = true;

	if recipeknown ~= nil then
		local recipes = getSpecificPlayer(player):getKnownRecipes();
		if recipeknown ~= "NONE" then
			if not recipes:contains(recipeknown) then
				_canBuildResult = false;
			else
				-- Snake:  This will be changed to false if we cannot build.
				_canBuildResult = true;
			end
		else
			_canBuildResult = true;
		end

		if recipes:contains(recipeknown) or recipeknown == "NONE" then
			-- Snake:  Start with the default header.
			_tooltip.description = ISAMReloadingMenu.textTooltipHeader;


			-- Snake:  Loop through the materials needed for this tooltip and let each one
			--       be tested and the tooltip updated based on if there is enough or not.
			--
			--       From my web research, LUA will handle things fine if the neededMaterials
			--       table is currently empty.  LUA skips the do-end block of code.
			--
			--       If the necessary entries for "Material", "Amount", and "Text" are not
			--       provided, that line of the tooltip is not built out and the object will
			--       not be available for building.
			local _currentResult = true;

			for _, _currentMaterial in pairs(ISAMReloadingMenu.neededMaterials) do
				if _currentMaterial["Material"] and _currentMaterial["Amount"] and _currentMaterial["Text"] then
					_currentResult = ISAMReloadingMenu.tooltipCheckForMaterial(_currentMaterial["Material"], _currentMaterial["Amount"], _currentMaterial["Text"], _tooltip);
				else
					_tooltip.description = _tooltip.description .. " <RGB:1,0,0>" .. getText("Tooltip_canterror") .. "<LINE>";
					_canBuildResult = false;
				end

				if not _currentResult then
					_canBuildResult = false;
				end
			end

			-- Snake:  Check the required aiming skill.
			if aimingSkillRequired > 0 then
				if ISAMReloadingMenu.playerAimingSkill < aimingSkillRequired then
					_tooltip.description = _tooltip.description .. ISAMReloadingMenu.textAimingRed;
					_canBuildResult = false;
				else
					_tooltip.description = _tooltip.description .. ISAMReloadingMenu.textAimingGreen;
				end

				_tooltip.description = _tooltip.description .. ISAMReloadingMenu.playerAimingSkill .. "/" .. aimingSkillRequired .. " <LINE>";
			end

			if reloadingSkillRequired > 0 then
				if ISAMReloadingMenu.playerReloadSkill < reloadingSkillRequired then
					_tooltip.description = _tooltip.description .. ISAMReloadingMenu.textReloadingRed;
					_canBuildResult = false;
				else
					_tooltip.description = _tooltip.description .. ISAMReloadingMenu.textReloadingGreen;
				end

				_tooltip.description = _tooltip.description .. ISAMReloadingMenu.playerReloadSkill .. "/" .. reloadingSkillRequired .. " <LINE>";
			end

			if strenghtSkillRequired > 0 then
				if ISAMReloadingMenu.playerStrengthSkill < strenghtSkillRequired then
					_tooltip.description = _tooltip.description .. ISAMReloadingMenu.textStrengthRed;
					_canBuildResult = false;
				else
					_tooltip.description = _tooltip.description .. ISAMReloadingMenu.textStrengthGreen;
				end

				_tooltip.description = _tooltip.description .. ISAMReloadingMenu.playerStrengthSkill .. "/" .. strenghtSkillRequired .. " <LINE>";
			end
		end
		if recipeknown ~= "NONE" then
			ISAMReloadingMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				_tooltip.description = _tooltip.description .. "<LINE> <LINE>" .. ISAMReloadingMenu.textneedrecipered .. " " .. " <RGB:1,0,0>" .. ISAMReloadingMenu.recipetext;
				_canBuildResult = false;
			else
				_tooltip.description = _tooltip.description .. "<LINE>" .. ISAMReloadingMenu.textneedrecipe .. " " .. " <RGB:0,1,0>" .. ISAMReloadingMenu.recipetext .. getText("Tooltip_alreadyrecipe");
			end
		end
	end

	-- Snake:  If any item failed to count up, of if the player does not have a high
	--       enough carpentry skill, then we don't want this menu tooltip to be active.
	--
	--       If cheat mode is enabled, then we don't have to worry about materials
	--       or skill as the player is always considered to be able to build.
	if not _canBuildResult then
		option.onSelect = nil;
		option.notAvailable = true;
	end


	return _tooltip;
end

ISAMReloadingMenu.tooltipCheckForMaterial = function(materialRequired, amountNeeded, materialText, tooltip)
	if amountNeeded > 0 then
		local _thisItemCount = 0;

		-- Snake: How much of the required material is available?
		if ISAMReloadingMenu.availableMaterialsList[materialRequired] then
			_thisItemCount = ISAMReloadingMenu.availableMaterialsList[materialRequired];
		else
			_thisItemCount = 0;
		end

		-- Snake: Do we have enough material?
		if _thisItemCount < amountNeeded then
			tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. materialText .. " " .. _thisItemCount .. "/" .. amountNeeded .. " <LINE>";
			return false;
		else
			tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. materialText .. " " .. _thisItemCount .. "/" .. amountNeeded .. " <LINE>";
			return true;
		end
	end

	return true;
end

ISAMReloadingMenu.canDismantleWeapons = function(reloadingSkillRequired, recipeknown, option, player)

	-- Snake:  Create a tooltip and add it to our current menu option.
	local _tooltip = ISToolTip:new();
	_tooltip:initialise();
	_tooltip:setVisible(false);
	option.toolTip = _tooltip;
	
	local _canBuildResult = true;

	if recipeknown ~= nil then
		local recipes = getSpecificPlayer(player):getKnownRecipes();
		if recipeknown ~= "NONE" then
			if not recipes:contains(recipeknown) then
				_canBuildResult = false;
			else
				-- Snake:  This will be changed to false if we cannot build.
				_canBuildResult = true;
			end
		else
			_canBuildResult = true;
		end

		if recipes:contains(recipeknown) or recipeknown == "NONE" then
			-- Snake:  Start with the default header.
			_tooltip.description = " <LINE> <LINE> <RGB:1,0.8,0>" .. getText("Tooltip_DismantleWAdvice") .. " <LINE>" .. ISAMReloadingMenu.textTooltipHeader;

			local _currentResult = true;
			
			for _, _currentMaterial in pairs(ISAMReloadingMenu.neededMaterials) do
				if _currentMaterial["Material"] and _currentMaterial["Amount"] and _currentMaterial["Text"] then
					_currentResult = ISAMReloadingMenu.tooltipCheckForMaterial(_currentMaterial["Material"], _currentMaterial["Amount"], _currentMaterial["Text"], _tooltip);
				else
					_tooltip.description = _tooltip.description .. " <RGB:1,0,0>" .. getText("Tooltip_canterror") .. "<LINE>";
					_canBuildResult = false;
				end

				if not _currentResult then
					_canBuildResult = false;
				end
			end

			if reloadingSkillRequired > 0 then
				if ISAMReloadingMenu.playerReloadSkill < reloadingSkillRequired then
					_tooltip.description = _tooltip.description .. ISAMReloadingMenu.textReloadingRed;
					_canBuildResult = false;
				else
					_tooltip.description = _tooltip.description .. ISAMReloadingMenu.textReloadingGreen;
				end

				_tooltip.description = _tooltip.description .. ISAMReloadingMenu.playerReloadSkill .. "/" .. reloadingSkillRequired .. " <LINE>";
			end

		end
		if recipeknown ~= "NONE" then
			ISAMReloadingMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				_tooltip.description = _tooltip.description .. "<LINE> <LINE>" .. ISAMReloadingMenu.textneedrecipered .. " " .. " <RGB:1,0,0>" .. ISAMReloadingMenu.recipetext;
				_canBuildResult = false;
			else
				_tooltip.description = _tooltip.description .. "<LINE>" .. ISAMReloadingMenu.textneedrecipe .. " " .. " <RGB:0,1,0>" .. ISAMReloadingMenu.recipetext .. getText("Tooltip_alreadyrecipe");
			end
		end
	end

	-- Snake:  If any item failed to count up, of if the player does not have a high
	--       enough carpentry skill, then we don't want this menu tooltip to be active.
	--
	--       If cheat mode is enabled, then we don't have to worry about materials
	--       or skill as the player is always considered to be able to build.
	if not _canBuildResult then
		option.onSelect = nil;
		option.notAvailable = true;
	end


	return _tooltip;
end
ISAMReloadingMenu.WeaponsMenuBuilder = function(subMenu, player, reloadingtable)
	local _option = nil;
	local _tooltip = nil;
	local _name = "";
	local _material = "";

	-- Snake: configuracion de los materiales a usarse en la lista
	--      del menu, esta lista servira para todos los objetos de aqui en adelante hasta que no se vuelva a crear nuevamente.

	----------------------------------------------------------------------------------
	--																				--
	-- M9																	        --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Pistol", Amount = 1, Text = getItemNameFromFullType("Base.Pistol"),
		},
	};

	_material = "Base.Pistol";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(1, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantlePistolDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/PistolDismantletooltip.png");


	----------------------------------------------------------------------------------
	--																				--
	-- M1911																	    --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Pistol2", Amount = 1, Text = getItemNameFromFullType("Base.Pistol2"),
		},
	};

	_material = "Base.Pistol2";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(2, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantlePistol2Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/Pistol2Dismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- Desert Eagle																    --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Pistol3", Amount = 1, Text = getItemNameFromFullType("Base.Pistol3"),
		},
	};

	_material = "Base.Pistol3";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(3, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantlePistol3Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/Pistol3Dismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- Revolver M625															    --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Revolver", Amount = 1, Text = getItemNameFromFullType("Base.Revolver"),
		},
	};

	_material = "Base.Revolver";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(2, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleRevolverDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/RevolverDismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- Revolver Magnum														        --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Revolver_Long", Amount = 1, Text = getItemNameFromFullType("Base.Revolver_Long"),
		},
	};

	_material = "Base.Revolver_Long";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(3, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleRevolver_LongDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/Revolver_LongDismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- Revolver M36														            --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Revolver_Short", Amount = 1, Text = getItemNameFromFullType("Base.Revolver_Short"),
		},
	};

	_material = "Base.Revolver_Short";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(3, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleRevolver_ShortDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/Revolver_ShortDismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- Shotgun  														            --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Shotgun", Amount = 1, Text = getItemNameFromFullType("Base.Shotgun"),
		},
	};

	_material = "Base.Shotgun";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(3, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleShotgunDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/ShotgunDismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- DoubleBarrel Shotgun 											            --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "DoubleBarrelShotgun", Amount = 1, Text = getItemNameFromFullType("Base.DoubleBarrelShotgun"),
		},
	};

	_material = "Base.DoubleBarrelShotgun";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(3, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleDoubleBarrelShotgunDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/DoubleBarrelShotgunDismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- ShotgunSawnoff  														        --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "ShotgunSawnoff", Amount = 1, Text = getItemNameFromFullType("Base.ShotgunSawnoff"),
		},
	};

	_material = "Base.ShotgunSawnoff";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(3, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleShotgunSawnoffDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/ShotgunSawnoffDismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- ShotgunSawnoff  														        --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "DoubleBarrelShotgunSawnoff", Amount = 1, Text = getItemNameFromFullType("Base.DoubleBarrelShotgunSawnoff"),
		},
	};

	_material = "Base.DoubleBarrelShotgunSawnoff";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(3, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleDoubleBarrelShotgunSawnoffDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/DoubleBarrelShotgunSawnoffDismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- VarmintRifle  														        --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "VarmintRifle", Amount = 1, Text = getItemNameFromFullType("Base.VarmintRifle"),
		},
	};

	_material = "Base.VarmintRifle";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(4, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleVarmintRifleDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/VarmintRifleDismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- HuntingRifle  														        --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "HuntingRifle", Amount = 1, Text = getItemNameFromFullType("Base.HuntingRifle"),
		},
	};

	_material = "Base.HuntingRifle";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(4, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleHuntingRifleDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/HuntingRifleDismantletooltip.png");

	----------------------------------------------------------------------------------
	--																				--
	-- AssaultRifle  														        --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "AssaultRifle", Amount = 1, Text = getItemNameFromFullType("Base.AssaultRifle"),
		},
	};

	_material = "Base.AssaultRifle";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(5, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleAssaultRifleDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/AssaultRifleDismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- AssaultRifle2  														        --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "AssaultRifle2", Amount = 1, Text = getItemNameFromFullType("Base.AssaultRifle2"),
		},
	};

	_material = "Base.AssaultRifle2";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(5, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleAssaultRifle2Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/AssaultRifle2Dismantletooltip.png");
	----------------------------------------------------------------------------------
	--																				--
	-- AK-47         														        --
	--																				--
	----------------------------------------------------------------------------------
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "AK47", Amount = 1, Text = getItemNameFromFullType("AmmoMaker.AK47"),
		},
	};

	_material = "AmmoMaker.AK47";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleWeapons, player, _material);

	_tooltip = ISAMReloadingMenu.canDismantleWeapons(6, "Dismantle weapons", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	_tooltip.description = ISAMReloadingMenu.textDismantleAK47Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/AK47Dismantletooltip.png");
end

ISAMReloadingMenu.isValidWeapon = function(playerObj, _material)
	local valid = false;
	local item = nil;
	if playerObj:getPrimaryHandItem() ~= nil and playerObj:getPrimaryHandItem():getFullType() == _material then
		item = playerObj:getPrimaryHandItem();
		if instanceof(item, "HandWeapon") then
			if not item:isFavorite() and 
				not item:getScope() and
				not item:getClip() and
				not item:getSling() and
				not item:getStock() and
				not item:getCanon() and
				not item:getRecoilpad() and 
				((not item:haveChamber() and item:getCurrentAmmoCount() <= 0) or (item:haveChamber() and not item:isRoundChambered() and item:getCurrentAmmoCount() <= 0)) then
				valid = true;
			end
		end
	end
	return valid
end

ISAMReloadingMenu.onDismantleWeapons = function(reloadingtable, player, _material)
	local playerObj = getSpecificPlayer(player);
	local isValidWeapon = ISAMReloadingMenu.isValidWeapon(playerObj, _material);
	if not isValidWeapon then return end
	if isValidWeapon then
		--playerObj:Say(tostring(isValidWeapon))
		if luautils.walkAdj(playerObj, reloadingtable:getSquare()) then
			local item = playerObj:getPrimaryHandItem();
			ISTimedActionQueue.add(AMDismantleWeaponsAction:new(reloadingtable, playerObj, item));
		end
	end
end

ISAMReloadingMenu.AmmoMenuBuilder = function(subMenu, player, reloadingtable)
	local _option = nil;
	local _tooltip = nil;
	local _name = "";
	local _result = "";

	-- Snake: configuracion de los materiales a usarse en la lista
	--      del menu, esta lista servira para todos los objetos de aqui en adelante hasta que no se vuelva a crear nuevamente.
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Casq9mm", Amount = 1, Text = getItemText("Case_9mm"),
		},

		{
			Material = "Lead9mm", Amount = 1, Text = getItemText("Lead_9mm"),
		},

		{
			Material = "GunPowder", Amount = 1, Text = getItemNameFromFullType("Base.GunPowder"),
		},

	};


	----------------------------------------------------------------------------------
	--																				--
	-- 9mm rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_result = "Base.Bullets9mm";
	_name = getItemNameFromFullType(_result);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 1, 1);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,2,3,"Make 9mm bullets", _option, player);
	_tooltip:setName(_name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text9mmDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/9mmtooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Casq38", Amount = 1, Text = getItemText("Case_cal.38"),
		},

		{
			Material = "Lead38", Amount = 1, Text = getItemText("Lead_cal.38"),
		},

		{
			Material = "GunPowder", Amount = 1, Text = getItemNameFromFullType("Base.GunPowder"),
		},

	};


	----------------------------------------------------------------------------------
	--																				--
	-- 38 rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_result = "Base.Bullets38";
	_name = getItemNameFromFullType(_result);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 1, 1);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,3,3,"Make bullets cal.38", _option, player);
	_tooltip:setName(_name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text38Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/38tooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Casq44", Amount = 1, Text = getItemText("Case_cal.44"),
		},

		{
			Material = "Lead44", Amount = 1, Text = getItemText("Lead_cal.44"),
		},

		{
			Material = "GunPowder", Amount = 2, Text = getItemNameFromFullType("Base.GunPowder"),
		},

	};


	----------------------------------------------------------------------------------
	--																				--
	-- 44 rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_result = "Base.Bullets44";
	_name = getItemNameFromFullType(_result);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 1, 2);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,4,4,"Make bullets cal.44", _option, player);
	_tooltip:setName(_name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text44Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/44tooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Casq45", Amount = 1, Text = getItemText("Case_cal.45"),
		},

		{
			Material = "Lead45", Amount = 1, Text = getItemText("Lead_cal.45"),
		},

		{
			Material = "GunPowder", Amount = 2, Text = getItemNameFromFullType("Base.GunPowder"),
		},

	};


	----------------------------------------------------------------------------------
	--																				--
	-- 45 rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_result = "Base.Bullets45";
	_name = getItemNameFromFullType(_result);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 1, 2);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,5,5,"Make bullets cal.45", _option, player);
	_tooltip:setName(_name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text45Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/45tooltip.png");

	----------------------------------------------------------------------------------
	
	-- Snake: configuracion de los materiales a usarse en la lista
	--      del menu, esta lista servira para todos los objetos de aqui en adelante hasta que no se vuelva a crear nuevamente.
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Casq223", Amount = 1, Text = getItemText("Case_cal.223"),
		},

		{
			Material = "Lead223", Amount = 1, Text = getItemText("Lead_cal.223"),
		},

		{
			Material = "GunPowder", Amount = 2, Text = getItemNameFromFullType("Base.GunPowder"),
		},

	};



	----------------------------------------------------------------------------------
	--																				--
	-- 223mm rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_result = "Base.223Bullets";
	_name = getItemNameFromFullType(_result);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 1, 2);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,3,4,"Make bullets cal.223", _option, player);
	_tooltip:setName(_name);
	_tooltip.description = ISAMReloadingMenu.text223Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/223tooltip.png");

	----------------------------------------------------------------------------------
	
	-- Snake: configuracion de los materiales a usarse en la lista
	--      del menu, esta lista servira para todos los objetos de aqui en adelante hasta que no se vuelva a crear nuevamente.
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Casq308", Amount = 1, Text = getItemText("Case_cal.308"),
		},

		{
			Material = "Lead308", Amount = 1, Text = getItemText("Lead_cal.308"),
		},

		{
			Material = "GunPowder", Amount = 3, Text = getItemNameFromFullType("Base.GunPowder"),
		},

	};



	----------------------------------------------------------------------------------
	--																				--
	-- 308 rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_result = "Base.308Bullets";
	_name = getItemNameFromFullType(_result);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 1, 3);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,4,5,"Make bullets cal.308", _option, player);
	_tooltip:setName(_name);
	_tooltip.description = ISAMReloadingMenu.text308Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/308tooltip.png");

	----------------------------------------------------------------------------------
	
	-- Snake: configuracion de los materiales a usarse en la lista
	--      del menu, esta lista servira para todos los objetos de aqui en adelante hasta que no se vuelva a crear nuevamente.
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "CasqShotgun", Amount = 1, Text = getItemText("Shotgun_cases"),
		},

		{
			Material = "LeadPellets", Amount = 25, Text = getItemText("Lead_pellets"),
		},

		{
			Material = "GunPowder", Amount = 5, Text = getItemNameFromFullType("Base.GunPowder"),
		},

	};

	----------------------------------------------------------------------------------
	--																				--
	-- Shotgun Shells																--
	--																				--
	----------------------------------------------------------------------------------

	_result = "Base.ShotgunShells";
	_name = getItemNameFromFullType(_result);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 25, 5);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,5,6,"Make shotgun shells", _option, player);
	_tooltip:setName(_name);
	_tooltip.description = ISAMReloadingMenu.textShotgunShellsDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/Shotguntooltip.png");
	
	----------------------------------------------------------------------------------

	-- Snake: configuracion de los materiales a usarse en la lista
	--      del menu, esta lista servira para todos los objetos de aqui en adelante hasta que no se vuelva a crear nuevamente.
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Casq556x45mm", Amount = 1, Text = getItemText("Case_556x45mm"),
		},

		{
			Material = "Lead556x45mm", Amount = 1, Text = getItemText("Lead_556x45mm"),
		},

		{
			Material = "GunPowder", Amount = 5, Text = getItemNameFromFullType("Base.GunPowder"),
		},

	};



	----------------------------------------------------------------------------------
	--																				--
	-- 5.56x45mm ammo																--
	--																				--
	----------------------------------------------------------------------------------

	_result = "Base.556Bullets";
	_name = getItemNameFromFullType(_result);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 1, 5);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,5,6,"Make 556x45mm bullets", _option, player);
	_tooltip:setName(_name);
	_tooltip.description = ISAMReloadingMenu.text556Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/556tooltip.png");

	----------------------------------------------------------------------------------

	-- Snake: configuracion de los materiales a usarse en la lista
	--      del menu, esta lista servira para todos los objetos de aqui en adelante hasta que no se vuelva a crear nuevamente.
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Casq762x39mm", Amount = 1, Text = getItemText("Case_762x39mm"),
		},

		{
			Material = "Lead762x39mm", Amount = 1, Text = getItemText("Lead_762x39mm"),
		},

		{
			Material = "GunPowder", Amount = 5, Text = getItemNameFromFullType("Base.GunPowder"),
		},

	};
	----------------------------------------------------------------------------------
	--																				--
	-- 7.62x39mm ammo																--
	--																				--
	----------------------------------------------------------------------------------

	_result = "AmmoMaker.Ammo_762x39mm";
	_name = getItemNameFromFullType(_result);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 1, 5);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,6,6,"Make 762x39mm bullets", _option, player);
	_tooltip:setName(_name);
	_tooltip.description = ISAMReloadingMenu.text762Description .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/762tooltip.png");
	

end

-------------------------------------------------------------------------------------------------------------------------------------

ISAMReloadingMenu.DAMenuBuilder = function(subMenu, player, reloadingtable)
	local _option = nil;
	local _tooltip = nil;
	local _name = "";
	local _material = "";

	-- Snake: configuracion de los materiales a usarse en la lista
	--      del menu, esta lista servira para todos los objetos de aqui en adelante hasta que no se vuelva a crear nuevamente.
	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Bullets9mm", Amount = 1, Text = getItemNameFromFullType("Base.Bullets9mm"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- 9mm rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_material = "Base.Bullets9mm";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleAmmo, player, _material);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,1,3, "NONE", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text9mmDDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/9Dmmtooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Bullets38", Amount = 1, Text = getItemNameFromFullType("Base.Bullets38"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- 38 rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_material = "Base.Bullets38";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleAmmo, player, _material);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,1,3, "NONE", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text38mmDDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/38Dmmtooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Bullets44", Amount = 1, Text = getItemNameFromFullType("Base.Bullets44"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- 44 rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_material = "Base.Bullets44";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleAmmo, player, _material);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,1,3, "NONE", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text44mmDDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/44Dmmtooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Bullets45", Amount = 1, Text = getItemNameFromFullType("Base.Bullets45"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- 45 rounds																	--
	--																				--
	----------------------------------------------------------------------------------

	_material = "Base.Bullets45";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleAmmo, player, _material);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,1,3, "NONE", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text45mmDDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/45Dmmtooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "223Bullets", Amount = 1, Text = getItemNameFromFullType("Base.223Bullets"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- .223 Ammo																	--
	--																				--
	----------------------------------------------------------------------------------

	_material = "Base.223Bullets";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleAmmo, player, _material);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,2,3, "NONE", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text223mmDDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/223Dmmtooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "308Bullets", Amount = 1, Text = getItemNameFromFullType("Base.308Bullets"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- .308 Ammo																	--
	--																				--
	----------------------------------------------------------------------------------

	_material = "Base.308Bullets";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleAmmo, player, _material);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,3,3, "NONE", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.text308mmDDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/308Dmmtooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "ShotgunShells", Amount = 1, Text = getItemNameFromFullType("Base.ShotgunShells"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- .Shotgun Ammo																	--
	--																				--
	----------------------------------------------------------------------------------

	_material = "Base.ShotgunShells";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleAmmo, player, _material);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,3,3, "NONE", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.textShotgunShellsDDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/DShotguntooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "556Bullets", Amount = 1, Text = getItemNameFromFullType("Base.556Bullets"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- 556x45mm Ammo																	--
	--																				--
	----------------------------------------------------------------------------------

	_material = "Base.556Bullets";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleAmmo, player, _material);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,4,4, "NONE", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.textAmmo556DDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/556Dtooltip.png");

	----------------------------------------------------------------------------------

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Ammo_762x39mm", Amount = 1, Text = getItemNameFromFullType("AmmoMaker.Ammo_762x39mm"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- 762x39mm Ammo																	--
	--																				--
	----------------------------------------------------------------------------------

	_material = "AmmoMaker.Ammo_762x39mm";
	_name = getItemNameFromFullType(_material);
	_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onDismantleAmmo, player, _material);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,4,4, "NONE", _option, player);
	_tooltip:setName(getText("Tooltip_Dismantle") .. _name);
	--_tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_9mmAmmo") .. "<LINE>" .. _tooltip.description;
	_tooltip.description = ISAMReloadingMenu.textAmmo762DDescription .. _tooltip.description ;
	_tooltip:setTexture("media/ui/AMTT/762Dtooltip.png");

	----------------------------------------------------------------------------------

end

ISAMReloadingMenu.onDismantleAmmo = function(reloadingtable, player, _material)
	if AmmoDefinitions[_material] then
		local playerObj = getSpecificPlayer(player);
		if luautils.walkAdj(playerObj, reloadingtable:getSquare()) then
			local stacks1 = nil;
			local contstacks1 = nil;
			local loadtime = 30;
			local _inventory = playerObj:getInventory();
			local _continventory = reloadingtable:getContainer();
			local ItemType = AmmoDefinitions[_material].ammotype;
			
			if _inventory:contains(ItemType) then
				stacks1 = _inventory:FindAll(ItemType);
			end
			if _continventory:getItems() and _continventory:contains(ItemType) then
				contstacks1 = _continventory:FindAll(ItemType);
			end

			ISAMReloadingMenu.TransferItems(playerObj, stacks1, contstacks1, 1);		

			ISTimedActionQueue.add(AMDismantleAmmoAction:new(reloadingtable, playerObj, _material, loadtime));
		end
	end
end


ISAMReloadingMenu.LeadMenuBuilder = function(subMenu, player, reloadingtable)
	local _option = nil;
	local _tooltip = nil;
	local _name = "";
	local _result = "";

	ISAMReloadingMenu.neededMaterials =
	{
		{
			Material = "Saucepan", Amount = 1, Text = getItemNameFromFullType("Base.Saucepan"),
		},

		{
			Material = "BlowTorch", Amount = 2, Text = getItemNameFromFullType("Base.BlowTorch") .. getText("Tooltip_Uses"),
		},

		{
			Material = "Lead", Amount = 50, Text = getItemText("Lead"),
		},
	};

	----------------------------------------------------------------------------------
	--																				--
	-- Liquid Lead																	--
	--																				--
	----------------------------------------------------------------------------------

	_name = getText("ContextMenu_Make_liquid_lead");
	_result = "Base.556Bullets";
	--_option = subMenu:addOption(_name, reloadingtable, ISAMReloadingMenu.onMakeAmmo, player, _result, 1, 6, 50);
	_option = subMenu:addOption(_name, reloadingtable, nil);

	_tooltip = ISAMReloadingMenu.canMakeAmmo(0,0,0, "Make liquid lead", _option, player)
	_tooltip:setName(_name);
	_tooltip.description = "<RGB:1,1,0>" .. ISAMReloadingMenu.textliquidleadDescription .. _tooltip.description;
	_tooltip:setTexture("media/ui/AMTT/MeltLeadtooltip.png");
end

ISAMReloadingMenu.onMakeAmmo = function(reloadingtable, player, result, casqNb, leadNb, gunpowderNb)
	if AmmoDefinitions[result] then
		local playerObj = getSpecificPlayer(player)
		if luautils.walkAdj(playerObj, reloadingtable:getSquare()) then
			local stacks1 = nil;
			local contstacks1 = nil;
			local item1complete = false;
			local item2complete = false;
			local item3complete = false;
			local material1 = AmmoDefinitions[result].materials[1];
			local material2 = AmmoDefinitions[result].materials[2];
			local material3 = AmmoDefinitions[result].materials[3];
			local loadtime = AmmoDefinitions[result].loadtime;
			local _inventory = playerObj:getInventory();
			local _continventory = reloadingtable:getContainer();

			if _inventory:contains(material1) then
				stacks1 = _inventory:FindAll("AmmoMaker." .. material1);
			end
			if _continventory:getItems() and _continventory:contains(material1) then
				contstacks1 = _continventory:FindAll("AmmoMaker." .. material1);
			end
			--if stacks1 == nil or stacks1:size() < casqNb then
				ISAMReloadingMenu.TransferItems(playerObj, stacks1, contstacks1, casqNb);
			--end


			if _inventory:contains(material2) then
				stacks1 = _inventory:FindAll("AmmoMaker." .. material2);
			else
				stacks1 = nil;
			end
			if _continventory:getItems() and _continventory:contains(material2) then
				contstacks1 = _continventory:FindAll("AmmoMaker." .. material2);
			else
				contstacks1 = nil;
			end
			--if stacks1 == nil or stacks1:size() < leadNb then
				ISAMReloadingMenu.TransferItems(playerObj, stacks1, contstacks1, leadNb);
			--end

			
			if _inventory:contains(material3) then
				stacks1 = _inventory:FindAll("Base." .. material3);
			else
				stacks1 = nil;
			end
			if _continventory:getItems() and _continventory:contains(material3) then
				contstacks1 = _continventory:FindAll("Base." .. material3);
			else
				contstacks1 = nil;
			end
			--if stacks1 == nil or stacks1:size() < gunpowderNb then
				ISAMReloadingMenu.TransferItems(playerObj, stacks1, contstacks1, gunpowderNb);
			--end
			
			if _inventory:contains(material1) then
				stacks1 = _inventory:FindAll("AmmoMaker." .. material1);
				if stacks1:size() >= casqNb then
					item1complete = true;
				end
			end
			if _inventory:contains(material2) then
				stacks1 = _inventory:FindAll("AmmoMaker." .. material2);
				if stacks1:size() >= leadNb then
					item2complete = true;
				end	
			end
			if _inventory:contains(material3) then
				stacks1 = _inventory:FindAll("Base." .. material3);
				if stacks1:size() >= gunpowderNb then
					item3complete = true;
				end	
			end
			

			--if item1complete and item2complete and item3complete then
				ISTimedActionQueue.add(AMMakeAmmoAction:new(reloadingtable, playerObj, result, loadtime, casqNb, leadNb, gunpowderNb));
			--end
		end
	end
end

function ISAMReloadingMenu.TransferItems(playerObj, stacks1, contstacks1, varnumber)
	
	if stacks1 ~= nil and stacks1:size() < varnumber then
		if contstacks1 ~= nil and (contstacks1:size() + stacks1:size()) >= varnumber then
			for i=1, (varnumber - stacks1:size()) do
				local item = contstacks1:get(i-1)
				if item:getContainer() ~= playerObj:getInventory() then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory(), nil));
				end
			end
		end
	elseif stacks1 == nil and contstacks1 ~= nil then
		if contstacks1:size() <= varnumber then
			for i=1, contstacks1:size() do
				local item = contstacks1:get(i-1)
				if item:getContainer() ~= playerObj:getInventory() then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory(), nil));
				end
			end
		elseif contstacks1:size() > varnumber then
			for i=1, (varnumber) do
				local item = contstacks1:get(i-1)
				if item:getContainer() ~= playerObj:getInventory() then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory(), nil));
				end
			end
		end
	end
end

function ISAMReloadingMenu.checkMaterialOnContainer(container)
	local result = {};
	if container:getContainer() and container:getContainer():getItems() then
		local items = container:getContainer():getItems()
		for i=0,items:size()-1 do
			local item = items:get(i);
			if instanceof(item, "InventoryContainer") and not item:getInventory():getItems():isEmpty() then
				-- ignore non-empty containers
			elseif result[item:getType()] then
			
				if instanceof(item, "DrainableComboItem") then
					local drainable = container:getContainer():getItemFromType(item:getType());
					local useLeft = 0;
					if drainable then
						useLeft = math.floor(drainable:getUsedDelta()/drainable:getUseDelta());
						result[item:getType()] = result[item:getType()] + useLeft;
					end
				elseif instanceof(item, "HandWeapon") then
					if not item:isFavorite() and 
						not item:getScope() and
						not item:getClip() and
						not item:getSling() and
						not item:getStock() and
						not item:getCanon() and
						not item:getRecoilpad() and
						(( not item:haveChamber() and item:getCurrentAmmoCount() <= 0) or (item:haveChamber() and not item:isRoundChambered() and item:getCurrentAmmoCount() <= 0)) then
						-- Nothing result[item:getType()] = result[item:getType()] + 1;
					end
				else
					-- Snake:  Add one to the count of an existing entry.
					result[item:getType()] = result[item:getType()] + 1;
				end
			
			
			
			
				--result[item:getType()] = result[item:getType()] + 1;
			else
				if instanceof(item, "DrainableComboItem") then
					local drainable = container:getContainer():getItemFromType(item:getType());
					local useLeft = 0;
					if drainable then
						useLeft = math.floor(drainable:getUsedDelta()/drainable:getUseDelta());
						result[item:getType()] = useLeft;
					end
				elseif instanceof(item, "HandWeapon") then
					if not item:isFavorite() and 
						not item:getScope() and
						not item:getClip() and
						not item:getSling() and
						not item:getStock() and
						not item:getCanon() and
						not item:getRecoilpad() and
						(( not item:haveChamber() and item:getCurrentAmmoCount() <= 0) or (item:haveChamber() and not item:isRoundChambered() and item:getCurrentAmmoCount() <= 0)) then
						-- Nothing result[item:getType()] = 1;
					end
				else
					result[item:getType()] = 1;
				end
			end
		end
	end
	return result;
end

Events.OnFillWorldObjectContextMenu.Add(ISAMReloadingMenu.doBuildMenu);

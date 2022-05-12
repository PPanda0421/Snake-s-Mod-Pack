--Made by Snake
PaintCratesMenu = {};

PaintCratesMenu.getWoodHealth = function()
	local playerObj = getSpecificPlayer(0)
	local health = (playerObj:getPerkLevel(Perks.Woodwork) * 50);
	if playerObj:HasTrait("Handy") then
		health = health + 100;
	end
	return health;
end

PaintCratesMenu.getHealth = function()
	return 200 + PaintCratesMenu.getWoodHealth();
end

PaintCratesMenu.doMenu = function(player, context, items)
	local pl = getSpecificPlayer(player);
	local Crate = nil;
	local Crate2 = nil;
	local Crate3 = nil;

	for i,v in ipairs(items) do
		local tempitem = v;
		if not instanceof(v, "InventoryItem") then
			tempitem = v.items[1];
		end
		if tempitem and instanceof(tempitem, "Moveable") and tempitem:getCustomNameFull() and tempitem:getTexture() and tempitem:getTexture():getName() then
			if (tempitem:getCustomNameFull() == "Crate" and tempitem:getTexture():getName() == "carpentry_01_16_Icon") or tempitem:getType() == "BaseCrate" then
				Crate = tempitem;
			end
			if tempitem:getType() == "CrateGreen" or 
			  tempitem:getType() == "CrateGrey" or 
			  tempitem:getType() == "CrateCyan" or 
			  tempitem:getType() == "CrateWhite" or 
			  tempitem:getType() == "CrateBlack" or
			  tempitem:getType() == "CrateOrange" or
			  tempitem:getType() == "CrateYellow" or
			  tempitem:getType() == "CrateTurquoise" or
			  tempitem:getType() == "CratePurple" or
			  tempitem:getType() == "CrateBlue" or
			  tempitem:getType() == "CrateRed" or
			  tempitem:getType() == "CrateLightBrown" or
			  tempitem:getType() == "CratePink" or
			  tempitem:getType() == "CrateBrown" or
			  tempitem:getType() == "CrateLightBlue" then
				Crate2 = tempitem;
			end
			if tempitem and instanceof(tempitem, "Moveable") and tempitem:getType() and UnpaintCratesDefinitions and UnpaintCratesDefinitions[tempitem:getType()] then
				Crate3 = tempitem;
			end
			--pl:Say(tostring(tempitem:getType()))
		end
	end
	if (not Crate or Crate == nil) and (not Crate2 or Crate2 == nil) and (not Crate3 or Crate3 == nil) then return end;
	--if not Crate or Crate == nil then return end
	local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory();
	local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush");
	local Turpentine = playerInv:containsTypeRecurse("Turpentine");
	local name = "";
	if Crate and (ISBuildMenu.cheat or paintBrush) then
		if Crate:getCustomNameFull() == "Crate" and Crate:getTexture():getName() == "carpentry_01_16_Icon" then
			name = Translator.getMoveableDisplayName(Crate:getCustomNameFull());
		else
			name  = Crate:getDisplayName() or "";
		end
		local paintOption = context:addOption(getText("ContextMenu_Paint") .. "  " .. name, worldobjects, nil);
		local subMenuPaint = ISContextMenu:getNew(context);
		context:addSubMenu(paintOption, subMenuPaint);
		local simpleOption  = subMenuPaint:addOption(getText("ContextMenu_Simple"), worldobjects, nil);
		local SimpleSubMenu = subMenuPaint:getNew(subMenuPaint);
		context:addSubMenu(simpleOption, SimpleSubMenu);
		
		local option1 = SimpleSubMenu:addOption(getText("ContextMenu_Blue"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateBlue", "PaintBlue");
		PaintCratesMenu.addTooltip(option1, playerObj, "CrateBlue", Crate, "PaintBlue");

		local option2 = SimpleSubMenu:addOption(getText("ContextMenu_Green"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateGreen", "PaintGreen");
		PaintCratesMenu.addTooltip(option2, playerObj, "CrateGreen", Crate, "PaintGreen");

		local option3 = SimpleSubMenu:addOption(getText("ContextMenu_Light_Brown"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateLightBrown", "PaintLightBrown");
		PaintCratesMenu.addTooltip(option3, playerObj, "CrateLightBrown", Crate, "PaintLightBrown");

		local option4 = SimpleSubMenu:addOption(getText("ContextMenu_Light_Blue"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateLightBlue", "PaintLightBlue");
		PaintCratesMenu.addTooltip(option4, playerObj, "CrateLightBlue", Crate, "PaintLightBlue");

		local option5 = SimpleSubMenu:addOption(getText("ContextMenu_Brown"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateBrown", "PaintBrown");
		PaintCratesMenu.addTooltip(option5, playerObj, "CrateBrown", Crate, "PaintBrown");

		local option6 = SimpleSubMenu:addOption(getText("ContextMenu_Orange"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateOrange", "PaintOrange");
		PaintCratesMenu.addTooltip(option6, playerObj, "CrateOrange", Crate, "PaintOrange");

		local option7 = SimpleSubMenu:addOption(getText("ContextMenu_Cyan"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateCyan", "PaintCyan");
		PaintCratesMenu.addTooltip(option7, playerObj, "CrateCyan", Crate, "PaintCyan");

		local option8 = SimpleSubMenu:addOption(getText("ContextMenu_Pink"), Crate, PaintCratesMenu.onPaint, playerObj, "CratePink", "PaintPink");
		PaintCratesMenu.addTooltip(option8, playerObj, "CratePink", Crate, "PaintPink");

		local option9 = SimpleSubMenu:addOption(getText("ContextMenu_Grey"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateGrey", "PaintGrey");
		PaintCratesMenu.addTooltip(option9, playerObj, "CrateGrey", Crate, "PaintGrey");

		local option10 = SimpleSubMenu:addOption(getText("ContextMenu_Turquoise"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateTurquoise", "PaintTurquoise");
		PaintCratesMenu.addTooltip(option10, playerObj, "CrateTurquoise", Crate, "PaintTurquoise");

		local option11 = SimpleSubMenu:addOption(getText("ContextMenu_Purple"), Crate, PaintCratesMenu.onPaint, playerObj, "CratePurple", "PaintPurple");
		PaintCratesMenu.addTooltip(option11, playerObj, "CratePurple", Crate, "PaintPurple");

		local option12 = SimpleSubMenu:addOption(getText("ContextMenu_Yellow"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateYellow", "PaintYellow");
		PaintCratesMenu.addTooltip(option12, playerObj, "CrateYellow", Crate, "PaintYellow");

		local option13 = SimpleSubMenu:addOption(getText("ContextMenu_White"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateWhite", "PaintWhite");
		PaintCratesMenu.addTooltip(option13, playerObj, "CrateWhite", Crate, "PaintWhite");

		local option14 = SimpleSubMenu:addOption(getText("ContextMenu_Red"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateRed", "PaintRed");
		PaintCratesMenu.addTooltip(option14, playerObj, "CrateRed", Crate, "PaintRed");

		local option15 = SimpleSubMenu:addOption(getText("ContextMenu_Black"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateBlack", "PaintBlack");
		PaintCratesMenu.addTooltip(option15, playerObj, "CrateBlack", Crate, "PaintBlack");

		
		--Cajas Especiales
		local SpecialOption  = subMenuPaint:addOption(getText("ContextMenu_Special"), worldobjects, nil);
		local SpecialSubMenu = subMenuPaint:getNew(subMenuPaint);
		context:addSubMenu(SpecialOption, SpecialSubMenu);
		
		local option16 = SpecialSubMenu:addOption(getText("ContextMenu_AmmoCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateAmmo", "PaintGreen", "PaintBlack");
		PaintCratesMenu.addTooltip(option16, playerObj, "CrateAmmo", Crate, "PaintGreen", "PaintBlack");

		local option17 = SpecialSubMenu:addOption(getText("ContextMenu_LiteratureCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateLiterature", "PaintCyan", "PaintBlack");
		PaintCratesMenu.addTooltip(option17, playerObj, "CrateLiterature", Crate, "PaintCyan", "PaintBlack");

		local option18 = SpecialSubMenu:addOption(getText("ContextMenu_FoodCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateFood", "PaintGrey", "PaintBlack");
		PaintCratesMenu.addTooltip(option18, playerObj, "CrateFood", Crate, "PaintGrey", "PaintBlack");

		local option19 = SpecialSubMenu:addOption(getText("ContextMenu_MedicalCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateMedical", "PaintWhite", "PaintRed");
		PaintCratesMenu.addTooltip(option19, playerObj, "CrateMedical", Crate, "PaintWhite", "PaintRed");

		local option20 = SpecialSubMenu:addOption(getText("ContextMenu_WeaponsCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateWeapons", "PaintBlack", "PaintWhite");
		PaintCratesMenu.addTooltip(option20, playerObj, "CrateWeapons", Crate, "PaintBlack", "PaintWhite");
		
		local option21 = SpecialSubMenu:addOption(getText("ContextMenu_CarpentryCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateCarpentry", "PaintOrange", "PaintBlack");
		PaintCratesMenu.addTooltip(option21, playerObj, "CrateCarpentry", Crate, "PaintOrange", "PaintBlack");
		
		local option22 = SpecialSubMenu:addOption(getText("ContextMenu_ElectricityCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateElectricity", "PaintYellow", "PaintBlack");
		PaintCratesMenu.addTooltip(option22, playerObj, "CrateElectricity", Crate, "PaintYellow", "PaintBlack");
		
		local option23 = SpecialSubMenu:addOption(getText("ContextMenu_FarmingCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateFarming", "PaintTurquoise", "PaintBlack");
		PaintCratesMenu.addTooltip(option23, playerObj, "CrateFarming", Crate, "PaintTurquoise", "PaintBlack");
		
		local option24 = SpecialSubMenu:addOption(getText("ContextMenu_FishingCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateFishing", "PaintPurple", "PaintWhite");
		PaintCratesMenu.addTooltip(option24, playerObj, "CrateFishing", Crate, "PaintPurple", "PaintWhite");
		
		local option25 = SpecialSubMenu:addOption(getText("ContextMenu_MechanicsCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateMechanics", "PaintBlue", "PaintWhite");
		PaintCratesMenu.addTooltip(option25, playerObj, "CrateMechanics", Crate, "PaintBlue", "PaintWhite");
		
		local option26 = SpecialSubMenu:addOption(getText("ContextMenu_MetalWeldingCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateMetalWelding", "PaintRed", "PaintBlack");
		PaintCratesMenu.addTooltip(option26, playerObj, "CrateMetalWelding", Crate, "PaintRed", "PaintBlack");
		
		local option27 = SpecialSubMenu:addOption(getText("ContextMenu_PaintingCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CratePainting", "PaintLightBrown", "PaintBlack");
		PaintCratesMenu.addTooltip(option27, playerObj, "CratePainting", Crate, "PaintLightBrown", "PaintBlack");
		
		local option28 = SpecialSubMenu:addOption(getText("ContextMenu_ScavengeCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateScavenge", "PaintPink", "PaintBlack");
		PaintCratesMenu.addTooltip(option28, playerObj, "CrateScavenge", Crate, "PaintPink", "PaintBlack");
		
		local option29 = SpecialSubMenu:addOption(getText("ContextMenu_ClothingCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateClothing", "PaintLightBlue", "PaintBlack");
		PaintCratesMenu.addTooltip(option29, playerObj, "CrateClothing", Crate, "PaintLightBlue", "PaintBlack");
		
		local option30 = SpecialSubMenu:addOption(getText("ContextMenu_TrashCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateTrash", "PaintBrown", "PaintWhite");
		PaintCratesMenu.addTooltip(option30, playerObj, "CrateTrash", Crate, "PaintBrown", "PaintWhite");
		
		local recipes = playerObj:getKnownRecipes();
		if recipes:contains("Dito Box") or recipes:contains("Army Box") or recipes:contains("Ammo Maker Box") then
			local UniqueOption  = subMenuPaint:addOption(getText("ContextMenu_Unique"), worldobjects, nil);
			local UniqueSubMenu = subMenuPaint:getNew(subMenuPaint);
			context:addSubMenu(UniqueOption, UniqueSubMenu);
			
			if recipes:contains("Dito Box") then
				local option31 = UniqueSubMenu:addOption(getText("ContextMenu_DitoCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateDito", "PaintBlack", "PaintWhite");
				PaintCratesMenu.addTooltip(option31, playerObj, "CrateDito", Crate, "PaintBlack", "PaintWhite");
			end
			if recipes:contains("Army Box") then
				local option32 = UniqueSubMenu:addOption(getText("ContextMenu_ArmyCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateArmy", "PaintGreen", "PaintYellow");
				PaintCratesMenu.addTooltip(option32, playerObj, "CrateArmy", Crate, "PaintGreen", "PaintYellow");
			end
			if recipes:contains("Ammo Maker Box") then
				local option33 = UniqueSubMenu:addOption(getText("ContextMenu_9mmCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "Crate9mm", "PaintBlack", "PaintYellow");
				PaintCratesMenu.addTooltip(option33, playerObj, "Crate9mm", Crate, "PaintBlack", "PaintYellow");
				
				local option34 = UniqueSubMenu:addOption(getText("ContextMenu_45Crate"), Crate, PaintCratesMenu.onPaint, playerObj, "Crate45", "PaintBlack", "PaintYellow");
				PaintCratesMenu.addTooltip(option34, playerObj, "Crate45", Crate, "PaintBlack", "PaintYellow");
				
				local option35 = UniqueSubMenu:addOption(getText("ContextMenu_38Crate"), Crate, PaintCratesMenu.onPaint, playerObj, "Crate38", "PaintBlack", "PaintYellow");
				PaintCratesMenu.addTooltip(option35, playerObj, "Crate38", Crate, "PaintBlack", "PaintYellow");
				
				local option36 = UniqueSubMenu:addOption(getText("ContextMenu_44Crate"), Crate, PaintCratesMenu.onPaint, playerObj, "Crate44", "PaintBlack", "PaintYellow");
				PaintCratesMenu.addTooltip(option36, playerObj, "Crate44", Crate, "PaintBlack", "PaintYellow");
				
				local option37 = UniqueSubMenu:addOption(getText("ContextMenu_223Crate"), Crate, PaintCratesMenu.onPaint, playerObj, "Crate223", "PaintBlack", "PaintYellow");
				PaintCratesMenu.addTooltip(option37, playerObj, "Crate223", Crate, "PaintBlack", "PaintYellow");
				
				local option38 = UniqueSubMenu:addOption(getText("ContextMenu_308Crate"), Crate, PaintCratesMenu.onPaint, playerObj, "Crate308", "PaintBlack", "PaintYellow");
				PaintCratesMenu.addTooltip(option38, playerObj, "Crate308", Crate, "PaintBlack", "PaintYellow");
				
				local option39 = UniqueSubMenu:addOption(getText("ContextMenu_556Crate"), Crate, PaintCratesMenu.onPaint, playerObj, "Crate556", "PaintBlack", "PaintYellow");
				PaintCratesMenu.addTooltip(option39, playerObj, "Crate556", Crate, "PaintBlack", "PaintYellow");
				
				local option40 = UniqueSubMenu:addOption(getText("ContextMenu_ShellsCrate"), Crate, PaintCratesMenu.onPaint, playerObj, "CrateShell", "PaintBlack", "PaintYellow");
				PaintCratesMenu.addTooltip(option40, playerObj, "CrateShell", Crate, "PaintBlack", "PaintYellow");
			end
		end
	end

	if Crate2 and (ISBuildMenu.cheat or paintBrush) then
		local paintOption = context:addOption(getText("ContextMenu_Paint") .. "  " .. (Crate2:getDisplayName() or ""), worldobjects, nil);
		local subMenuPaint = ISContextMenu:getNew(context);
		context:addSubMenu(paintOption, subMenuPaint);	
		
		if Crate2:getType() == "CrateGreen" then
			local option16 = subMenuPaint:addOption(getText("ContextMenu_AmmoCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateAmmo", "PaintBlack");
			PaintCratesMenu.addTooltip(option16, playerObj, "CrateAmmo", Crate2, "PaintBlack");
			local recipes = playerObj:getKnownRecipes();
			if recipes:contains("Army Box") then
				local UniqueOption  = subMenuPaint:addOption(getText("ContextMenu_Unique"), worldobjects, nil);
				local UniqueSubMenu = subMenuPaint:getNew(subMenuPaint);
				context:addSubMenu(UniqueOption, UniqueSubMenu);
				
				local option32 = UniqueSubMenu:addOption(getText("ContextMenu_ArmyCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateArmy", "PaintYellow");
				PaintCratesMenu.addTooltip(option32, playerObj, "CrateArmy", Crate2, "PaintYellow");				
			end
		end
		
		if Crate2:getType() == "CrateCyan" then
			local option17 = subMenuPaint:addOption(getText("ContextMenu_LiteratureCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateLiterature", "PaintBlack");
			PaintCratesMenu.addTooltip(option17, playerObj, "CrateLiterature", Crate2, "PaintBlack");
		end
	
		if Crate2:getType() == "CrateGrey" then
			local option18 = subMenuPaint:addOption(getText("ContextMenu_FoodCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateFood", "PaintBlack");
			PaintCratesMenu.addTooltip(option18, playerObj, "CrateFood", Crate2, "PaintBlack");
		end
		
		if Crate2:getType() == "CrateWhite" then
			local option19 = subMenuPaint:addOption(getText("ContextMenu_MedicalCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateMedical", "PaintRed");
			PaintCratesMenu.addTooltip(option19, playerObj, "CrateMedical", Crate2, "PaintRed");
		end
		
		if Crate2:getType() == "CrateBlack" then
			local option20 = subMenuPaint:addOption(getText("ContextMenu_WeaponsCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateWeapons", "PaintWhite");
			PaintCratesMenu.addTooltip(option20, playerObj, "CrateWeapons", Crate2, "PaintWhite");		
			local recipes = playerObj:getKnownRecipes();
			if recipes:contains("Dito Box") then
				local UniqueOption  = subMenuPaint:addOption(getText("ContextMenu_Unique"), worldobjects, nil);
				local UniqueSubMenu = subMenuPaint:getNew(subMenuPaint);
				context:addSubMenu(UniqueOption, UniqueSubMenu);
				
				local option31 = UniqueSubMenu:addOption(getText("ContextMenu_DitoCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateDito", "PaintWhite");
				PaintCratesMenu.addTooltip(option31, playerObj, "CrateDito", Crate2, "PaintWhite");		
			end
		end

		if Crate2:getType() == "CrateOrange" then
			local option21 = subMenuPaint:addOption(getText("ContextMenu_CarpentryCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateCarpentry", "PaintBlack");
			PaintCratesMenu.addTooltip(option21, playerObj, "CrateCarpentry", Crate2, "PaintBlack");	
		end

		if Crate2:getType() == "CrateYellow" then
			local option22 = subMenuPaint:addOption(getText("ContextMenu_ElectricityCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateElectricity", "PaintBlack");
			PaintCratesMenu.addTooltip(option22, playerObj, "CrateElectricity", Crate2, "PaintBlack");	
		end

		if Crate2:getType() == "CrateTurquoise" then
			local option23 = subMenuPaint:addOption(getText("ContextMenu_FarmingCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateFarming", "PaintBlack");
			PaintCratesMenu.addTooltip(option23, playerObj, "CrateFarming", Crate2, "PaintBlack");
		end
		
		if Crate2:getType() == "CratePurple" then
			local option24 = subMenuPaint:addOption(getText("ContextMenu_FishingCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateFishing", "PaintWhite");
			PaintCratesMenu.addTooltip(option24, playerObj, "CrateFishing", Crate2, "PaintWhite");
		end
		
		if Crate2:getType() == "CrateBlue" then
			local option25 = subMenuPaint:addOption(getText("ContextMenu_MechanicsCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateMechanics", "PaintWhite");
			PaintCratesMenu.addTooltip(option25, playerObj, "CrateMechanics", Crate2, "PaintWhite");
		end

		if Crate2:getType() == "CrateRed" then
			local option26 = subMenuPaint:addOption(getText("ContextMenu_MetalWeldingCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateMetalWelding", "PaintBlack");
			PaintCratesMenu.addTooltip(option26, playerObj, "CrateMetalWelding", Crate2, "PaintBlack");
		end

		if Crate2:getType() == "CrateLightBrown" then
			local option27 = subMenuPaint:addOption(getText("ContextMenu_PaintingCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CratePainting", "PaintBlack");
			PaintCratesMenu.addTooltip(option27, playerObj, "CratePainting", Crate2, "PaintBlack");
		end
		
		if Crate2:getType() == "CratePink" then
			local option28 = subMenuPaint:addOption(getText("ContextMenu_ScavengeCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateScavenge", "PaintBlack");
			PaintCratesMenu.addTooltip(option28, playerObj, "CrateScavenge", Crate2, "PaintBlack");
		end

		if Crate2:getType() == "CrateLightBlue" then
			local option29 = subMenuPaint:addOption(getText("ContextMenu_ClothingCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateClothing", "PaintBlack");
			PaintCratesMenu.addTooltip(option29, playerObj, "CrateClothing", Crate2, "PaintBlack");
		end
		
		if Crate2:getType() == "CrateBrown" then
			local option30 = subMenuPaint:addOption(getText("ContextMenu_TrashCrate"), Crate2, PaintCratesMenu.onPaint, playerObj, "CrateTrash", "PaintWhite");
			PaintCratesMenu.addTooltip(option30, playerObj, "CrateTrash", Crate2, "PaintWhite");
		end
	end
	if Crate3 and (ISBuildMenu.cheat or (Turpentine and paintBrush)) then
		local option1 = context:addOption(getText("ContextMenu_UnpaintCrate"), Crate3, PaintCratesMenu.onPaint, playerObj, "BaseCrate", "Turpentine");
		local tooltip = ISWorldObjectContextMenu.addToolTip();
		tooltip:setName(getText("ContextMenu_UnpaintCrate"));
		tooltip.description = PaintCratesMenu.ManageDescription2(tooltip, playerObj, Crate3:getType(), "Turpentine");
		tooltip:setTexture(UnpaintCratesDefinitions[Crate3:getType()].texture);
		option1.toolTip = tooltip;
		--PaintCratesMenu.addTooltip(option1, playerObj, "BaseCrate", Crate3, "Turpentine");
	end
end


PaintCratesMenu.getPaintCrateTexture = function(itemtype)
	if PaintCratesDefinitions and PaintCratesDefinitions[itemtype] then
		return PaintCratesDefinitions[itemtype].texture;
	else return nil
	end
end

PaintCratesMenu.ManageDescription = function(tooltip, playerObj, itemtype, Paint1, Paint2)
	local playerInv = playerObj:getInventory();
	local text = getText("ContextMenu_PaintCrateTT");
	if PaintCratesDefinitions and PaintCratesDefinitions[itemtype] then
		if PaintCratesDefinitions[itemtype].desc then
			text = getText(PaintCratesDefinitions[itemtype].desc);
		end
	end
	text = text .. "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" ..  getText("Tooltip_craft_Needs") .. " : <LINE>";
	if ISBuildMenu.cheat then
		text = text .. " <RGB:0,0.8,0>" .. getText("ContextMenu_CheatActivated");
	else
		local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush")
		if paintBrush then
			text = text .. " <RGB:0,0.8,0>" .. paintBrush:getDisplayName() .. ": " .. "1/1";
		else
			paintBrush = InventoryItemFactory.CreateItem("Base.Paintbrush");
			text = text .. " <RGB:0,0.8,0>" .. paintBrush:getDisplayName() .. ": " .. "0/1";
		end
		if Paint1 ~= nil then
			if playerInv:containsTypeRecurse(Paint1) then
				local paint = playerInv:getFirstTypeRecurse(Paint1);
				text = text .. " <LINE> <RGB:0,0.8,0>" .. paint:getDisplayName() .. ": " .. "1/1";
			else
				local paint = InventoryItemFactory.CreateItem("Base." .. Paint1);
				text = text .. " <LINE> <RGB:1,0,0>" .. paint:getDisplayName() .. ": " .. "0/1";
			end
		end
		if Paint2 ~= nil then
			if playerInv:containsTypeRecurse(Paint2) then
				local paint2 = playerInv:getFirstTypeRecurse(Paint2);
				text = text .. " <LINE> <RGB:0,0.8,0>" .. paint2:getDisplayName() .. ": " .. "1/1";
			else
				local paint2 = InventoryItemFactory.CreateItem("Base." .. Paint2);
				text = text .. " <LINE> <RGB:1,0,0>" .. paint2:getDisplayName() .. ": " .. "0/1";
			end
		end
	end
	return text;
end

PaintCratesMenu.ManageDescription2 = function(tooltip, playerObj, itemtype, Paint1, Paint2)
	local playerInv = playerObj:getInventory();
	local text = getText("ContextMenu_UnpaintCrateTT");
	text = text .. "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" ..  getText("Tooltip_craft_Needs") .. " : <LINE>";
	if ISBuildMenu.cheat then
		text = text .. " <RGB:0,0.8,0>" .. getText("ContextMenu_CheatActivated");
	else
		local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush")
		if paintBrush then
			text = text .. " <RGB:0,0.8,0>" .. paintBrush:getDisplayName() .. ": " .. "1/1";
		else
			paintBrush = InventoryItemFactory.CreateItem("Base.Paintbrush");
			text = text .. " <RGB:0,0.8,0>" .. paintBrush:getDisplayName() .. ": " .. "0/1";
		end
		if Paint1 ~= nil then
			if playerInv:containsTypeRecurse(Paint1) then
				local paint = playerInv:getFirstTypeRecurse(Paint1);
				text = text .. " <LINE> <RGB:0,0.8,0>" .. paint:getDisplayName() .. ": " .. "1/1";
			else
				local paint = InventoryItemFactory.CreateItem("TableSaw." .. Paint1);
				text = text .. " <LINE> <RGB:1,0,0>" .. paint:getDisplayName() .. ": " .. "0/1";
			end
		end
		if Paint2 ~= nil then
			if playerInv:containsTypeRecurse(Paint2) then
				local paint2 = playerInv:getFirstTypeRecurse(Paint2);
				text = text .. " <LINE> <RGB:0,0.8,0>" .. paint2:getDisplayName() .. ": " .. "1/1";
			else
				local paint2 = InventoryItemFactory.CreateItem("Base." .. Paint2);
				text = text .. " <LINE> <RGB:1,0,0>" .. paint2:getDisplayName() .. ": " .. "0/1";
			end
		end
	end
	return text;
end

PaintCratesMenu.canPaint = function(playerObj, Paint1, Paint2)
	if ISBuildMenu.cheat then return true end
	local CanPaint = false;
	local playerInv = playerObj:getInventory();
	local item1 = false;
	local item2 = false;
	if Paint1 ~= nil and Paint2 == nil then
		if playerInv:containsTypeRecurse(Paint1) then
			item1 = true;
		end
		if item1 then
			CanPaint = true;
		end
	elseif Paint1 ~= nil and Paint2 ~= nil then
		if playerInv:containsTypeRecurse(Paint1) then
			item1 = true;
		end	
		if playerInv:containsTypeRecurse(Paint2) then
			item2 = true;
		end
		if item1 and item2 then
			CanPaint = true;
		end
	end
	return CanPaint;
end

PaintCratesMenu.addTooltip = function(option, playerObj, itemtype, Crate, Paint1, Paint2)
	local tooltip = ISWorldObjectContextMenu.addToolTip();
	local name = "";
	if Crate:getCustomNameFull() == "Crate" and Crate:getTexture():getName() == "carpentry_01_16_Icon" then
		name = Translator.getMoveableDisplayName(Crate:getCustomNameFull());
	else
		name  = Crate:getDisplayName() or "";
	end
	tooltip:setName(getText("ContextMenu_Paint") .. "  " .. name);
	tooltip.description = PaintCratesMenu.ManageDescription(tooltip, playerObj, itemtype, Paint1, Paint2);
	tooltip:setTexture(PaintCratesMenu.getPaintCrateTexture(itemtype));
	tooltip.footNote = getText("ContextMenu_CanBeCleaned");
	option.toolTip = tooltip;
	local canPaint = PaintCratesMenu.canPaint(playerObj, Paint1, Paint2);
	if not canPaint then
		option.notAvailable = true;
	end
	return tooltip
end


PaintCratesMenu.onPaint = function(object, playerObj, item, paint, paint2)
	
	-- check if needs to be moved
	local playerInv = playerObj:getInventory();
	if luautils.haveToBeTransfered(playerObj, object) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, object, object:getContainer(), playerObj:getInventory()));
	end
	local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush");
	if paintBrush then
		if luautils.haveToBeTransfered(playerObj, paintBrush) then
			ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, paintBrush, paintBrush:getContainer(), playerInv));
		end
		if not paintBrush:isEquipped() then
			ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, paintBrush, 50, true, false))
		end
	end
	if paint ~= nil then
		if playerInv:containsTypeRecurse(paint) then
			local paintItem1 = playerInv:getFirstTypeRecurse(paint);
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, paintItem1)
		end
	end
	if paint2 ~= nil then
		if playerInv:containsTypeRecurse(paint2) then
			local paintItem2 = playerInv:getFirstTypeRecurse(paint2);
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, paintItem2)
		end
	end
	local actionTime = 200;
	if ISBuildMenu.cheat then
		actionTime = 5;
	end
	ISTimedActionQueue.add(OnPaintCratesAction:new(object, playerObj, item, paint, paint2, actionTime));
end


Events.OnFillInventoryObjectContextMenu.Add(PaintCratesMenu.doMenu);
--Made by Snake
SkillsMagMenu = {};

SkillsMagMenu.doMenu = function(player, context, items)
	local pl = getSpecificPlayer(player);
	local SMag = nil;

	for i,v in ipairs(items) do
		local tempitem = v;
		if not instanceof(v, "InventoryItem") then
			tempitem = v.items[1];
		end
		if tempitem:getModule() == "SkillMag" then
			SMag = tempitem;
		end
	end
	if not SMag or SMag == nil then return end

	if SMag and SkillMagsDefinitions[SMag:getType()] and not pl:HasTrait("Illiterate") then
		local option = context:addOption((getText("ContextMenu_Read") .. " " .. SMag:getDisplayName()), SMag, SkillsMagMenu.ReadMagazine_OnCreate, pl);
		local tooltip = ISWorldObjectContextMenu.addToolTip();
		tooltip:setName(getText("ContextMenu_Read") .. " " .. SMag:getDisplayName());
		tooltip.description = tooltip.description .. getText("ContextMenu_CheckMagTT");
		tooltip:setTexture(SMag:getTexture():getName());
		option.toolTip = tooltip;
	elseif SMag and SMag:getType() == "SkillMagPackage" then
		local option = context:addOption((getText("ContextMenu_Open") .. " " .. SMag:getDisplayName()), SMag, SkillsMagMenu.OpenPackage, pl);
		local tooltip = ISWorldObjectContextMenu.addToolTip();
		tooltip:setName(getText("ContextMenu_Open") .. " " .. SMag:getDisplayName());
		tooltip.description = getText("ContextMenu_SMPackageTT") .. SMag:getDisplayName();
		tooltip:setTexture(SMag:getTexture():getName());
		option.toolTip = tooltip;
	
	end
end

SkillsMagMenu.ReadMagazine_OnCreate = function(item, playerObj)
	
	-- check if needs to be moved
	if luautils.haveToBeTransfered(playerObj, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
	end
	
	if not item:isEquipped() then
		local toPrimary = true;
		if not (not playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) then
			-- Primary hand is damaged
			toPrimary = false;
		elseif playerObj:getPrimaryHandItem() and not playerObj:getSecondaryHandItem() then
			-- Primary hand has an item, but secondary is free
			if not playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0) then
				-- Secondary hand is not damaged, so secondary it is!
				toPrimary = false;
			end
		end
		
		-- equip the item first
		ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, toPrimary, false))
	end

	ISTimedActionQueue.add(SkillsMagReadAction:new(playerObj, item, nil));
end

SkillsMagMenu.OpenPackage = function(item, playerObj)
	-- check if needs to be moved
	if luautils.haveToBeTransfered(playerObj, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
	end
	ISTimedActionQueue.add(OpenMagsPackageAction:new(playerObj, item, nil));
end

Events.OnFillInventoryObjectContextMenu.Add(SkillsMagMenu.doMenu);
Events.OnObjectAdded.Add(function(isoObject)
	if not isoObject then return end
	local sprite = isoObject and isoObject:getSprite() or nil;
	if sprite == nil then return end;
	local prop = sprite and sprite:getProperties() or nil;
	if prop == nil then return end;
	local customItem = prop:Is("CustomItem") and prop:Val("CustomItem") or nil;
	if customItem == nil then return end;
	if customItem then
		if string.sub(prop:Val("CustomItem"), 1, string.len("ColorCrates")) == "ColorCrates" then
			isoObject:setMaxHealth(PaintCratesMenu.getHealth());
			isoObject:setHealth(isoObject:getMaxHealth());
			if IsActivatedMod("Worse Searching") then
				local mData = isoObject:getModData()
				if not mData.searched then
					mData.searched = true
				end
			end
			ISInventoryPage.renderDirty = true;
		end
	end
end)

Events.OnDestroyIsoThumpable.Add(function(isoObject)
	if not isoObject then return end
	local sprite = isoObject and isoObject:getSprite() or nil;
	if sprite == nil then return end;
	local prop = sprite and sprite:getProperties() or nil;
	if prop == nil then return end;
	local customItem = prop:Is("CustomItem") and prop:Val("CustomItem") or nil;
	if customItem == nil then return end;
	if customItem then
		if string.sub(prop:Val("CustomItem"), 1, string.len("ColorCrates")) == "ColorCrates" then
			for i=1,3 do
				isoObject:getSquare():AddWorldInventoryItem("Base.Plank", isoObject:getX() - math.floor(isoObject:getX()), isoObject:getY() - math.floor(isoObject:getY()), isoObject:getZ() - math.floor(isoObject:getZ()));
				isoObject:getSquare():AddWorldInventoryItem(instanceItem("Base.Nails"), isoObject:getX() - math.floor(isoObject:getX()), isoObject:getY() - math.floor(isoObject:getY()), isoObject:getZ() - math.floor(isoObject:getZ()));
				ISInventoryPage.renderDirty = true;
			end
		end
	end
end)

local function IsActivatedMod(mod_Name)
    local mods = getActivatedMods();
    for i=0, mods:size()-1, 1 do
        if mods:get(i) == mod_Name then
            return true;
        end
    end
    return false;
end
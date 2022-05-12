require ("TimedActions/ISBaseTimedAction");

OnPaintCratesAction = ISBaseTimedAction:derive("OnPaintCratesAction");

function OnPaintCratesAction:isValid()
	return true
end

function OnPaintCratesAction:update()
    self.object:setJobDelta(self:getJobDelta());
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function OnPaintCratesAction:start()
	self:setActionAnim("Loot");
	self:setOverrideHandModels("PaintBrush", nil)
	self.character:clearVariable("LootPosition");
	self:setAnimVariable("LootPosition", "Low");
    --self:setOverrideHandModels("PaintBrush", nil)
	self.character:playSound("PaintLong");
    self.object:setJobType(getText("ContextMenu_Paint"));
    self.object:setJobDelta(0.0);
    --self.character:getEmitter():playSoundImpl("waffles", nil);
end


function OnPaintCratesAction:stop()

	ISBaseTimedAction.stop(self);
	self.object:setJobDelta(0.0);
end

function OnPaintCratesAction:perform()

    self.object:setJobDelta(0.0);
	local playerInv = self.character:getInventory();
	if ISBuildMenu.cheat then
		-- nothing- CheatMode.
	else
		PaintItem = playerInv:containsTypeRecurse(self.paint) 
		if PaintItem then
			local itemObj = playerInv:getItemFromType(self.paint);
			if instanceof(itemObj, "DrainableComboItem") then
				if itemObj:getUsedDelta() > 0 then
					itemObj:Use();
				end	
			else
				if self.paint == "Turpentine" then
					local Turpentine = self.character:getInventory():getItemFromType("Turpentine");
					Turpentine:setThirstChange(Turpentine:getThirstChange() + 0.05);
					if Turpentine:getThirstChange() > -0.05 then
						Turpentine:Use();
					end
				end
			end
		end
		if self.paint2 ~= nil then
			PaintItem = playerInv:containsTypeRecurse(self.paint2)
			local itemObj = playerInv:getItemFromType(self.paint2);
			if itemObj:getUsedDelta() > 0 then
				itemObj:Use();
			end			
		end
		playerInv:Remove(self.object)
	end
	playerInv:AddItem("ColorCrates."..self.item)
	ISBaseTimedAction.perform(self);
end

function OnPaintCratesAction:new(object, character, item, paint, paint2, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.object = object;
	o.character = character;
	o.item = item;
	o.paint = paint;
	o.paint2 = paint2;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end
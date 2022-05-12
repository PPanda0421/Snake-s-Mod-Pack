--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

OnDismantleGenAction = ISBaseTimedAction:derive("OnDismantleGenAction");

function OnDismantleGenAction:isValid()
	return (self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem() == self.item)
end

function OnDismantleGenAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function OnDismantleGenAction:update()
	self.item:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function OnDismantleGenAction:start()
	self.item:setJobType(getText("ContextMenu_Dismantle"))
	self:setActionAnim(CharacterActionAnims.Craft);
	if self.item:getStaticModel() then
		self:setOverrideHandModels(self.item:getStaticModel(), nil)
	end
	self.character:getEmitter():playSound("Hammering");
	local worldSoundRadius = math.ceil(20 * self.character:getHammerSoundMod())
	if worldSoundRadius > 0 then
		addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), worldSoundRadius, worldSoundRadius)
	end
	self.item:setJobDelta(0.0)
end

function OnDismantleGenAction:stop()
	self.item:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function OnDismantleGenAction:perform()
	self.item:setJobDelta(0.0)
	local screwdriver = self.character:getPrimaryHandItem();
    if screwdriver and screwdriver:getType() == "Screwdriver" and ZombRand(screwdriver:getConditionLowerChance()) == 0 then
        screwdriver:setCondition(screwdriver:getCondition() - 1)
        ISWorldObjectContextMenu.checkWeapon(self.character);
    end
	if self.character:getPerkLevel(Perks.Electricity) >= 2 then
		local number = 0;
		if self.character:getPerkLevel(Perks.Electricity) == 3 then
			number = 2;
		else
			number = ZombRand(1,3);
		end
		local itemsAdded = self.character:getInventory():AddItems("Base.SheetMetal", number);
		if itemsAdded then
			for i=1,itemsAdded:size() do
				self:ItemToFloor(itemsAdded:get(i-1));
			end
		end
		itemsAdded = self.character:getInventory():AddItems("TableSaw.Engine", 1);
		if itemsAdded then
			for i=1,itemsAdded:size() do
				self:ItemToFloor(itemsAdded:get(i-1));
			end
		end
		if ZombRand(2) == 0 or self.character:getPerkLevel(Perks.Electricity) == 3 then
			itemsAdded = self.character:getInventory():AddItems("Radio.ElectricWire", 2);
			if itemsAdded then
				for i=1,itemsAdded:size() do
					self:ItemToFloor(itemsAdded:get(i-1));
				end
			end
		end
		itemsAdded = self.character:getInventory():AddItems("Base.ScrapMetal", 2);
		if itemsAdded then
			for i=1,itemsAdded:size() do
				self:ItemToFloor(itemsAdded:get(i-1));
			end
		end
		if ZombRand(2) == 0 or self.character:getPerkLevel(Perks.Electricity) == 3 then
			if self.character:getPerkLevel(Perks.Electricity) == 3 then
				number = 6;
			else
				number = ZombRand(1,6);
			end
			itemsAdded = self.character:getInventory():AddItems("Base.ElectronicsScrap", number);
			if itemsAdded then
				for i=1,itemsAdded:size() do
					self:ItemToFloor(itemsAdded:get(i-1));
				end
			end
		end
		if ZombRand(2) == 0 or self.character:getPerkLevel(Perks.Electricity) == 3 then
			itemsAdded = self.character:getInventory():AddItems("Base.LightBulb", 1);
			if itemsAdded then
				for i=1,itemsAdded:size() do
					self:ItemToFloor(itemsAdded:get(i-1));
				end
			end
		end
		if ZombRand(2) == 0 or self.character:getPerkLevel(Perks.Electricity) == 3 then
			itemsAdded = self.character:getInventory():AddItems("Base.LightBulbRed", 1);
			if itemsAdded then
				for i=1,itemsAdded:size() do
					self:ItemToFloor(itemsAdded:get(i-1));
				end
			end
		end

		self.character:getXp():AddXP(Perks.Electricity, 100);
		self.object:remove();
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function OnDismantleGenAction:ItemToFloor(itemtoadd)
	local inv = self.character:getInventory();
	if inv:contains(itemtoadd) then
		inv:Remove(itemtoadd)
	end

	self.square:AddWorldInventoryItem(itemtoadd,
	self.object:getX() - math.floor(self.object:getX()),
	self.object:getY() - math.floor(self.object:getY()),
	self.object:getZ() - math.floor(self.object:getZ()))
	ISInventoryPage.renderDirty = true;

end

function OnDismantleGenAction:new(character, object, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.object = object;
	o.item = item;
    o.square = object:getSquare();
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end

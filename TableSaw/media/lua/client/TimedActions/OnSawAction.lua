--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

OnSawAction = ISBaseTimedAction:derive("OnSawAction");

function OnSawAction:isValid()
	return (self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem() == self.item)
end

function OnSawAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function OnSawAction:update()
	self.item:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function OnSawAction:start()
	local sound = "SawMachine"
	if self.item:getType() == "Plank" then
		sound = "SawMachineShort"
	end
	self.character:playSound(sound);
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 20);
	self.item:setJobType(getText("ContextMenu_Saw"))
	self:setAnimVariable("FoodType", "bottle");
	self:setActionAnim("fill_container_tap");
	if self.item:getStaticModel() then
		self:setOverrideHandModels(nil, self.item:getStaticModel())
	else
		self:setOverrideHandModels(nil, "Log")
	end
	self.item:setJobDelta(0.0)
end

function OnSawAction:stop()
	self.item:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function OnSawAction:perform()
	self.item:setJobDelta(0.0)
	local number = 1;
	local itemtoadd = nil;
	if self.item:getType() == "Log" then
		itemtoadd = "Base.Plank";
		number = 6;
	elseif self.item:getType() == "Plank" then
		itemtoadd = "Base.WoodenStick";
		number = 12;
	end
	if itemtoadd ~= nil then
		local itemsAdded = self.character:getInventory():AddItems(itemtoadd, number);
		self.character:getPrimaryHandItem():Use();
		self.character:setPrimaryHandItem(nil);
		if itemsAdded then
			for i=1,itemsAdded:size() do
				self.character:getXp():AddXP(Perks.Woodwork, 1);
				self:addOrDropItem(itemsAdded:get(i-1));
			end
		end
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function OnSawAction:addOrDropItem(itemtoadd)
	local inv = self.character:getInventory()
	if not inv:contains(itemtoadd) then
		inv:AddItem(itemtoadd)
	end
	if inv:getCapacityWeight() > inv:getEffectiveCapacity(self.character) then
		if inv:contains(itemtoadd) then
			inv:Remove(itemtoadd)
		end
		self.character:getCurrentSquare():AddWorldInventoryItem(itemtoadd,
		self.character:getX() - math.floor(self.character:getX()),
		self.character:getY() - math.floor(self.character:getY()),
		self.character:getZ() - math.floor(self.character:getZ()))
		ISInventoryPage.renderDirty = true;
	end
end

function OnSawAction:new(character, object, item, time)
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

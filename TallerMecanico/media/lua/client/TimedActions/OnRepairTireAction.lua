--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

OnRepairTireAction = ISBaseTimedAction:derive("OnRepairTireAction");

function OnRepairTireAction:isValid()
	return true --(self.item ~= nil and self.item:getCondition())
end

function OnRepairTireAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function OnRepairTireAction:update()
	self.item:setJobDelta(self:getJobDelta())
	self.tire:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function OnRepairTireAction:start()

	self.item:setJobType(getText("ContextMenu_RepairTire"))
	self.tire:setJobType(getText("ContextMenu_RepairTire"))
	self:setAnimVariable("FoodType", "bottle");
	self:setActionAnim("fill_container_tap");
	self.character:playSound("VulcanizingMachine");
	self:setOverrideHandModels(nil, nil)
	self.item:setJobDelta(0.0)
	self.tire:setJobDelta(0.0);
end

function OnRepairTireAction:stop()
	self.item:setJobDelta(0.0);
	self.tire:setJobDelta(0.0);
    ISBaseTimedAction.stop(self);
end

function OnRepairTireAction:perform()
	self.item:setJobDelta(0.0);
	self.tire:setJobDelta(0.0);
	if self.item ~= nil then
		self.character:getInventory():Remove(self.item)
	end
	if self.object:getContainer() and self.object:getContainer():getContentsWeight() > 0 then
		if self.tire ~= nil then
			if self.tire:getCondition() < self.tire:getConditionMax() then
				local calc = self.tire:getCondition() + 20;
				if calc > self.tire:getConditionMax() then
					calc = self.tire:getConditionMax();
				end
				self.tire:setCondition(calc)
				self.character:getXp():AddXP(Perks.Mechanics, 3);
				ISInventoryPage.renderDirty = true;
			end
		end
	end	
	ISBaseTimedAction.perform(self);
end

function OnRepairTireAction:getTireItem(obj)
	local Tire = nil;
	if obj:getContainer() and obj:getContainer():getContentsWeight() > 0 then
		local it = obj:getContainer():getItems();
		for i = 0, it:size()-1 do
			local Titem = it:get(i);
			if Titem:getType() == "DismountedTire" then
				Tire = Titem;
			end
		end
	end
	return Tire;
end

function OnRepairTireAction:new(character, object, item)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.object = object;
	o.item = item;
	o.tire = OnRepairTireAction:getTireItem(object);
    o.square = object:getSquare();
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 300;
	return o;
end

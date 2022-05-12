require ("TimedActions/ISBaseTimedAction");

RepairSilencerAction = ISBaseTimedAction:derive("RepairSilencerAction");

function RepairSilencerAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) and (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item2:getType())));
end

function RepairSilencerAction:update()
    self.item:setJobDelta(self:getJobDelta());
	self.character:setMetabolicTarget(Metabolics.LightDomestic);
end

function RepairSilencerAction:start()
    self.item:setJobType(getText("ContextMenu_fixing"));
    self.item:setJobDelta(0.0);
	self:setActionAnim(CharacterActionAnims.Craft);
    self.character:getEmitter():playSoundImpl("RepairSilencer", nil);
end


function RepairSilencerAction:stop()

	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function RepairSilencerAction:perform()

    self.item:setJobDelta(0.0);

	local Data = self.item:getModData();
	if Data.SilencerDurability and Data.SilencerDurability < 100 and self.item2:getUsedDelta() > 0 then
		if self.item2:getUsedDelta() > 0 then
			self.item2:Use();
		end
		Data.SilencerDurability = Data.SilencerDurability + 10
		if Data.SilencerDurability > 100 then
			Data.SilencerDurability = 100;
		end
	end
	ISBaseTimedAction.perform(self);
end

function RepairSilencerAction:new(character, item, item2, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.item2 = item2;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end
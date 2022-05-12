--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

RTStudyAction = ISBaseTimedAction:derive("RTStudyAction");

function RTStudyAction:isValid()
	return self.skilllvl < 1;
end

function RTStudyAction:waitToStart()
    self.character:faceThisObject(self.reloadingtable)
    return self.character:shouldBeTurning()
end

function RTStudyAction:update()
end

function RTStudyAction:start()
	if ZombRand(2) == 0 then
		self:setActionAnim(CharacterActionAnims.Craft);
	else
		self:setActionAnim("Loot");
		if ZombRand(2) == 0 then
			self:setAnimVariable("LootPosition", "Low");
		end
	end
	self:setOverrideHandModels(nil, nil);
end

function RTStudyAction:stop()
    ISBaseTimedAction.stop(self);
end

function RTStudyAction:perform()
	if self.character:getPerkLevel(Perks.AMReloading) < 1 then
		local oldXp = self.character:getXp():getXP(Perks.AMReloading);
		self.character:getXp():AddXP(Perks.AMReloading, 1);
		local xp = self.character:getXp():getXP(Perks.AMReloading) - oldXp;
		self.character:setHaloNote(getText("IGUI_perks_AMReloading").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,50);
		ISTimedActionQueue.add(RTStudyAction:new(self.character, self.reloadingtable, 100));
	end
	ISBaseTimedAction.perform(self);
end

function RTStudyAction:new(character, reloadingtable, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.reloadingtable = reloadingtable;
	o.maxTime = time;
	o.skilllvl = o.character:getPerkLevel(Perks.AMReloading)
	o.useProgressBar = false;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	return o;
end

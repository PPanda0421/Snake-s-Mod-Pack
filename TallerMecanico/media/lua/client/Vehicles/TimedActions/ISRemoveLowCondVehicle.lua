--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRemoveLowCondVehicle = ISBaseTimedAction:derive("ISRemoveLowCondVehicle")

function ISRemoveLowCondVehicle:isValid()
	return self.vehicle and not self.vehicle:isRemovedFromWorld();
end

function ISRemoveLowCondVehicle:update()
	self.character:faceThisObject(self.vehicle)
	self.item:setJobDelta(self:getJobDelta())
	self.item:setJobType(getText("ContextMenu_RemoveLowConditionVehicle"))

	if self.sound ~= 0 and not self.character:getEmitter():isPlaying(self.sound) then
		self.sound = self.character:playSound("BlowTorch")
	end

    self.character:setMetabolicTarget(Metabolics.HeavyWork);
end

function ISRemoveLowCondVehicle:start()
	self.item = self.character:getPrimaryHandItem()
	self:setActionAnim("BlowTorch")
	self:setOverrideHandModels(self.item, nil)
	self.sound = self.character:playSound("BlowTorch")
end

function ISRemoveLowCondVehicle:stop()
	if self.item then
		self.item:setJobDelta(0)
	end
	if self.sound ~= 0 then
		self.character:getEmitter():stopSound(self.sound)
	end
	ISBaseTimedAction.stop(self)
end

function ISRemoveLowCondVehicle:perform()
	if self.sound ~= 0 then
		self.character:getEmitter():stopSound(self.sound)
	end
	local totalXp = 5;
	local junkchance = self.character:getPerkLevel(Perks.MetalWelding)*5;
	if self.helicopter and string.match(self.vehicle:getScript():getName(), "FEMASupplyDrop") then
		for i=1,math.max(5,self.character:getPerkLevel(Perks.MetalWelding)) do
			if self:checkAddItem("Nails", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("SheetMetal", 18) then totalXp = totalXp + 2 end;
			if self:checkAddItem("SmallSheetMetal", 12) then totalXp = totalXp + 2 end;
			if self:checkAddItem("Plank", 10) then totalXp = totalXp + 2 end;
			if junkchance <= 25 then
				if self:checkAddItem("UnusableMetal", junkchance) then totalXp = totalXp + 2 end;
				if self:checkAddItem("UnusableWood", junkchance) then totalXp = totalXp + 2 end;
			end
			if self:checkAddItem("UnusableMetal", junkchance) then totalXp = totalXp + 2 end;
			if self:checkAddItem("UnusableWood", junkchance) then totalXp = totalXp + 2 end;
		end
	else
		for i=1,math.max(5,self.character:getPerkLevel(Perks.MetalWelding)) do
			if self:checkAddItem("MetalBar", 15) then totalXp = totalXp + 2 end;
			if self:checkAddItem("MetalPipe", 15) then totalXp = totalXp + 2 end;
			if self:checkAddItem("SheetMetal", 18) then totalXp = totalXp + 2 end;
			if self:checkAddItem("SheetMetal", 18) then totalXp = totalXp + 2 end;
			if self:checkAddItem("SheetMetal", 18) then totalXp = totalXp + 2 end;
			if self:checkAddItem("SmallSheetMetal", 12) then totalXp = totalXp + 2 end;
			if self:checkAddItem("SmallSheetMetal", 12) then totalXp = totalXp + 2 end;
			if self:checkAddItem("SmallSheetMetal", 12) then totalXp = totalXp + 2 end;
			if self:checkAddItem("ScrapMetal", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("ScrapMetal", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("ScrapMetal", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("ScrapMetal", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("ScrapMetal", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("ScrapMetal", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("Screws", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("Screws", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("Screws", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("Screws", 10) then totalXp = totalXp + 2 end;
			if self:checkAddItem("Screws", 10) then totalXp = totalXp + 2 end;
			if junkchance <= 25 then
				if self:checkAddItem("UnusableMetal", junkchance) then totalXp = totalXp + 2 end;
			end
			if self:checkAddItem("UnusableMetal", junkchance) then totalXp = totalXp + 2 end;
		end
	end
	local totalMXp = 2;
	local fuselage = false;
	if string.match(self.vehicle:getScript():getName(), "Fuselage") then
		fuselaje = true;
	end
	
	if not self.helicopter or fuselage then
		for i=1,math.max(5,self.character:getPerkLevel(Perks.Mechanics)) do
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
			if self:checkAddMItem("EngineParts", 25) then totalMXp = totalMXp + 2 end;
		end
	end
	for i=1,20 do
		self.item:Use();
	end
	self.character:getXp():AddXP(Perks.MetalWelding, totalXp);
	self.character:getXp():AddXP(Perks.Mechanics, totalMXp);
	sendClientCommand(self.character, "vehicle", "remove", { vehicle = self.vehicle:getId() })
	self.item:setJobDelta(0);
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISRemoveLowCondVehicle:checkAddItem(item, baseChance)
	local chance = baseChance;
	if chance <= self.character:getPerkLevel(Perks.MetalWelding) then
		chance = 0;
	end
	if ZombRand(chance-self.character:getPerkLevel(Perks.MetalWelding)) == 0 then
--		self.character:getInventory():AddItem(item);
		self.vehicle:getSquare():AddWorldInventoryItem(item, ZombRandFloat(0,0.9), ZombRandFloat(0,0.9), 0);
		return true;
	end
	return false;
end

function ISRemoveLowCondVehicle:checkAddMItem(item, baseChance)
	local chance = baseChance;
	if chance <= self.character:getPerkLevel(Perks.Mechanics) then
		chance = 0;
	end
	if ZombRand(chance-self.character:getPerkLevel(Perks.Mechanics)) == 0 then
--		self.character:getInventory():AddItem(item);
		self.vehicle:getSquare():AddWorldInventoryItem(item, ZombRandFloat(0,0.9), ZombRandFloat(0,0.9), 0);
		return true;
	end
	return false;
end

function ISRemoveLowCondVehicle:new(character, vehicle, Helicopter)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.vehicle = vehicle
	o.helicopter = Helicopter
	o.maxTime = 800 - (character:getPerkLevel(Perks.MetalWelding) * 20);
	if character:isTimedActionInstant() then o.maxTime = 10 end
	return o
end


--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

FillPaintMachineAction = ISBaseTimedAction:derive("FillPaintMachineAction");

function FillPaintMachineAction:isValid()
	return self.PMachine:getObjectIndex() ~= -1 and
		self.character:getInventory():contains(self.PaintBucket)
end

function FillPaintMachineAction:waitToStart()
	self.character:faceThisObject(self.PMachine)
	return self.character:shouldBeTurning()
end

function FillPaintMachineAction:update()
	self.PaintBucket:setJobDelta(self:getJobDelta())
	self.character:faceThisObject(self.PMachine)

    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function FillPaintMachineAction:start()
	self.PaintBucket:setJobType(getText("ContextMenu_FillPaint") .. " " .. getItemNameFromFullType("Base." .. self.PaintBucket:getType()))
	self:setActionAnim(CharacterActionAnims.Pour)
	self:setOverrideHandModels(self.PaintBucket, nil)
	self.PaintBucket:setJobDelta(0.0)
	--self.character:playSound("FuelTankFill");
end

function FillPaintMachineAction:stop()
	self.PaintBucket:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function FillPaintMachineAction:perform()
	self.PaintBucket:setJobDelta(0.0);
    local endFuel = 0;
	local MachineData = self.PMachine:getModData();
	local PaintType = self.PaintBucket:getType();
    while self.PaintBucket and self.PaintBucket:getUsedDelta() > 0 and MachineData[PaintType] + endFuel < 5 do
        self.PaintBucket:Use();
        endFuel = endFuel + 1;
    end
    MachineData[PaintType] = MachineData[PaintType] + endFuel
    self.PMachine:transmitModData();
	local UpdateData = PaintingMachineMenu.CheckFull(MachineData);
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function FillPaintMachineAction:new(character, PMachine, PaintBucket,  time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = getSpecificPlayer(character);
    o.PaintBucket = PaintBucket;
	o.PMachine = PMachine;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	if o.character:isTimedActionInstant() then o.maxTime = 1; end
	return o;
end

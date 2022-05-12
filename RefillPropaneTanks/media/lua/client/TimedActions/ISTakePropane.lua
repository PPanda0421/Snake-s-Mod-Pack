--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISTakePropane = ISBaseTimedAction:derive("ISTakePropane");
ISTakePropane.SoundTimer = 0;
function ISTakePropane:isValid()
	local pumpCurrent = tonumber(self.propanetankobjectdata.PropaneContent)
	return pumpCurrent > 0
end

function ISTakePropane:update()
	self.PropaneTank:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.propanetankobject:getSquare():getX(), self.propanetankobject:getSquare():getY())
	local actionCurrent = math.floor(self.itemStart + (self.itemTarget - self.itemStart) * self:getJobDelta() + 0.001)
	local itemCurrent = math.floor(self.PropaneTank:getUsedDelta() / self.PropaneTank:getUseDelta() + 0.001)
	if actionCurrent > itemCurrent then
		local pumpCurrent = tonumber(self.propanetankobjectdata.PropaneContent)
		self.propanetankobjectdata.PropaneContent = tonumber(pumpCurrent - (actionCurrent - itemCurrent));
		self.propanetankobject:transmitModData();

		self.PropaneTank:setUsedDelta(actionCurrent * self.PropaneTank:getUseDelta())
	end
	if ISTakePropane.SoundTimer > 0 then
		ISTakePropane.SoundTimer = ISTakePropane.SoundTimer -1;
	end
	if ISTakePropane.SoundTimer <= 0 then
		ISTakePropane.SoundTimer = 25;
		self.character:playSound("RefillPropaneTank")
	end
	
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function ISTakePropane:start()
	self.PropaneTank:setJobType(getText("ContextMenu_TakeGasFromPump"))
	self.PropaneTank:setJobDelta(0.0)
	local pumpCurrent = tonumber(self.propanetankobjectdata.PropaneContent);
	local itemCurrent = math.floor(self.PropaneTank:getUsedDelta() / self.PropaneTank:getUseDelta() + 0.001)
	local itemMax = math.floor(1 / self.PropaneTank:getUseDelta() + 0.001)
	local take = math.min(pumpCurrent, itemMax - itemCurrent)
	self.action:setTime(take * 50)
	self.itemStart = itemCurrent
	self.itemTarget = itemCurrent + take
	self.propanetankobject:transmitModData();
end

function ISTakePropane:stop()
	self.character:playSound("RefillPropaneTankFinish")
	self.PropaneTank:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function ISTakePropane:perform()
	self.PropaneTank:setJobDelta(0.0)
	self.character:playSound("RefillPropaneTankFinish")
	local itemCurrent = math.floor(self.PropaneTank:getUsedDelta() / self.PropaneTank:getUseDelta() + 0.001)
	if self.itemTarget > itemCurrent then
		self.PropaneTank:setUsedDelta(self.itemTarget * self.PropaneTank:getUseDelta())
		local pumpCurrent = tonumber(self.propanetankobjectdata.PropaneContent)
		self.propanetankobjectdata.PropaneContent = tonumber(pumpCurrent + (self.itemTarget - itemCurrent));
		
		self.propanetankobject:transmitModData();
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISTakePropane:new(character, propanetankobject, PropaneTank, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.propanetankobject = propanetankobject;
	o.propanetankobjectdata = propanetankobject:getModData();
	o.PropaneTank = PropaneTank;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end

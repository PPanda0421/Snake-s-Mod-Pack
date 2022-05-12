--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

FuelTanksAddFuel = ISBaseTimedAction:derive("FuelTanksAddFuel");

function FuelTanksAddFuel:isValid()
	return self.fueltank:getObjectIndex() ~= -1 and
		self.character:getInventory():contains(self.petrol)
end

function FuelTanksAddFuel:waitToStart()
	self.character:faceThisObject(self.fueltank)
	return self.character:shouldBeTurning()
end

function FuelTanksAddFuel:update()
	self.character:faceThisObject(self.fueltank)

    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function FuelTanksAddFuel:start()
	self:setActionAnim(CharacterActionAnims.Pour)
	self:setOverrideHandModels(self.petrol, nil)
	self.character:playSound("FuelTankFill");
end

function FuelTanksAddFuel:stop()
    ISBaseTimedAction.stop(self);
end

function FuelTanksAddFuel:perform()
    local endFuel = 0;
	local TankData = self.fueltank:getModData();
    while self.petrol and self.petrol:getUsedDelta() > 0 and TankData.Fuel + endFuel < TankData.MaxCapacity do
        self.petrol:Use();
        endFuel = endFuel + 1;
    end
	
    TankData.Fuel = TankData.Fuel + endFuel
    self.fueltank:transmitModData();
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function FuelTanksAddFuel:new(character, fueltank, petrolCan, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = getSpecificPlayer(character);
    o.petrol = petrolCan;
	o.fueltank = fueltank;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	if o.character:isTimedActionInstant() then o.maxTime = 1; end
	return o;
end

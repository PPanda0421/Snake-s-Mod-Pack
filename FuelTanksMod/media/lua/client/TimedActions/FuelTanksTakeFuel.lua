--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

FuelTanksTakeFuel = ISBaseTimedAction:derive("FuelTanksTakeFuel");

function FuelTanksTakeFuel:isValid()
	local pumpCurrent = tonumber(self.tankdata.Fuel)
	return pumpCurrent > 0
end

function FuelTanksTakeFuel:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function FuelTanksTakeFuel:update()
	self.petrolCan:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.square:getX(), self.square:getY())
	local actionCurrent = math.floor(self.itemStart + (self.itemTarget - self.itemStart) * self:getJobDelta() + 0.001)
	local itemCurrent = math.floor(self.petrolCan:getUsedDelta() / self.petrolCan:getUseDelta() + 0.001)
	if actionCurrent > itemCurrent then
		local pumpCurrent = tonumber(self.tankdata.Fuel)
		self.tankdata.Fuel = tonumber(pumpCurrent - (actionCurrent - itemCurrent));
		self.object:transmitModData();

		self.petrolCan:setUsedDelta(actionCurrent * self.petrolCan:getUseDelta())
    end

    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function FuelTanksTakeFuel:start()
	if self.petrolCan:getType() == "EmptyPetrolCan" then
		local chr = self.character
		local emptyCan = self.petrolCan
		self.petrolCan = chr:getInventory():AddItem("Base.PetrolCan")
		self.petrolCan:setUsedDelta(0)
		if chr:getPrimaryHandItem() == emptyCan then
			chr:setPrimaryHandItem(self.petrolCan)
		end
		if chr:getSecondaryHandItem() == emptyCan then
			chr:setSecondaryHandItem(self.petrolCan)
		end
		chr:getInventory():Remove(emptyCan)
	end
	
	self:setActionAnim(CharacterActionAnims.Pour)
	--self.character:SetVariable("LootPosition", "Low")
	self:setOverrideHandModels(self.petrolCan, nil)
	self.character:playSound("FuelTankFill");

	self.petrolCan:setJobType(getText("ContextMenu_TakeGasFromPump"))
	self.petrolCan:setJobDelta(0.0)

	local pumpCurrent = tonumber(self.tankdata.Fuel);
	local itemCurrent = math.floor(self.petrolCan:getUsedDelta() / self.petrolCan:getUseDelta() + 0.001)
	local itemMax = math.floor(1 / self.petrolCan:getUseDelta() + 0.001)
	local take = math.min(pumpCurrent, itemMax - itemCurrent)
	self.action:setTime(take * 50)
	self.itemStart = itemCurrent
	self.itemTarget = itemCurrent + take
	self.object:transmitModData();
end

function FuelTanksTakeFuel:stop()
	self.petrolCan:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function FuelTanksTakeFuel:perform()
	self.petrolCan:setJobDelta(0.0)
	local itemCurrent = math.floor(self.petrolCan:getUsedDelta() / self.petrolCan:getUseDelta() + 0.001)
	if self.itemTarget > itemCurrent then
		self.petrolCan:setUsedDelta(self.itemTarget * self.petrolCan:getUseDelta())
		-- FIXME: sync in multiplayer
		local pumpCurrent = tonumber(self.tankdata.Fuel)
		self.tankdata.Fuel = tonumber(pumpCurrent + (self.itemTarget - itemCurrent));
		self.object:transmitModData();
		--self.square:getProperties():Set("fuelAmount", tostring(pumpCurrent + (self.itemTarget - itemCurrent)))
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function FuelTanksTakeFuel:new(character, object, square, petrolCan, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.object = object;
	o.tankdata = object:getModData();
    o.square = square;
	o.petrolCan = petrolCan;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end

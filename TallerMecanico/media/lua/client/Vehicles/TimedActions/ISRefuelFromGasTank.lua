--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRefuelFromGasTank = ISBaseTimedAction:derive("ISRefuelFromGasTank")

function ISRefuelFromGasTank:isValid()
	return self.vehicle:isInArea(self.part:getArea(), self.character)
end

function ISRefuelFromGasTank:waitToStart()
	self.character:faceThisObject(self.vehicle)
	return self.character:shouldBeTurning()
end

function ISRefuelFromGasTank:update()
	local litres = self.tankStart + (self.tankTarget - self.tankStart) * self:getJobDelta()
	litres = math.floor(litres)
	if litres ~= self.amountSent then
		local args = { vehicle = self.vehicle:getId(), part = self.part:getId(), amount = litres }
		sendClientCommand(self.character, 'vehicle', 'setContainerContentAmount', args)
		self.amountSent = litres
	end
--[[
	if isClient() then
		if math.floor(litres) ~= self.amountSent then
			local args = { vehicle = self.vehicle:getId(), part = self.part:getId(), amount = litres }
			sendClientCommand(self.character, 'vehicle', 'setContainerContentAmount', args)
			self.amountSent = math.floor(litres)
		end
	else
		self.part:setContainerContentAmount(litres)
	end
--]]
	local pumpUnits = self.pumpStart + (self.pumpTarget - self.pumpStart) * self:getJobDelta()
	pumpUnits = math.ceil(pumpUnits)
	if self.Tank then
		local Tankdata = self.Tank:getModData(); 
		if Tankdata.Fuel then
			Tankdata.Fuel = pumpUnits;
		end
	end
	--self.square:getProperties():Set("fuelAmount", tostring(pumpUnits))

    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function ISRefuelFromGasTank:start()
	self.tankStart = self.part:getContainerContentAmount()
	-- Pumps start with 100 units of fuel.  8 pump units = 1 PetrolCan according to ISTakeFuel.
	local Tankdata = self.Tank:getModData();
	if Tankdata.Fuel then
		
		self.pumpStart = tonumber(Tankdata.Fuel)
		local pumpLitresAvail = self.pumpStart * (Vehicles.JerryCanLitres / 8)
		local tankLitresFree = self.part:getContainerCapacity() - self.tankStart
		local takeLitres = math.min(tankLitresFree, pumpLitresAvail)
		self.tankTarget = self.tankStart + takeLitres
		self.pumpTarget = self.pumpStart - takeLitres / (Vehicles.JerryCanLitres / 8)
		self.amountSent = self.tankStart

		self.action:setTime(takeLitres * 50)

		self:setActionAnim("fill_container_tap")
		self:setOverrideHandModels(nil, nil)
	end
end

function ISRefuelFromGasTank:stop()
	ISBaseTimedAction.stop(self)
end

function ISRefuelFromGasTank:perform()
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISRefuelFromGasTank:new(character, part, square, time, Tank)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.vehicle = part:getVehicle()
	o.part = part
	o.square = square
	o.maxTime = math.max(time, 50)
	o.Tank = Tank
	return o
end


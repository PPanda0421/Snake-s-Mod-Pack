--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

TuningEngine = ISBaseTimedAction:derive("TuningEngine")

function TuningEngine:isValid()
--	return self.vehicle:isInArea(self.part:getArea(), self.character)
	return true;
end

function TuningEngine:waitToStart()
	self.character:faceThisObject(self.vehicle)
	return self.character:shouldBeTurning()
end

function TuningEngine:update()
	self.character:faceThisObject(self.vehicle)
	self.item:setJobDelta(self:getJobDelta())

    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function TuningEngine:start()
	self.item:setJobType(getText("IGUI_TuningEngine"))
	self:setActionAnim("VehicleWorkOnMid")
end

function TuningEngine:stop()
	self.item:setJobDelta(0)
	ISBaseTimedAction.stop(self)
end

function TuningEngine:perform()
	ISBaseTimedAction.perform(self)
	self.item:setJobDelta(0)
	local VehicleName = tostring(self.part:getVehicle():getScript():getName())
	if PMRMTunningPartsDef and PMRMTunningPartsDef[VehicleName] then
		local TunningType = PMRMTunningPartsDef[VehicleName].item;
		local havetunning = self.character:getInventory():containsTypeRecurse(TunningType);
		if havetunning then
			local TunningItem = self.character:getInventory():getFirstTypeRecurse(TunningType);
			self.character:getInventory():Remove(TunningItem);
		end
	end

	local args = { vehicle = self.vehicle:getId(), part = self.part:getId() }
	sendClientCommand(self.character, "vehicle", "repairPart", args)

end

function TuningEngine:new(character, part, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.vehicle = part:getVehicle()
	o.part = part
	o.item = item
	o.maxTime = time
	o.jobType = getText("IGUI_TuningEngine")
	return o
end


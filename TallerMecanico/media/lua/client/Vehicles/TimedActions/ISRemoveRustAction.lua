--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRemoveRustAction = ISBaseTimedAction:derive("ISRemoveRustAction")

-----

local AREAS = {
	{ id = "Front", area = "Engine", done = false},
	{ id = "Rear", area = "TruckBed", done = false},
	{ id = "Left", area = "SeatFrontLeft", done = false},
	{ id = "Right", area = "SeatFrontRight", done = false}
}

function ISRemoveRustAction.chooseArea(character, vehicle)
	for _,area in ipairs(AREAS) do
		if vehicle:getScript():getAreaById(area.area) and area.done == false then
			return area
		end
	end
	return nil
end

function ISRemoveRustAction.resetAreas(character, vehicle)
	for _,area in ipairs(AREAS) do
		if area.done == true then
			area.done = false;
		end
	end
end

-----

function ISRemoveRustAction:isValid()
	return self.vehicle:isInArea(self.area, self.character) and self.vehicle:getRust() == 1;
end

function ISRemoveRustAction:waitToStart()
	self.character:faceThisObject(self.vehicle)
	return self.character:shouldBeTurning()
end

function ISRemoveRustAction:update()
	if self.vehicle:getRust() == 0 then
		self:forceComplete()
		return
	end

	self.character:faceThisObject(self.vehicle)
	self.character:setMetabolicTarget(Metabolics.HeavyDomestic)
end

function ISRemoveRustAction:start()
    if self.character:hasEquipped("BlowTorch") then
		if ZombRand(2) == 1 then
			self:setActionAnim("BlowTorch")
			self:setOverrideHandModels(self.character:getPrimaryHandItem(), nil)
			self.sound = self.character:getEmitter():playSound("BlowTorch")
			local radius = 20 * self.character:getWeldingSoundMod()
			addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
		else
			self:setActionAnim("VehicleWash")
			self:setOverrideHandModels(nil, nil)	
		end
	else
		self:setActionAnim("VehicleWash")
		self:setOverrideHandModels(nil, nil)		
	end
end

function ISRemoveRustAction:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
	self:resetAreas(self.character, self.vehicle)
	ISBaseTimedAction.stop(self)
end

function ISRemoveRustAction:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	local area = ISRemoveRustAction.chooseArea(self.character, self.vehicle)
	if area then
		-- Add in reverse order
		area.done = true;
		ISTimedActionQueue.addAfter(self, ISRemoveRustAction:new(self.character, self.vehicle, area.id, area.area))
		ISTimedActionQueue.addAfter(self, ISPathFindAction:pathToVehicleArea(self.character, self.vehicle, area.area))
	else
		local Blowtorch = self.character:getInventory():containsTypeRecurse("BlowTorch")
		local LGRMod = false
		if LGEPData then
			LGRMod = true;
		end
		local btdone = false;
		local aciddone = false;
		local metaldone = false;
		if Blowtorch then
			local itemObj = ISBlacksmithMenu.getBlowTorchWithMostUses(self.character:getInventory());
			local blowTorchUseLeft = itemObj:getDrainableUsesInt();
			if instanceof(itemObj, "DrainableComboItem") then
				if blowTorchUseLeft >= 10 then
					for i=1,10 do
						itemObj:Use();
					end
					btdone = true;
				end
			end
			if LGRMod then
				local AcidC = self.character:getInventory():containsTypeRecurse("AcidC");
				if AcidC then
					local itemObjB = PMRMISVehicleMenu.getAcidWithMostUses(self.character:getInventory());
					local AcidCUseLeft = itemObjB:getDrainableUsesInt();
					if instanceof(itemObjB, "DrainableComboItem") then
						if AcidCUseLeft >= 5 then
							for i=1,5 do
								itemObjB:Use();
							end
							aciddone = true;
						end
					end
				end
			else
				aciddone = true;
			end
			local metalSheet = self.character:getInventory():containsTypeRecurse("SheetMetal")
			local count = 0;
			if metalSheet then
				count = self.character:getInventory():getCountTypeRecurse("SheetMetal")
				if count >= 1 then
					local metalitem = self.character:getInventory():getItemFromType("SheetMetal");
					self.character:getInventory():Remove(metalitem)
					metaldone = true;
				end
			end
		end
		if btdone and aciddone and metaldone then
			sendClientCommand(self.character, "vehicle", "setRust", { vehicle = self.vehicle:getId(), rust = 0 })
			self.character:getXp():AddXP(Perks.Mechanics, 3);
			self.character:getXp():AddXP(Perks.MetalWelding, 6);
		end
		self:resetAreas(self.character, self.vehicle)
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISRemoveRustAction:new(character, vehicle, id, area)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.vehicle = vehicle
	o.id = id
	o.area = area
	o.maxTime = 200
	return o
end


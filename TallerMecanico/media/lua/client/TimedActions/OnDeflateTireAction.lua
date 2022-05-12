--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

OnDeflateTireAction = ISBaseTimedAction:derive("OnDeflateTireAction");

function OnDeflateTireAction:isValid()
	if TiresMenu.HaveATire(self.object) then
		return (self.item ~= nil and self.item:getItemCapacity() and self.item:getItemCapacity() > 0)
	end
	return false
	--return (self.item ~= nil and self.item:getItemCapacity() and self.item:getItemCapacity() > 0)
end

function OnDeflateTireAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function OnDeflateTireAction:update()
	self.item:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);
	if self.SoundTimer > 0 then
		self.SoundTimer = self.SoundTimer -1;
	end
	if self.SoundTimer <= 0 then
		self.SoundTimer = 25;
		self.character:playSound("DeflateTire")
	end
	self.DeflateTimer = self.DeflateTimer - 1;
	if self.DeflateTimer == 0 then
		self.item:setItemCapacity(self.item:getItemCapacity() - 1)
		self.DeflateTimer = 10;
	end
	if self.item:getItemCapacity() <= 0 then
		self.item:setItemCapacity(0);
		self:forceStop();
	end
end

function OnDeflateTireAction:start()

	self.item:setJobType(getText("IGUI_DeflateTire"))
	self:setAnimVariable("FoodType", "bottle");
	self:setActionAnim("fill_container_tap");
	self:setOverrideHandModels(nil, nil)
	self.DeflateTimer = 10;
	self.item:setJobDelta(0.0)
end

function OnDeflateTireAction:stop()
	self.item:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function OnDeflateTireAction:perform()
	self.item:setJobDelta(0.0);
	if self.item ~= nil then
		if self.item:getItemCapacity() > 0 then
			self.item:setItemCapacity(0);
		end
	end
	ISBaseTimedAction.perform(self);
end

function OnDeflateTireAction:getTireItem(obj)
	local Tire = nil;
	if obj:getContainer() and obj:getContainer():getContentsWeight() > 0 then
		local it = obj:getContainer():getItems();
		for i = 0, it:size()-1 do
			local Titem = it:get(i);
			if Titem:getType() == "OldTire1" or
			  Titem:getType() == "OldTire2" or 
			  Titem:getType() == "OldTire3" or
			  Titem:getType() == "NormalTire1" or
			  Titem:getType() == "NormalTire2" or
			  Titem:getType() == "NormalTire3" or
			  Titem:getType() == "ModernTire1" or
			  Titem:getType() == "ModernTire2" or
			  Titem:getType() == "ModernTire3" then
				Tire = Titem;
			end
		end
	end
	return Tire;
end

function OnDeflateTireAction:new(character, object)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.object = object;
	o.item = OnDeflateTireAction:getTireItem(object);
    o.square = object:getSquare();
	o.stopOnWalk = true;
	o.stopOnRun = true;
	-- o.psiStart = o.item:getItemCapacity();
	-- o.psiTarget = 0;
	-- o.maxTime = (o.item:getItemCapacity() - 0) * 50)
	o.maxTime = 250;
	if o.item:getItemCapacity() and o.item:getItemCapacity() > 0 then
		o.maxTime = o.item:getItemCapacity() * 50;
	end
	o.DeflateTimer = 0;
	o.SoundTimer = 0;
	return o;
end

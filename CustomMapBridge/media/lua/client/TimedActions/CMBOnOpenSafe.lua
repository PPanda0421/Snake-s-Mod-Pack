--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

CMBOnOpenSafe = ISBaseTimedAction:derive("CMBOnOpenSafe");

function CMBOnOpenSafe:isValid()
	if self.character:getInventory():haveThisKeyId(self.keyid) then
		return true
	end
	return false
end

function CMBOnOpenSafe:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function CMBOnOpenSafe:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())
end

function CMBOnOpenSafe:start()
	self:setActionAnim("Loot");
	self:setAnimVariable("LootPosition", "Low");
	self:setOverrideHandModels(nil, nil);
	self.character:getEmitter():playSound("WoodDoorUnlock");
end

function CMBOnOpenSafe:stop()
    ISBaseTimedAction.stop(self);
end

function CMBOnOpenSafe:perform()
	local data = self.object:getModData();
	if not data.opened or data.opened ~= "1" then
		data.opened = "1";
		if CMBSpecialLootDef and CMBSpecialLootDef[self.cmbtable] then
			if CMBSpecialLootDef[self.cmbtable].bag then
				local bag = self.character:getInventory():AddItem(CMBSpecialLootDef[self.cmbtable].bag)
				if CMBSpecialLootDef[self.cmbtable].items then
					for i=1, #CMBSpecialLootDef[self.cmbtable].items do
						bag:getItemContainer():AddItem(CMBSpecialLootDef[self.cmbtable].items[i])
					end
					self.character:playSound("CMBEasterEgg");
					local finaltext = getText("IGUI_CMBDiscoverEasterEgg");
					luautils.okRichModal(finaltext, true, 320, 500);
				end
			end
		end
		self.object:transmitModData();
	end
	
	ISBaseTimedAction.perform(self);
end

function CMBOnOpenSafe:new(character, object, cmbtable, keyid, maxTime)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.object = object;
	o.cmbtable = cmbtable;
	o.keyid = keyid;
    o.square = object:getSquare();
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = o.maxTime or 100;
	return o;
end

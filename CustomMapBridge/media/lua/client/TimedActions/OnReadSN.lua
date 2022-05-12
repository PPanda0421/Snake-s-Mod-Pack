--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

OnReadSN = ISBaseTimedAction:derive("OnReadSN");

function OnReadSN:isValid()
	return math.floor(self.object:getZ()) == math.floor(self.character:getZ());
end

function OnReadSN:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function OnReadSN:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())
end

function OnReadSN:start()
	self:setActionAnim("Loot");
	self:setAnimVariable("LootPosition", "");
	self:setOverrideHandModels(nil, nil);
end

function OnReadSN:stop()
    ISBaseTimedAction.stop(self);
end

function OnReadSN:perform()
	luautils.okRichModal(self.text, true, 400, 550);
	local data = self.object:getModData();
	if not data.readed or data.readed == "0" then
		if not self.knownrecipes:contains(self.recipename) then
			if self.recipename ~= "None" then
				self.knownrecipes:add(self.recipename);
			end
			if self.item ~= nil then
				self.character:getEmitter():playSound("PutItemInBag");
				local key = self.character:getInventory():AddItem(self.item);
				key:setKeyId(self.keyid);
			end
		end
		data.readed = "1";
		self.object:transmitModData();
	end
	
	ISBaseTimedAction.perform(self);
end

function OnReadSN:new(character, object, item, recipename, text, keyid, maxTime)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.object = object;
	o.item = item;
	o.recipename = recipename;
	o.text = text;
	o.keyid= keyid;
    o.square = object:getSquare();
	o.knownrecipes = character:getKnownRecipes();
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = o.maxTime or 100;
	return o;
end

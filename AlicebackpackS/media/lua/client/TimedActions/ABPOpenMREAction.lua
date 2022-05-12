require ("TimedActions/ISBaseTimedAction");

ABPOpenMREAction = ISBaseTimedAction:derive("ABPOpenMREAction");

function ABPOpenMREAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())));
end

function ABPOpenMREAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function ABPOpenMREAction:start()
	self:setActionAnim(CharacterActionAnims.Craft);
	if self.item:getStaticModel() then
		self:setOverrideHandModels(nil, self.item);
	end

    self.character:getEmitter():playSoundImpl("OpenMRE", nil)
    self.item:setJobType(getText("ContextMenu_OpenMRE"));
    self.item:setJobDelta(0.0);
end


function ABPOpenMREAction:stop()
	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function ABPOpenMREAction:perform()

    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);

    local player = getPlayer()
    local success = 50;
    -- La suerte afecta la poisibilidad de suceso.

	if player:HasTrait("Lucky") then
	    success = success + 25;
    elseif player:HasTrait("Unlucky") then
        success = success - 25;

    end

    local inv = self.character:getInventory();
    if ZombRand(0,100)<=success then
		local iRandom = ZombRand(0,100);
		if iRandom <=10 then
		    inv:AddItem("Base.CannedChili");
		elseif iRandom <=20 then
            inv:AddItem("Base.CannedCornedBeef");
		elseif iRandom <=30 then
            local rabbit = inv:AddItem("Base.Rabbitmeat");
			rabbit:setCooked(true);
		elseif iRandom <=40 then
            inv:AddItem("Base.BeefJerky");
		elseif iRandom <=50 then
            local pork = inv:AddItem("Base.PorkChop");
			pork:setCooked(true);
		elseif iRandom <=60 then
            local mutton = inv:AddItem("Base.MuttonChop");
			mutton:setCooked(true);
		elseif iRandom <=70 then
            local patty = inv:AddItem("Base.MeatPatty");
			patty:setCooked(true);
		elseif iRandom <=80 then
            local steak = inv:AddItem("Base.Steak");
			steak:setCooked(true);
		elseif iRandom <=90 then
            local chicken = inv:AddItem("Base.Chicken");
			chicken:setCooked(true);
		else
            inv:AddItem("Base.Ham");
		end
		inv:AddItems("Base.CookieJelly", ZombRand(1,6));
		inv:AddItems("Base.CookieChocolateChip", ZombRand(1,6));
	else
	    inv:AddItem("Base.Bread");
		inv:AddItems("Base.CookieJelly", ZombRand(1,6));
		inv:AddItems("Base.CookieChocolateChip", ZombRand(1,6));
    end

    self.prim = self.character:getPrimaryHandItem();
    self.mre = false;
    if self.prim ~= nil and self.prim:getType() == (self.item:getType()) then
        self.mre = true;
    end
	if self.mre then
        self.character:getPrimaryHandItem():Use();
        self.character:setPrimaryHandItem(nil);
	elseif not self.mre then
        self.character:getSecondaryHandItem():Use();
        self.character:setSecondaryHandItem(nil);
	end
end

function ABPOpenMREAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end
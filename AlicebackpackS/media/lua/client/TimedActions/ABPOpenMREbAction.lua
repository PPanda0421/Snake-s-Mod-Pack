require ("TimedActions/ISBaseTimedAction");

ABPOpenMREbAction = ISBaseTimedAction:derive("ABPOpenMREbAction");

function ABPOpenMREbAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())));
end

function ABPOpenMREbAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function ABPOpenMREbAction:start()
    self.character:getEmitter():playSoundImpl("OpenMREBox", nil)
    self.item:setJobType(getText("ContextMenu_OpenMREBox"));
    self.item:setJobDelta(0.0);
end


function ABPOpenMREbAction:stop()
	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function ABPOpenMREbAction:perform()

    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);

    local player = getPlayer()
	local nmin;
	local nmax;

    -- Opciones de SandboxVars.
    if SandboxVars.FoodLoot == 1 then -- very poor
        nmin = 1;
		nmax = 6;
	elseif SandboxVars.FoodLoot == 2 then -- poor
		nmin = 1;
		nmax = 7;
	elseif SandboxVars.FoodLoot == 3 then -- normal
		nmin = 4;
		nmax = 11;
	elseif SandboxVars.FoodLoot == 4 then -- abundant
		nmin = 5;
		nmax = 13;
	elseif SandboxVars.FoodLoot == 5 then -- very abundant
		nmin = 7;
		nmax = 13;
	end

	if player:HasTrait("Lucky") then
		nmin = nmin + ZombRand(1,3);
		nmax = nmax + ZombRand(1,3);
    elseif player:HasTrait("Unlucky") then
		nmin = nmin - ZombRand(1,3);
		nmax = nmax - ZombRand(1,3);
		if nmin <= 0 then
			nmin = 1;
		end
		if nmax >= nmin then
			nmax = nmin + 1;
		end
    end

	player:getInventory():AddItems("AliceBP.MRE", ZombRand(nmin,nmax));

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

function ABPOpenMREbAction:new(character, item, time)
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
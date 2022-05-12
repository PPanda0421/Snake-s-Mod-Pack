require ("TimedActions/ISBaseTimedAction");

SkillsMagReadAction = ISBaseTimedAction:derive("SkillsMagReadAction");

function SkillsMagReadAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())));
end

function SkillsMagReadAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function SkillsMagReadAction:start()
	self.character:playSound("pageflip")
    self.item:setJobType(getText("ContextMenu_Reading"));
    self.item:setJobDelta(0.0);

    self:setAnimVariable("ReadType", "book")
    self:setActionAnim(CharacterActionAnims.Read);
    self:setOverrideHandModels(nil, self.item);
    self.character:setReading(true)
--    self.character:getEmitter():playSoundImpl("FishingLureBrowse", nil);
end


function SkillsMagReadAction:stop()

	ISBaseTimedAction.stop(self);
	self.character:setReading(false);
	self.item:setJobDelta(0.0);
end

function SkillsMagReadAction:perform()
	self.character:setReading(false);
    self.item:setJobDelta(0.0);
	local perkobj = nil;

    self.prim = self.character:getPrimaryHandItem();
	self.sec = self.character:getSecondaryHandItem();
	
	-- Determinacion del perk de la revista segun el objeto clickeado
	if SkillMagsDefinitions[self.item:getType()] then
		perkobj = SkillMagsDefinitions[self.item:getType()].perk[ZombRand(1, # SkillMagsDefinitions[self.item:getType()].perk +1)];
		--self.character:Say(tostring(perkobj))
	end

    if perkobj ~= nil then
	    local perklvl = self.character:getPerkLevel(perkobj);
		
		-- calculos para los jugadores que tengan nivel 0 en el perk de la revista
		if perklvl == 0 then
			perklvl = perklvl +1;
		end

		-- Calculos para la variable segun los rasgos
		if self.character:HasTrait("FastLearner") then
			self.variable = self.variable * (perklvl) * 2;
		elseif self.character:HasTrait("SlowLearner") then
			self.variable = self.variable * (perklvl) / 2;
		else
			self.variable = self.variable * (perklvl);
		end
		
		-- calculos para que el nivel de exp ganado no quede por debajo de 0
		if self.variable <= 0 then
			self.variable = 0;
		end

		-- Dar xp solo para los players que no hayan llegado al maximo nivel del perk que otorga la revista.
		if perklvl < 10 then
			local oldXp = self.character:getXp():getXP(perkobj);
			self.character:getXp():AddXP(perkobj, self.variable);
			local xp = self.character:getXp():getXP(perkobj) - oldXp;
			self.character:setHaloNote(getText(tostring(PerkFactory.getPerk(perkobj):getName())).."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
			

--			luautils.okModal((getText("ContextMenu_SMExpgain") .. self.variable), true);
		else
			luautils.okModal(getText("ContextMenu_SMLevelMax"), true);
		end
	end

	-- Eliminacion del objeto del inventario y de la mano
	if self.prim ~= nil and self.prim:getType() == (self.item:getType()) then
        self.character:getPrimaryHandItem():Use();
        self.character:setPrimaryHandItem(nil);
	elseif self.sec ~= nil and self.sec:getType() == (self.item:getType()) then
        self.character:getSecondaryHandItem():Use();
        self.character:setSecondaryHandItem(nil);
	end
	
	ISBaseTimedAction.perform(self);
end

function SkillsMagReadAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	
	local numPages = 5
    if isClient() then
        o.minutesPerPage = getServerOptions():getFloat("MinutesPerPage") or 1.0
        if o.minutesPerPage < 0.0 then o.minutesPerPage = 1.0 end
    else
        o.minutesPerPage = 2.0
    end
    local f = 1 / getGameTime():getMinutesPerDay() / 2
    time = numPages * o.minutesPerPage / f
	-- calculos de tiempo segun el rasgo
    if(character:HasTrait("FastReader")) then
        time = time * 0.7;
    end
    if(character:HasTrait("SlowReader")) then
        time = time * 1.3;
    end

	o.maxTime = time;
	o.variable = ZombRand(3,11);
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end
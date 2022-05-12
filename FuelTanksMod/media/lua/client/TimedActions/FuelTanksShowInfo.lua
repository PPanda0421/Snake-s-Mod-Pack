--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

FuelTanksShowInfo = ISBaseTimedAction:derive("FuelTanksShowInfo");

function FuelTanksShowInfo:isValid()
	return self.fuelstation:getObjectIndex() ~= -1 and
		(self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == "FuelMeter")
end

function FuelTanksShowInfo:waitToStart()
	self.character:faceThisObject(self.fuelstation)
	return self.character:shouldBeTurning()
end

function FuelTanksShowInfo:update()
	self.character:faceThisObject(self.fuelstation)

    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function FuelTanksShowInfo:start()
	self:setActionAnim("Loot");
	self:setAnimVariable("LootPosition", "Low");
	self:setOverrideHandModels(nil, nil);
	--self:setActionAnim(CharacterActionAnims.Pour)
	--self:setOverrideHandModels(self.petrol, nil)
	--self.character:playSound("FuelTankFill");
end

function FuelTanksShowInfo:stop()
    ISBaseTimedAction.stop(self);
end

function FuelTanksShowInfo:perform()
	local posX;
	local posY;
	local width = 220;
	local height = 75;
	local amount = tonumber(self.fuelstation:getPipedFuelAmount());
	local FPROMod = self:IsActivatedMod("Fuel Pumps Run Out");
	local texto = self:getAmount(amount);
	if FPROMod then
		print("FPROMod")
		local square = self.fuelstation:getSquare();
		if square then
			print("SquareValid")
			local data = square:getModData();
			if not data.fuelAmount then
				data.fuelAmount = ZombRand(200) 
			    if ZombRand(0,2) == 0 then data.fuelAmount = 0 end
			else
				print("Tiene Fuel Amount")
				texto = self:getAmount(data.fuelAmount);
			end
		end
	end
	local image = " <H2>" .. getText("Tooltip_FAmount") .. "  " .. texto .. " / 20000";
	local core = getCore();
	posX = core:getScreenWidth() * 0.5 - width * 0.5;
	posY = core:getScreenHeight() * 0.5 - height * 0.5;
	local modal = ISModalRichText2:new(posX, posY, width, height, image, false, nil, nil, self.character:getPlayerNum(), nil, nil);
	modal:initialise();
	modal:addToUIManager();
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function FuelTanksShowInfo:getAmount(amount)
	local value = amount;
	local r = "1";
	local g = "1";
	local b = "1";
	if value >= 80 then
		r = "0.0"; --Si se encuentra entre 80 y 100, perfecto estado color Celeste
		g = "0.8";
		b = "0.8";
	elseif value < 80 and value >= 60 then
		r = "0.0"; --Si se encuentra entre 60 y 80, Buen estado color verde
		g = "0.8";
		b = "0.0";
	elseif value < 60 and value >= 40 then
		r = "0.4"; --Si se encuentra entre 40 y 60, Normal color verde claro
		g = "0.8";
		b = "0.0";
	elseif value < 40 and value >= 20 then
		r = "0.8"; --Si se encuentra entre 20 y 40, Un poco pasado color amarillo
		g = "0.8";
		b = "0.0";
	elseif value < 20 and value > 10 then
		r = "0.8"; --Si se encuentra entre 10 y 20, Muy pasado color naranja
		g = "0.4";
		b = "0.0";
	elseif value < 10 and value >= 0 then
		r = "1"; --Si se encuentra entre 1 y 10, Muy pasado color rojo
		g = "0.0";
		b = "0.0";
	else
	end
	local text = "<RGB:" .. r .. "," .. g .. "," .. b .. "> " .. tostring(value);
	return text;
end

function FuelTanksShowInfo:IsActivatedMod(mod_Name)
    local mods = getActivatedMods();
    for i=0, mods:size()-1, 1 do
        if mods:get(i) == mod_Name then
			print(mod_Name .. " Activo.")
            return true;
        end
    end
    return false;
end

function FuelTanksShowInfo:new(character, fuelstation, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.fuelstation = fuelstation;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	if o.character:isTimedActionInstant() then o.maxTime = 1; end
	return o;
end

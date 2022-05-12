WPAWeaponUpgrades = {}

WPAWeaponUpgrades.onKeyPressed = function(key)
    if key == getCore():getKey("Equip/Turn On/Off Light Source") then
		local Player = getSpecificPlayer(0);
        local Item = Player:getPrimaryHandItem();
        if (instanceof(Item, "HandWeapon") and Item:getCondition() > 0) then
			if Item:getType() == "Pistol" or Item:getType() == "Pistol2" or Item:getType() == "Pistol3" or Item:getType() == "Shotgun" or Item:getType() == "AssaultRifle" or Item:getType() == "AssaultRifle2" then
				if Item:getSling() ~= nil then
					local Sling = Item:getSling();
					if Sling:getType() == "TacticalLight" or Sling:getType() == "LaserLight" or Sling:getType() == "TacticalLight2" or Sling:getType() == "TacticalLaserLight2" or Sling:getType() == "M16LaserLight" or Sling:getType() == "M16TL" then
						if not Item:isActivated() then
							Player:getEmitter():playSoundImpl("WPA_TLonoff", nil)
							Item:setTorchCone(true);
							Item:setLightStrength(0.8);
							Item:setLightDistance(8);
							Item:setActivated(true);
						else
							Player:getEmitter():playSoundImpl("WPA_TLonoff", nil)
							Item:setTorchCone(true);
							Item:setLightStrength(0);
							Item:setLightDistance(0);
							Item:setActivated(false);
						end
					end
				else
				end
			end
		end
        if (instanceof(Item, "HandWeapon") and Item:getCondition() > 0) then
            if Item:getType() == "VarmintRifle" or Item:getType() == "HuntingRifle" then
				if Item:getScope() ~= nil then
					local Scope = Item:getScope();
					if Scope:getType() == "StealthTacticalScope2" then
						if not Item:isActivated() then
							Player:getEmitter():playSoundImpl("WPA_TLonoff", nil)
							Item:setTorchCone(true);
							Item:setLightStrength(1.5);
							Item:setLightDistance(12);
							Item:setActivated(true);
						else
							Player:getEmitter():playSoundImpl("WPA_TLonoff", nil)
							Item:setTorchCone(true);
							Item:setLightStrength(0);
							Item:setLightDistance(0);
							Item:setActivated(false);
						end
					end
				else
				end
            end
        end
    end
end

local function WPAinit()
	Events.OnKeyPressed.Add(WPAWeaponUpgrades.onKeyPressed);
end

Events.OnGameStart.Add(WPAinit);
AMWeaponUpgrades = {}

AMWeaponUpgrades.onKeyPressed = function(key)
    if key == getCore():getKey("Equip/Turn On/Off Light Source") then
		local Player = getSpecificPlayer(0);
        local Item = Player:getPrimaryHandItem();
        if (instanceof(Item, "HandWeapon") and Item:getCondition() > 0) then
			if Item:getType() == "AK47" then
				if Item:getSling() ~= nil then
					local Sling = Item:getSling();
					if Sling:getType() == "AKTacticalLight" then
						if not Item:isActivated() then
							Player:getEmitter():playSoundImpl("AMRTL", nil)
							Item:setTorchCone(true);
							Item:setLightStrength(0.8);
							Item:setLightDistance(20);
							Item:setActivated(true);
						else
							Player:getEmitter():playSoundImpl("AMRTL", nil)
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

local function AMRinit()
	Events.OnKeyPressed.Add(AMWeaponUpgrades.onKeyPressed);
end

Events.OnGameStart.Add(AMRinit);
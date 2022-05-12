require "Reloading/ISReloadableWeapon"
require "Reloading/ISShotgunWeapon"

-- Sawn-off recipe callback, copies modData to the new sawn-off.
function ShotgunSawnoff_OnCreate(items, result, player)
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getType() == "Shotgun" then
			result:setCurrentAmmoCount(item:getCurrentAmmoCount())
			if result:haveChamber() and item:haveChamber() and item:isRoundChambered() then
				result:setRoundChambered(true)
			end
			local modData = result:getModData()
			for k,v in pairs(item:getModData()) do
				modData[k] = v
			end
			local part = item:getScope();
			if part ~= nil then
				if part:getMountOn():contains(result:getFullType()) then
					result:attachWeaponPart(part)
				else
					player:getInventory():AddItem(part);
				end
			end
			part = item:getClip();
			if part ~= nil then
				if part:getMountOn():contains(result:getFullType()) then
					result:attachWeaponPart(part)
				else
					player:getInventory():AddItem(part);
				end
			end
			part = item:getSling();
			if part ~= nil then
				if part:getMountOn():contains(result:getFullType()) then
					result:attachWeaponPart(part)
				else
					player:getInventory():AddItem(part);
				end
			end
			part = item:getCanon();
			if part ~= nil then
				local silencer = SilencerDefinitions[part:getType()];
				if silencer then
					--nothing
					player:getInventory():AddItem(part);
					ISRemoveWeaponUpgrade:setSilencerDurability(item, part)
					
					--self.weapon:getWeaponPart(self.part:getPartType())
				else
					if part:getMountOn():contains(result:getFullType()) then
						result:attachWeaponPart(item:getCanon())
					else
						player:getInventory():AddItem(part);
					end
				end
			end
			part = item:getStock();
			if part ~= nil then
				if part:getMountOn():contains(result:getFullType()) then
					result:attachWeaponPart(part)
				else
					player:getInventory():AddItem(part);
				end
			end
			part = item:getRecoilpad();
			if part ~= nil then
				if part:getMountOn():contains(result:getFullType()) then
					result:attachWeaponPart(part)
				else
					player:getInventory():AddItem(part);
				end
			end
			return
		end
    end
end
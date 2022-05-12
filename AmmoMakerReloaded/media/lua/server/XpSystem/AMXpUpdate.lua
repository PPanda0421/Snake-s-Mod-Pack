require "XpSystem/XpUpdate";

-- when you gain a level you could win or lose perks
xpUpdate.amlevelPerk = function(owner, perk, level, addBuffer)
	if perk == Perks.AMReloading then
        if level == 5 then
			if owner:HasTrait("wrecicler") or owner:HasTrait("wrecicler2") then return end;
			if not owner:HasTrait("wrecicler") and not owner:HasTrait("wrecicler2") then
				if owner:HasTrait("wrecicler3") then
					owner:getTraits():remove("wrecicler3");
				else
					owner:getTraits():add("wrecicler");
				end
			end
        end
		if level == 8 then
			if owner:HasTrait("wrecicler") or owner:HasTrait("wrecicler2") then return end;
			if not owner:HasTrait("wrecicler") and not owner:HasTrait("wrecicler2") then
				owner:getTraits():add("wrecicler");
			end
		end
	end
	if perk == Perks.Reloading then
		if level == 4 then
			if owner:HasTrait("HardOfHearing") or owner:HasTrait("Deaf") then
				--nothing
			else
				if owner:HasTrait("ammocount") or owner:HasTrait("ammocount2") then
					-- nothing
				else
					owner:getTraits():add("ammocount");
				end
			end
		end
	end
end
Events.LevelPerk.Add(xpUpdate.amlevelPerk);


require "Definitions/CMBSpecialLootDef"
if CMBSpecialLootDef then
	local LGR = nil;
	if LeGourmet then
		LGR = true
	end
	if CMBSpecialLootDef["Magazines"] then
		if LGR ~= nil then
			for i=1, 10 do
				table.insert(CMBSpecialLootDef["Magazines"].items, "SkillMag.SkillMagHunting");
			end
		end
		table.insert(CMBSpecialLootDef["Magazines"].items, "SkillMag.SkillMagPackage");
		table.insert(CMBSpecialLootDef["Magazines"].items, "SkillMag.SkillMagPackage");
	end
end
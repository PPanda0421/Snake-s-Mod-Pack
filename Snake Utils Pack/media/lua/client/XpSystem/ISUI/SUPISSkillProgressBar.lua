-- require "ISUI/ISPanel"
-- require "XpSystem/ISUI/ISSkillProgressBar"

-- ISSkillProgressBar.UpSkill = getTexture("media/ui/UpSkill.png");
-- ISSkillProgressBar.Timer = 1;
-- ISSkillProgressBar.Activate = 0;
-- ISSkillProgressBar.ConfigOption = nil;
-- --ISSkillProgressBar.Hour = nil;

-- function ISSkillProgressBar:renderPerkRect()
	-- local x = 0;
	-- local y = 0;

	-- -- perks level up automatically, update the UI
	-- if self.level ~= self.char:getPerkLevel(self.perk:getType()) then
		-- self.level = self.char:getPerkLevel(self.perk:getType())
		-- self.xpForLvl = ISSkillProgressBar.getXpForLvl(self.perk, self.level)
		-- self.parent.lastLeveledUpPerk = self.perk
		-- self.parent.lastLevelUpTime = 1
	-- end
	
	-- -- how much xp we already aquire for this perk
	-- self.xp = ISSkillProgressBar.getPerkXp(self);

	-- if self.xp > self.xpForLvl then
		-- self.xp = self.xpForLvl;
	-- end

	-- -- we start to render our first rect : all the lvl we already got, we render them in a simple white rect
	-- -- ex : if we're lvl 3, we gonna render 2 (lvl 1 and 2) white rect
	-- for i=0,self.level - 1 do
-- --~ 		self:drawRect(x, y, 19, 19, 1.0, 1.0, 1.0, 1.0);
		-- if (ISSkillProgressBar.ConfigOption ~= nil and ISSkillProgressBar.ConfigOption) or sup_settings.cursor_settings.customskillwindow then
			-- if self.parent.lastLeveledUpPerk == self.perk and i == (self.level - 1) then
				-- ISSkillProgressBar.Activate = 1;
				-- --self:drawTexture(self.UnlockedSkill, x, y, 1,0,1,0);
				-- if ISSkillProgressBar.Timer == 1 then
					-- self:drawTexture(self.UnlockedSkill, x, y, 1,1,1,1);
					-- if ISCharacterInfo.animOffset == -1 or ISCharacterInfo.animOffset == 15 then
						-- self:drawTexture(ISSkillProgressBar.UpSkill, x, y, 1, 1, 1, 1);
					-- end
				-- else
					-- self:drawTexture(self.UnlockedSkill, x, y, 1,1,1,1);
				-- end
			-- else
				-- if self.parent.lastLeveledUpPerk == self.perk then
					-- --this fades over time to return to the original colour
					-- self:drawTexture(self.UnlockedSkill, x, y, 1,1-self.parent.lastLevelUpTime,1,1-self.parent.lastLevelUpTime);
				-- else
					-- self:drawTexture(self.UnlockedSkill, x, y, 1,1,1,1);
				-- end
			-- end
			-- x = x + 20;
		-- else
			-- if self.parent.lastLeveledUpPerk == self.perk then
				-- --this fades over time to return to the original colour
				-- self:drawTexture(self.UnlockedSkill, x, y, 1,1-self.parent.lastLevelUpTime,1,1-self.parent.lastLevelUpTime);
			-- else
				-- self:drawTexture(self.UnlockedSkill, x, y, 1,1,1,1);
			-- end
			-- x = x + 20;
		-- end
	-- end
	-- -- the most important square : the one in progress !
	-- -- for this one we got multiple choice :
	-- -- * In progress : light grey rect filled with light grey depending on the progress
	-- -- * In faster progress : if you read a book 'bout this skill or if a npc trained you, it's a light blue/filled with light blue too
	-- -- * Finished but no skills pts available : a white rect full filled with light grey
	-- -- * Finished and ready to take : a white rect that glow filled with light grey
	-- if self.level < 10 then
		-- -- we gonna fill with light grey our rect, depending on the progress of our lvl (50% xp mean a rect filled at 50%)
		-- -- this width correspond to 1% xp progress
		-- local sliceWidth = 18 / 100;
		-- -- our progress into the current lvl in %
		-- local percentProgress = (self.xp / self.xpForLvl) * 100;
		-- if percentProgress < 0 then percentProgress = 0 end
		-- -- we now draw our rect with the correct width
		-- -- our border, a bit darker than the filled rect or if the skill is rdy to unlock it's a white border
		-- if percentProgress == 100 then
			-- if self.perk:isPassiv() then
				-- self:drawTexture(self.UnlockedSkill, x, y, 1,1,1,1);
			-- else -- the skill is ready to be trained but no skill pts available, we set up just a white border
					-- self:drawTexture(self.ProgressSkill, x, y, 1,1,1,1);
				-- self:drawTexture(self.SkillBtnEmptWhitey, x, y, 1,1,1,1);
			-- end
		-- else -- skill is in progress, we set up a grey rect and fill it depending on the skill progress
			-- self:drawTexture(self.SkillBtnEmpty, x, y, 1,1,1,1);
			-- self:drawTextureScaled(self.ProgressSkill, x, y, sliceWidth * percentProgress, 18, 1,1,1,1);
		-- end
		-- x = x + 20;
	-- end

	-- -- our last square : the no available ones, this is just an empty dark grey rect
	-- for i=self.level + 1, 9 do
-- --~ 		self:drawRect(x, y, 19, 19, 0.5, 0.41, 0.41, 0.41);
		-- self:drawTexture(self.SkillBtnEmpty, x, y, 1,1,1,1);
		-- x = x + 20;
	-- end
-- end

-- function ISSkillProgressBar:EveryHours()
	-- --ISSkillProgressBar.Hour == nil then return end;
	-- --local actualhour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600);
	-- --if ISSkillProgressBar.Hour ~= nil and actualhour >= ISSkillProgressBar.Hour then
		-- if ISSkillProgressBar.Activate == 1 and ISSkillProgressBar.Timer == 1 then
			-- ISSkillProgressBar.Timer = 0;
			-- ISSkillProgressBar.Activate = 0;
		-- end
	-- --end
-- end
-- local function EveryHours()
	-- ISSkillProgressBar.EveryHours()
-- end

-- Events.EveryHours.Add(EveryHours)
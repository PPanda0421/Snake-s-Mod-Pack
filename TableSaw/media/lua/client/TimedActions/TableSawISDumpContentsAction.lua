--***********************************************************
--**                    Erasmus Crowley                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISDumpContentsAction"

function ISDumpContentsAction:perform()
    if self.item ~= nil then
        self.item:getContainer():setDrawDirty(true);
        self.item:setJobDelta(0.0);
		if instanceof(self.item, "DrainableComboItem") then
			while self.item and self.item:getUsedDelta() > 0 do
				self.item:Use();
			end
		else
			local itemType = self:finalItem(self.item:getFullType())
			if itemType then
				self.item:setReplaceOnUse(itemType)
			end
			self.item:Use();
		end
    end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

require "Util/LuaList"

AMGuideEntries = {}

AMGuideEntries.list = LuaList:new();

AMGuideEntries.addSurvivalGuideEntry = function (title, text, moreInfo, openConditionMethod, completeConditionMethod, moreInfoText)
    local entry = {title = title, text = text, moreInfo = moreInfo};

    AMGuideEntries.list:add(entry);
end

AMGuideEntries.getEntry = function(num)
    return AMGuideEntries.list:get(num);
end

AMGuideEntries.getEntryCount = function()
    return AMGuideEntries.list:size();
end

AMGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_amentrie1title"), getText("SurvivalGuide_amentrie1txt"), getText("SurvivalGuide_amentrie1moreinfo"));
AMGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_amentrie2title"), getText("SurvivalGuide_amentrie2txt"), getText("SurvivalGuide_amentrie2moreinfo"));
AMGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_amentrie3title"), getText("SurvivalGuide_amentrie3txt"), getText("SurvivalGuide_amentrie3moreinfo"));
AMGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_amentrie4title"), getText("SurvivalGuide_amentrie4txt"), getText("SurvivalGuide_amentrie4moreinfo"));
AMGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_amentrie5title"), getText("SurvivalGuide_amentrie5txt"), getText("SurvivalGuide_amentrie5moreinfo"));
AMGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_amentrie6title"), getText("SurvivalGuide_amentrie6txt"), getText("SurvivalGuide_amentrie6moreinfo"));
AMGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_amentrie7title"), getText("SurvivalGuide_amentrie7txt"), getText("SurvivalGuide_amentrie7moreinfo"));
AMGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_amentrie8title"), getText("SurvivalGuide_amentrie8txt"), getText("SurvivalGuide_amentrie8moreinfo"));
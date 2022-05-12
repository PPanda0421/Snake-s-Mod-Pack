local distributionTable = VehicleDistributions[1]
if VehicleDistributions then
	VehicleDistributions.VanSnakeneta = {
		TruckBed =
		{
			rolls = 4,
			items = {
				"BatteryCleaner", 10,
				"BatteryCleaner", 10,
				"GlassGlue", 10,
				"GlassGlue", 10,
				"GlassGlue", 10,
				"BigGlassPanel", 10,
				"BigGlassPanel", 10,
				"BigGlassPanel", 10,
				"SmallGlassPanel", 10,
				"SmallGlassPanel", 10,
				"SmallGlassPanel", 10,
				"SmallGlassPanel", 10,
				"TireGlue", 10,
				"TireGlue", 10,
			},
			junk = {
				rolls = 1,
				items = {
					"BatteryCleaner", 15,
					"BatteryCleaner", 5,
					"GlassGlue", 15,
					"GlassGlue", 5,
					"GlassGlue", 5,
					"BigGlassPanel", 15,
					"BigGlassPanel", 5,
					"BigGlassPanel", 5,
					"SmallGlassPanel", 15,
					"SmallGlassPanel", 5,
					"SmallGlassPanel", 5,
					"SmallGlassPanel", 5,
					"TireGlue", 15,
					"TireGlue", 15,
				}
			}
		},
		GloveBox = {
			rolls = 4,
			items = {
				"AlcoholWipes", 8,
				"Bandage", 4,
				"Bandaid", 1,
				"Battery", 2,
				"BluePen", 1,
				"Disc_Retail", 2,
				"Eraser", 6,
				"HandTorch", 4,
				"Magazine", 5,
				"Notebook", 5,
				"Paperclip", 4,
				"Pen", 1,
				"Pencil", 5,
				"Radio.WalkieTalkie4", 5,
				"RedPen", 1,
				"RubberBand", 6,
				"Tissue", 5,
				"GlassMag1", 4,
				"GlassCutter", 5,
				"TireGlue", 10,
				"GlassGlue", 10,
			},
			junk = {
				rolls = 1,
				items = {
					"FirstAidKit", 5,
					"Glasses_Aviators", 0.5,
					"Gloves_LeatherGlovesBlack", 0.5,
					"HandTorch", 4,
					"HuntingKnife", 0.1,
					"Lighter", 4,
					"Matches", 8,
					"Scotchtape", 8,
					"ToiletPaper", 4,
					"Twine", 5,
					"GlassMag1", 4,
					"GlassCutter", 5,
					"TireGlue", 30,
					"GlassGlue", 30,
				}
			}
		},
	}
end

pmrmcustomdist = {
	-- Snakeneta
    VanSnakeneta = { 
		Normal = VehicleDistributions.VanSnakeneta; 
	},
};

distributionTable["VanSnakeneta"] = pmrmcustomdist["VanSnakeneta"]
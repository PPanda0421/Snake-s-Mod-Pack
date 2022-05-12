require 'Items/SuburbsDistributions'
require 'Items/Distributions'

MCCustomLoot = {
    all = {
		labfridge = {
            rolls = 1,
            items = {
                "PillsVitamins", 20,
				"PillsVitamins", 20,
				"PillsVitamins", 20,
                "Antibiotics", 5,
                "Bandage", 20,
                "Bandage", 20,
                "Bandaid", 20,
                "Bandaid", 20,
                "FirstAidKit", 2,
                "Tweezers", 10,
                "Disinfectant", 20,
                "AlcoholWipes", 20,
                "SutureNeedle", 10,
            },
        },

		incubator = {
            rolls = 1,
            items = {
                "PillsVitamins", 20,
				"PillsVitamins", 20,
				"PillsVitamins", 20,
                "Antibiotics", 5,
                "Bandage", 20,
                "Bandage", 20,
                "Bandaid", 20,
                "Bandaid", 20,
                "FirstAidKit", 2,
                "Tweezers", 10,
                "Disinfectant", 20,
                "AlcoholWipes", 20,
                "SutureNeedle", 10,
            },
        },

		extinguishers_shelves = {
            rolls = 1,
            items = {
                "Extinguisher",10,
            },
        },

        military_crate = {
            rolls = 3,
            items = {
                "Radio.WalkieTalkie1",0.05,
                "Radio.WalkieTalkie2",0.03,
                "Radio.WalkieTalkie3",0.01,
                "Radio.WalkieTalkie4",5,
                "Radio.WalkieTalkie5",1,
				"Radio.HamRadio1",5,
                "Radio.HamRadio2",1,
				"Radio.ElectricWire", 5,
                "Radio.RadioMag1", 0.2,
                "Radio.RadioMag2", 0.1,
                "Radio.RadioMag3", 0.05,
				"Bag_NormalHikingBag", 1,
				"HuntingKnife", 3,
				"Bandage", 5,
				"Bandage", 5,
				"Bandage", 5,
				"FirstAidKit", 3,
				"PillsVitamins", 1,
				"PillsAntiDep", 1,
                "x2Scope", 1,
                "x4Scope", 0.5,
                "x8Scope", 0.2,
                "Base.AmmoStrap_Bullets", 1,
                "Base.AmmoStrap_Shells", 1,
                "Sling", 2,
                "FiberglassStock", 1,
                "RecoilPad",  2,
                "GunPowder", 4,
                "GunPowder", 2,
                "GunPowder", 1,
				"Axe", 1,
				"Nails", 20,
				"Sheet", 4,
				"BarbedWire", 10,
				"Sandbag", 5,
                "Gravelbag", 5,
                "EmptySandbag", 5,
				"Bullets9mm", 2.5,
				"Bullets9mm", 1,
				"223Bullets", 1,
                "308Bullets", 1,
            },
        },
        simple_military_crate = {
            rolls = 3,
            items = {
                "Radio.WalkieTalkie1",0.05,
                "Radio.WalkieTalkie2",0.03,
                "Radio.WalkieTalkie3",0.01,
                "Radio.WalkieTalkie4",5,
                "Radio.WalkieTalkie5",1,
				"Radio.HamRadio1",5,
                "Radio.HamRadio2",1,
				"Radio.ElectricWire", 5,
                "Radio.RadioMag1", 0.2,
                "Radio.RadioMag2", 0.1,
                "Radio.RadioMag3", 0.05,
				"Bag_NormalHikingBag", 1,
				"HuntingKnife", 3,
				"Bandage", 5,
				"Bandage", 5,
				"Bandage", 5,
				"FirstAidKit", 3,
				"PillsVitamins", 1,
				"PillsAntiDep", 1,
                "x2Scope", 1,
                "x4Scope", 0.5,
                "x8Scope", 0.2,
                "Base.AmmoStrap_Bullets", 1,
                "Base.AmmoStrap_Shells", 1,
                "Sling", 2,
                "FiberglassStock", 1,
                "RecoilPad",  2,
                "GunPowder", 4,
                "GunPowder", 2,
                "GunPowder", 1,
				"Axe", 1,
				"Nails", 20,
				"Sheet", 4,
				"BarbedWire", 10,
				"Sandbag", 5,
                "Gravelbag", 5,
                "EmptySandbag", 5,
				"Bullets9mm", 2.5,
				"Bullets9mm", 1,
				"223Bullets", 1,
                "308Bullets", 1,
            },
        },
        army_locker = {
            rolls = 2,
            items = {
				"Tshirt_DefaultTEXTURE_TINT", 3,
				"Jumper_RoundNeck", 1,
				"TrousersMesh_DenimLight", 1,
				"Trousers_DefaultTEXTURE_TINT", 2,
				"Vest_DefaultTEXTURE_TINT", 1,
				"Skirt_Knees", 0.3,
				"Skirt_Long", 0.3,
				"Skirt_Normal", 0.3,
				"Cigarettes", 1,
				"Book", 3,
				"Tshirt_Sport", 2,
				"Bag_DuffelBagTINT", 0.8,
				"Bag_NormalHikingBag", 0.8,
				"Bag_BigHikingBag", 0.5,
				"Suit_Jacket", 0.5,
				"Jacket_WhiteTINT", 0.6,
				"Jacket_Black", 0.6,
				"Shoes_ArmyBoots", 0.2,
				"Shoes_ArmyBootsDesert", 0.2,
				"Trousers_CamoDesert", 0.2,
				"Trousers_CamoGreen", 0.2,
				"Trousers_CamoUrban", 0.2,
				"Shorts_CamoGreenLong", 0.2,
				"Hat_Army", 0.2,
				"Jacket_ArmyCamoDesert", 0.2,
				"Jacket_ArmyCamoGreen", 0.2,
				"Shirt_CamoDesert", 0.2,
				"Shirt_CamoGreen", 0.2,
				"Shirt_CamoUrban", 0.2,
				"Tshirt_ArmyGreen", 0.2,
				"Tshirt_CamoDesert", 0.2,
				"Tshirt_CamoGreen", 0.2,
				"Tshirt_CamoUrban", 0.2,
				"Vest_BulletArmy", 0.05,
		    },
        },
		ammo_crate={
			rolls = 3,
			items = {
				"x2Scope", 3,
				"x4Scope", 2,
				"x8Scope", 1,
                "Base.AmmoStrap_Bullets", 3,
                "Base.AmmoStrap_Shells", 3,
				"Sling", 4,
				"FiberglassStock", 3,
				"RecoilPad",  4,
				"HuntingRifle", 3,
				"VarmintRifle", 3,
				"Shotgun", 3,
				"DoubleBarrelShotgun", 2,
				"ShotgunShellsBox", 10,
				"ShotgunShellsBox", 10,
				"Pistol", 1.5,
				"Pistol2", 1.5,
				"Pistol3", 0.5,
				"Revolver_Short", 1.5,
				"Revolver", 1,
				"Revolver_Long", 0.5,
				"Bullets9mmBox", 10,
				"Bullets9mmBox", 10,
				"GunPowder", 10,
				"GunPowder", 10,
				"223Box", 10,
				"308Box", 10,
				"223Box", 10,
				"308Box", 10,
				"Bullets38Box", 10,
				"Bullets44Box", 10,
				"Bullets45Box", 10,
				"Radio.WalkieTalkie4",5,
				"Radio.WalkieTalkie5",3,
				"Radio.HamRadio1",5,
				"Radio.HamRadio2",3,
				"45Clip", 0.2,
				"45Clip", 0.2,
				"44Clip", 0.2,
				"44Clip", 0.2,
				"9mmClip", 0.2,
				"9mmClip", 0.2,
			},

			dontSpawnAmmo = true,
		},
	},
};

table.insert(SuburbsDistributions,MilitaryGeneralRoom);
SuburbsDistributions["MilitaryGeneralRoom"] = {
	shelves = {
        rolls = 3,
        items = {
			"Magazine", 20,
			"Newspaper", 20,
			"Book", 20,
			"SheetPaper2", 20,
			"Notebook", 20,
			"BookCarpentry1", 2,
			"BookCarpentry2", 1,
			"BookCarpentry3", 0.7,
			"BookCarpentry4", 0.5,
			"BookCarpentry5", 0.3,
			"BookForaging1", 2,
			"BookForaging2", 1,
			"BookForaging3", 0.7,
			"BookForaging4", 0.5,
			"BookForaging5", 0.3,
			"BookTrapping1", 2,
			"BookTrapping2", 1,
			"BookTrapping3", 0.7,
			"BookTrapping4", 0.5,
			"BookTrapping5", 0.3,
			"BookFirstAid1", 2,
			"BookFirstAid2", 1,
			"BookFirstAid3", 0.7,
			"BookFirstAid4", 0.5,
			"BookFirstAid5", 0.3,
			"BookMetalWelding1", 2,
            "BookMetalWelding2", 1,
            "BookMetalWelding3", 0.7,
            "BookMetalWelding4", 0.5,
            "BookMetalWelding5", 0.3,
            "BookElectrician1", 2,
            "BookElectrician2", 1,
            "BookElectrician3", 0.7,
            "BookElectrician4", 0.5,
            "BookElectrician5", 0.3,
            "BookMechanic1", 2,
            "BookMechanic2", 1,
            "BookMechanic3", 0.7,
            "BookMechanic4", 0.5,
            "BookMechanic5", 0.3,
            "FishingMag1", 1,
            "FishingMag2", 1,
            "HuntingMag1", 1,
            "HuntingMag2", 1,
            "HuntingMag3", 1,
            "EngineerMagazine1", 1,
            "EngineerMagazine2", 1,
            "MetalworkMag1", 1,
            "MetalworkMag2", 1,
            "MetalworkMag3", 1,
            "MetalworkMag4", 1,
            "Journal", 2,
            "Radio.RadioBlack",2,
            "Radio.RadioRed",1,
        },
    },
    medicine = {
        rolls = 3,
        items = {
            "Bandaid", 7,
            "Pills", 7,
            "PillsBeta", 7,
            "PillsAntiDep", 7,
            "PillsSleepingTablets", 7,
            "PillsVitamins", 7,
            "Tweezers", 5,
            "Antibiotics", 5,
        },
    },
	desk = {
		rolls = 3,
		items = {
			"PillsVitamins", 1,
			"Magazine", 10,
			"Newspaper", 20,
			"Book", 5,
			"ComicBook", 1,
			"Cigarettes", 1,
			"Radio.RadioBlack",2,
			"Radio.RadioRed",1,
			"Radio.WalkieTalkie1",0.01,
			"Radio.WalkieTalkie2",0.03,
			"Radio.WalkieTalkie3",0.05,
			"Pistol", 5,
			"Pistol2", 2,
			"Pistol3", 1,
			"Bullets38Box", 1,
			"Bullets44Box", 1,
			"Bullets45Box", 1,
			"Bullets38Box", 1,
			"Bullets44Box", 1,
			"Bullets45Box", 1,
			"45Clip", 0.5,
			"45Clip", 0.5,
			"44Clip", 0.5,
			"44Clip", 0.5,
			"9mmClip", 1,
			"9mmClip", 1,
			"Glasses_Shooting", 2,
			"Glasses_Aviators", 5,
		}
	},
	wardrobe ={
		rolls = 1,
		items = {
			"Jacket_CoatArmy", 30,
			"Jacket_ArmyCamoGreen", 20,
			"Tshirt_DefaultTEXTURE_TINT", 3,
			"Jumper_RoundNeck", 1,
			"TrousersMesh_DenimLight", 1,
			"Trousers_DefaultTEXTURE_TINT", 2,
			"Vest_DefaultTEXTURE_TINT", 1,
			"Skirt_Knees", 0.3,
			"Skirt_Long", 0.3,
			"Skirt_Normal", 0.3,
			"Cigarettes", 1,
			"Book", 3,
			"Tshirt_Sport", 2,
			"Bag_DuffelBagTINT", 0.8,
			"Bag_NormalHikingBag", 0.8,
			"Bag_BigHikingBag", 0.5,
			"Suit_Jacket", 0.5,
			"Jacket_WhiteTINT", 0.6,
			"Jacket_Black", 0.6,
			"Shoes_ArmyBoots", 0.2,
			"Shoes_ArmyBootsDesert", 0.2,
			"Trousers_CamoDesert", 0.2,
			"Trousers_CamoGreen", 0.2,
			"Trousers_CamoUrban", 0.2,
			"Shorts_CamoGreenLong", 0.2,
			"Hat_Army", 0.2,
			"Jacket_ArmyCamoDesert", 0.2,
			"Jacket_ArmyCamoGreen", 0.2,
			"Shirt_CamoDesert", 0.2,
			"Shirt_CamoGreen", 0.2,
			"Shirt_CamoUrban", 0.2,
			"Tshirt_ArmyGreen", 0.2,
			"Tshirt_CamoDesert", 0.2,
			"Tshirt_CamoGreen", 0.2,
			"Tshirt_CamoUrban", 0.2,
			"Vest_BulletArmy", 0.05,
			"Hat_Beret", 5,
			"Hat_BeretArmy", 2,
			"Hat_GasMask", 1,
			"Hat_NBCmask", 10,
			"Hat_PeakedCapArmy", 50,
			"Trousers_NavyBlue", 30,
			"Trousers_ArmyService", 50,
		}
	},
	bin ={
        rolls = 5,
        items = {
			"Socks_Ankle", 4,
            "Tissue", 2,
            "Lighter", 2,
            "Battery", 2,
            "Pen", 3,
            "BluePen", 1,
            "RedPen", 1,
            "Pencil", 3,
            "Eraser", 2,
            "Magazine", 2,
            "Newspaper", 2,
            "Paperclip", 1,
            "Doll", 1,
            "Lollipop", 3,
            "MintCandy", 3,
            "Cigarettes", 3,
            "SheetPaper2", 3,
            "WaterBottleEmpty", 3,
            "Garbagebag", 12,
            "Garbagebag", 12,
            "Garbagebag", 12,
        }
    },
	security_box ={
        rolls = 1,
        items = {}
    },
    other ={
        rolls = 5,
        items = {
            "Magazine", 2,
            "Newspaper", 2,
            "Paperclip", 1,
        }
    },
};
table.insert(SuburbsDistributions,mcmechanic);
SuburbsDistributions["mcmechanic"] = {
	metal_shelves = {
        rolls = 3,
        items = {
			"Hammer", 4,
			"Wire", 2,
			"Saw", 4,
			"GardenSaw", 4,
			"NailsBox", 2,
			"PaperclipBox", 1,
			"NailsBox", 2,
			"NailsBox", 2,
			"Nails", 4,
			"Screwdriver", 4,
			"Toolbox", 2,
			"Radio.ElectricWire", 2,
			"Sheet", 4,
			"Sheet", 4,
			"BarbedWire", 3,
			"PetrolCan", 1,
			"EmptyPetrolCan", 3,
			"Radio.RadioBlack",2,
			"Radio.RadioRed",1,
			"Radio.WalkieTalkie1",0.05,
			"Radio.WalkieTalkie2",0.03,
			"Radio.WalkieTalkie3",0.01,
			"Radio.HamRadio1",0.05,
			"MechanicMag1", 0.3,
			"MechanicMag2", 0.3,
			"MechanicMag3", 0.3,
			"BookMechanic1",0.5,
			"BookMechanic2",0.4,
			"BookMechanic3",0.3,
			"BookMechanic4",0.2,
			"BookMechanic5",0.1,
			"MetalworkMag1", 0.2,
			"MetalworkMag2", 0.2,
			"MetalworkMag3", 0.2,
			"MetalworkMag4", 0.2,
			"Wrench", 1,
			"LeadPipe", 1,
			"PipeWrench", 1,
			"LugWrench",0.8,
			"Jack", 0.5,
			"TirePump", 0.5,
			"NormalBrake1", 1.2,
			"ModernBrake1", 1.1,
			"NormalBrake2", 1.2,
			"ModernBrake2", 1.1,
			"NormalBrake3", 1.2,
			"ModernBrake3", 1.1,
			"NormalSuspension1", 1.2,
			"ModernSuspension1", 1.1,
			"NormalSuspension2", 1.2,
			"ModernSuspension2", 1.1,
			"NormalSuspension3", 1.2,
			"ModernSuspension3", 1.1,
			"SmallGasTank1", 1.3,
			"NormalGasTank1", 1.2,
			"BigGasTank1", 1.1,
			"SmallGasTank2", 1.3,
			"NormalGasTank2", 1.2,
			"BigGasTank2", 1.1,
			"SmallGasTank3", 1.3,
			"NormalGasTank3", 1.2,
			"BigGasTank3", 1.1,
			"CarBatteryCharger", 2,
			"CarBattery1", 1.5,
			"CarBattery2", 1.5,
			"CarBattery3", 1.5,
			"FrontCarDoor1", 1.2,
			"RearCarDoor1", 1.2,
			"FrontCarDoor2", 1.2,
			"RearCarDoor2", 1.2,
			"FrontCarDoor3", 1.2,
			"RearCarDoor3", 1.2,
			"NormalCarSeat1", 1.3,
			"BigCarSeat1", 1.2,
			"SportCarSeat1", 1.1,
			"NormalCarSeat2", 1.3,
			"BigCarSeat2", 1.2,
			"SportCarSeat2", 1.1,
			"NormalCarSeat3", 1.3,
			"BigCarSeat3", 1.2,
			"SportCarSeat3", 1.1,
			"Wrench", 1,
			"LeadPipe", 1,
			"PipeWrench", 1,
			"LugWrench",0.7,
			"Jack", 0.5,
			"TirePump", 0.5,
        }
    },
};

table.insert(SuburbsDistributions,vigtower);
SuburbsDistributions["vigtower"] = {
	metal_shelves = {
        rolls = 3,
        items = {
            "223Box", 10,
            "308Box", 10,
            "223Box", 10,
            "308Box", 10,
			"HuntingRifle", 2,
            "VarmintRifle", 2,
            "x4Scope", 2,
            "x8Scope", 1,
        },
    },
	simple_military_crate = {
        rolls = 3,
        items = {
            "223Box", 10,
            "308Box", 10,
            "223Box", 10,
            "308Box", 10,
			"HuntingRifle", 2,
            "VarmintRifle", 2,
			"Ghillie_Top", 5,
			"Ghillie_Trousers", 5,
			"Shoes_ArmyBoots", 6,
            "x4Scope", 2,
            "x8Scope", 1,
			"Glasses_Shooting", 2,
        },
	},
};

table.insert(SuburbsDistributions,ammostorage);
SuburbsDistributions["ammostorage"] = {
	extinguishers_shelves = {
        rolls = 1,
        items = {
           "Extinguisher",10,
        },
    },
    crate ={
        rolls = 5,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
        }
    },
    locker ={
        rolls = 5,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
        }
    },
    metal_shelves ={
        rolls = 3,
        items = {}
    },
    military_crate ={
        rolls = 7,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
        }
    },
    military_shelves ={
        rolls = 5,
        items = {
            "Base.HuntingRifle", 3,
            "Base.VarmintRifle", 3,
            "Base.Pistol", 3,
            "Base.Pistol2", 1.5,
            "Base.Pistol3", 0.5,
            "Base.Revolver_Short", 1.5,
            "Base.Revolver", 1,
            "Base.Revolver_Long", 0.5,
        }
    },
	army_locker ={
        rolls = 5,
        items = {
				"Bag_DuffelBagTINT", 2,
				"Bag_NormalHikingBag", 2,
				"Bag_BigHikingBag", 2,
				"Shoes_ArmyBoots", 0.5,
				"Shoes_ArmyBootsDesert", 0.5,
				"Trousers_CamoDesert", 0.5,
				"Trousers_CamoGreen", 0.5,
				"Trousers_CamoUrban", 0.5,
				"Shorts_CamoGreenLong", 0.5,
				"Hat_Army", 0.5,
				"Jacket_ArmyCamoDesert", 0.5,
				"Jacket_ArmyCamoGreen", 0.5,
				"Shirt_CamoDesert", 0.5,
				"Shirt_CamoGreen", 0.5,
				"Shirt_CamoUrban", 0.5,
				"Tshirt_ArmyGreen", 0.5,
				"Tshirt_CamoDesert", 0.5,
				"Tshirt_CamoGreen", 0.5,
				"Tshirt_CamoUrban", 0.5,
				"Vest_BulletArmy", 0.05,
				"Hat_Beret", 5,
				"Hat_BeretArmy", 2,
				"Hat_GasMask", 1,
				"Hat_NBCmask", 1,
        }
    },
};
table.insert(SuburbsDistributions,ammostorage2);
SuburbsDistributions["ammostorage2"] = {
	extinguishers_shelves = {
        rolls = 1,
        items = {
           "Extinguisher",10,
        },
    },
    crate ={
        rolls = 5,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
        }
    },
    metal_shelves ={
        rolls = 5,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
        }
    },
    military_crate ={
        rolls = 7,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
        }
    },
    locker ={
        rolls = 5,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
        }
    },
    military_shelves ={
        rolls = 5,
        items = {
            "Base.HuntingRifle", 4,
            "Base.VarmintRifle", 5,
            "Base.Pistol", 10,
            "Base.Pistol2", 1.5,
            "Base.Pistol3", 0.5,
            "Base.Revolver_Short", 1.5,
            "Base.Revolver", 1,
            "Base.Revolver_Long", 0.5,
        }
    },
    --other ={
    --    rolls = 5,
    --    items = {
    --        "Base.Bullets9mmBox", 10,
    --        "Base.Bullets9mmBox", 10,
    --        "Base.GunPowder", 10,
    --        "Base.GunPowder", 10,
    --        "Base.GunPowder", 10,
    --        "Base.223Box", 10,
    --        "Base.308Box", 10,
    --        "Base.223Box", 10,
	--		  "Base.308Box", 10,
    --        "Base.ShotgunShellsBox", 10,
    --        "Base.ShotgunShellsBox", 10,
    --        "Base.Bullets38Box", 10,
    --        "Base.Bullets44Box", 10,
    --        "Base.Bullets45Box", 10,
    --        "Base.Bullets38Box", 10,
    --        "Base.Bullets44Box", 10,
    --        "Base.Bullets45Box", 10,
    --    }
    --},
};

table.insert(SuburbsDistributions,DiningRoom);
SuburbsDistributions["DiningRoom"] = {
};

table.insert(SuburbsDistributions,mcmedicalstorage);
SuburbsDistributions["mcmedicalstorage"] = {
};

table.insert(SuburbsDistributions,mcpolicestorage);
SuburbsDistributions["mcpolicestorage"] = {
};

table.insert(SuburbsDistributions,mcgaragestorage);
SuburbsDistributions["mcgaragestorage"] = {
};

table.insert(SuburbsDistributions,mcgunstorestorage);
SuburbsDistributions["mcgunstorestorage"] = {
    military_shelves ={
        rolls = 5,
        items = {
            "Base.HuntingRifle", 3,
            "Base.VarmintRifle", 3,
            "Base.Pistol", 3,
            "Base.Pistol2", 1.5,
            "Base.Pistol3", 0.5,
            "Base.Revolver_Short", 1.5,
            "Base.Revolver", 1,
            "Base.Revolver_Long", 0.5,
        }
    },
	extinguishers_shelves = {
        rolls = 1,
        items = {
           "Extinguisher",10,
        },
    },
	crate={
		rolls = 3,
		items = {
			"x2Scope", 3,
			"x4Scope", 2,
			"x8Scope", 1,
            "Base.AmmoStrap_Bullets", 3,
            "Base.AmmoStrap_Shells", 3,
			"Sling", 4,
			"FiberglassStock", 3,
			"RecoilPad",  4,
			"HuntingRifle", 3,
			"VarmintRifle", 3,
			"Shotgun", 3,
			"DoubleBarrelShotgun", 2,
			"ShotgunShellsBox", 10,
			"ShotgunShellsBox", 10,
			"Pistol", 1.5,
			"Pistol2", 1.5,
			"Pistol3", 0.5,
			"Revolver_Short", 1.5,
			"Revolver", 1,
			"Revolver_Long", 0.5,
			"Bullets9mmBox", 10,
			"Bullets9mmBox", 10,
			"GunPowder", 10,
			"GunPowder", 10,
			"223Box", 10,
			"308Box", 10,
			"223Box", 10,
			"308Box", 10,
			"Bullets38Box", 10,
			"Bullets44Box", 10,
			"Bullets45Box", 10,
			"Radio.WalkieTalkie4",5,
			"Radio.WalkieTalkie5",3,
			"Radio.HamRadio1",5,
			"Radio.HamRadio2",3,
			"45Clip", 0.2,
			"45Clip", 0.2,
			"44Clip", 0.2,
			"44Clip", 0.2,
			"9mmClip", 0.2,
			"9mmClip", 0.2,
		},

		dontSpawnAmmo = true,
	},
    metal_shelves ={
        rolls = 3,
        items = {
            "223Box", 10,
            "223Clip", 2,
            "308Box", 10,
            "308Clip", 2,
            "44Clip", 2,
            "45Clip", 2,
            "9mmClip", 2,
            "AmmoStraps", 4,
            "Bullets38Box", 10,
            "Bullets44Box", 10,
            "Bullets45Box", 10,
            "Bullets9mmBox", 10,
            "FiberglassStock", 4,
            "Hat_EarMuff_Protectors", 1,
            "M14Clip", 2,
            "RecoilPad",  4,
            "ShotgunShellsBox", 10,
            "Sling", 4,
            "x2Scope", 4,
            "x4Scope", 2,
            "x8Scope", 1,
        }
    },
};

table.insert(SuburbsDistributions,mcspiffosstorage);
SuburbsDistributions["mcspiffosstorage"] = {
};

table.insert(SuburbsDistributions,mcstorageunit);
SuburbsDistributions["mcstorageunit"] = {
};

table.insert(SuburbsDistributions,trainingcamp);
SuburbsDistributions["trainingcamp"] = {
	extinguishers_shelves = {
        rolls = 1,
        items = {
           "Extinguisher",10,
        },
    },
    crate ={
        rolls = 5,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.HuntingMag1", 0.2,
            "Base.HuntingMag2", 0.2,
            "Base.HuntingMag3", 0.2,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.HuntingRifle", 3,
            "Base.VarmintRifle", 3,
            "Base.Pistol", 3,
            "Base.Pistol2", 1.5,
            "Base.Pistol3", 0.5,
            "Base.Revolver_Short", 1.5,
            "Base.Revolver", 1,
            "Base.Revolver_Long", 0.5,
        }
    },
    metal_shelves ={
        rolls = 5,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.HuntingRifle", 3,
			"Base.HuntingRifle", 3,
            "Base.VarmintRifle", 3,
			"Base.VarmintRifle", 3,
            "Base.Pistol", 3,
			"Base.Pistol", 3,
			"Base.Pistol", 3,
            "Base.Pistol2", 1.5,
            "Base.Pistol3", 0.5,
            "Base.Revolver_Short", 1.5,
            "Base.Revolver", 1,
            "Base.Revolver_Long", 0.5,
        }
    },
    locker ={
        rolls = 5,
        items = {
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.HuntingMag1", 0.2,
            "Base.HuntingMag2", 0.2,
            "Base.HuntingMag3", 0.2,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
        }
    },
};

table.insert(SuburbsDistributions,ammomakerroom);
SuburbsDistributions["ammomakerroom"] = {
    all ={
        rolls = 5,
        items = {
            "Base.x2Scope", 3,
            "Base.x4Scope", 2,
            "Base.x8Scope", 1,
            "Base.AmmoStrap_Bullets", 3,
            "Base.AmmoStrap_Shells", 3,
            "Base.Sling", 4,
            "Base.FiberglassStock", 3,
            "Base.RecoilPad",  4,
            "Base.HuntingRifle", 3,
            "Base.VarmintRifle", 3,
            "Base.Shotgun", 3,
			"DoubleBarrelShotgun", 2,
            "Base.ShotgunShellsBox", 10,
            "Base.ShotgunShellsBox", 10,
            "Base.Pistol", 3,
            "Base.Pistol2", 1.5,
            "Base.Pistol3", 0.5,
            "Base.Revolver_Short", 1.5,
            "Base.Revolver", 1,
            "Base.Revolver_Long", 0.5,
            "Base.HuntingKnife", 5,
            "Base.Bullets9mmBox", 10,
            "Base.Bullets9mmBox", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.Bullets38Box", 10,
            "Base.Bullets44Box", 10,
            "Base.Bullets45Box", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.GunPowder", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.223Box", 10,
            "Base.308Box", 10,
            "Base.Axe", 3,
            "Base.HuntingKnife", 3,
            "Base.HuntingMag1", 0.2,
            "Base.HuntingMag2", 0.2,
            "Base.HuntingMag3", 0.2,
        }
    },
};

table.insert(SuburbsDistributions,hangarclothes);
SuburbsDistributions["hangarclothes"] = {
	extinguishers_shelves = {
        rolls = 1,
        items = {
            "Extinguisher",10,
        },
    },
    crate ={
        procedural = true,
        procList = {
            {name="ClothingStoresShirts", min=0, max=3},
            {name="ClothingStoresPants", min=0, max=2},
            {name="ClothingStoresJumpers", min=0, max=2},
            {name="ClothingStoresLeather", min=0, max=1},
            {name="ClothingStoresShoes", min=0, max=1},
            {name="ClothingPoor", min=0, max=20, forceForZones="Poor"},
        }
    },
    metal_shelves ={
        rolls = 3,
        items = {
            "Hammer", 4,
            "Wire", 2,
            "Saw", 4,
            "NailsBox", 2,
            "PaperclipBox", 1,
            "NailsBox", 2,
            "NailsBox", 2,
            "Nails", 4,
            "Screwdriver", 4,
            "Radio.ElectricWire", 2,
            "Sheet", 4,
            "Sheet", 4,
            "BarbedWire", 3,
            "PetrolCan", 5,
            "EmptyPetrolCan", 10,
            "Radio.RadioBlack",2,
            "Radio.RadioRed",1,
            "Radio.WalkieTalkie1",0.05,
            "Radio.WalkieTalkie2",0.03,
            "Radio.WalkieTalkie3",0.01,
            "Radio.HamRadio1",0.05,
            "Wrench", 1,
            "LugWrench",0.8,
            "Jack", 0.5,
            "TirePump", 0.5,
            "NormalBrake1", 1.2,
            "ModernBrake1", 1.1,
            "NormalBrake2", 1.2,
            "ModernBrake2", 1.1,
            "NormalBrake3", 1.2,
            "ModernBrake3", 1.1,
            "NormalSuspension1", 1.2,
            "ModernSuspension1", 1.1,
            "NormalSuspension2", 1.2,
            "ModernSuspension2", 1.1,
            "NormalSuspension3", 1.2,
            "ModernSuspension3", 1.1,
            "SmallGasTank1", 1.3,
            "NormalGasTank1", 1.2,
            "BigGasTank1", 1.1,
            "SmallGasTank2", 1.3,
            "NormalGasTank2", 1.2,
            "BigGasTank2", 1.1,
            "SmallGasTank3", 1.3,
            "NormalGasTank3", 1.2,
            "BigGasTank3", 1.1,
            "CarBattery1", 1.5,
            "CarBattery2", 1.5,
            "CarBattery3", 1.5,
        }
    },
    wardrobe ={
        rolls = 3,
        items = {
            "Tshirt_DefaultTEXTURE_TINT", 3,
            "Jumper_RoundNeck", 1,
            "TrousersMesh_DenimLight", 1,
            "Trousers_DefaultTEXTURE_TINT", 2,
            "Vest_DefaultTEXTURE_TINT", 1,
            "Skirt_Knees", 0.3,
            "Skirt_Long", 0.3,
            "Skirt_Normal", 0.3,
            "Socks_Ankle", 4,
            "Sheet", 9,
            "Pillow", 9,
            "Paperclip", 0.5,
            "Belt2", 5,
            "Doll", 0.5,
            "Disc", 0.5,
            "CDplayer", 0.5,
            "Earbuds", 0.5,
            "Headphones", 0.5,
            "VideoGame", 0.5,
            "Bag_DuffelBagTINT", 1,
            "Bag_Schoolbag", 3,
            "Bag_NormalHikingBag", 0.8,
            "ClosedUmbrellaRed", 0.3,
            "ClosedUmbrellaBlue", 0.3,
            "ClosedUmbrellaBlack", 0.3,
            "ClosedUmbrellaWhite", 0.3,
            "Bag_BigHikingBag", 0.5,
            "AlarmClock2", 2,
            "Radio.RadioBlack",2,
            "Radio.RadioRed",1,
            "Radio.HamRadio1",0.005,
        }
    },
    bin ={
        rolls = 3,
        items = {
            "EmptyPetrolCan", 1,
			"Socks_Ankle", 4,
            "Plank", 2,
            "Tissue", 2,
            "Lighter", 2,
            "Battery", 2,
            "Pen", 3,
            "BluePen", 1,
            "RedPen", 1,
            "Pencil", 3,
            "Eraser", 2,
            "Magazine", 2,
            "Newspaper", 2,
            "Paperclip", 1,
            "Doll", 1,
            "Lollipop", 3,
            "MintCandy", 3,
            "Cigarettes", 3,
            "SheetPaper2", 3,
            "WaterBottleEmpty", 3,
            "Garbagebag", 12,
            "Garbagebag", 12,
            "Garbagebag", 12,
        }
    },
    locker ={
        rolls = 3,
        items = {
            "Tshirt_DefaultTEXTURE_TINT", 3,
            "Jumper_RoundNeck", 1,
            "TrousersMesh_DenimLight", 1,
            "Trousers_DefaultTEXTURE_TINT", 2,
            "Vest_DefaultTEXTURE_TINT", 1,
            "Skirt_Knees", 0.3,
            "Skirt_Long", 0.3,
            "Skirt_Normal", 0.3,
            "Socks_Ankle", 4,
            "Belt2", 5,
			"Pillow", 9,
            "ClosedUmbrellaRed", 0.3,
            "ClosedUmbrellaBlue", 0.3,
            "ClosedUmbrellaBlack", 0.3,
            "ClosedUmbrellaWhite", 0.3,
        }
    },
};
local function MComplexmergeDistributions()

	SuburbsDistributions.mcstorageunit.extinguishers_shelves = MCCustomLoot.all.extinguishers_shelves;
	SuburbsDistributions.mcstorageunit.metal_shelves = SuburbsDistributions.storageunit.all;
	SuburbsDistributions.mcstorageunit.crate = SuburbsDistributions.storageunit.all;
	SuburbsDistributions.mcstorageunit.locker = SuburbsDistributions.storageunit.all;
	SuburbsDistributions.mcstorageunit.shelves = SuburbsDistributions.storageunit.all;
	SuburbsDistributions.mcstorageunit.bin = SuburbsDistributions.all.bin;
	SuburbsDistributions.mcstorageunit.military_shelves = SuburbsDistributions.storageunit.all;
	SuburbsDistributions.mcstorageunit.simple_military_shelves = SuburbsDistributions.storageunit.all;
	SuburbsDistributions.mcstorageunit.desk = SuburbsDistributions.storageunit.all;
	SuburbsDistributions.mcstorageunit.filingcabinet = SuburbsDistributions.storageunit.all;
	
	SuburbsDistributions.mcpolicestorage.military_shelves = SuburbsDistributions.ammostorage.military_shelves;
	SuburbsDistributions.mcpolicestorage.extinguishers_shelves = MCCustomLoot.all.extinguishers_shelves;
	SuburbsDistributions.mcpolicestorage.desk = SuburbsDistributions.all.desk;
	SuburbsDistributions.mcpolicestorage.bin = SuburbsDistributions.all.bin;
	SuburbsDistributions.mcpolicestorage.filingcabinet = SuburbsDistributions.all.filingcabinet;
	SuburbsDistributions.mcpolicestorage.locker = SuburbsDistributions.policestorage.locker;
	SuburbsDistributions.mcpolicestorage.crate = MCCustomLoot.all.military_crate; --este

	SuburbsDistributions.mcmedicalstorage.extinguishers_shelves = MCCustomLoot.all.extinguishers_shelves;
	SuburbsDistributions.mcmedicalstorage.shelves = SuburbsDistributions.medicalstorage.metal_shelves;
	SuburbsDistributions.mcmedicalstorage.metal_shelves = SuburbsDistributions.medicalstorage.metal_shelves;
	SuburbsDistributions.mcmedicalstorage.simple_military_crate = SuburbsDistributions.medicalstorage.counter;
	SuburbsDistributions.mcmedicalstorage.military_crate = SuburbsDistributions.medicalstorage.metal_shelves;
	SuburbsDistributions.mcmedicalstorage.crate = SuburbsDistributions.medicalstorage.counter;
	SuburbsDistributions.mcmedicalstorage.locker = SuburbsDistributions.medicalstorage.metal_shelves;
	
	SuburbsDistributions.mcgaragestorage.extinguishers_shelves = MCCustomLoot.all.extinguishers_shelves;
	SuburbsDistributions.mcgaragestorage.metal_shelves = SuburbsDistributions.garagestorage.metal_shelves;
	
	SuburbsDistributions.mcspiffosstorage.extinguishers_shelves = MCCustomLoot.all.extinguishers_shelves;
	SuburbsDistributions.mcspiffosstorage.crate = SuburbsDistributions.spiffosstorage.all;
	SuburbsDistributions.mcspiffosstorage.fridge = SuburbsDistributions.spiffosstorage.all;
	SuburbsDistributions.mcspiffosstorage.freezer = SuburbsDistributions.spiffosstorage.all;
	SuburbsDistributions.mcspiffosstorage.metal_shelves = SuburbsDistributions.spiffosstorage.all;
	SuburbsDistributions.mcspiffosstorage.smallcrate = SuburbsDistributions.spiffosstorage.all;
	SuburbsDistributions.mcspiffosstorage.shelves = SuburbsDistributions.spiffosstorage.all;

	SuburbsDistributions.all.military_crate = MCCustomLoot.all.military_crate;
	SuburbsDistributions.all.simple_military_crate = MCCustomLoot.all.simple_military_crate;
	SuburbsDistributions.all.extinguishers_shelves = MCCustomLoot.all.extinguishers_shelves;
	SuburbsDistributions.all.incubator = MCCustomLoot.all.incubator;
	SuburbsDistributions.all.labfridge = MCCustomLoot.all.labfridge;
	SuburbsDistributions.all.army_locker = MCCustomLoot.all.army_locker;

	SuburbsDistributions.laundry.extinguishers_shelves = MCCustomLoot.all.extinguishers_shelves;

	SuburbsDistributions.gunstorestorage.bin = SuburbsDistributions.all.bin;
	SuburbsDistributions.gunstorestorage.extinguishers_shelves = MCCustomLoot.all.extinguishers_shelves;
	SuburbsDistributions.gunstorestorage.simple_military_crate = SuburbsDistributions.mcgunstorestorage.crate;
	SuburbsDistributions.gunstorestorage.military_crate = SuburbsDistributions.mcgunstorestorage.crate;
	SuburbsDistributions.gunstorestorage.military_shelves = SuburbsDistributions.ammostorage.military_shelves;
	SuburbsDistributions.gunstorestorage.army_locker = MCCustomLoot.all.army_locker;

	SuburbsDistributions.DiningRoom.extinguishers_shelves = SuburbsDistributions.all.extinguishers_shelves;
	SuburbsDistributions.DiningRoom.vendingsnack = SuburbsDistributions.all.vendingsnack;
	SuburbsDistributions.DiningRoom.vendingpop = SuburbsDistributions.all.vendingpop;
	SuburbsDistributions.DiningRoom.counter = SuburbsDistributions.kitchen.counter;
	SuburbsDistributions.DiningRoom.fridge = SuburbsDistributions.all.fridge;
	SuburbsDistributions.DiningRoom.freezer = SuburbsDistributions.all.freezer;
	SuburbsDistributions.DiningRoom.stove = SuburbsDistributions.restaurantkitchen.stove;
	SuburbsDistributions.DiningRoom.bin = SuburbsDistributions.all.bin;
	SuburbsDistributions.DiningRoom.medicine = SuburbsDistributions.Nurse.medicine;
	SuburbsDistributions.DiningRoom.desk = SuburbsDistributions.all.desk;
	SuburbsDistributions.DiningRoom.officedrawers = SuburbsDistributions.all.officedrawers;
	--SuburbsDistributions.DiningRoom.other = SuburbsDistributions.kitchen.counter;

	SuburbsDistributions.mcgunstorestorage.bin = SuburbsDistributions.all.bin;
	SuburbsDistributions.mcgunstorestorage.filingcabinet = SuburbsDistributions.all.filingcabinet;
	SuburbsDistributions.mcgunstorestorage.desk = SuburbsDistributions.all.desk;
	--SuburbsDistributions.mcgunstorestorage.metal_shelves = SuburbsDistributions.gunstorestorage.all; --Este
	SuburbsDistributions.mcgunstorestorage.military_crate = SuburbsDistributions.mcgunstorestorage.crate;
	SuburbsDistributions.mcgunstorestorage.simple_military_crate = SuburbsDistributions.mcgunstorestorage.crate;
	SuburbsDistributions.mcgunstorestorage.locker = SuburbsDistributions.ammostorage2.crate;
	
	SuburbsDistributions.trainingcamp.simple_military_crate = SuburbsDistributions.trainingcamp.crate;
	SuburbsDistributions.trainingcamp.military_crate = SuburbsDistributions.trainingcamp.crate;

end
local function MComplexpostDistributionMerge()
	if AdvFishing then
		RemoveItemFromDistribution(SuburbsDistributions, "FishingTackle");
		RemoveItemFromDistribution(SuburbsDistributions, "FishingTackle2");

		RemoveItemFromDistribution(ProceduralDistributions, "FishingTackle");
		RemoveItemFromDistribution(ProceduralDistributions, "FishingTackle2");
	end
end

MCLInsertion = {

};

Events.OnDistributionMerge.Add(MComplexmergeDistributions);
Events.OnPostDistributionMerge.Add(MComplexpostDistributionMerge);
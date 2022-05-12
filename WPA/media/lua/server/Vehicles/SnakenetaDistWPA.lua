require "Vehicles/snakenetadis"

local distributionTable = VehicleDistributions[1]
if VehicleDistributions then
	VehicleDistributions.WPATruckBed = {
		rolls = 4,
		items = {
			"WPA.BlackBriefcase", 50,
			"WPA.BlackBriefcase", 50,
			"WPA.BlackBriefcase", 50,
			"WPA.SilencerRK", 50,
			"WPA.SilencerRK", 50,
			"WPA.SilencerRK", 50,
			"WPA.LaserLight", 5,
			"WPA.TacticalLaserLight2", 4,
			"WPA.TacticalLight", 2,
			"WPA.PHeavyBarrel", 1,
			"WPA.Grip2", 2,
			"WPA.Silencer1", 1,
			"WPA.Slide1", 1,
			"WPA.RecoilCompensator", 2,
			"WPA.Pistolx2Scope", 3,
			"WPA.Pistolx2Scope2", 2,
			"WPA.Grip1", 1,
			"WPA.Bipod", 3,
			"WPA.x20Scope", 4,
			"WPA.x40Scope", 2,
			"WPA.StealthTacticalScope", 5,
			"WPA.StealthTacticalScope2", 4,
			"WPA.StraightPullBolt", 5,
			"WPA.RHeavyBarrel", 5,
			"WPA.PolymerStock", 1,
			"WPA.RRecoilCompensator", 1,
			"WPA.Silencer3", 0.8,
			"WPA.CheekRest", 2,
			"WPA.RecoilPad2", 1,
			"WPA.RecoilPad3", 1,
			"WPA.Silencer5", 0.8,
			"WPA.TacticalLight2", 1,
			"WPA.ShotgunLaser", 2,
			"WPA.SRTPS", 1,
			"WPA.FoldingStock", 2,
			"WPA.SRecoilCompensator", 1,
			"WPA.ShellHolderStock", 1,
			"WPA.ShotgunPolymerStock", 0.8,
			"WPA.SilencerRK", 0.5,
			"WPA.Silencerm16", 0.5,
			"WPA.M16x4Scope", 0.8,
			"WPA.M16Grip", 0.5,
			"WPA.M16TL", 1,
			"WPA.M16LaserLight", 0.5,
			"WPA.M16Laser", 1,
			"WPA.M16Reflex", 0.8,
			"WPA.M16BoltCarrier", 0.5,
			"WPA.M16RecoilPad", 0.5,
			"WPA.MilitarySling", 0.8,
			"WPA.AkIronSight", 0.8,
			"Radio.WalkieTalkie4", 8,
		},
	}
	VehicleDistributions.WPAGloveBox = {
		rolls = 1,
		items = {
			"WPA.WeaponsMagazine", 50,
			"WPA.WeaponsMagazine2", 50,
			"WPA.WeaponsMagazine3", 50,
			"WPA.SilencerRK", 50,
			"WPA.SilencerRK", 50,
			"Radio.WalkieTalkie4", 8,
			"Base.Screwdriver", 20,
		},
	}
	VehicleDistributions.WPASeat = {
		rolls = 1,
		items = {
            "CorpseMale", 0.01,
            "CorpseFemale", 0.01,		
		},
	}
	VehicleDistributions.WPA = {
		TruckBed = VehicleDistributions.WPATruckBed;

		TruckBedOpen = VehicleDistributions.WPATruckBed;

		GloveBox = VehicleDistributions.WPAGloveBox;

		SeatRearLeft = VehicleDistributions.WPASeat;
		SeatRearRight = VehicleDistributions.WPASeat;
	}
end

if distributionTable["VanSnakeneta"] then
	if not distributionTable["VanSnakeneta"].Specific then
		distributionTable["VanSnakeneta"].Specific = {};
	end
	table.insert(distributionTable["VanSnakeneta"].Specific, VehicleDistributions.WPA);
end
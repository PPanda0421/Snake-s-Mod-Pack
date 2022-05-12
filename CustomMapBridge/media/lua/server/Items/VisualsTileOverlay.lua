local TileVisualOverlay = {}
TileVisualOverlay.VERSION = 1
TileVisualOverlay["pmrm_01_24"] = {{ name = "other", chance = 1, usage = "tabletop", tiles = {"visuals_overlays_01_54", "visuals_overlays_01_55"} }}
TileVisualOverlay["pmrm_01_25"] = {{ name = "other", chance = 1, usage = "tabletop", tiles = {"visuals_overlays_01_58", "visuals_overlays_01_59"} }}
TileVisualOverlay["pmrm_01_26"] = {{ name = "other", chance = 1, usage = "tabletop", tiles = {"visuals_overlays_01_56", "visuals_overlays_01_57"} }}
TileVisualOverlay["pmrm_01_27"] = {{ name = "other", chance = 1, usage = "tabletop", tiles = {"visuals_overlays_01_60", "visuals_overlays_01_61"} }}
TileVisualOverlay["pmrm_01_28"] = {{ name = "other", chance = 1, usage = "tabletop", tiles = {"visuals_overlays_01_54", "visuals_overlays_01_55"} }}
TileVisualOverlay["pmrm_01_29"] = {{ name = "other", chance = 1, usage = "tabletop", tiles = {"visuals_overlays_01_58", "visuals_overlays_01_59"} }}
TileVisualOverlay["pmrm_01_30"] = {{ name = "other", chance = 1, usage = "tabletop", tiles = {"visuals_overlays_01_56", "visuals_overlays_01_57"} }}
TileVisualOverlay["pmrm_01_31"] = {{ name = "other", chance = 1, usage = "tabletop", tiles = {"visuals_overlays_01_60", "visuals_overlays_01_61"} }}

if not TILEZED then
	getTileOverlays():addOverlays(TileVisualOverlay)
end
return TileVisualOverlay
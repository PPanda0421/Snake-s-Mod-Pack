local AMOverlayMap = {}
AMOverlayMap.VERSION = 1
AMOverlayMap["carpentry_03_0"] = {{ name = "other", tiles = {"ammo_01_1", "ammo_01_0"} }}
AMOverlayMap["carpentry_03_1"] = {{ name = "other", tiles = {"ammo_01_3", "ammo_01_2"} }}
AMOverlayMap["carpentry_03_2"] = {{ name = "other", tiles = {"ammo_01_5", "ammo_01_4"} }}
AMOverlayMap["carpentry_03_3"] = {{ name = "other", tiles = {"ammo_01_7", "ammo_01_6"} }}
AMOverlayMap["carpentry_03_4"] = {{ name = "other", tiles = {"ammo_01_9", "ammo_01_8"} }}
AMOverlayMap["carpentry_03_5"] = {{ name = "other", tiles = {"ammo_01_10", "ammo_01_10"} }}
AMOverlayMap["carpentry_03_6"] = {{ name = "other", tiles = {"ammo_01_11", "ammo_01_11"} }}
AMOverlayMap["carpentry_03_7"] = {{ name = "other", tiles = {"ammo_01_13", "ammo_01_12"} }}
if not TILEZED then
	getContainerOverlays():addOverlays(AMOverlayMap)
end
return AMOverlayMap
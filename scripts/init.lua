Tracker:AddItems("items/common.json")



if (Tracker.ActiveVariantUID == "items_only") then
	Tracker:AddItems("items/swords.json")
	Tracker:AddLayouts("layouts/tracker.json")
	Tracker:AddLayouts("layouts/broadcast_tems_only.json")

else
	ScriptHost:LoadScript("scripts/class.lua")
	ScriptHost:LoadScript("scripts/custom_item.lua")
	ScriptHost:LoadScript("scripts/sword.lua")

	wind = SwordItem("Sword of Wind", "wind", "wind")
	fire = SwordItem("Sword of Fire", "fire", "fire")
	water = SwordItem("Sword of Water", "water", "water")
	thunder = SwordItem("Sword of Thunder", "thunder", "thunder")

	ScriptHost:LoadScript("scripts/logic_common.lua")
	ScriptHost:LoadScript("scripts/flags.lua")
	Tracker:AddMaps("maps/sub_maps.json")
	Tracker:AddItems("items/flags.json")
	Tracker:AddLayouts("layouts/custom_flags.json")
	Tracker:AddLocations("locations/full/overworld_locations.json")
	Tracker:AddLocations("locations/full/sealed_cave_locations.json")
	Tracker:AddLocations("locations/full/sabre_west_locations.json")
	Tracker:AddLocations("locations/full/sabre_north_locations.json")
	Tracker:AddLocations("locations/full/fog_lamp_cave_locations.json")
	Tracker:AddLocations("locations/full/island_cave_locations.json")
	Tracker:AddLocations("locations/full/island_fortress_locations.json")
	Tracker:AddLocations("locations/full/hydra_locations.json")
	Tracker:AddLocations("locations/full/oasis_cave_locations.json")
	Tracker:AddLocations("locations/full/goa_locations.json")
	Tracker:AddLayouts("layouts/broadcast.json")

end





-- Check to see if a relevant flag is set to "off"
function sc_off()
	return Tracker:ProviderCountForCode("flag_sc") == 0
end

function sk_off()
	return Tracker:ProviderCountForCode("flag_sk") == 0
end

function sm_off()
	return Tracker:ProviderCountForCode("flag_sm") == 0
end

function st_off()
	return Tracker:ProviderCountForCode("flag_st") == 0
end

-- See if an area still has valid locations based on flags
function sealed_cave_has_items()
	local a = Tracker:FindObjectForCode("@Sealed Cave 1/Ball of Wind")
	local b = Tracker:FindObjectForCode("@Sealed Cave 2/Vampire")
	local c = Tracker:FindObjectForCode("@Sealed Cave 3/Warp Boots")
	local d = Tracker:FindObjectForCode("@Sealed Cave 4/Medical Herb 1")
	local e = Tracker:FindObjectForCode("@Sealed Cave 5/Antidote")
	local f = Tracker:FindObjectForCode("@Sealed Cave 6/Medical Herb 2")
	if (a and b and c and d and e and f) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sk_off() or
			c.AvailableChestCount > 0 and not sc_off() or
			d.AvailableChestCount > 0 and not sc_off() or
			e.AvailableChestCount > 0 and not sc_off() or
			f.AvailableChestCount > 0 and not sc_off()
	end
	return false
end

function sabre_west_has_items()
	local a = Tracker:FindObjectForCode("@Mt Sabre West 1/Tornado Bracelet")
	local b = Tracker:FindObjectForCode("@Mt Sabre West 2/Teleport")
	local c = Tracker:FindObjectForCode("@Mt Sabre West 3/Warp Boots")
	local d = Tracker:FindObjectForCode("@Mt Sabre West 4/Medical Herb")
	local e = Tracker:FindObjectForCode("@Mt Sabre West 5/Magic Ring")
	if (a and b and c and d and e) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sm_off() or
			c.AvailableChestCount > 0 and not sc_off() or
			d.AvailableChestCount > 0 and not sc_off() or
			e.AvailableChestCount > 0 and not sc_off()
	end
	return false
end

function sabre_north_has_items()
	local a = Tracker:FindObjectForCode("@Mt Sabre North 1/Key to Prison")
	local b = Tracker:FindObjectForCode("@Mt Sabre North 2/General Kelbesque")
	local c = Tracker:FindObjectForCode("@Mt Sabre North 3/Antidote")
	local d = Tracker:FindObjectForCode("@Mt Sabre North 4/Medical Herb")
	if (a and b and c and d) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sk_off() or
			c.AvailableChestCount > 0 and not sc_off() or
			d.AvailableChestCount > 0 and not sc_off()
	end
	return false
end

function fog_lamp_cave_has_items()
	local a = Tracker:FindObjectForCode("@Fog Lamp Cave 1/Fog Lamp")
	local b = Tracker:FindObjectForCode("@Fog Lamp Cave 2/Lysis Plant")
	local c = Tracker:FindObjectForCode("@Fog Lamp Cave 3/Mimic 1")
	local d = Tracker:FindObjectForCode("@Fog Lamp Cave 4/Mimic 2")
	if (a and b and c and d) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sc_off() or
			c.AvailableChestCount > 0 and not st_off() or
			d.AvailableChestCount > 0 and not st_off()
	end
	return false
end

function island_cave_has_items()
	local a = Tracker:FindObjectForCode("@Island Cave 1/Iron Necklace")
	local b = Tracker:FindObjectForCode("@Island Cave 2/Magic Ring")
	local c = Tracker:FindObjectForCode("@Island Cave 3/Lysis Plant")
	local d = Tracker:FindObjectForCode("@Island Cave 4/Mimic")
	if (a and b and c and d) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sc_off() or
			c.AvailableChestCount > 0 and not sc_off() or
			d.AvailableChestCount > 0 and not st_off()
	end
	return false
end

function island_fortress_has_items()
	local a = Tracker:FindObjectForCode("@Island Fortress 1/Vampire 2")
	local b = Tracker:FindObjectForCode("@Island Fortress 2/Sabera")
	local c = Tracker:FindObjectForCode("@Island Fortress 3/Fruit of Power")
	local d = Tracker:FindObjectForCode("@Island Fortress 4/Medical Herb")
	if (a and b and c and d) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sk_off() or
			c.AvailableChestCount > 0 and not sc_off() or
			d.AvailableChestCount > 0 and not sc_off()
	end
	return false
end

function hydra_has_items()
	local a = Tracker:FindObjectForCode("@Mt Hydra 1/Bow of Sun")
	local b = Tracker:FindObjectForCode("@Mt Hydra 2/Fruit of Lime")
	local c = Tracker:FindObjectForCode("@Mt Hydra 3/Magic Ring")
	local d = Tracker:FindObjectForCode("@Mt Hydra 4/Medical Herb")
	local e = Tracker:FindObjectForCode("@Mt Hydra 5/Mimic")
	if (a and b and c and d and e) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sc_off() or
			c.AvailableChestCount > 0 and not sc_off() or
			d.AvailableChestCount > 0 and not sc_off() or
			e.AvailableChestCount > 0 and not st_off()
	end
	return false
end

function oasis_cave_has_items()
	local a = Tracker:FindObjectForCode("@Oasis Cave 1/Leather Boots")
	local b = Tracker:FindObjectForCode("@Oasis Cave 2/Power Ring")
	local c = Tracker:FindObjectForCode("@Oasis Cave 3/Battle Armor")
	local d = Tracker:FindObjectForCode("@Oasis Cave 4/Fruit of Power 1")
	local e = Tracker:FindObjectForCode("@Oasis Cave 5/Fruit of Power 2")
	if (a and b and c and d and e) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sk_off() or
			c.AvailableChestCount > 0 and not sc_off() or
			d.AvailableChestCount > 0 and not sc_off() or
			e.AvailableChestCount > 0 and not sc_off()
	end
	return false
end

function goa_2_has_items()
	local a = Tracker:FindObjectForCode("@Goa 2nd Floor 1/Sabera 2 (use Fire)")
	local b = Tracker:FindObjectForCode("@Goa 2nd Floor 2/Fruit of Power")
	local c = Tracker:FindObjectForCode("@Goa 2nd Floor 3/Fruit of Repun")
	local d = Tracker:FindObjectForCode("@Goa 2nd Floor 4/Lysis Plant")
	if (a and b and c and d) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sc_off() or
			c.AvailableChestCount > 0 and not sc_off() or
			d.AvailableChestCount > 0 and not sc_off()
	end
	return false
end

function goa_3_has_items()
	local a = Tracker:FindObjectForCode("@Goa 3rd Floor 1/Mado 2 (use Water)")
	local b = Tracker:FindObjectForCode("@Goa 3rd Floor 2/Opel Statue")
	local c = Tracker:FindObjectForCode("@Goa 3rd Floor 3/Antidote")
	local d = Tracker:FindObjectForCode("@Goa 3rd Floor 4/Magic Ring 1")
	local e = Tracker:FindObjectForCode("@Goa 3rd Floor 5/Magic Ring 2")
	local f = Tracker:FindObjectForCode("@Goa 3rd Floor 6/Magic Ring 3")
	if (a and b and c and d and e and f) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sc_off() or
			c.AvailableChestCount > 0 and not sc_off() or
			d.AvailableChestCount > 0 and not sc_off() or
			e.AvailableChestCount > 0 and not sc_off() or
			f.AvailableChestCount > 0 and not sc_off()
	end
	return false
end

function goa_4_has_items()
	local a = Tracker:FindObjectForCode("@Goa 4th Floor 1/Karmine (use Thunder)")
	local b = Tracker:FindObjectForCode("@Goa 4th Floor 2/Storm Bracelet")
	local c = Tracker:FindObjectForCode("@Goa 4th Floor 3/Kensu Blob (use Ivory Statue)")
	local d = Tracker:FindObjectForCode("@Goa 4th Floor 4/Warp Boots")
	local e = Tracker:FindObjectForCode("@Goa 4th Floor 5/Magic Ring")
	local f = Tracker:FindObjectForCode("@Goa 4th Floor 6/Mimic 1")
	local g = Tracker:FindObjectForCode("@Goa 4th Floor 7/Mimic 2")
	local h = Tracker:FindObjectForCode("@Goa 4th Floor 8/Mimic 3")
	if (a and b and c and d and e and f and g and h) then
		return
			a.AvailableChestCount > 0 and not sk_off() or
			b.AvailableChestCount > 0 and not sk_off() or
			c.AvailableChestCount > 0 and not sm_off() or
			d.AvailableChestCount > 0 and not sc_off() or
			e.AvailableChestCount > 0 and not sc_off() or
			f.AvailableChestCount > 0 and not st_off() or
			g.AvailableChestCount > 0 and not st_off() or
			h.AvailableChestCount > 0 and not st_off()
	end
	return false
end
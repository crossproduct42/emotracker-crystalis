-- Sword functions
function hasSword()
	return
		Tracker:ProviderCountForCode("wind") > 0 or
		Tracker:ProviderCountForCode("fire") > 0 or
		Tracker:ProviderCountForCode("water") > 0 or
		Tracker:ProviderCountForCode("thunder") > 0
end

function hasAnyBall()
	return
		wind:getProperty("active") and wind:getProperty("level") >= 2 or
		fire:getProperty("active") and fire:getProperty("level") >= 2 or
		water:getProperty("active") and water:getProperty("level") >= 2 or
		thunder:getProperty("active") and thunder:getProperty("level") >= 2
end

function canBreakStoneWalls()
	if not wind:getProperty("active") then
		return false
	end
	return
		wind:getProperty("level") >= 2 or
		Tracker:ProviderCountForCode("flag_ro") > 0 or
		(
			Tracker:ProviderCountForCode("flag_gc") > 0 and
			hasAnyBall()
		)
end

function canBreakIceWalls()
	if not fire:getProperty("active") then
		return false
	end
	return
		fire:getProperty("level") >= 2 or
		Tracker:ProviderCountForCode("flag_ro") > 0 or
		(
			Tracker:ProviderCountForCode("flag_gc") > 0 and
			hasAnyBall()
		)
end

function canCrossRivers()
	if Tracker:ProviderCountForCode("flight") > 0 then
		return true
	end
	if not water:getProperty("active") then
		return false
	end
	return
		water:getProperty("level") >= 2 or
		Tracker:ProviderCountForCode("flag_ro") > 0 or
		(
			Tracker:ProviderCountForCode("flag_gc") > 0 and
			hasAnyBall()
		)
end

function canBreakIronWalls()
	if not thunder:getProperty("active") then
		return false
	end
	return
		thunder:getProperty("level") >= 2 or
		Tracker:ProviderCountForCode("flag_ro") > 0 or
		(
			Tracker:ProviderCountForCode("flag_gc") > 0 and
			hasAnyBall()
		)
end



-- Boss Functions
function canKillInsect()
	return
		Tracker:ProviderCountForCode("fire") > 0 or
		Tracker:ProviderCountForCode("water") > 0 or
		Tracker:ProviderCountForCode("thunder") > 0 or
		Tracker:ProviderCountForCode("flag_hs") > 0 and hasSword()
end

function canKillKelbesque()
	if
		Tracker:ProviderCountForCode("flag_er") > 0 and
		Tracker:ProviderCountForCode("refresh") <= 0 then
		return false
	end
	if Tracker:ProviderCountForCode("flag_hs") > 0 then
		return hasSword()
	end
	if Tracker:ProviderCountForCode("flag_hw") > 0 then
		return Tracker:ProviderCountForCode("wind") > 0
	else
		return wind:getProperty("active") and wind:getProperty("level") >= 3
	end
end

function canKillSabera()
	if
		Tracker:ProviderCountForCode("flag_er") > 0 and
		Tracker:ProviderCountForCode("refresh") <= 0 then
		return false
	end
	if Tracker:ProviderCountForCode("flag_hs") > 0 then
		return hasSword()
	end
	if Tracker:ProviderCountForCode("flag_hw") > 0 then
		return Tracker:ProviderCountForCode("fire") > 0
	else
		return fire:getProperty("active") and fire:getProperty("level") >= 3
	end
end

function canKillMado()
	if
		Tracker:ProviderCountForCode("flag_er") > 0 and
		Tracker:ProviderCountForCode("refresh") <= 0 then
		return false
	end
	if Tracker:ProviderCountForCode("flag_hs") > 0 then
		return hasSword()
	end
	if Tracker:ProviderCountForCode("flag_hw") > 0 then
		return Tracker:ProviderCountForCode("water") > 0
	else
		return water:getProperty("active") and water:getProperty("level") >= 3
	end
end

function canKillKarmine()
	if
		Tracker:ProviderCountForCode("flag_er") > 0 and
		Tracker:ProviderCountForCode("refresh") <= 0 then
		return false
	end
	if Tracker:ProviderCountForCode("flag_hs") > 0 then
		return hasSword()
	end
	if Tracker:ProviderCountForCode("flag_hw") > 0 then
		return Tracker:ProviderCountForCode("thunder") > 0
	else
		return thunder:getProperty("active") and thunder:getProperty("level") >= 2
	end
end



-- All "Access" functions here refer to Goa Fortress
function canAccessKelbesque()
	return
		canAccessGoa() and canBypassBarriers() and canBreakIronWalls() or
		canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0 and canBreakIronWalls() and canKillMado() and canKillSabera()
end

function canAccessSabera()
	return
		canAccessGoa() and canBypassBarriers() and canBreakIronWalls() and canKillKelbesque() and canCrossRivers() or
		canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0 and canBreakIronWalls() and canKillMado()
end

function canAccessMado()
	return
		canAccessGoa() and canBypassBarriers() and canBreakIronWalls() and canKillKelbesque() and canCrossRivers() and canKillSabera() or
		canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0 and canBreakIronWalls()
end

function canAccessKarmine()
	return
		canAccessGoa() and canBypassBarriers() and canBreakIronWalls() and canKillKelbesque() and canCrossRivers() and canKillSabera() and canKillMado() or
		canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0 and canBypassBarriers()
end



-- Trade-in Item Functions
function hasAkahanaItem()
	if Tracker:ProviderCountForCode("flag_wt") <= 0 then
		return Tracker:ProviderCountForCode("onyx") > 0
	else
		return Tracker:ProviderCountForCode("akahana") > 0
	end
end

function hasBoatItem()
	if Tracker:ProviderCountForCode("flag_wt") <= 0 then
		return Tracker:ProviderCountForCode("fog") > 0
	else
		return Tracker:ProviderCountForCode("boat") > 0
	end
end

function hasKensuItem()
	if Tracker:ProviderCountForCode("flag_wt") <= 0 then
		return Tracker:ProviderCountForCode("love") > 0
	else
		return Tracker:ProviderCountForCode("kensu") > 0
	end
end

function hasQueenItem()
	if Tracker:ProviderCountForCode("flag_wt") <= 0 then
		return Tracker:ProviderCountForCode("kirisa") > 0
	else
		return Tracker:ProviderCountForCode("queen") > 0
	end
end

function hasBlobItem()
	if Tracker:ProviderCountForCode("flag_wt") <= 0 then
		return Tracker:ProviderCountForCode("ivory") > 0
	else
		return Tracker:ProviderCountForCode("blob") > 0
	end
end

function hasTornelBracelet()
	if Tracker:ProviderCountForCode("flag_wt") <= 0 then
		return wind:getProperty("level") >= 3
	end
	if Tracker:ProviderCountForCode("storm") > 0 then
		return thunder:getProperty("level") >= 3
	end
	if Tracker:ProviderCountForCode("blizzard") > 0 then
		return water:getProperty("level") >= 3
	end
	if Tracker:ProviderCountForCode("flame") > 0 then
		return fire:getProperty("level") >= 3
	end
	if Tracker:ProviderCountForCode("tornado") > 0 then
		return wind:getProperty("level") >= 3
	end
	return wind:getProperty("level") >= 3 and
		fire:getProperty("level") >= 3 and
		water:getProperty("level") >= 3 and
		thunder:getProperty("level") >= 3
end

-- Glitch and Miscellaneous Functions

function canClimbSlope()
	return
		Tracker:ProviderCountForCode("rabbit") > 0 or
		Tracker:ProviderCountForCode("flight") > 0 or
		Tracker:ProviderCountForCode("speed") > 0 and Tracker:ProviderCountForCode("flag_tb") > 0
end

function canBypassBarriers()
	return
		Tracker:ProviderCountForCode("barrier") > 0 or
		Tracker:ProviderCountForCode("refresh") > 0 and Tracker:ProviderCountForCode("shield") > 0 or
		Tracker:ProviderCountForCode("flag_hb") > 0
end

function canTriggerMesia()
	return canAccessPortoa() and Tracker:ProviderCountForCode("water") > 0 and canCrossRivers()
end

-- returns true of flag_rr is off
function rrOff()
	return Tracker:ProviderCountForCode("flag_rr") <= 0
end

-- Region Functions

-- IMPORTANT!!!
-- To avoid circular reasoning, regions DO NOT reference other regions LOWER in this list!

function canAccessBrynmaer()
	if canBreakIceWalls() then
		return true
	else
		return Tracker:ProviderCountForCode("windmill") > 0 and canBreakStoneWalls()
	end
end

function canAccessOak()
	return
		canAccessBrynmaer() and
		( Tracker:ProviderCountForCode("hazmat") > 0 or Tracker:ProviderCountForCode("flag_hg") > 0 )
end

function canAccessSabreNorth()
	return
		(
			canAccessBrynmaer() and
			( Tracker:ProviderCountForCode("teleport") > 0 or
				Tracker:ProviderCountForCode("flag_gp") > 0 ) and
			( Tracker:ProviderCountForCode("telepathy") > 0 or
				Tracker:ProviderCountForCode("flag_gr") > 0 )
		) or
		(
			-- Access Portoa
			(
				Tracker:ProviderCountForCode("flag_rp") > 0 or
				(
					Tracker:ProviderCountForCode("flag_rt") > 0 and
					Tracker:ProviderCountForCode("thunder") > 0 and
					Tracker:ProviderCountForCode("flight") > 0 and
					Tracker:ProviderCountForCode("change") > 0
				)
			) and
			Tracker:ProviderCountForCode("flight") > 0 and
			Tracker:ProviderCountForCode("prison") > 0 and
			canKillKelbesque()
		)
end

function canAccessPortoa()
	return
		Tracker:ProviderCountForCode("flag_rp") > 0 or
		(
			canAccessNadares() and
			canBreakIceWalls() and
			canKillKelbesque() and
			Tracker:ProviderCountForCode("prison") > 0
		) or
		(
			Tracker:ProviderCountForCode("flag_rt") > 0 and
			Tracker:ProviderCountForCode("thunder") > 0 and
			Tracker:ProviderCountForCode("flight") > 0 and
			Tracker:ProviderCountForCode("change") > 0
		)
end

function canAccessAmazones()
	return canAccessBrynmaer() and canCrossRivers()
end

function canReturnFogLamp()
	if
		Tracker:ProviderCountForCode("flag_rd") > 0 and
		(
			not canTriggerMesia() or
			not canCrossRivers()
		)
		then return false
	end
	return
			canAccessPortoa () and
			Tracker:ProviderCountForCode("shell") > 0 and
			hasBoatItem()
end

function canCrossSea()
	return
		Tracker:ProviderCountForCode("flight") > 0 or
		canReturnFogLamp()
end

function canAccessJoel()
	return
		(
			canAccessPortoa() and
			canCrossSea()
		) or
		(
			Tracker:ProviderCountForCode("flag_rt") > 0 and
			Tracker:ProviderCountForCode("thunder") > 0 and
			Tracker:ProviderCountForCode("flight") > 0 and
			Tracker:ProviderCountForCode("change") > 0
		)
end

function canAccessZombieTown()
	return canAccessJoel() and canCrossRivers() and canBreakStoneWalls()
end

function canAccessSwan()
	return
		(
			canAccessJoel() and
			(
				Tracker:ProviderCountForCode("flight") > 0 or
				(
					Tracker:ProviderCountForCode("broken") > 0 and
					Tracker:ProviderCountForCode("glowing") > 0
				) or
				(
					Tracker:ProviderCountForCode("flag_gf") > 0 and
					Tracker:ProviderCountForCode("rabbit") > 0
				)
			)
		) or
		(
			Tracker:ProviderCountForCode("flag_rt") > 0 and
			Tracker:ProviderCountForCode("thunder") > 0 and
			canCrossRivers() and
			Tracker:ProviderCountForCode("change") > 0
		)
end

function canAccessGoa()
	return
		(
			canAccessSwan() and
			Tracker:ProviderCountForCode("change") > 0
		) or
		(
			Tracker:ProviderCountForCode("flag_rt") > 0 and
			Tracker:ProviderCountForCode("thunder") > 0 and
			canCrossRivers()
		)
end

function canAccessShyron()
	return
		(
			canAccessGoa() and
			canCrossRivers() and
			(
				Tracker:ProviderCountForCode("flag_gt") > 0 or
				Tracker:ProviderCountForCode("change") > 0
			)
		) or
		(
			Tracker:ProviderCountForCode("flag_rt") > 0 and
			Tracker:ProviderCountForCode("thunder") > 0
		)
end

function canAccessSahara()
	return canAccessGoa() and Tracker:ProviderCountForCode("flight") > 0
end

function canAccessBarrier()
	return
		canAccessJoel() and
		Tracker:ProviderCountForCode("broken") > 0  and
		Tracker:ProviderCountForCode("glowing") > 0
end

function canAccessStxy()
	return canAccessGoa() and canCrossRivers() and Tracker:ProviderCountForCode("stxy") > 0
end
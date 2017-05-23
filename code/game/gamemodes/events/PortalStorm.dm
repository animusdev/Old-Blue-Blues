/datum/event/portalstorm

	Announce()
		command_alert("Subspace disruption detected around the vessel", "Anomaly Alert")
		LongTerm()

		var/list/possible_turfs = new
		var/turf/picked

		for(var/turf/simulated/floor/T in turfs)
			if(isStationLevel(T.z))
				possible_turfs += T

		for(var/elem in possible_turfs)
			if(prob(10))
				spawn(50+rand(0,3000))
					picked = pick(turfs)
					var/obj/portal/P = new /obj/portal(elem)
					P.target = picked
					P.creator = null
					P.icon = 'icons/obj/objects.dmi'
					P.failchance = 0
					P.icon_state = "anom"
					P.name = "wormhole"
					spawn(rand(100,150))
						qdel(P)

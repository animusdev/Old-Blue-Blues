/obj/structure/door_assembly
	name = "airlock assembly"
	icon = 'icons/obj/doors/door_assembly.dmi'
	icon_state = "door_as_0"
	anchored = 0
	density = 1
	w_class = ITEM_SIZE_NO_CONTAINER
	var/state = 0
	var/base_icon_state = ""
	var/base_name = "Airlock"
	var/obj/item/weapon/airlock_electronics/electronics = null
	var/airlock_type = "" //the type path of the airlock once completed
	var/glass_type = "/glass"
	// 0 = glass can be installed.
	// -1 = glass can't be installed.
	// 1 = glass is already installed.
	// Text = mineral plating is installed instead.
	var/glass = 0
	var/created_name = null

	New()
		..()
		update_state()

/obj/structure/door_assembly/door_assembly_com
	base_icon_state = "com"
	base_name = "Command Airlock"
	glass_type = "/glass_command"
	airlock_type = "/command"

/obj/structure/door_assembly/door_assembly_sec
	base_icon_state = "sec"
	base_name = "Security Airlock"
	glass_type = "/glass_security"
	airlock_type = "/security"

/obj/structure/door_assembly/door_assembly_eng
	base_icon_state = "eng"
	base_name = "Engineering Airlock"
	glass_type = "/glass_engineering"
	airlock_type = "/engineering"

/obj/structure/door_assembly/door_assembly_min
	base_icon_state = "min"
	base_name = "Mining Airlock"
	glass_type = "/glass_mining"
	airlock_type = "/mining"

/obj/structure/door_assembly/door_assembly_atmo
	base_icon_state = "atmo"
	base_name = "Atmospherics Airlock"
	glass_type = "/glass_atmos"
	airlock_type = "/atmos"

/obj/structure/door_assembly/door_assembly_research
	base_icon_state = "res"
	base_name = "Research Airlock"
	glass_type = "/glass_research"
	airlock_type = "/research"

/obj/structure/door_assembly/door_assembly_science
	base_icon_state = "sci"
	base_name = "Science Airlock"
	glass_type = "/glass_science"
	airlock_type = "/science"

/obj/structure/door_assembly/door_assembly_med
	base_icon_state = "med"
	base_name = "Medical Airlock"
	glass_type = "/glass_medical"
	airlock_type = "/medical"

/obj/structure/door_assembly/door_assembly_mai
	base_icon_state = "mai"
	base_name = "Maintenance Airlock"
	airlock_type = "/maintenance"
	glass = -1

/obj/structure/door_assembly/door_assembly_ext
	base_icon_state = "ext"
	base_name = "External Airlock"
	airlock_type = "/external"
	glass = -1

/obj/structure/door_assembly/door_assembly_fre
	base_icon_state = "fre"
	base_name = "Freezer Airlock"
	airlock_type = "/freezer"
	glass = -1

/obj/structure/door_assembly/door_assembly_hatch
	base_icon_state = "hatch"
	base_name = "Airtight Hatch"
	airlock_type = "/hatch"
	glass = -1

/obj/structure/door_assembly/door_assembly_mhatch
	base_icon_state = "mhatch"
	base_name = "Maintenance Hatch"
	airlock_type = "/maintenance_hatch"
	glass = -1

// Borrowing this until WJohnston makes sprites for the assembly
/obj/structure/door_assembly/door_assembly_highsecurity
	base_icon_state = "highsec"
	base_name = "High Security Airlock"
	airlock_type = "/highsecurity"
	glass = -1

/obj/structure/door_assembly/multi_tile
	icon = 'icons/obj/doors/door_assembly2x1.dmi'
	dir = EAST
	var/width = 1

/*Temporary until we get sprites.
	glass_type = "/multi_tile/glass"
	airlock_type = "/multi_tile/maint"
	glass = 1*/
	base_icon_state = "g" //Remember to delete this line when reverting "glass" var to 1.
	airlock_type = "/multi_tile/glass"
	glass = -1 //To prevent bugs in deconstruction process.

	New()
		if(dir in list(EAST, WEST))
			bound_width = width * world.icon_size
			bound_height = world.icon_size
		else
			bound_width = world.icon_size
			bound_height = width * world.icon_size
		update_state()

	Move()
		. = ..()
		if(dir in list(EAST, WEST))
			bound_width = width * world.icon_size
			bound_height = world.icon_size
		else
			bound_width = world.icon_size
			bound_height = width * world.icon_size



/obj/structure/door_assembly/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/pen))
		var/t = sanitizeSafe(input(user, "Enter the name for the door.", src.name, src.created_name), MAX_NAME_LEN)
		if(!t)	return
		if(!in_range(src, usr) && src.loc != usr)	return
		created_name = t
		return

	if(src.in_use)
		return

	if(istype(W, /obj/item/weapon/weldingtool) && (istext(glass) || (glass == 1) || !anchored))
		var/obj/item/weapon/weldingtool/WT = W
		if (WT.remove_fuel(1, user))
			src.in_use = 1
			playsound(src.loc, 'sound/items/Welder2.ogg', 50, 1)
			if(istext(glass))
				user.visible_message(
					"[user] welds the [glass] plating off the airlock assembly.",
					"You start to weld the [glass] plating off the airlock assembly."
				)
				if(do_after(user, 40, src) && glass)
					if(!src || !WT.isOn())
						src.in_use = 0
						return
					user << SPAN_NOTE("You welded the [glass] plating off!")
					create_material_stacks(glass, 2, src.loc)
					glass = 0
			else if(glass == 1)
				user.visible_message(
					"[user] welds the glass panel out of the airlock assembly.",
					"You start to weld the glass panel out of the airlock assembly."
				)
				if(do_after(user, 40, src) && glass)
					if(!src || !WT.isOn())
						src.in_use = 0
						return
					user << SPAN_NOTE("You welded the glass panel out!")
					new /obj/item/stack/material/glass/reinforced(src.loc)
					glass = 0
			else if(!anchored)
				user.visible_message(
					"[user] dissassembles the airlock assembly.",
					"You start to dissassemble the airlock assembly."
				)
				if(do_after(user, 40, src))
					if(!src || !WT.isOn())
						src.in_use = 0
						return
					user << "\blue You dissasembled the airlock assembly!"
					new /obj/item/stack/material/steel(src.loc, 4)
					qdel (src)
			src.in_use = 0
		else
			user << "<span class='warning'>You need more welding fuel.</span>"
			return

	else if(istype(W, /obj/item/weapon/wrench) && state == 0)
		src.in_use = 1
		playsound(src.loc, 'sound/items/Ratchet.ogg', 100, 1)
		if(anchored)
			user.visible_message(
				"[user] begins unsecuring the airlock assembly from the floor.",
				"You starts unsecuring the airlock assembly from the floor."
			)
		else
			user.visible_message(
				"[user] begins securing the airlock assembly to the floor.",
				"You starts securing the airlock assembly to the floor."
			)

		if(do_after(user, 40, src) && src)
			user << SPAN_NOTE("You [anchored? "un" : ""]secured the airlock assembly!")
			anchored = !anchored

		src.in_use = 0

	else if(istype(W, /obj/item/stack/cable_coil) && state == 0 && anchored)
		var/obj/item/stack/cable_coil/C = W
		if (C.get_amount() < 1)
			user << SPAN_WARN("You need one length of coil to wire the airlock assembly.")
			return

		src.in_use = 1
		user.visible_message(
			"[user] wires the airlock assembly.",
			"You start to wire the airlock assembly."
		)
		if(do_after(user, 40, src) && state == 0 && anchored)
			if (C.use(1))
				src.state = 1
				user << SPAN_NOTE("You wire the airlock.")
		src.in_use = 0

	else if(istype(W, /obj/item/weapon/wirecutters) && (state == 1))
		src.in_use = 1
		playsound(src.loc, 'sound/items/Wirecutter.ogg', 100, 1)
		user.visible_message(
			"[user] cuts the wires from the airlock assembly.",
			"You start to cut the wires from airlock assembly."
		)

		if(do_after(user, 40, src) && src && state)
			user << "<span class='notice'>You cut the airlock wires!</span>"
			new/obj/item/stack/cable_coil(src.loc, 1)
			src.state = 0
		src.in_use = 0

	else if(istype(W, /obj/item/weapon/airlock_electronics) && (state == 1))
		playsound(src.loc, 'sound/items/Screwdriver.ogg', 100, 1)
		user.visible_message(
			"[user] installs the electronics into the airlock assembly.",
			"You start to install electronics into the airlock assembly."
		)

		if(do_after(user, 40, src))
			if(!src) return
			if(electronics)
				user << SPAN_WARN("There already electronics installed.")
				return
			user.drop_from_inventory(W, src)
			user << SPAN_NOTE("You installed the airlock electronics!")
			src.state = 2
			src.name = "Near finished Airlock Assembly"
			src.electronics = W

	else if(istype(W, /obj/item/weapon/crowbar) && (state == 2))
		//This should never happen, but just in case I guess
		if (!electronics)
			user << SPAN_NOTE("There was nothing to remove.")
			src.state = 1
			return

		playsound(src.loc, 'sound/items/Crowbar.ogg', 100, 1)
		user.visible_message(
			"\The [user] starts removing the electronics from the airlock assembly.",
			"You start removing the electronics from the airlock assembly."
		)

		if(do_after(user, 40, src) && src && (state != 1))
			user << "<span class='notice'>You removed the airlock electronics!</span>"
			src.state = 1
			src.name = "Wired Airlock Assembly"
			electronics.loc = src.loc
			electronics = null

	else if(ismaterial(W) && !glass)
		src.in_use = 1
		var/obj/item/stack/S = W
		var/material_name = S.get_material_name()
		if(S && S.get_amount() >= 1)
			if(material_name == MATERIAL_RGLASS)
				playsound(src.loc, 'sound/items/Crowbar.ogg', 100, 1)
				user.visible_message(
					"[user] adds [S.name] to the airlock assembly.",
					"You start to install [S.name] into the airlock assembly."
				)
				if(do_after(user, 40, src) && !glass)
					if (S.use(1))
						user << SPAN_NOTE("You installed reinforced glass windows into the airlock assembly.")
						glass = 1
			else if(material_name)
				// Ugly hack, will suffice for now. Need to fix it upstream as well, may rewrite mineral walls. ~Z
				if(!(material_name in list(MATERIAL_GOLD, MATERIAL_SILVER, MATERIAL_DIAMOND, MATERIAL_URANIUM, MATERIAL_PHORON, MATERIAL_SANDSTONE)))
					user << SPAN_WARN("You cannot make an airlock out of that material.")
					src.in_use = 0
					return
				if(S.get_amount() >= 2)
					playsound(src.loc, 'sound/items/Crowbar.ogg', 100, 1)
					user.visible_message(
						"[user] adds [S.name] to the airlock assembly.",
						"You start to install [S.name] into the airlock assembly."
					)
					if(do_after(user, 40, src) && !glass)
						if (S.use(2))
							user << SPAN_NOTE("You installed [material_display_name(material_name)] plating into the airlock assembly.")
							glass = material_name
		src.in_use = 0

	else if(istype(W, /obj/item/weapon/screwdriver) && state == 2 )
		src.in_use = 1
		playsound(src.loc, 'sound/items/Screwdriver.ogg', 100, 1)
		user << "\blue Now finishing the airlock."

		if(do_after(user, 40, src) && src)
			user << "\blue You finish the airlock!"
			var/path
			if(istext(glass))
				path = text2path("/obj/machinery/door/airlock/[glass]")
			else if (glass == 1)
				path = text2path("/obj/machinery/door/airlock[glass_type]")
			else
				path = text2path("/obj/machinery/door/airlock[airlock_type]")

			var/obj/machinery/door/new_airlock = new path(src.loc, src)
			new_airlock.dir = src.dir
			qdel(src)
		src.in_use = 0
	else
		..()
	update_state()

/obj/structure/door_assembly/proc/update_state()
	icon_state = "door_as_[glass == 1 ? "g" : ""][istext(glass) ? glass : base_icon_state][state]"
	name = ""
	switch (state)
		if(0)
			if (anchored)
				name = "Secured "
		if(1)
			name = "Wired "
		if(2)
			name = "Near Finished "
	name += "[glass == 1 ? "Window " : ""][istext(glass) ? "[glass] Airlock" : base_name] Assembly"

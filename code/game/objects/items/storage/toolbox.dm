/obj/item/storage/toolbox
	name = "toolbox"
	desc = "Danger. Very robust."
	icon = 'icons/obj/storage.dmi'
	icon_state = "red"
	item_state = "toolbox_red"
	flags = CONDUCT
	force = 10
	throwforce = 10
	throw_speed = 1
	throw_range = 7
	w_class = ITEM_SIZE_LARGE
	max_w_class = ITEM_SIZE_NORMAL
	storage_slots = 0
	max_storage_space = DEFAULT_LARGEBOX_STORAGE //enough to hold all starting contents
	origin_tech = list(TECH_COMBAT = 1)
	attack_verb = list("robusted")

/obj/item/storage/toolbox/emergency
	name = "emergency toolbox"
	icon_state = "red"
	item_state = "toolbox_red"

/obj/item/storage/toolbox/emergency/New()
	..()
	new /obj/item/weapon/crowbar/red(src)
	new /obj/item/weapon/extinguisher/mini(src)
	if(prob(50))
		new /obj/item/device/flashlight(src)
	else
		new /obj/item/device/flashlight/flare(src)
	new /obj/item/device/radio(src)

/obj/item/storage/toolbox/mechanical
	name = "mechanical toolbox"
	icon_state = "blue"
	item_state = "toolbox_blue"

/obj/item/storage/toolbox/mechanical/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/device/analyzer(src)
	new /obj/item/weapon/wirecutters(src)

/obj/item/storage/toolbox/electrical
	name = "electrical toolbox"
	icon_state = "yellow"
	item_state = "toolbox_yellow"

/obj/item/storage/toolbox/electrical/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/t_scanner(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/stack/cable_coil/random(src,30)
	new /obj/item/stack/cable_coil/random(src,30)
	if(prob(5))
		new /obj/item/clothing/gloves/yellow(src)
	else
		new /obj/item/stack/cable_coil/random(src,30)

/obj/item/storage/toolbox/syndicate
	name = "black and red toolbox"
	icon_state = "syndicate"
	item_state = "toolbox_syndi"
	origin_tech = list(TECH_COMBAT = 1, TECH_ILLEGAL = 1)
	force = 14

/obj/item/storage/toolbox/syndicate/New()
	..()
	new /obj/item/clothing/gloves/yellow(src)
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/multitool(src)

/obj/item/organ/external/robotic
	name = "robotic"
	default_icon = 'icons/mob/human_races/cyberlimbs/robotic.dmi'
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	dislocated = -1
	cannot_break = 1
	robotic = ORGAN_ROBOT
	brute_mod = 0.8
	burn_mod = 0.8
	var/list/forced_children = null

/obj/item/organ/external/robotic/set_description(var/datum/organ_description/desc)
	src.name = "[name] [desc.name]"
	src.amputation_point = desc.amputation_point
	src.joint = desc.joint

/obj/item/organ/external/robotic/install()
	if(..()) return 1
	if(islist(forced_children) && forced_children[organ_tag])
		var/list/spawn_part = forced_children[organ_tag]
		var/child_type
		for(var/name in spawn_part)
			child_type = spawn_part[name]
			new child_type(owner, owner.species.has_limbs[name])

/obj/item/organ/external/robotic/sync_to_owner()
	for(var/obj/item/organ/I in internal_organs)
		I.sync_to_owner()

	if(gendered)
		gendered = (owner.gender == MALE)? "_m": "_f"
	body_build = owner.body_build.index

/obj/item/organ/external/robotic/get_icon()
	icon_state = "[organ_tag][gendered][body_build]"

	mob_icon = new /icon(default_icon, icon_state)
	return mob_icon

/obj/item/organ/external/robotic/apply_colors()
	return

/obj/item/organ/external/robotic/get_icon_key()
	. = "robotic[model]"

/obj/item/organ/external/robotic/Destroy()
	deactivate()
	..()

/obj/item/organ/external/robotic/removed()
	deactivate(1)
	..()

/obj/item/organ/external/robotic/update_germs()
	germ_level = 0
	return

/obj/item/organ/external/robotic/proc/can_activate()
	if(owner.sleeping || owner.stunned || owner.restrained())
		owner << SPAN_WARN("You can't do that now!")
		return

	for(var/obj/item/weapon/implant/prosthesis_inhibition/I in owner)
		if(I.malfunction)
			continue
		owner << SPAN_WARN("[I] in your [I.part] prevent [src] activation!")
		return FALSE
	return TRUE

/obj/item/organ/external/robotic/proc/activate()
/obj/item/organ/external/robotic/proc/deactivate()

/obj/item/organ/external/robotic/limb
	max_damage = 50
	min_broken_damage = 30
	w_class = 3

/obj/item/organ/external/robotic/tiny
	min_broken_damage = 15
	w_class = 2


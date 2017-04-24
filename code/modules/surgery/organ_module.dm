/datum/surgery_step/internal/install_module
	priority = 3 // Before internal organs

	allowed_tools = list(
		/obj/item/organ_module = 100
	)

	min_duration = 70
	max_duration = 90

	can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		if (!hasorgans(target))
			return 0

		var/obj/item/organ_module/OM = tool
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		if(!affected.organ_tag in OM.allowed_organs)
			user << SPAN_WARN("[OM] isn't created for [affected].")
			return 0
		return affected && !affected.module && affected.open == (affected.encased ? 3 : 2)

	begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		if (!hasorgans(target))
			return
		var/obj/item/organ/external/affected = target.get_organ(target_zone)

		user.visible_message(
			"[user] starts installing [tool] into [target]'s [affected].",
			"You start installing [tool] into [target]'s [affected]."
		)

		target.custom_pain("The pain in your [affected.name] is living hell!",1)
		..()

	end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		if (!hasorgans(target))
			return
		var/obj/item/organ/external/affected = target.get_organ(target_zone)

		user.visible_message(
			"[user] installed [tool] into [target]'s [affected].",
			"You installed [tool] into [target]'s [affected]."
		)

		if(!affected.module)
			var/obj/item/organ_module/OM = tool
			user.unEquip(OM, affected)
			affected.module = OM
			OM.install(affected)

	fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message(
			SPAN_WARN("[user]'s hand slips, scraping tissue inside [target]'s [affected.name] with \the [tool]!"),
			SPAN_WARN("Your hand slips, scraping tissue inside [target]'s [affected.name] with \the [tool]!")
		)
		affected.createwound(CUT, 20)


/datum/surgery_step/internal/module_removal
	priority = 3 // Before internal organs

	allowed_tools = list(
		/obj/item/weapon/hemostat = 100,
		/obj/item/weapon/wirecutters = 75,
		/obj/item/weapon/material/kitchen/utensil/fork = 20
	)

	min_duration = 60
	max_duration = 80

	can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)

		if (!..())
			return 0

		for(var/obj/item/organ/internal/I in target.internal_organs)
			if(I && (I.status & ORGAN_CUT_AWAY) && I.parent_organ == target_zone)
				return 0

		return ..()

	begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message(
			"[user] starts removing [affected.module], from [target]'s [affected] with \the [tool].",
			"You start removing [affected.module] from [target]'s [affected] with \the [tool]."
		)
		target.custom_pain("Someone's ripping out your [affected]!",1)
		..()

	end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message(
			SPAN_NOTE("[user] has removed [affected.module] from [target]'s [affected]."),
			SPAN_NOTE("You have removed [affected.module] from [target]'s [affected].")
		)

		var/obj/item/organ_module/OM = affected.module
		OM.remove(affected)
		affected.module = null
		OM.forceMove(get_turf(affected))

	fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
		var/obj/item/organ/external/affected = target.get_organ(target_zone)
		user.visible_message(
			SPAN_WARN("[user]'s hand slips, damaging the flesh in [target]'s [affected.name] with \the [tool]!"),
			SPAN_WARN("Your hand slips, damaging the flesh in [target]'s [affected.name] with \the [tool]!")
		)
		affected.createwound(BRUISE, 20)


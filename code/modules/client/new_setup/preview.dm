datum/preferences
	var/icon/preview_south = null
	var/icon/preview_north = null
	var/icon/preview_east  = null
	var/icon/preview_west  = null
	var/preview_dir = SOUTH

	proc/new_update_preview_icon()
		req_update_icon = 0			//No check. Can be forced.
		qdel(preview_south)
		qdel(preview_north)
		qdel(preview_east)
		qdel(preview_west)

		var/datum/body_build/body_build = current_species.get_body_build(gender, body)
		var/g = "_m"
		if(gender == FEMALE)
			g = "_f"
		var/b=body_build.index
		g+=b

		var/icon/icobase = current_species.icobase

		preview_icon = new /icon('icons/mob/human.dmi', "blank")

		var/list/organ_list = list(BP_CHEST,BP_GROIN,BP_HEAD)
		if(preview_dir & (SOUTH|WEST))
			organ_list += list(BP_R_ARM,BP_R_HAND,BP_R_LEG,BP_R_FOOT, BP_L_LEG,BP_L_FOOT,BP_L_ARM,BP_L_HAND)
		else
			organ_list += list(BP_L_LEG,BP_L_FOOT,BP_L_ARM,BP_L_HAND, BP_R_ARM,BP_R_HAND,BP_R_LEG,BP_R_FOOT)
		for(var/organ in organ_list)
			var/datum/body_modification/mod = get_modification(organ)
			if(!mod.replace_limb)
				var/icon/organ_icon
				if(organ in list(BP_HEAD, BP_CHEST, BP_GROIN))
					organ_icon = new(icobase, "[organ][g]")
				else
					organ_icon = new(icobase, "[organ][b]")
				// Skin color
				if(current_species && (current_species.flags & HAS_SKIN_COLOR))
					organ_icon.Blend(skin_color, ICON_ADD)

				// Skin tone
				if(current_species && (current_species.flags & HAS_SKIN_TONE))
					if (s_tone >= 0)
						organ_icon.Blend(rgb(s_tone, s_tone, s_tone), ICON_ADD)
					else
						organ_icon.Blend(rgb(-s_tone,  -s_tone,  -s_tone), ICON_SUBTRACT)
				preview_icon.Blend(organ_icon, ICON_OVERLAY)
			preview_icon.Blend(mod.get_mob_icon(organ, body_build, modifications_colors[organ], gender),ICON_OVERLAY)

		//Tail
		if(current_species.tail)
			var/icon/temp = new/icon(icobase, "tail")
			// Skin color
			if(current_species && (current_species.flags & HAS_SKIN_COLOR))
				temp.Blend(skin_color, ICON_ADD)

			// Skin tone
			if(current_species && (current_species.flags & HAS_SKIN_TONE))
				if (s_tone >= 0)
					temp.Blend(rgb(s_tone, s_tone, s_tone), ICON_ADD)
				else
					temp.Blend(rgb(-s_tone,  -s_tone,  -s_tone), ICON_SUBTRACT)
			preview_icon.Blend(temp, ICON_OVERLAY)

		// Underwear
		if(underwear && current_species.flags & HAS_UNDERWEAR)
			var/obj/item/clothing/hidden/H = all_underwears[underwear]
			var/t_state = initial(H.wear_state)
			if(!t_state) t_state = initial(H.icon_state)
			preview_icon.Blend(icon(body_build.hidden_icon, t_state), ICON_OVERLAY)
		// Socks
		if(socks)
			var/obj/item/clothing/hidden/H = all_socks[socks]
			var/t_state = initial(H.wear_state)
			if(!t_state) t_state = initial(H.icon_state)
			preview_icon.Blend(icon(body_build.hidden_icon, t_state), ICON_OVERLAY)
		// Undershirt
		if(undershirt && current_species.flags & HAS_UNDERWEAR)
			var/obj/item/clothing/hidden/H = all_undershirts[undershirt]
			var/t_state = initial(H.wear_state)
			if(!t_state) t_state = initial(H.icon_state)
			preview_icon.Blend(icon(body_build.hidden_icon, t_state), ICON_OVERLAY)

		// Eyes color
		var/icon/eyes = new /icon('icons/mob/human.dmi', "blank")
		var/datum/body_modification/mod = get_modification(O_EYES)
		if(!mod.replace_limb)
			eyes.Blend(new/icon(icobase, "eyes[b]"), ICON_OVERLAY)
			if((current_species && (current_species.flags & HAS_EYE_COLOR)))
				eyes.Blend(eyes_color, ICON_ADD)
		eyes.Blend(mod.get_mob_icon(O_EYES, body_build, modifications_colors[O_EYES]), ICON_OVERLAY)

		// Hair Style'n'Color
		var/datum/sprite_accessory/hair_style = hair_styles_list[h_style]
		if(hair_style)
			var/icon/hair = new/icon(hair_style.icon, hair_style.icon_state)
			hair.Blend(hair_color, ICON_ADD)
			eyes.Blend(hair, ICON_OVERLAY)

		var/datum/sprite_accessory/facial_hair_style = facial_hair_styles_list[f_style]
		if(facial_hair_style)
			var/icon/facial = new/icon(facial_hair_style.icon, facial_hair_style.icon_state)
			facial.Blend(facial_color, ICON_ADD)
			eyes.Blend(facial, ICON_OVERLAY)

		var/icon/clothes = null
		//This gives the preview icon clothes depending on which job(if any) is set to 'high'
		if(job_civilian_low & ASSISTANT || !job_master)
			clothes = new /icon(body_build.uniform_icon, "grey")
			clothes.Blend(new /icon(body_build.shoes_icon, "black"), ICON_UNDERLAY)
			if(backbag == 2)
				clothes.Blend(new /icon(body_build.back_icon, "backpack"), ICON_OVERLAY)
			else if(backbag == 3 || backbag == 4)
				clothes.Blend(new /icon(body_build.back_icon, "satchel"), ICON_OVERLAY)

		else
			var/datum/job/J = job_master.GetJob(high_job_title)
			if(J)
				var/obj/item/clothing/under/UF = J.uniform
				clothes = new /icon(body_build.uniform_icon, initial(UF.icon_state))

				var/obj/item/clothing/shoes/SH = J.shoes
				clothes.Blend(new /icon(body_build.shoes_icon, initial(SH.icon_state)), ICON_UNDERLAY)

				var/obj/item/clothing/gloves/GL = J.gloves
				if(GL) clothes.Blend(new /icon(body_build.gloves_icon, initial(GL.icon_state)), ICON_UNDERLAY)

				var/obj/item/weapon/storage/belt/BT = J.belt
				if(BT) clothes.Blend(new /icon(body_build.belt_icon, initial(BT.icon_state)), ICON_OVERLAY)

				var/obj/item/clothing/suit/ST = J.suit
				if(ST) clothes.Blend(new /icon(body_build.suit_icon, initial(ST.icon_state)), ICON_OVERLAY)

				var/obj/item/clothing/head/HT = J.hat
				if(HT) clothes.Blend(new /icon(body_build.hat_icon, initial(HT.icon_state)), ICON_OVERLAY)

				if( backbag > 1 )
					var/obj/item/weapon/storage/backpack/BP = J.backpack
					switch(backbaglist[backbag])
						if("Backpack")		BP = J.backpack
						if("Satchel")		BP = J.satchel
						if("Satchel Job")	BP = J.satchel_j
						if("Dufflebag")		BP = J.dufflebag
						if("Messenger")		BP = J.messenger
					clothes.Blend(new /icon(body_build.back_icon, initial(BP.icon_state)), ICON_OVERLAY)

		if(disabilities & NEARSIGHTED)
			preview_icon.Blend(new /icon(body_build.glasses_icon, "glasses"), ICON_OVERLAY)

		preview_icon.Blend(eyes, ICON_OVERLAY)

		if(clothes)
			preview_icon.Blend(clothes, ICON_OVERLAY)

		preview_south = new(preview_icon, dir = SOUTH)
		preview_north = new(preview_icon, dir = NORTH)
		preview_east  = new(preview_icon, dir = EAST)
		preview_west  = new(preview_icon, dir = WEST)

		qdel(eyes)
		qdel(clothes)
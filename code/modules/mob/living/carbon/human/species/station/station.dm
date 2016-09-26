/datum/species/human
	name = "Human"
	name_plural = "Humans"
	language = "Sol Common"
	primitive_form = "Monkey"
	unarmed_attacks = list(
		new /datum/unarmed_attack/stomp,
		new /datum/unarmed_attack/kick,
		new /datum/unarmed_attack/punch,
		new /datum/unarmed_attack/bite
	)
	blurb = "Humanity originated in the Sol system, and over the last five centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol government maintains control of its far-flung people, powerful corporate \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultous at best."
	min_age = 17
	max_age = 110


	flags = CAN_JOIN | HAS_SKIN_TONE | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR


/datum/species/human/cursed
	name = "Cursed huamn"
	name_plural = "Humans"
	language = "Sol Common"
	primitive_form = ""
	flags = HAS_SKIN_TONE | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | IS_RESTRICTED

/datum/species/human/cursed/handle_environment_special(var/mob/living/carbon/human/H)
	var/is_skeleton = (SKELETON in H.mutations)
	var/light_amount = 0
	if(isturf(H.loc))
		var/turf/T = H.loc
		var/atom/movable/lighting_overlay/L = locate(/atom/movable/lighting_overlay) in T
		if(L)
			light_amount = L.lum_r + L.lum_g + L.lum_b //hardcapped so it's not abused by having a ton of flashlights
		else
			light_amount =  10
	if(light_amount > 0.9)
		if(is_skeleton)
			H.mutations -= SKELETON
			H.update_hair(0)
			H.update_body()
	else
		if(!is_skeleton)
			H.mutations |= SKELETON
			H.update_hair(0)
			H.update_body()

/datum/species/human/cursed/get_bodytype()
	return "Human"

/datum/species/unathi
	name = "Unathi"
	name_plural = "Unathi"
	icobase = 'icons/mob/human_races/r_lizard.dmi'
	deform = 'icons/mob/human_races/r_def_lizard.dmi'
	language = "Sinta'unathi"
	tail = "sogtail"
	tail_animation = 'icons/mob/species/unathi/tail.dmi'
	unarmed_attacks = list(
		new /datum/unarmed_attack/stomp,
		new /datum/unarmed_attack/kick,
		new /datum/unarmed_attack/claws,
		new /datum/unarmed_attack/bite/sharp
	)
	primitive_form = "Stok"
	darksight = 3
	gluttonous = 1
	slowdown = 0.5
	brute_mod = 0.8

	min_age = 18
	max_age = 60

	blurb = "A heavily reptillian species, Unathi (or 'Sinta as they call themselves) hail from the \
	Uuosa-Eso system, which roughly translates to 'burning mother'.<br/><br/>Coming from a harsh, radioactive \
	desert planet, they mostly hold ideals of honesty, virtue, martial combat and bravery above all \
	else, frequently even their own lives. They prefer warmer temperatures than most species and \
	their native tongue is a heavy hissing laungage called Sinta'Unathi."

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

	flags = CAN_JOIN | IS_WHITELISTED | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#34AF10"

	reagent_tag = IS_UNATHI
	base_color = "#066000"

	heat_discomfort_level = 295
	heat_discomfort_strings = list(
		"You feel soothingly warm.",
		"You feel the heat sink into your bones.",
		"You feel warm enough to take a nap."
		)

	cold_discomfort_level = 292
	cold_discomfort_strings = list(
		"You feel chilly.",
		"You feel sluggish and cold.",
		"Your scales bristle against the cold."
		)

	accent = list("�"="��", "�"="��", "�"="��",\
				  "�"="��", "�"="��", "�"="��")
	accentFL = list("�" = "�", "�" = "�")

	restricted_jobs = list("Captain", "Head of Personnel", "Head of Security", "Chief Engineer",\
						"Research Director", "Chief Medical Officer", "Detective",\
						"Medical Doctor", "Geneticist", "Chemist", "Scientist", "Roboticist",\
						"Xenobiologist", "Quartermaster", "Internal Affairs Agent")

/datum/species/unathi/equip_survival_gear(var/mob/living/carbon/human/H)
	..()
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes)

/datum/species/tajaran
	name = "Tajara"
	name_plural = "Tajaran"
	icobase = 'icons/mob/human_races/r_tajaran.dmi'
	deform = 'icons/mob/human_races/r_def_tajaran.dmi'
	language = "Siik'tajr"
	tail = "tajtail"
	tail_animation = 'icons/mob/species/tajaran/tail.dmi'
	unarmed_attacks = list(
		new /datum/unarmed_attack/stomp,
		new /datum/unarmed_attack/kick,
		new /datum/unarmed_attack/claws,
		new /datum/unarmed_attack/bite/sharp
	)
	darksight = 8
	slowdown = -0.5
	brute_mod = 1.15
	burn_mod =  1.15
	gluttonous = 1

	min_age = 17
	max_age = 80

	blurb = "The Tajaran race is a species of feline-like bipeds hailing from the planet of Ahdomai in the \
	S'randarr system. They have been brought up into the space age by the Humans and Skrell, and have been \
	influenced heavily by their long history of Slavemaster rule. They have a structured, clan-influenced way \
	of family and politics. They prefer colder environments, and speak a variety of languages, mostly Siik'Maas, \
	using unique inflections their mouths form."

	cold_level_1 = 200 //Default 260
	cold_level_2 = 140 //Default 200
	cold_level_3 = 80  //Default 120

	heat_level_1 = 330 //Default 360
	heat_level_2 = 380 //Default 400
	heat_level_3 = 800 //Default 1000

	primitive_form = "Farwa"

	flags = CAN_JOIN | IS_WHITELISTED | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"

	reagent_tag = IS_TAJARA

	heat_discomfort_level = 292
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)
	cold_discomfort_level = 275
	restricted_jobs = list("Captain", "Head of Personnel", "Head of Security", "Chief Engineer",\
						"Research Director", "Chief Medical Officer", "Warden", "Detective", "Security Officer",\
						"Medical Doctor", "Geneticist", "Scientist", "Roboticist", "Xenobiologist",\
						"Quartermaster", "Internal Affairs Agent")
	accent = list("�" = "��", "�" = "��")

/datum/species/tajaran/equip_survival_gear(var/mob/living/carbon/human/H)
	..()
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes)

/datum/species/skrell
	name = "Skrell"
	name_plural = "Skrell"
	icobase = 'icons/mob/human_races/r_skrell.dmi'
	deform = 'icons/mob/human_races/r_def_skrell.dmi'
	language = "Skrellian"
	primitive_form = "Neaera"
	unarmed_attacks = list(new /datum/unarmed_attack/punch)
	blurb = "An amphibious species, Skrell come from the star system known as Qerr'Vallis, which translates to 'Star of \
	the royals' or 'Light of the Crown'.<br/><br/>Skrell are a highly advanced and logical race who live under the rule \
	of the Qerr'Katish, a caste within their society which keeps the empire of the Skrell running smoothly. Skrell are \
	herbivores on the whole and tend to be co-operative with the other species of the galaxy, although they rarely reveal \
	the secrets of their empire to their allies."

	min_age = 19
	max_age = 80

	flags = CAN_JOIN | IS_WHITELISTED | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR

	flesh_color = "#8CD7A3"
	blood_color = "#1D2CBF"
	base_color = "#006666"

	reagent_tag = IS_SKRELL
	restricted_jobs = list("Captain", "Head of Personnel", "Head of Security", "Chief Engineer", "Warden",\
						"Detective", "Security Officer", "Station Engineer", "Atmospheric Technician",\
						"Quartermaster", "Cargo Technician", "Shaft Miner")

/datum/species/diona
	name = "Diona"
	name_plural = "Dionaea"
	icobase = 'icons/mob/human_races/r_diona.dmi'
	deform = 'icons/mob/human_races/r_def_plant.dmi'
	language = "Rootspeak"
	unarmed_attacks = list(
		new /datum/unarmed_attack/stomp,
		new /datum/unarmed_attack/kick,
		new /datum/unarmed_attack/diona
	)
	//primitive_form = "Nymph"
	slowdown = 7
	rarity_value = 3
	hud = new /datum/hud_data/diona
	siemens_coefficient = 0.3
	show_ssd = "completely quiescent"

	min_age = 1
	max_age = 300

	blurb = "Commonly referred to (erroneously) as 'plant people', the Dionaea are a strange space-dwelling collective \
	species hailing from Epsilon Ursae Minoris. Each 'diona' is a cluster of numerous cat-sized organisms called nymphs; \
	there is no effective upper limit to the number that can fuse in gestalt, and reports exist	of the Epsilon Ursae \
	Minoris primary being ringed with a cloud of singing space-station-sized entities.<br/><br/>The Dionaea coexist peacefully with \
	all known species, especially the Skrell. Their communal mind makes them slow to react, and they have difficulty understanding \
	even the simplest concepts of other minds. Their alien physiology allows them survive happily off a diet of nothing but light, \
	water and other radiation."

	has_organ = list(
		"nutrient channel" =   /obj/item/organ/internal/nutrients,
		"neural strata" =      /obj/item/organ/internal/diona/strata,
		"response node" =      /obj/item/organ/internal/node,
		"gas bladder" =        /obj/item/organ/internal/diona/bladder,
		"polyp segment" =      /obj/item/organ/internal/diona/polyp,
		"anchoring ligament" = /obj/item/organ/internal/diona/ligament
	)

	has_limbs = list(
		"chest" =  new /datum/organ_description/diona,
		"groin" =  new /datum/organ_description/groin/diona,
		"head" =   new /datum/organ_description/head/diona,
		"l_arm" =  new /datum/organ_description/arm/left/diona,
		"r_arm" =  new /datum/organ_description/arm/right/diona,
		"l_leg" =  new /datum/organ_description/leg/left/diona,
		"r_leg" =  new /datum/organ_description/leg/right/diona,
		"l_hand" = new /datum/organ_description/hand/left/diona,
		"r_hand" = new /datum/organ_description/hand/right/diona,
		"l_foot" = new /datum/organ_description/foot/left/diona,
		"r_foot" = new /datum/organ_description/foot/right/diona,
	)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/diona_split_nymph
	)

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 2000
	heat_level_2 = 3000
	heat_level_3 = 4000

	body_temperature = T0C + 15		//make the plant people have a bit lower body temperature, why not

	flags = CAN_JOIN | IS_WHITELISTED | NO_BREATHE | NO_SCAN | IS_PLANT | NO_BLOOD | NO_PAIN | NO_SLIP | REGENERATES_LIMBS

	blood_color = "#004400"
	flesh_color = "#907E4A"

	reagent_tag = IS_DIONA
	restricted_jobs = list("Captain", "Head of Personnel", "Head of Security", "Chief Engineer",\
						"Research Director", "Chief Medical Officer", "Warden", "Detective", "Security Officer",\
						"Station Engineer", "Atmospheric Technician", "Medical Doctor", "Geneticist", "Paramedic",\
						"Scientist", "Roboticist", "Bartender", "Quartermaster", "Internal Affairs Agent")

/datum/species/diona/can_understand(var/mob/other)
	var/mob/living/carbon/alien/diona/D = other
	if(istype(D))
		return 1
	return 0

/datum/species/diona/equip_survival_gear(var/mob/living/carbon/human/H)
	if(H.back && istype(H.back, /obj/item/weapon/storage))
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/flare(H.back), slot_in_backpack)
	else
		H.equip_to_slot_or_del(new /obj/item/device/flashlight/flare(H), slot_r_hand)

/datum/species/diona/handle_post_spawn(var/mob/living/carbon/human/H)
	H.gender = NEUTER
	return ..()

/datum/species/diona/handle_death(var/mob/living/carbon/human/H)

	var/mob/living/carbon/alien/diona/S = new(get_turf(H))

	if(H.mind)
		H.mind.transfer_to(S)

	if(H.isSynthetic())
		H.visible_message("<span class='danger'>\The [H] collapses into parts, revealing a solitary diona nymph at the core.</span>")
		return

	for(var/mob/living/carbon/alien/diona/D in H.contents)
		if(D.client)
			D.forceMove(get_turf(H))
		else
			qdel(D)

	H.visible_message("<span class='danger'>\The [H] splits apart with a wet slithering noise!</span>")

/datum/species/machine
	name = "Machine"
	name_plural = "machines"

	icobase = 'icons/mob/human_races/r_machine.dmi'
	deform = 'icons/mob/human_races/r_machine.dmi'
	language = "EAL"
	unarmed_attacks = list(
		new /datum/unarmed_attack/punch
		)
	rarity_value = 2

	brute_mod = 0.5
	burn_mod = 1
	show_ssd = "flashing a 'system offline' glyph on their monitor"

	warning_low_pressure = 50
	hazard_low_pressure = 0

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 500		//gives them about 25 seconds in space before taking damage
	heat_level_2 = 1000
	heat_level_3 = 2000

	passive_temp_gain = 10 //this should cause IPCs to stabilize at ~80 C in a 20 C environment.

	flags = CAN_JOIN | IS_WHITELISTED | NO_BREATHE | NO_SCAN | NO_BLOOD | NO_PAIN | IS_SYNTHETIC

	blood_color = "#1F181F"
	flesh_color = "#575757"
	allow_slim_fem = 1

	has_organ = list() //TODO: Positronic brain.

	restricted_jobs = list("Captain", "Head of Personnel", "Head of Security", "Chief Engineer",\
						"Research Director", "Chief Medical Officer", "Warden", "Detective",\
						"Security Officer", "Medical Doctor", "Geneticist",\
						"Psychiatrist", "Paramedic", "Quartermaster", "Shaft Miner", "Internal Affairs Agent")

/datum/species/machine/equip_survival_gear(var/mob/living/carbon/human/H)
	return

/datum/species/machine/handle_death(var/mob/living/carbon/human/H)
	..()
	if(flags & IS_SYNTHETIC)
		H.h_style = ""
		spawn(100)
			if(H) H.update_hair()

/datum/species/monkey
	name = SPECIES_MONKEY
	name_plural = "Monkeys"
	blurb = "Ook."

	icobase = 'icons/mob/human_races/monkeys/monkey.dmi'
	deform = 'icons/mob/human_races/monkeys/monkey.dmi'
	damage_overlays = 'icons/mob/human_races/masks/dam_monkey.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_monkey.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_monkey.dmi'
	language = null
	default_language = "Chimpanzee"
	greater_form = SPECIES_HUMAN
	is_small = 1
	has_fine_manipulation = 0
	show_ssd = null

	gibbed_anim = "gibbed-m"
	dusted_anim = "dust-m"
	death_message = "lets out a faint chimper as it collapses and stops moving..."
	tail = "chimptail"

	unarmed_attacks = list(
		new /datum/unarmed_attack/bite,
		new /datum/unarmed_attack/claws
		)
	inherent_verbs = list(/mob/living/proc/ventcrawl)
	hud = new /datum/hud_data/monkey
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/monkey
	holder_type = /obj/item/weapon/holder/monkey

	rarity_value = 0.1
	total_health = 75
	brute_mod = 1.5
	burn_mod = 1.5

	flags = IS_RESTRICTED

	bump_flag = MONKEY
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL|ALIEN

/datum/species/monkey/handle_npc(var/mob/living/carbon/human/H)
	if(H.stat != CONSCIOUS)
		return
	if(prob(33) && H.canmove && isturf(H.loc) && !H.pulledby) //won't move if being pulled
		step(H, pick(cardinal))
	if(prob(1))
		H.emote(pick("scratch","jump","roll","tail"))

/datum/species/monkey/get_random_name()
	return "[lowertext(name)] ([rand(100,999)])"

/datum/species/monkey/tajaran
	name = SPECIES_FARWA
	name_plural = "Farwa"

	icobase = 'icons/mob/human_races/monkeys/farwa.dmi'
	deform = 'icons/mob/human_races/monkeys/farwa.dmi'

	greater_form = SPECIES_TAJARA
	default_language = "Farwa"
	flesh_color = "#AFA59E"
	base_color = "#333333"
	tail = "farwatail"
	holder_type = /obj/item/weapon/holder/monkey/farwa

/datum/species/monkey/skrell
	name = SPECIES_NEAERA
	name_plural = "Neaera"

	icobase = 'icons/mob/human_races/monkeys/neaera.dmi'
	deform = 'icons/mob/human_races/monkeys/neaera.dmi'

	greater_form = SPECIES_SKRELL
	default_language = "Neaera"
	flesh_color = "#8CD7A3"
	blood_color = "#1D2CBF"
	reagent_tag = IS_SKRELL
	tail = null
	holder_type = /obj/item/weapon/holder/monkey/neaera

/datum/species/monkey/unathi
	name = SPECIES_STOK
	name_plural = "Stok"

	icobase = 'icons/mob/human_races/monkeys/stok.dmi'
	deform = 'icons/mob/human_races/monkeys/stok.dmi'

	tail = "stoktail"
	greater_form = SPECIES_UNATHI
	default_language = "Stok"
	flesh_color = "#34AF10"
	base_color = "#066000"
	reagent_tag = IS_UNATHI
	holder_type = /obj/item/weapon/holder/monkey/stok

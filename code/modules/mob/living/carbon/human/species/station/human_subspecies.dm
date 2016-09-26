

datum/species/human/vatgrown
	name = "Vat-grown Human"
	name_plural = "Vat-grown Humans"
	blurb = "With cloning on the forefront of human scientific advancement, cheap mass production \
	of bodies is a very real and rather ethically grey industry. Vat-grown humans tend to be paler than \
	baseline, with no appendix and fewer inherited genetic disabilities, but a weakened metabolism."
	icobase = 'icons/mob/human_races/r_vatgrown.dmi'
	allow_slim_fem = 1

	flags = CAN_JOIN | HAS_UNDERWEAR | HAS_EYE_COLOR

//	toxins_mod =   1.1
	has_organ = list(
		"heart" =    /obj/item/organ/internal/heart,
		"lungs" =    /obj/item/organ/internal/lungs,
		"liver" =    /obj/item/organ/internal/liver,
		"kidneys" =  /obj/item/organ/internal/kidneys,
		"brain" =    /obj/item/organ/internal/brain,
		"eyes" =     /obj/item/organ/internal/eyes
		)

/datum/species/human/vatgrown/get_bodytype()
	return "Human"


datum/species/human/android
	name = "Synth"
	name_plural = "Synths"
	blurb = "Synths are an artificial life forms designed to look and act like a human.\
	Most of them have a lab-grown bodies of real flesh, bones, and organs in a way to copy Human physiology and mentality.\
	Synths have blue biogel instead of blood and strong skeleton, what allows them to work in very hard conditions."
	icobase = 'icons/mob/human_races/r_android.dmi'
	deform = 'icons/mob/human_races/r_def_android.dmi'
	allow_slim_fem = 1

	taste_sensitivity = TASTE_DULL

	flags = CAN_JOIN | NO_PAIN | NO_SCAN | HAS_UNDERWEAR | IS_WHITELISTED

	blood_color = "#2299FC"
	flesh_color = "#808D11"

	brute_mod = 0.5
	burn_mod = 1

	has_organ = list(                                     //TODO: Positronic brain.
		"liver" =    /obj/item/organ/internal/liver,
		"heart" =    /obj/item/organ/internal/heart,
		"lungs" =    /obj/item/organ/internal/lungs,
		"kidneys" =  /obj/item/organ/internal/kidneys,
		)

/datum/species/human/android/get_bodytype()
	return "Human"

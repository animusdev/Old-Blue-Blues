//Wizard Rig
/obj/item/clothing/head/helmet/space/void/wizard
	name = "gem-encrusted voidsuit helmet"
	desc = "A bizarre gem-encrusted helmet that radiates magical energies."
	icon_state = "rig0-wiz"
	item_state = "wiz_helm"
	unacidable = 1 //No longer shall our kind be foiled by lone chemists with spray bottles!
	armor = list(melee = 40, bullet = 20, laser = 20,energy = 20, bomb = 35, bio = 100, rad = 60)
	siemens_coefficient = 0.3
	sprite_sheets_refit = null
	sprite_sheets_obj = null
	wizard_garb = 1

/obj/item/clothing/suit/space/void/wizard
	icon_state = "rig-wiz"
	name = "gem-encrusted voidsuit"
	desc = "A bizarre gem-encrusted suit that radiates magical energies."
	item_state = "wiz_voidsuit"
	slowdown = 1
	w_class = ITEM_SIZE_LARGE //normally voidsuits are bulky but this one is magic I suppose
	unacidable = 1
	armor = list(melee = 40, bullet = 20, laser = 20,energy = 20, bomb = 35, bio = 100, rad = 60)
	siemens_coefficient = 0.3
	sprite_sheets_refit = null
	sprite_sheets_obj = null
	wizard_garb = 1

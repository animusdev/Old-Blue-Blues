/*
 *	Everything derived from the common cardboard box.
 *	Basically everything except the original is a kit (starts full).
 *
 *	Contains:
 *		Empty box, starter boxes (survival/engineer),
 *		Latex glove and sterile mask boxes,
 *		Syringe, beaker, dna injector boxes,
 *		Blanks, flashbangs, and EMP grenade boxes,
 *		Tracking and chemical implant boxes,
 *		Prescription glasses and drinking glass boxes,
 *		Condiment bottle and silly cup boxes,
 *		Donkpocket and monkeycube boxes,
 *		ID and security PDA cart boxes,
 *		Handcuff, mousetrap, and pillbottle boxes,
 *		Snap-pops and matchboxes,
 *		Replacement light boxes.
 *
 *		For syndicate call-ins see uplink_kits.dm
 */

/obj/item/storage/box
	name = "box"
	desc = "It's just an ordinary box."
	icon_state = "box"
	item_state = "syringe_kit"
	max_storage_space = DEFAULT_BOX_STORAGE
	// BubbleWrap - if set, can be folded (when empty) into a sheet of cardboard
	var/foldable = /obj/item/stack/material/cardboard
	max_w_class = ITEM_SIZE_SMALL

/obj/item/storage/box/large
	name = "large box"
	icon_state = "largebox"
	w_class = ITEM_SIZE_LARGE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_LARGEBOX_STORAGE

// BubbleWrap - A box can be folded up to make card
/obj/item/storage/box/attack_self(mob/user as mob)
	if(..()) return

	//try to fold it.
	if ( contents.len )
		return

	if ( !ispath(src.foldable) )
		return
	var/found = 0
	// Close any open UI windows first
	for(var/mob/M in range(1))
		if (M.s_active == src)
			src.close(M)
		if ( M == user )
			found = 1
	if ( !found )	// User is too far away
		return
	// Now make the cardboard
	user << "<span class='notice'>You fold [src] flat.</span>"
	new src.foldable(get_turf(src))
	qdel(src)

/obj/item/storage/box/survival/New()
	..()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/weapon/tank/emergency_oxygen(src)

/obj/item/storage/box/vox/New()
	..()
	new /obj/item/clothing/mask/vox_breath(src)
	new /obj/item/weapon/tank/emergency_nitrogen(src)

/obj/item/storage/box/engineer/New()
	..()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/weapon/tank/emergency_oxygen/engi(src)

/obj/item/storage/box/gloves
	name = "box of latex gloves"
	desc = "Contains white gloves."
	icon_state = "latex"

/obj/item/storage/box/gloves/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/clothing/gloves/latex(src)

/obj/item/storage/box/ems
	name = "box of nitrile gloves"
	desc = "Contains black gloves."
	icon_state = "nitrile"

/obj/item/storage/box/ems/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/clothing/gloves/latex/emt(src)

/obj/item/storage/box/masks
	name = "box of sterile masks"
	desc = "This box contains masks of sterility."
	icon_state = "sterile"

/obj/item/storage/box/masks/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/clothing/mask/surgical(src)

/obj/item/storage/box/syringes
	name = "box of syringes"
	desc = "A box full of syringes."
	icon_state = "syringe"

/obj/item/storage/box/syringes/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/syringe(src)

/obj/item/storage/box/beakers
	name = "box of beakers"
	icon_state = "beaker"

/obj/item/storage/box/beakers/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/glass/beaker(src)
/*
/obj/item/storage/box/injectors
	name = "box of DNA injectors"
	desc = "This box contains injectors it seems."
*/
/obj/item/storage/box/blanks
	name = "box of blank shells"
	desc = "It has a picture of a gun and several warning symbols on the front."
	icon_state = "practiceshot_box"

/obj/item/storage/box/blanks/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/shotgun/blank(src)

/obj/item/storage/box/beanbags
	name = "box of beanbag shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	icon_state = "rubbershot_box"

/obj/item/storage/box/beanbags/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/shotgun/beanbag(src)

/obj/item/storage/box/shotgunammo
	name = "box of shotgun slugs"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	icon_state = "slugshot_box"

/obj/item/storage/box/shotgunammo/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/shotgun(src)

/obj/item/storage/box/shotgunshells
	name = "box of shotgun shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	icon_state = "lethalshot_box"

/obj/item/storage/box/shotgunshells/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/shotgun/pellet(src)

/obj/item/storage/box/flashshells
	name = "box of illumination shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	icon_state = "flashshot_box"

/obj/item/storage/box/flashshells/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/shotgun/flash(src)

/obj/item/storage/box/stunshells
	name = "box of stun shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	icon_state = "stunshot_box"

/obj/item/storage/box/stunshells/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/shotgun/stunshell(src)

/obj/item/storage/box/practiceshells
	name = "box of practice shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."
	icon_state = "practiceshot_box"

/obj/item/storage/box/practiceshells/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/shotgun/practice(src)

/obj/item/storage/box/sniperammo
	name = "box of 14.5mm shells"
	desc = "It has a picture of a gun and several warning symbols on the front.<br>WARNING: Live ammunition. Misuse may result in serious injury or death."

/obj/item/storage/box/sniperammo/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/a145(src)

/obj/item/storage/box/flashbangs
	name = "box of flashbangs (WARNING)"
	desc = "<B>WARNING: These devices are extremely dangerous and can cause blindness or deafness in repeated use.</B>"
	icon_state = "flashbang"

/obj/item/storage/box/flashbangs/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/grenade/flashbang(src)

/obj/item/storage/box/teargas
	name = "box of teargas grenades (WARNING)"
	desc = "<B>WARNING: These devices are extremely dangerous and can cause blindness in repeated use.</B>"
	icon_state = "flashbang"

/obj/item/storage/box/teargas/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/grenade/chem_grenade/teargas(src)

/obj/item/storage/box/emps
	name = "box of emp grenades"
	desc = "A box containing 5 military grade EMP grenades.<br> WARNING: Do not use near unshielded electronics or biomechanical augmentations, death or permanent paralysis may occur."
	icon_state = "flashbang"

/obj/item/storage/box/emps/New()
	..()
	for(var/i = 1 to 5)
		new /obj/item/weapon/grenade/empgrenade(src)

/obj/item/storage/box/smoke
	name = "box of smoke grenades (WARNING)"
	desc = "<B>WARNING: These devices are extremely dangerous and can cause blindness in repeated use.</B>"
	icon_state = "flashbang"

/obj/item/storage/box/smoke/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/grenade/smokebomb(src)

/obj/item/storage/box/trackimp
	name = "boxed tracking implant kit"
	desc = "Box full of scum-bag tracking utensils."
	icon_state = "implant"

/obj/item/storage/box/trackimp/New()
	..()
	for(var/i = 1 to 4)
		new /obj/item/weapon/implantcase/tracking(src)
	new /obj/item/weapon/implanter(src)
	new /obj/item/weapon/implantpad(src)
	new /obj/item/weapon/locator(src)

/obj/item/storage/box/chemimp
	name = "boxed chemical implant kit"
	desc = "Box of stuff used to implant chemicals."
	icon_state = "implant"

/obj/item/storage/box/chemimp/New()
	..()
	for(var/i = 1 to 5)
		new /obj/item/weapon/implantcase/chem(src)
	new /obj/item/weapon/implanter(src)
	new /obj/item/weapon/implantpad(src)

/obj/item/storage/box/inhibitionimp
	name = "boxed prosthesis inhibition implant kit"
	desc = "Box of stuff used to deactivate and lock human prosthesis or embed modules."
	icon_state = "implant"

/obj/item/storage/box/inhibitionimp/New()
	..()
	for(var/i = 1 to 5)
		new /obj/item/weapon/implant/prosthesis_inhibition(src)
	new /obj/item/weapon/implanter(src)
	new /obj/item/weapon/implantpad(src)

/obj/item/storage/box/rxglasses
	name = "box of prescription glasses"
	desc = "This box contains nerd glasses."
	icon_state = "glasses"

/obj/item/storage/box/rxglasses/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/clothing/glasses/regular(src)

/obj/item/storage/box/drinkingglasses
	name = "box of drinking glasses"
	desc = "It has a picture of drinking glasses on it."

/obj/item/storage/box/drinkingglasses/New()
	..()
	for(var/i = 1 to 6)
		new /obj/item/weapon/reagent_containers/glass/drinks/drinkingglass(src)

/obj/item/storage/box/cdeathalarm_kit
	name = "death alarm kit"
	desc = "Box of stuff used to implant death alarms."
	icon_state = "implant"

/obj/item/storage/box/cdeathalarm_kit/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/implantcase/death_alarm(src)
	new /obj/item/weapon/implanter(src)

/obj/item/storage/box/condimentbottles
	name = "box of condiment bottles"
	desc = "It has a large ketchup smear on it."

/obj/item/storage/box/condimentbottles/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/condiment(src)

/obj/item/storage/box/cups
	name = "box of paper cups"
	desc = "It has pictures of paper cups on the front."

/obj/item/storage/box/cups/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/glass/drinks/sillycup(src)

/obj/item/storage/box/donkpockets
	name = "box of donk-pockets"
	desc = "<B>Instructions:</B> <I>Heat in microwave. Product will cool if not eaten within seven minutes.</I>"
	icon_state = "donk_kit"

/obj/item/storage/box/donkpockets/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/food/snacks/donkpocket(src)

/obj/item/storage/box/sinpockets
	name = "box of sin-pockets"
	desc = "<B>Instructions:</B> <I>Crush bottom of package to initiate chemical heating. Wait for 20 seconds before consumption. Product will cool if not eaten within seven minutes.</I>"
	icon_state = "donk_kit"

/obj/item/storage/box/sinpockets/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/food/snacks/donkpocket/sinpocket(src)

/obj/item/storage/box/monkeycubes
	name = "monkey cube box"
	desc = "Drymate brand monkey cubes. Just add water!"
	icon = 'icons/obj/food.dmi'
	icon_state = "monkeycubebox"
	can_hold = list(/obj/item/weapon/reagent_containers/food/snacks/monkeycube)

/obj/item/storage/box/monkeycubes/New()
	..()
	if(src.type == /obj/item/storage/box/monkeycubes)
		for(var/i = 1 to 4)
			new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped(src)

/obj/item/storage/box/monkeycubes/farwacubes
	name = "farwa cube box"
	desc = "Drymate brand farwa cubes, shipped from Ahdomai. Just add water!"

/obj/item/storage/box/monkeycubes/farwacubes/New()
	..()
	for(var/i = 1 to 4)
		new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/farwacube(src)

/obj/item/storage/box/monkeycubes/stokcubes
	name = "stok cube box"
	desc = "Drymate brand stok cubes, shipped from Moghes. Just add water!"

/obj/item/storage/box/monkeycubes/stokcubes/New()
	..()
	for(var/i = 1 to 4)
		new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/stokcube(src)

/obj/item/storage/box/monkeycubes/neaeracubes
	name = "neaera cube box"
	desc = "Drymate brand neaera cubes, shipped from Jargon 4. Just add water!"

/obj/item/storage/box/monkeycubes/neaeracubes/New()
	..()
	for(var/i = 1 to 4)
		new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/neaeracube(src)

/obj/item/storage/box/ids
	name = "box of spare IDs"
	desc = "Has so many empty IDs."
	icon_state = "id"

/obj/item/storage/box/ids/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/card/id(src)

/obj/item/storage/box/seccarts
	name = "box of spare R.O.B.U.S.T. Cartridges"
	desc = "A box full of R.O.B.U.S.T. Cartridges, used by Security."
	icon_state = "pda"

/obj/item/storage/box/seccarts/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/cartridge/security(src)

/obj/item/storage/box/handcuffs
	name = "box of spare handcuffs"
	desc = "A box full of handcuffs."
	icon_state = "handcuff"

/obj/item/storage/box/handcuffs/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/handcuffs(src)

/obj/item/storage/box/mousetraps
	name = "box of Pest-B-Gon mousetraps"
	desc = "<B><FONT color='red'>WARNING:</FONT></B> <I>Keep out of reach of children</I>."
	icon_state = "mousetraps"

/obj/item/storage/box/mousetraps/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/device/assembly/mousetrap(src)

/obj/item/storage/box/pillbottles
	name = "box of pill bottles"
	desc = "It has pictures of pill bottles on its front."

/obj/item/storage/box/pillbottles/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/storage/pill_bottle(src)

/obj/item/storage/box/snappops
	name = "snap pop box"
	desc = "Eight wrappers of fun! Ages 8 and up. Not suitable for children."
	icon = 'icons/obj/toy.dmi'
	icon_state = "spbox"
	can_hold = list(/obj/item/toy/snappop)

/obj/item/storage/box/snappops/New()
	..()
	for(var/i = 1 to 8)
		new /obj/item/toy/snappop(src)

/obj/item/storage/box/matches
	name = "matchbox"
	desc = "A small box of 'Space-Proof' premium matches."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "matchbox"
	item_state = "zippo"
	sprite_group = null
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_BELT
	can_hold = list(/obj/item/weapon/flame/match)

/obj/item/storage/box/matches/New()
	..()
	for(var/i=1 to 10)
		new /obj/item/weapon/flame/match(src)

/obj/item/storage/box/matches/attackby(obj/item/weapon/flame/match/W as obj, mob/user as mob)
	if(istype(W) && !W.lit && !W.burnt)
		W.lit = 1
		W.damtype = "burn"
		W.icon_state = "match_lit"
		processing_objects.Add(W)
	W.update_icon()
	return

/obj/item/storage/box/autoinjectors
	name = "box of injectors"
	desc = "Contains autoinjectors."
	icon_state = "syringe"

/obj/item/storage/box/autoinjectors/New()
	..()
	for (var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/hypospray/autoinjector(src)

/obj/item/storage/box/lights
	name = "box of replacement bulbs"
	icon = 'icons/obj/storage.dmi'
	icon_state = "light"
	desc = "This box is shaped on the inside so that only light tubes and bulbs fit."
	storage_slots=21
	can_hold = list(/obj/item/weapon/light/tube, /obj/item/weapon/light/bulb)
	max_storage_space = 42 //holds 21 items of w_class 2
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/storage/box/lights/bulbs/New()
	..()
	for(var/i = 1 to 24)
		new /obj/item/weapon/light/bulb(src)

/obj/item/storage/box/lights/tubes
	name = "box of replacement tubes"
	icon_state = "lighttube"

/obj/item/storage/box/lights/tubes/New()
	..()
	for(var/i = 1 to 24)
		new /obj/item/weapon/light/tube(src)

/obj/item/storage/box/lights/mixed
	name = "box of replacement lights"
	icon_state = "lightmixed"

/obj/item/storage/box/lights/mixed/New()
	..()
	for(var/i = 1 to 16)
		new /obj/item/weapon/light/tube(src)
	for(var/i = 1 to 8)
		new /obj/item/weapon/light/bulb(src)

/obj/item/storage/box/freezer
	name = "portable freezer"
	desc = "This nifty shock-resistant device will keep your 'groceries' nice and non-spoiled."
	icon = 'icons/obj/storage.dmi'
	icon_state = "portafreezer"
	item_state = "medicalpack"
	sprite_group = SPRITE_BACKPACK
	foldable = null
	max_w_class = ITEM_SIZE_NORMAL
	w_class = ITEM_SIZE_HUGE
	can_hold = list(/obj/item/organ, /obj/item/weapon/reagent_containers/food, /obj/item/weapon/reagent_containers/glass)
	max_storage_space = DEFAULT_BACKPACK_STORAGE
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/storage/box/freezer/Entered(var/atom/movable/AM)
	if(istype(AM, /obj/item/organ))
		var/obj/item/organ/O = AM
		O.preserved = 1
		for(var/obj/item/organ/organ in O)
			organ.preserved = 1
	..()

/obj/item/storage/box/freezer/Exited(var/atom/movable/AM)
	if(istype(AM, /obj/item/organ))
		var/obj/item/organ/O = AM
		O.preserved = 0
		for(var/obj/item/organ/organ in O)
			organ.preserved = 0
	..()

/obj/item/storage/box/underwear
	icon_state = "underwear"
	name = "underwear box"
	can_hold = list(/obj/item/clothing/hidden)
	storage_slots = 9
	max_storage_space = 9

/obj/item/storage/box/underwear/New()
	var/tmp_type
	for(var/i = 1 to 3)
		tmp_type = pick(subtypesof(/obj/item/clothing/hidden/underwear))
		new tmp_type(src)
	for(var/i = 1 to 3)
		tmp_type = pick(subtypesof(/obj/item/clothing/hidden/undershirt))
		new tmp_type(src)
	for(var/i = 1 to 3)
		tmp_type = pick(subtypesof(/obj/item/clothing/hidden/socks))
		new tmp_type(src)
	..()


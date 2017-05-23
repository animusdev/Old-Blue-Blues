/* Gifts and wrapping paper
 * Contains:
 *		Gifts
 *		Wrapping Paper
 */

/*
 * Gifts
 */
/obj/item/weapon/a_gift
	name = "gift"
	desc = "PRESENTS!!!! eek!"
	icon = 'icons/obj/items.dmi'
	icon_state = "gift1"
	item_state = "gift1"
	randpixel = 10

/obj/item/weapon/a_gift/New()
	..()
	if(w_class > 0 && w_class < ITEM_SIZE_HUGE)
		icon_state = "gift[w_class]"
	else
		icon_state = "gift[pick(1, 2, 3)]"
	return

/obj/item/weapon/a_gift/ex_act()
	qdel(src)
	return

/obj/effect/spresent/relaymove(mob/user as mob)
	if (user.stat)
		return
	user << "\blue You cant move."

/obj/effect/spresent/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()

	if (!istype(W, /obj/item/weapon/wirecutters))
		user << "\blue I need wirecutters for that."
		return

	user << "\blue You cut open the present."

	for(var/mob/M in src) //Should only be one but whatever.
		M.loc = src.loc
		if (M.client)
			M.client.eye = M.client.mob
			M.client.perspective = MOB_PERSPECTIVE

	qdel(src)

/obj/item/weapon/a_gift/attack_self(mob/M as mob)
	var/gift_type = pick(/obj/item/weapon/sord,
		/obj/item/storage/wallet,
		/obj/item/storage/photo_album,
		/obj/item/storage/box/snappops,
		/obj/item/storage/fancy/crayons,
		/obj/item/storage/backpack/holding,
		/obj/item/storage/belt/champion,
		/obj/item/weapon/soap/deluxe,
		/obj/item/weapon/pickaxe/silver,
		/obj/item/weapon/pen/invisible,
		/obj/item/weapon/lipstick/random,
		/obj/item/weapon/grenade/smokebomb,
		/obj/item/weapon/corncob,
		/obj/item/weapon/contraband/poster,
		/obj/item/weapon/book/manual/barman_recipes,
		/obj/item/weapon/book/manual/chef_recipes,
		/obj/item/weapon/bikehorn,
		/obj/item/weapon/beach_ball,
		/obj/item/weapon/beach_ball/holoball,
		/obj/item/weapon/banhammer,
		/obj/item/toy/balloon,
		/obj/item/toy/blink,
		/obj/item/toy/crossbow,
		/obj/item/toy/gun,
		/obj/item/toy/katana,
		/obj/item/toy/prize/deathripley,
		/obj/item/toy/prize/durand,
		/obj/item/toy/prize/fireripley,
		/obj/item/toy/prize/gygax,
		/obj/item/toy/prize/honk,
		/obj/item/toy/prize/marauder,
		/obj/item/toy/prize/mauler,
		/obj/item/toy/prize/odysseus,
		/obj/item/toy/prize/phazon,
		/obj/item/toy/prize/ripley,
		/obj/item/toy/prize/seraph,
		/obj/item/toy/spinningtoy,
		/obj/item/toy/sword,
		/obj/item/weapon/reagent_containers/food/snacks/grown/ambrosiadeus,
		/obj/item/weapon/reagent_containers/food/snacks/grown/ambrosiavulgaris,
		/obj/item/device/paicard,
		/obj/item/device/violin,
		/obj/item/storage/belt/utility/full,
		/obj/item/clothing/accessory/horrible)

	if(!ispath(gift_type,/obj/item))	return

	var/obj/item/I = new gift_type(M)
	M.remove_from_mob(src)
	M.put_in_hands(I)
	I.add_fingerprint(M)
	qdel(src)
	return

/*
 * Wrapping Paper and Gifts
 */

/obj/item/weapon/gift
	name = "gift"
	desc = "A wrapped item."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift3"
	var/size = 3.0
	var/obj/item/gift = null
	item_state = "gift"
	w_class = ITEM_SIZE_HUGE

/obj/item/weapon/gift/New(newloc, obj/item/wrapped = null)
	..(newloc)

	if(istype(wrapped))
		gift = wrapped
		w_class = gift.w_class
		gift.forceMove(src)

		//a good example of where we don't want to use the w_class defines
		switch(gift.w_class)
			if(1) icon_state = "gift1"
			if(2) icon_state = "gift1"
			if(3) icon_state = "gift2"
			if(4) icon_state = "gift2"
			else  icon_state = "gift3"

/obj/item/weapon/gift/attack_self(mob/user as mob)
	user.unEquip(src)
	if(src.gift)
		user.put_in_hands(gift)
		src.gift.add_fingerprint(user)
	else
		user << SPAN_WARN("The gift was empty!")
	qdel(src)
	return

/obj/item/weapon/gift/new_year/New()
	var/surprize = pick(/obj/item/clothing/head/witchwig,
		/obj/item/clothing/head/philosopher_wig,
		/obj/item/clothing/head/pirate,
		/obj/item/clothing/head/collectable/rabbitears,
		/obj/item/clothing/head/collectable/kitty,
//		/obj/item/clothing/head/collectable/slime,
		/obj/item/clothing/head/collectable/slime2,
		/obj/item/clothing/head/collectable/tophat,
		/obj/item/clothing/head/collectable/amp,
		/obj/item/clothing/head/collectable/crown,
		/obj/item/clothing/head/wizard/fake,
		/obj/item/clothing/head/collectable/marisa,
		/obj/item/clothing/head/collectable/suzumiyarabbitears,
		/obj/item/clothing/head/collectable/mikururabbitears,
		/obj/item/clothing/head/collectable/metroid,
		/obj/item/clothing/head/cueball,
		/obj/item/clothing/head/collectable/women_blue_hat,
		/obj/item/clothing/head/collectable/secelitetop)
	gift = new surprize

/*
 * Wrapping Paper
 */
/obj/item/weapon/wrapping_paper
	name = "wrapping paper"
	desc = "You can use this to wrap items in."
	icon = 'icons/obj/items.dmi'
	icon_state = "wrap_paper"
	var/amount = 20.0

/obj/item/weapon/wrapping_paper/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if (!( locate(/obj/structure/table, src.loc) ))
		user << "\blue You MUST put the paper on a table!"
	if (W.w_class < ITEM_SIZE_HUGE)
		if ((istype(user.l_hand, /obj/item/weapon/wirecutters) || istype(user.r_hand, /obj/item/weapon/wirecutters)))
			var/a_used = W.get_storage_cost()
			if (a_used == ITEM_SIZE_NO_CONTAINER)
				user << SPAN_WARN("You can't wrap that!")

				return
			if (src.amount < a_used)
				user << SPAN_WARN("You need more paper!")
				return
			else
				if(istype(W, /obj/item/smallDelivery) || istype(W, /obj/item/weapon/gift)) //No gift wrapping gifts!
					return

				if(user.unEquip(W))
					var/obj/item/weapon/gift/G = new(src.loc, W)
					G.add_fingerprint(user)
					W.add_fingerprint(user)
					src.add_fingerprint(user)
					src.amount -= a_used

			if (src.amount <= 0)
				new /obj/item/weapon/c_tube( src.loc )
				qdel(src)
				return
		else
			user << SPAN_WARN("You need scissors!")
	else
		user << SPAN_WARN("The object is FAR too large!")
	return


/obj/item/weapon/wrapping_paper/examine(mob/user, return_dist=1)
	. = ..()
	if(.<3)
		user << "There is about [amount] square units of paper left!"

/obj/item/weapon/wrapping_paper/attack(mob/living/carbon/human/H as mob, mob/user as mob)
	if (!istype(H)) return
	if (istype(H.wear_suit, /obj/item/clothing/suit/straight_jacket) || H.stat)
		if (src.amount > 2)
			var/obj/effect/spresent/present = new /obj/effect/spresent (H.loc)
			src.amount -= 2

			if (H.client)
				H.client.perspective = EYE_PERSPECTIVE
				H.client.eye = present

			H.forceMove(present)

			admin_attack_log(user, H,
				"Used the [src.name] to wrap [H.name] ([H.ckey])",
				"Has been wrapped with [src.name]  by [user.name] ([user.ckey])",
				"used [src] to wrap [key_name(H)]"
			)

		else
			user << "\blue You need more paper."
	else
		user << "They are moving around too much. A straightjacket would help."

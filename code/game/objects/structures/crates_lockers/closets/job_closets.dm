/* Closets for specific jobs
 * Contains:
 *		Bartender
 *		Janitor
 *		Lawyer
 */

/*
 * Bartender
 */
/obj/structure/closet/gmcloset
	name = "formal closet"
	desc = "It's a storage unit for formal clothing."
	icon_state = "black"

/obj/structure/closet/gmcloset/New()
	..()
	new /obj/item/clothing/head/that(src)
	new /obj/item/clothing/head/that(src)
	new /obj/item/device/radio/headset/service(src)
	new /obj/item/device/radio/headset/service(src)
	new /obj/item/clothing/head/hairflower
	new /obj/item/clothing/under/sl_suit(src)
	new /obj/item/clothing/under/sl_suit(src)
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/clothing/under/dress/saloon(src)
	new /obj/item/clothing/shoes/black(src)
	new /obj/item/clothing/shoes/black(src)

/*
 * Chef
 */
/obj/structure/closet/chefcloset
	name = "chef's closet"
	desc = "It's a storage unit for foodservice garments."
	icon_state = "black"

/obj/structure/closet/chefcloset/New()
	..()
	new /obj/item/clothing/under/sundress(src)
	new /obj/item/clothing/under/waiter(src)
	new /obj/item/clothing/under/waiter(src)
	new /obj/item/device/radio/headset/service(src)
	new /obj/item/device/radio/headset/service(src)
	new /obj/item/storage/box/mousetraps(src)
	new /obj/item/storage/box/mousetraps(src)
	new /obj/item/clothing/under/rank/chef(src)
	new /obj/item/clothing/head/chefhat(src)

/*
 * Janitor
 */
/obj/structure/closet/jcloset
	name = "custodial closet"
	desc = "It's a storage unit for janitorial clothes and gear."
	icon_state = "mixed"

/obj/structure/closet/jcloset/New()
	..()
	new /obj/item/clothing/under/rank/janitor(src)
	new /obj/item/device/radio/headset/service(src)
	new /obj/item/weapon/cartridge/janitor(src)
	new /obj/item/clothing/gloves/black(src)
	new /obj/item/clothing/head/soft/purple(src)
	new /obj/item/clothing/head/beret/jan(src)
	new /obj/item/device/flashlight(src)
	new /obj/item/weapon/caution(src)
	new /obj/item/weapon/caution(src)
	new /obj/item/weapon/caution(src)
	new /obj/item/weapon/caution(src)
	new /obj/item/device/lightreplacer(src)
	new /obj/item/storage/bag/trash(src)
	new /obj/item/storage/belt/janitor(src)
	new /obj/item/clothing/shoes/galoshes(src)

/*
 * Lawyer
 */
/obj/structure/closet/lawcloset
	name = "legal closet"
	desc = "It's a storage unit for courtroom apparel and items."
	icon_state = "blue"

/obj/structure/closet/lawcloset/New()
	..()
	new /obj/item/clothing/under/lawyer/female(src)
	new /obj/item/clothing/under/lawyer/black(src)
	new /obj/item/clothing/under/lawyer/red(src)
	new /obj/item/clothing/under/lawyer/bluesuit(src)
	new /obj/item/clothing/under/lawyer/bluesuit(src)
	new /obj/item/clothing/suit/storage/toggle/lawyer/bluejacket(src)
	new /obj/item/clothing/suit/storage/toggle/lawyer/bluejacket(src)
	new /obj/item/clothing/under/lawyer/purpsuit(src)
	new /obj/item/clothing/under/lawyer/purpsuit(src)
	new /obj/item/clothing/suit/storage/lawyer/purpjacket(src)
	new /obj/item/clothing/shoes/brown(src)
	new /obj/item/clothing/shoes/brown(src)
	new /obj/item/clothing/shoes/black(src)
	new /obj/item/clothing/shoes/black(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/glasses/sunglasses/big(src)
	new /obj/item/clothing/glasses/sunglasses/big(src)
	new /obj/item/clothing/under/rank/internalaffairs(src)
	new /obj/item/clothing/under/rank/internalaffairsdress(src)
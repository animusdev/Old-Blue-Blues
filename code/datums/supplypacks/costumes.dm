/*
*	Here is where any supply packs
*	related to weapons live.
*/


/datum/supply_packs/costumes
	group = "Costumes"

/datum/supply_packs/randomised/costumes
	group = "Costumes"

/datum/supply_packs/costumes/wizard
	name = "Wizard costume"
	contains = list(
		/obj/item/weapon/staff,
		/obj/item/clothing/suit/wizrobe/fake,
		/obj/item/clothing/shoes/sandal,
		/obj/item/clothing/head/wizard/fake
	)
	cost = 20
	containertype = /obj/structure/closet/crate
	containername = "Wizard costume crate"

/datum/supply_packs/randomised/costumes/hats
	num_contained = 4
	contains = list(
		/obj/item/clothing/head/collectable/chef,
		/obj/item/clothing/head/collectable/paper,
		/obj/item/clothing/head/collectable/tophat,
		/obj/item/clothing/head/collectable/captain,
		/obj/item/clothing/head/collectable/beret,
		/obj/item/clothing/head/collectable/welding,
		/obj/item/clothing/head/collectable/flatcap,
		/obj/item/clothing/head/collectable/pirate,
		/obj/item/clothing/head/collectable/kitty,
		/obj/item/clothing/head/collectable/rabbitears,
		/obj/item/clothing/head/collectable/wizard,
		/obj/item/clothing/head/collectable/hardhat,
		/obj/item/clothing/head/collectable/HoS,
		/obj/item/clothing/head/collectable/thunderdome,
		/obj/item/clothing/head/collectable/swat,
		/obj/item/clothing/head/collectable/slime2,
		/obj/item/clothing/head/collectable/police,
		/obj/item/clothing/head/collectable/slime2,
		/obj/item/clothing/head/collectable/xenom,
		/obj/item/clothing/head/collectable/petehat
	)
	name = "Collectable hat crate!"
	cost = 200
	containertype = /obj/structure/closet/crate
	containername = "Collectable hats crate! Brought to you by Bass.inc!"

/datum/supply_packs/randomised/costumes/costume
	num_contained = 3
	contains = list(
		/obj/item/clothing/suit/storage/pirate,
		/obj/item/clothing/suit/judgerobe,
		/obj/item/clothing/suit/wcoat,
		/obj/item/clothing/suit/hastur,
		/obj/item/clothing/suit/holidaypriest,
		/obj/item/clothing/suit/nun,
		/obj/item/clothing/suit/imperium_monk,
		/obj/item/clothing/suit/ianshirt,
		/obj/item/clothing/under/rank/captain/green,
		/obj/item/clothing/under/rank/hop/teal,
		/obj/item/clothing/under/lawyer/purpsuit,
		/obj/item/clothing/under/rank/mailman,
		/obj/item/clothing/under/dress/saloon,
		/obj/item/clothing/accessory/suspenders,
		/obj/item/clothing/suit/bio_suit/plaguedoctorsuit,
		/obj/item/clothing/under/schoolgirl,
		/obj/item/clothing/under/owl,
		/obj/item/clothing/under/waiter,
		/obj/item/clothing/under/gladiator,
		/obj/item/clothing/under/soviet,
		/obj/item/clothing/under/scratch,
		/obj/item/clothing/under/wedding/bride_white,
		/obj/item/clothing/suit/chef,
		/obj/item/clothing/suit/apron/overalls,
		/obj/item/clothing/under/redcoat,
		/obj/item/clothing/under/kilt
	)
	name = "Costumes crate"
	cost = 10
	containertype = /obj/structure/closet/crate
	containername = "Actor Costumes"

/datum/supply_packs/costumes/formal_wear
	contains = list(
		/obj/item/clothing/head/bowlerhat,
		/obj/item/clothing/head/that,
		/obj/item/clothing/suit/storage/toggle/internalaffairs,
		/obj/item/clothing/suit/storage/toggle/lawyer/bluejacket,
//		/obj/item/clothing/suit/storage/toggle/lawyer/purpjacket,
		/obj/item/clothing/suit/storage/lawyer/purpjacket,
		/obj/item/clothing/under/suit_jacket,
		/obj/item/clothing/under/suit_jacket/female,
		/obj/item/clothing/under/suit_jacket/really_black,
		/obj/item/clothing/under/suit_jacket/red,
		/obj/item/clothing/under/lawyer/bluesuit,
		/obj/item/clothing/under/lawyer/purpsuit,
		/obj/item/clothing/shoes/black = 2,
		/obj/item/clothing/shoes/leather,
		/obj/item/clothing/suit/wcoat
	)
	name = "Formalwear closet"
	cost = 30
	containertype = /obj/structure/closet
	containername = "Formalwear for the best occasions."

datum/supply_packs/costumes/witch
	name = "Witch costume"
	containername = "Witch costume"
	containertype = /obj/structure/closet
	cost = 20
	contains = list(
		/obj/item/clothing/suit/wizrobe/marisa/fake,
		/obj/item/clothing/shoes/sandal,
		/obj/item/clothing/head/wizard/marisa/fake,
		/obj/item/weapon/staff/broom
	)

/datum/supply_packs/randomised/costumes/costume_hats
	name = "Costume hats"
	containername = "Actor hats crate"
	containertype = /obj/structure/closet/crate
	cost = 10
	num_contained = 3
	contains = list(
		/obj/item/clothing/head/redcoat,
		/obj/item/clothing/head/mailman,
		/obj/item/clothing/head/plaguedoctorhat,
		/obj/item/clothing/head/pirate,
		/obj/item/clothing/head/hasturhood,
		/obj/item/clothing/head/powdered_wig,
		/obj/item/clothing/head/hairflower,
		/obj/item/clothing/mask/gas/owl_mask,
		/obj/item/clothing/mask/gas/monkeymask,
		/obj/item/clothing/head/helmet/gladiator,
		/obj/item/clothing/head/ushanka
	)

/datum/supply_packs/randomised/costumes/dresses
	name = "Womens formal dress locker"
	containername = "Pretty dress locker"
	containertype = /obj/structure/closet
	cost = 15
	num_contained = 3
	contains = list(
		/obj/item/clothing/under/wedding/bride_orange,
		/obj/item/clothing/under/wedding/bride_purple,
		/obj/item/clothing/under/wedding/bride_blue,
		/obj/item/clothing/under/wedding/bride_red,
		/obj/item/clothing/under/wedding/bride_white,
		/obj/item/clothing/under/sundress,
		/obj/item/clothing/under/dress/green,
		/obj/item/clothing/under/dress/pink,
		/obj/item/clothing/under/dress/orange,
		/obj/item/clothing/under/dress/yellow,
		/obj/item/clothing/under/dress/saloon
	)

/datum/supply_packs/costumes/knight
	contains = list(
		/obj/item/clothing/suit/armor/knight,
		/obj/item/clothing/head/helmet/knight
	)
	name = "Knight Armor Pack"
	cost = 60
	containertype = /obj/structure/closet/crate/secure
	containername = "Knight Armor"

/datum/supply_packs/costumes/knight/blue
	contains = list(
		/obj/item/clothing/suit/armor/knight/blue,
		/obj/item/clothing/head/helmet/knight/blue
	)
	name = "Knight Armor Pack, Blue"

/datum/supply_packs/costumes/knight/red
	contains = list(
		/obj/item/clothing/suit/armor/knight/red,
		/obj/item/clothing/head/helmet/knight/red
	)
	name = "Knight Armor Pack, Red"

/datum/supply_packs/costumes/knight/yellow
	contains = list(
		/obj/item/clothing/suit/armor/knight/yellow,
		/obj/item/clothing/head/helmet/knight/yellow
	)
	name = "Knight Armor Pack, Yellow"

/datum/supply_packs/costumes/knight/green
	contains = list(
		/obj/item/clothing/suit/armor/knight/green,
		/obj/item/clothing/head/helmet/knight/green
	)
	name = "Knight Armor Pack, Green"

/datum/supply_packs/costumes/knight/templar
	contains = list(
		/obj/item/clothing/suit/armor/knight/templar,
		/obj/item/clothing/head/helmet/knight/templar
	)
	name = "Knight Armor Pack, Templar"

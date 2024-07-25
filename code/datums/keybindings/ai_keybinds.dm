/datum/keybinding/ai
	category = KB_CATEGORY_AI

/datum/keybinding/ai/can_use(client/C, mob/M)
	return isAI(M) && ..()

/datum/keybinding/ai/to_core
	name = "Jump to Core"
	keys = list("1")

/datum/keybinding/ai/to_core/down(client/C)
	. = ..()
	var/mob/living/silicon/ai/AI = C.mob
	AI.view_core()

/datum/keybinding/ai/store_location
	//Which location we're storing.
	var/location_number

/datum/keybinding/ai/store_location/down(client/C)
	. = ..()
	var/mob/living/silicon/ai/AI = C.mob
	if(AI.store_location(location_number))
		to_chat(AI, "<span class='notice'>Successfully set location [location_number].</span>")

/datum/keybinding/ai/store_location/one
	name = "Store Location One"
	keys = list("Ctrl2")
	location_number = 1

/datum/keybinding/ai/store_location/two
	name = "Store Location Two"
	keys = list("Ctrl3")
	location_number = 2

/datum/keybinding/ai/store_location/three
	name = "Store Location Three"
	keys = list("Ctrl4")
	location_number = 3

/datum/keybinding/ai/store_location/four
	name = "Store Location Four"
	keys = list("Ctrl5")
	location_number = 4

/datum/keybinding/ai/store_location/five
	name = "Store Location Five"
	keys = list("Ctrl6")
	location_number = 5

/datum/keybinding/ai/store_location/six
	name = "Store Location Six"
	keys = list("Ctrl7")
	location_number = 6

/datum/keybinding/ai/store_location/seven
	name = "Store Location Seven"
	keys = list("Ctrl8")
	location_number = 7

/datum/keybinding/ai/store_location/eight
	name = "Store Location Eight"
	keys = list("Ctrl9")
	location_number = 8

/datum/keybinding/ai/store_location/nine
	name = "Store Location Nine"
	keys = list("Ctrl0")
	location_number = 9

/datum/keybinding/ai/to_location
	var/location_number

/datum/keybinding/ai/to_location/down(client/C)
	. = ..()
	var/mob/living/silicon/ai/AI = C.mob

	if(AI.stored_locations[location_number] == "unset")
		to_chat(AI, "<span class='warning'>You haven't set location [location_number] yet!</span>")
		return

	AI.eyeobj.setLoc(AI.stored_locations[location_number])

/datum/keybinding/ai/to_location/one
	name = "Jump to Location One"
	keys = list("2")
	location_number = 1

/datum/keybinding/ai/to_location/two
	name = "Jump to Location Two"
	keys = list("3")
	location_number = 2

/datum/keybinding/ai/to_location/three
	name = "Jump to Location Three"
	keys = list("4")
	location_number = 3

/datum/keybinding/ai/to_location/four
	name = "Jump to Location Four"
	keys = list("5")
	location_number = 4

/datum/keybinding/ai/to_location/five
	name = "Jump to Location Five"
	keys = list("6")
	location_number = 5

/datum/keybinding/ai/to_location/six
	name = "Jump to Location Six"
	keys = list("7")
	location_number = 6

/datum/keybinding/ai/to_location/seven
	name = "Jump to Location Seven"
	keys = list("8")
	location_number = 7

/datum/keybinding/ai/to_location/eight
	name = "Jump to Location Eight"
	keys = list("9")
	location_number = 8

/datum/keybinding/ai/to_location/nine
	name = "Jump to Location Nine"
	keys = list("0")
	location_number = 9

/datum/keybinding/ai/switch_intent/down(client/C)
	. = ..()
	var/mob/living/silicon/ai/AI = C.mob
	AI.a_intent_change(INTENT_HOTKEY_LEFT)

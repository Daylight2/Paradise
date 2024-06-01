GLOBAL_DATUM(plmaster, /obj/effect/overlay)
GLOBAL_DATUM(slmaster, /obj/effect/overlay)

GLOBAL_VAR_INIT(CELLRATE, 0.002)  // conversion ratio between a watt-tick and kilojoule
GLOBAL_VAR_INIT(CHARGELEVEL, 0.001) // Cap for how fast cells charge, as a percentage-per-tick (.001 means cellcharge is capped to 1% per second)

// Announcer intercom, because too much stuff creates an intercom for one message then qdel()s it.
GLOBAL_DATUM_INIT(global_announcer, /obj/item/radio/intercom, create_global_announcer())
GLOBAL_DATUM_INIT(command_announcer, /obj/item/radio/intercom/command, create_command_announcer())

// Load order issues means this can't be new'd until other code runs
// This is probably not the way I should be doing this, but I don't know how to do it right!
/proc/create_global_announcer()
	spawn(0)
		GLOB.global_announcer = new(null)
		GLOB.global_announcer.config(list("Common", "Engineering", "Medical", "Supply", "Command", "Science", "Service", "Security", "Procedure"))
	return

/proc/create_command_announcer()
	spawn(0)
		GLOB.command_announcer = new(null)
	return

///Library Catalog global is for storing a library catalog datum that will track book, category, and report lists for the library
GLOBAL_DATUM_INIT(library_catalog, /datum/library_catalog, new())

GLOBAL_LIST_INIT(paper_tag_whitelist, list("center","p","div","span","h1","h2","h3","h4","h5","h6","hr","pre",	\
	"big","small","font","i","u","b","s","sub","sup","tt","br","hr","ol","ul","li","caption","col",	\
	"table","td","th","tr"))
GLOBAL_LIST_INIT(paper_blacklist, list("java","onblur","onchange","onclick","ondblclick","onfocus","onkeydown",	\
	"onkeypress","onkeyup","onload","onmousedown","onmousemove","onmouseout","onmouseover",	\
	"onmouseup","onreset","onselect","onsubmit","onunload"))

GLOBAL_VAR_INIT(gravity_is_on, 1) //basically unused, just one admin verb..

#define TAB "&nbsp;&nbsp;&nbsp;&nbsp;"

GLOBAL_VAR_INIT(timezoneOffset, 0) // The difference betwen midnight (of the host computer) and 0 world.ticks.

// For FTP requests. (i.e. downloading runtime logs.)
// However it'd be ok to use for accessing attack logs and such too, which are even laggier.
GLOBAL_VAR_INIT(fileaccess_timer, 0)

GLOBAL_VAR_INIT(gametime_offset, 432000) // 12:00 in seconds

GLOBAL_DATUM_INIT(data_core, /datum/datacore, new) // Station datacore, manifest, etc

GLOBAL_LIST_INIT(pipe_colors, list("grey" = PIPE_COLOR_GREY, "red" = PIPE_COLOR_RED, "blue" = PIPE_COLOR_BLUE, "cyan" = PIPE_COLOR_CYAN, "green" = PIPE_COLOR_GREEN, "yellow" = PIPE_COLOR_YELLOW, "purple" = PIPE_COLOR_PURPLE))

/// Global list of all /datum/mod_theme
GLOBAL_LIST_INIT(mod_themes, setup_mod_themes())

GLOBAL_DATUM(main_supermatter_engine, /obj/machinery/atmospherics/supermatter_crystal)

///Global list for descriptors
GLOBAL_LIST_INIT(character_physiques, list("rail thin", "thin", "average", "well-built", "muscular", "overweight"))

GLOBAL_LIST_INIT(character_heights, list("very short", "short", "average height", "tall", "very tall"))

///AI core display and holograms
///These do not support costum sprites, but they're still avaible to those who have them once in game
GLOBAL_LIST_INIT(core_display_choices, list("Monochrome", "Blue", "Clown", "Inverted", "Text", "Smiley", "Angry", "Dorf",
	"Matrix", "Bliss", "Firewall", "Green", "Red", "Static", "Triumvirate",
	"Triumvirate Static", "Red October", "Sparkles", "ANIMA", "President", "NT",
	"NT2", "Rainbow", "Angel", "Heartline", "Hades", "Helios", "Syndicat Meow",
	"Too Deep", "Goon", "Murica", "Fuzzy", "Glitchman", "House", "Database", "Alien",
	"Tiger", "Fox", "Vox", "Lizard", "Dark Matter", "Cheese", "Rainbow Slime",
	"Void Donut", "NAD Burn", "Borb", "Bee", "Catamari"))

GLOBAL_LIST_INIT(hologram_animals, list(
		"Bear", "Carp", "Chicken", "Corgi", "Cow", "Crab", "Deer", "Fox", "Goat",
		"Goose", "Kitten", "Kitten2", "Pig", "Poly", "Pug", "Seal", "Spider",
		"Turkey", "Shantak", "Bunny", "Hellhound", "Lightgeist", "Cockroach",
		"Mecha-Cat", "Mecha-Fairy", "Mecha-Fox", "Mecha-Monkey", "Mecha-Mouse",
		"Mecha-Snake", "Roller-Mouse", "Roller-Monkey"))

GLOBAL_LIST_INIT(hologram_unique, list(
	"default", "floating face", "xeno queen", "eldritch", "ancient machine", "angel",
	"borb", "biggest fan", "cloudkat", "donut", "frost phoenix", "engi bot",
	"drone", "boxbot"))

#define GLOBAL_SPARK_LIMIT 500
/// Counter for the current amount of sparks
GLOBAL_VAR_INIT(sparks_active, 0)

#define GLOBAL_SMOKE_LIMIT 200
///Counter for the current amount of smoke
GLOBAL_VAR_INIT(smokes_active, 0)

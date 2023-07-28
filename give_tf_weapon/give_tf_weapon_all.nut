//-----------------------------------------------------------------------------
// This file holds all the data tables for every weapon in TF2.
//-----------------------------------------------------------------------------

::TF_WEAPONSLOTS <- {
  PRIMARY = -0.0
  SECONDARY = -1
  MELEE = -2
  SLOT3 = -3
  SLOT4 = -4
  SLOT5 = -5
  SLOT6 = -6
  MISC = "misc"
}

::TF_AMMO_PER_CLASS_PRIMARY <- [
	0,
	32,
	25,
	20
	16,
	150
	200,
	200,
	20,
	32,
	0,
]

::TF_AMMO_PER_CLASS_SECONDARY <- [
	0,
	36,
	75,
	32,
	24,
	150,
	32,
	32,
	24,
	200,
	0,
]

::GTFW_Saxxy <-
[
	"tf_weapon_fireaxe",	//MULTI-CLASS
	"tf_weapon_bat",	//SCOUT
	"tf_weapon_club",	//SNIPER
	"tf_weapon_shovel",	//SOLDIER
	"tf_weapon_bottle",	//DEMO
	"tf_weapon_bonesaw",	//MEDIC
	"tf_weapon_fireaxe",	//HEAVY
	"tf_weapon_fireaxe",	//PYRO
	"tf_weapon_knife",	//SPY
	"tf_weapon_wrench",	//ENGINEER
	"tf_weapon_fireaxe",	//CIVILIAN
]

class ::TF_WEAPONS_BASE
{
	tf_class	= null
	slot		= null
	className	= null
	itemID		= null
	ammo_type	= null
	clip		= null
	reserve		= null
	w_model		= null
	v_model		= null
	wearable	= null
	func		= null
	class_arms	= null

	constructor(TF_class, TF_slot, weapon, id, ammotype, prim, sec, world_model, view_model, extra_wearable, Function, class_armz)
	{
		tf_class	= TF_class
		slot		= TF_slot
		className	= weapon
		itemID		= id
		ammo_type	= ammotype
		clip		= prim
		reserve		= sec
		w_model		= world_model
		v_model		= view_model
		wearable	= extra_wearable
		func		= Function
		class_arms	= class_armz
	}
}

class TF_WEAPONS
{
	tf_class	= null
	slot		= null
	className	= null
	itemID		= null
	itemID2 	= null
	itemString	= null
	itemString2	= null
	ammo_type	= null
	clip		= null
	reserve		= null
	wearable	= null

	constructor(TF_class, TF_slot, weapon, id, id2, item, item2, ammotype, prim, sec, extra_wearable)
	{
		tf_class	= TF_class
		slot		= TF_slot
		className	= weapon
		itemID		= id
		itemID2		= id2
		itemString	= item
		itemString2	= item2
		ammo_type	= ammotype
		clip		= prim
		reserve		= sec
		wearable	= extra_wearable
	}
}
class TF_WEAPONS_RESKIN
{
	tf_class	= null
	slot		= null
	className	= null
	itemID		= null
	itemID2 	= null
	itemID3		= null
	itemID4		= null
	itemID5 	= null
	itemID6 	= null
	itemID7 	= null
	itemID8 	= null
	itemID9 	= null
	itemID10 	= null
	itemID11	= null
	itemID12 	= null
	itemID13 	= null

	ammo_type	= null
	clip		= null
	reserve		= null
	wearable	= null

	constructor(TF_class, TF_slot, weapon, id, id2, id3, id4, id5, id6, id7, id8, id9, id10, id11, id12, id13, ammotype, prim, sec)
	{
		tf_class	= TF_class
		slot		= TF_slot
		className	= weapon
		itemID		= id
		itemID2		= id2
		itemID3		= id3
		itemID4		= id4
		itemID5		= id5
		itemID6		= id6
		itemID7		= id7
		itemID8		= id8
		itemID9		= id9
		itemID10	= id10
		itemID11	= id11
		itemID12	= id12
		itemID13	= id13

		ammo_type	= ammotype
		clip		= prim
		reserve		= sec
	}
}
class TF_WEP_FEST
{
	tf_class	= null
	slot		= null
	className	= null
	itemID		= null
	itemString	= null
	itemString2	= null

	ammo_type	= null
	clip		= null
	reserve		= null
	wearable	= null

	constructor(TF_class, TF_slot, weapon, id, item, item2, ammotype, prim, sec, extra_wearable)
	{
		tf_class	= TF_class
		slot		= TF_slot
		className	= weapon
		itemID		= id
		itemString	= item
		itemString2	= item2

		ammo_type	= ammotype
		clip		= prim
		reserve		= sec
		wearable	= extra_wearable
	}
}
class TF_CUSTOM_WEPS
{
	itemString	= null
	className	= null
	slot		= null
	tf_class	= null
	itemID		= null
	func		= null
	class_arms	= null
	ammo_type	= null
	clip		= null
	reserve		= null
	w_model		= null
	v_model		= null
	wearable	= null

	constructor(name, weapon, TF_class, Slot, id, Function, classarms, ammoslot, prim, sec, world_model, view_model, extra_wearable)
	{
		itemString	= name
		className	= weapon
		tf_class	= TF_class
		slot		= Slot
		itemID		= id
		func		= Function
		class_arms	= classarms
		ammo_type	= ammoslot
		clip		= prim
		reserve		= sec
		w_model		= world_model
		v_model		= view_model
		wearable	= extra_wearable
	}
}
// Unlike other registries, this one can only be searched by item name.
::TF_CUSTOM_WEAPONS_REGISTRY <- {
}


::TF_WEAPONS_ALL <- [
//-----------------------------------------------------------------------------
// All
//-----------------------------------------------------------------------------
	TF_WEAPONS(0, 1, "shotgun", 199, null, "Shotgun", null, TF_AMMO.SECONDARY, 6, 32, null)
	TF_WEAPONS(0, 1, "shotgun", 415, null, "Reserve Shooter", null, TF_AMMO.SECONDARY, 4, 32, null)
	TF_WEAPONS(0, 1, "shotgun", 1153, null, "Panic Attack", null, TF_AMMO.SECONDARY, 6, 32, null)
	TF_WEAPONS(0, 1, "pistol", 22, 209, "Pistol", null, TF_AMMO.SECONDARY, 12, 36, null)
	TF_WEAPONS(0, 1, "pistol", 30666, null, "C.A.P.P.E.R.", "CAPPER", TF_AMMO.SECONDARY, 12, 36, null)
	TF_WEAPONS(0, 1, "pistol", 160, 294, "Lugermorph", "Luger", TF_AMMO.SECONDARY, 12, 36, null)
	TF_WEAPONS(0, 6, "spellbook", 1070, null, "Basic Spellbook", null, TF_AMMO.GRENADES3, -1, -1, null)
	TF_WEAPONS(0, 6, "spellbook", 1069, null, "Fancy Spellbook", "Halloween Spellbook", TF_AMMO.GRENADES3, -1, -1, "models/player/items/all_class/hwn_spellbook_complete.mdl")
	TF_WEAPONS(0, 6, "spellbook", 1132, null, "Spellbook Magazine", null, TF_AMMO.GRENADES3, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 264, null, "Frying Pan", "Pan", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 423, null, "Saxxy", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 474, null, "Conscientious Objector", "Sign", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 880, null, "Freedom Staff", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 939, null, "Bat Outta Hell", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 954, null, "Memory Maker", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 1013, null, "Ham Shank", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 1071, null, "Gold Frying Pan", "Gold Pan", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 1127, null, "Crossing Guard", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 1123, null, "Necro Smasher", "Smasher", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "saxxy", 30758, null, "Prinny Machete", "Machete", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 6, "grapplinghook ", 1152, null, "Grappling Hook", null, TF_AMMO.NONE, -1, -1, null)

//-----------------------------------------------------------------------------
// Scout
//-----------------------------------------------------------------------------
	TF_WEAPONS(1, 0, "scattergun", 13, 200, "Scattergun", "Scatter Gun", TF_AMMO.PRIMARY, 6, 32, null)
	TF_WEAPONS(1, 0, "scattergun", 45, null, "Force-A-Nature", "FAN", TF_AMMO.PRIMARY, 2, 32, null)
	TF_WEAPONS(1, 0, "handgun_scout_primary", 220, null, "Shortstop", null, TF_AMMO.PRIMARY, 4, 32, null)
	TF_WEAPONS(1, 0, "soda_popper", 448, null, "Soda Popper", null, TF_AMMO.PRIMARY, 2, 32, null)
	TF_WEAPONS(1, 0, "pep_brawler_blaster", 772, null, "Baby Face's Blaster", "BFB", TF_AMMO.PRIMARY, 4, 32, null)
	TF_WEAPONS(1, 0, "scattergun", 1103, null, "Back Scatter", null, TF_AMMO.PRIMARY, 4, 32, null)

	TF_WEAPONS(1, 1, "lunchbox_drink", 46, null, "Bonk! Atomic Punch", "Bonk", TF_AMMO.GRENADES2, 1, -1, null)
	TF_WEAPONS(1, 1, "lunchbox_drink", 163, null, "Crit-a-Cola", "CAC", TF_AMMO.GRENADES2, 1, -1, null)
	TF_WEAPONS(1, 1, "jar_milk", 222, null, "Mad Milk", null, TF_AMMO.GRENADES2, 1, -1, null)
	TF_WEAPONS(1, 1, "handgun_scout_secondary", 449, null, "Winger", null, TF_AMMO.SECONDARY, 5, 36, null)
	TF_WEAPONS(1, 1, "handgun_scout_secondary", 773, null, "Pretty Boy's Pocket Pistol", "PBPP", TF_AMMO.SECONDARY, 9, 36, null)
	TF_WEAPONS(1, 1, "cleaver", 812, 833, "Flying Guillotine", "Cleaver", TF_AMMO.GRENADES2, 1, -1, null)
	TF_WEAPONS(1, 1, "jar_milk", 1121, null, "Mutated Milk", null, TF_AMMO.GRENADES2, 1, -1, null)

	TF_WEAPONS(1, 2, "bat", 0, 190, "Bat", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(1, 2, "bat_wood", 44, null, "Sandman", null, TF_AMMO.GRENADES1, 1, -1, null)
	TF_WEAPONS(1, 2, "bat_fish", 221, null, "Holy Mackerel", "Fish", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(1, 2, "bat", 317, null, "Candy Cane", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(1, 2, "bat", 325, null, "Boston Basher", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(1, 2, "bat", 349, null, "Sun-on-a-Stick", "SOAS", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(1, 2, "bat", 355, null, "Fan O'War", "FOW", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(1, 2, "bat", 450, null, "Atomizer", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(1, 2, "bat_giftwrap", 648, null, "Wrap Assassin", null, TF_AMMO.GRENADES1, 1, -1, null)
	TF_WEAPONS(1, 2, "bat", 452, null, "Three-Rune Blade", "TRB", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(1, 2, "bat", 572, null, "Unarmed Combat", "Spy Arm", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(1, 2, "bat", 30667, null, "Batsaber", null, TF_AMMO.NONE, -1, -1, null)

//-----------------------------------------------------------------------------
// Solly
//-----------------------------------------------------------------------------
	TF_WEAPONS(3, 0, "rocketlauncher", 18, 205, "Rocket Launcher", "RL", TF_AMMO.PRIMARY, 4, 20, null)
	TF_WEAPONS(3, 0, "rocketlauncher_directhit", 127, null, "Direct Hit", "DH", TF_AMMO.PRIMARY, 4, 20, null)
	TF_WEAPONS(3, 0, "rocketlauncher", 228, null, "Black Box", null, TF_AMMO.PRIMARY, 3, 20, null)
	TF_WEAPONS(3, 0, "rocketlauncher", 237, null, "Rocket Jumper", "RJ", TF_AMMO.PRIMARY, 4, 60, null)
	TF_WEAPONS(3, 0, "rocketlauncher", 414, null, "Liberty Launcher", null, TF_AMMO.PRIMARY, 5, 60, null)
	TF_WEAPONS(3, 0, "particle_cannon", 441, null, "Cow Mangler 5000", "Cow Mangler", TF_AMMO.PRIMARY, 4, -1, null)
	TF_WEAPONS(3, 0, "rocketlauncher", 513, null, "Original", null, TF_AMMO.PRIMARY, 4, 20, null)
	TF_WEAPONS(3, 0, "rocketlauncher", 730, null, "Beggar's Bazooka", "Beggars", TF_AMMO.PRIMARY, 0, 20, null)
	TF_WEAPONS(3, 0, "rocketlauncher", 1104, null, "Air Strike", "Airstrike", TF_AMMO.PRIMARY, 4, 20, null)

	TF_WEAPONS(3, 1, "shotgun_soldier", 10, null, "Soldier Shotgun", null, TF_AMMO.SECONDARY, 6, 32, null)
	TF_WEAPONS(3, 1, "buff_item", 129, null, "Buff Banner", "Buff", TF_AMMO.NONE, -1, -1, "models/weapons/c_models/c_buffpack/c_buffpack.mdl")
	TF_WEAPONS(3, 1, "tf_wearable", 133, null, "Gunboats", null, TF_AMMO.NONE, -1, -1, "models/weapons/c_models/c_rocketboots_soldier.mdl")
	TF_WEAPONS(3, 1, "buff_item", 226, null, "Battalion's Backup", "Backup", TF_AMMO.NONE, -1, -1, "models/workshop/weapons/c_models/c_battalion_buffpack/c_battalion_buffpack.mdl")
	TF_WEAPONS(3, 1, "buff_item", 354, null, "Concheror", "Conch", TF_AMMO.NONE, -1, -1, "models/workshop_partner/weapons/c_models/c_shogun_warpack/c_shogun_warpack.mdl")
	TF_WEAPONS(3, 1, "shotgun", 415, null, "Reserve Shooter", null, TF_AMMO.SECONDARY, 4, 32, null)
	TF_WEAPONS(3, 1, "raygun", 442, null, "Righteous Bison", "Bison", TF_AMMO.SECONDARY, 4, -1, null)
	TF_WEAPONS(3, 1, "tf_wearable", 444, null, "Mantreads", null,  TF_AMMO.NONE, -1, -1, "models/workshop/player/items/soldier/mantreads/mantreads.mdl")
	TF_WEAPONS(3, 1, "parachute_secondary", 1101, null, "B.A.S.E. Jumper Soldier", "Soldier Parachute", TF_AMMO.NONE, -1, -1, "models/workshop/weapons/c_models/c_paratooper_pack/c_paratrooper_pack.mdl")

	TF_WEAPONS(3, 2, "shovel", 6, 196, "Shovel", "Spade", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(3, 2, "shovel", 128, null, "Equalizer", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(3, 2, "shovel", 154, null, "Pain Train", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(3, 2, "katana", 357, null, "Half-Zatoichi", "Katana", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(3, 2, "shovel", 416, null, "Market Gardener", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(3, 2, "shovel", 447, null, "Disciplinary Action", "DA", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(3, 2, "shovel", 775, null, "Escape Plan", null, TF_AMMO.NONE, -1, -1, null)

//-----------------------------------------------------------------------------
// Pyro
//-----------------------------------------------------------------------------
	TF_WEAPONS(7, 0, "flamethrower", 21, 208, "Flame Thrower", "Flamethrower", TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(7, 0, "flamethrower", 40, null, "Backburner", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(7, 0, "flamethrower", 215, null, "Degreaser", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(7, 0, "flamethrower", 594, null, "Phlogistinator", "Phlog", TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(7, 0, "flamethrower", 741, null, "Rainblower", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(7, 0, "rocketlauncher_fireball", 1178, null, "Dragon's Fury", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(7, 0, "flamethrower", 30474, null, "Nostromo Napalmer", "Alien Flamethrower", TF_AMMO.PRIMARY, 200, 200, null)

	TF_WEAPONS(7, 1, "shotgun_pyro", 12, null, "Pyro Shotgun", null, TF_AMMO.SECONDARY, 6, 32, null)
	TF_WEAPONS(7, 1, "flaregun", 39, null, "Flare Gun", "Flaregun", TF_AMMO.SECONDARY, 1, 16, null)
	TF_WEAPONS(7, 1, "flaregun", 351, null, "Detonator", null, TF_AMMO.SECONDARY, 1, 16, null)
	TF_WEAPONS(7, 1, "flaregun_revenge", 595, null, "Manmelter", null, TF_AMMO.SECONDARY, -1, -1, null)
	TF_WEAPONS(7, 1, "flaregun", 740, null, "Scorch Shot", null, TF_AMMO.SECONDARY, 1, 16, null)
	TF_WEAPONS(7, 1, "rocketpack", 1179, null, "Thermal Thruster", null, TF_AMMO.GRENADES1, 2, -1, "models/weapons/c_models/c_rocketpack/c_rocketpack.mdl")
	TF_WEAPONS(7, 1, "jar_gas", 1180, null, "Gas Passer", null, TF_AMMO.GRENADES1, 1, -1, null)

	TF_WEAPONS(7, 2, "fireaxe", 2, 192, "Fire Axe", "Fireaxe", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "fireaxe", 38, null, "Axtinguisher", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "fireaxe", 153, null, "Homewrecker", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "fireaxe", 214, null, "Powerjack", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "fireaxe", 326, null, "Back Scratcher", "Backscratcher", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "fireaxe", 348, null, "Sharpened Volcano Fragment", "SVF", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "fireaxe", 457, null, "Postal Plummeler", "Mailbox", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "fireaxe", 466, null, "Maul", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "fireaxe", 593, null, "Third-Degree", "Third Degree", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "fireaxe", 739, null, "Lollichop", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "breakable_sign", 813, 834, "Neon Annihilator", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(7, 2, "slap", 1181, null, "Hot Hand", "Slap Glove", TF_AMMO.NONE, -1, -1, null)

//-----------------------------------------------------------------------------
// Demo
//-----------------------------------------------------------------------------
	TF_WEAPONS(4, 0, "grenadelauncher", 19, 206, "Grenade Launcher", null, TF_AMMO.PRIMARY, 4, 16, null)
	TF_WEAPONS(4, 0, "grenadelauncher", 308, null, "Loch-n-Load", "Loch", TF_AMMO.PRIMARY, 3, 16, null)
	TF_WEAPONS(4, 0, "tf_wearable", 405, null, "Ali Baba's Wee Booties", "Booties", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 0, "tf_wearable", 608, null, "Bootlegger", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 0, "cannon", 996, null, "Loose Cannon", null, TF_AMMO.PRIMARY, 4, 16, null)
	TF_WEAPONS(4, 1, "parachute_primary", 1101, null, "B.A.S.E. Jumper Demo", "Demo Parachute", TF_AMMO.NONE, -1, -1, "models/workshop/weapons/c_models/c_paratooper_pack/c_paratrooper_pack.mdl")
	TF_WEAPONS(4, 0, "grenadelauncher", 1151, null, "Iron Bomber", null, TF_AMMO.PRIMARY, 4, 16, null)

	TF_WEAPONS(4, 1, "pipebomblauncher", 20, 207, "Stickybomb Launcher", null, TF_AMMO.SECONDARY, 8, 24, null)
	TF_WEAPONS(4, 1, "pipebomblauncher", 130, null, "Scottish Resistance", "Sticky Resistance", TF_AMMO.SECONDARY, 8, 36, null)
	TF_WEAPONS(4, 1, "pipebomblauncher", 265, null, "Sticky Jumper", null, TF_AMMO.SECONDARY, 8, 72, null)
	TF_WEAPONS(4, 1, "pipebomblauncher", 1150, null, "Quickiebomb Launcher", null, TF_AMMO.SECONDARY, 8, 72, null)
	TF_WEAPONS(4, 1, "demoshield", 131, null, "Chargin' Targe", "Targe", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 1, "demoshield", 406, null, "Splendid Screen", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 1, "demoshield", 1099, null, "Tide Turner", null, TF_AMMO.NONE, -1, -1, null)

	TF_WEAPONS(4, 2, "bottle", 1, 191, "Bottle", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 2, "sword", 132, null, "Eyelander", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 2, "sword", 172, null, "Scotsman's Skullcutter", "Skullcutter", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 2, "stickbomb", 307, null, "Ullapool Caber", "Caber", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 2, "sword", 327, null, "Claidheamh Mor", "Claid", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "sword", 404, null, "Persian Persuader", "Persuader", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 2, "sword", 266, null, "Horseless Headless Horseman's Headtaker", "HHHH", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 2, "sword", 482, null, "Nessie's Nine Iron", "Golf Club", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(4, 2, "bottle", 609, null, "Scottish Handshake", null, TF_AMMO.NONE, -1, -1, null)


//-----------------------------------------------------------------------------
// Heavy
//-----------------------------------------------------------------------------
	TF_WEAPONS(6, 0, "minigun", 15, 202, "Minigun", "Sasha", TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(6, 0, "minigun", 41, null, "Natascha", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(6, 0, "minigun", 298, null, "Iron Curtain", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(6, 0, "minigun", 312, null, "Brass Beast", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(6, 0, "minigun", 424, null, "Tomislav", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(6, 0, "minigun", 811, 832, "Huo-Long Heater", "Heater", TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEAPONS(6, 0, "minigun", 850, null, "Deflector", null, TF_AMMO.PRIMARY, 200, 200, null)

	TF_WEAPONS(6, 1, "shotgun_hwg", 11, null, "Heavy Shotgun", null, TF_AMMO.SECONDARY, 6, 32, null)
	TF_WEAPONS(6, 1, "lunchbox", 42, null, "Sandvich", null, TF_AMMO.GRENADES1, 1, -1, null)
	TF_WEAPONS(6, 1, "lunchbox", 159, null, "Dalokohs Bar", "Dalokohs", TF_AMMO.GRENADES1, 1, -1, null)
	TF_WEAPONS(6, 1, "lunchbox", 311, null, "Buffalo Steak Sandvich", "Steak", TF_AMMO.GRENADES1, 1, -1, null)
	TF_WEAPONS(6, 1, "shotgun", 425, null, "Family Business", null, TF_AMMO.SECONDARY, 8, 32, null)
	TF_WEAPONS(6, 1, "lunchbox", 433, null, "Fishcake", null, TF_AMMO.GRENADES1, 1, -1, null)
	TF_WEAPONS(6, 1, "lunchbox", 863, null, "Robo-Sandvich", "Robo Sandvich", TF_AMMO.GRENADES1, 1, -1, null)
	TF_WEAPONS(6, 1, "lunchbox", 1190, null, "Second Banana", "Banana", TF_AMMO.GRENADES1, 1, -1, null)

	TF_WEAPONS(6, 2, "fists", 5, 195, "Fists", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(6, 2, "fists", 43, null, "Killing Gloves of Boxing", "KGB", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(6, 2, "fists", 239, null, "Gloves of Running Urgently", "GRU", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(6, 2, "fists", 310, null, "Warrior's Spirit", "WS", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(6, 2, "fists", 331, null, "Fists of Steel", "FOS", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(6, 2, "fists", 426, null, "Eviction Notice", "EN", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(6, 2, "fists", 587, null, "Apoco-Fists", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(6, 2, "fists", 656, null, "Holiday Punch", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(6, 2, "fists", 1100, null, "Bread Bite", "Bread GRU", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(6, 2, "fists", 1184, null, "Gloves of Running Urgently MvM", "GRU MVM", TF_AMMO.NONE, -1, -1, null)

//-----------------------------------------------------------------------------
// Engineer
//-----------------------------------------------------------------------------
	TF_WEAPONS(9, 0, "shotgun_primary", 9, null, "Shotgun Primary", "Engineer Shotgun", TF_AMMO.PRIMARY, 6, 32, null)
	TF_WEAPONS(9, 0, "sentry_revenge", 141, null, "Frontier Justice", "FJ", TF_AMMO.PRIMARY, 3, 32, null)
	TF_WEAPONS(9, 0, "shotgun_primary", 527, null, "Widowmaker", null, TF_AMMO.METAL, -1, 200, null)
	TF_WEAPONS(9, 0, "drg_pomson", 588, null, "Pomson 6000", "Pomson", TF_AMMO.PRIMARY, 4, -1, null)
	TF_WEAPONS(9, 0, "shotgun_building_rescue", 997, null, "Rescue Ranger", null, TF_AMMO.PRIMARY, 4, 20, null)

	TF_WEAPONS(0, 1, "pistol", 22, null, "Engineer Pistol", null, TF_AMMO.SECONDARY, 12, 200, null)	//ID doesn't exist
	TF_WEAPONS(9, 1, "laser_pointer", 140, null, "Wrangler", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(9, 1, "mechanical_arm", 528, null, "Short Circuit", null, TF_AMMO.METAL, -1, 200, null)

	TF_WEAPONS(9, 2, "wrench", 7, 197, "Wrench", null, TF_AMMO.METAL, -1, 200, null)
	TF_WEAPONS(9, 2, "robot_arm", 142, null, "Gunslinger", null, TF_AMMO.METAL, -1, 200, null)
	TF_WEAPONS(9, 2, "wrench", 155, null, "Southern Hospitality", null, TF_AMMO.METAL, -1, 200, null)
	TF_WEAPONS(9, 2, "wrench", 329, null, "Jag", null, TF_AMMO.METAL, -1, 200, null)
	TF_WEAPONS(9, 2, "wrench", 589, null, "Eureka Effect", null, TF_AMMO.METAL, -1, 200, null)
	TF_WEAPONS(9, 2, "wrench", 169, null, "Golden Wrench", null, TF_AMMO.METAL, -1, 200, null)

	TF_WEAPONS(9, 3, "pda_engineer_build", 25, 737, "Build PDA", null, TF_AMMO.METAL, -1, 200, null)
	TF_WEAPONS(9, 4, "pda_engineer_destroy", 26, null, "Destruction PDA", "Destroy PDA", TF_AMMO.METAL, -1, 200, null)
	TF_WEAPONS(9, 5, "builder", 28, null, "Engineer Toolbox", "Toolbox", TF_AMMO.METAL, -1, 200, null)

//-----------------------------------------------------------------------------
// Medic
//-----------------------------------------------------------------------------
	TF_WEAPONS(5, 0, "syringegun_medic", 17, 204, "Syringe Gun", "Syringegun", TF_AMMO.PRIMARY, 40, 150, null)
	TF_WEAPONS(5, 0, "syringegun_medic", 36, null, "Blutsauger", null, TF_AMMO.PRIMARY, 40, 150, null)
	TF_WEAPONS(5, 0, "crossbow", 305, null, "Crusader's Crossbow", "Crossbow", TF_AMMO.PRIMARY, 1, 38, null)
	TF_WEAPONS(5, 0, "syringegun_medic", 412, null, "Overdose", null, TF_AMMO.PRIMARY, 40, 150, null)

	TF_WEAPONS(5, 1, "medigun", 29, 211, "Medigun", "Medi Gun", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(5, 1, "medigun", 35, null, "Kritzkrieg", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(5, 1, "medigun", 441, null, "Quick-Fix", null, TF_AMMO.NONE, -1, -1, "models/weapons/c_models/c_proto_backpack/c_proto_backpack.mdl")
	TF_WEAPONS(5, 1, "medigun", 998, null, "Vaccinator", null, TF_AMMO.NONE, -1, -1, "models/workshop/weapons/c_models/c_medigun_defense/c_medigun_defensepack.mdl")

	TF_WEAPONS(5, 2, "bonesaw", 8, 198, "Bonesaw", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(5, 2, "bonesaw", 37, null, "Ubersaw", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(5, 2, "bonesaw", 173, null, "Vita-Saw", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(5, 2, "bonesaw", 304, null, "Amputator", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(0, 2, "bonesaw", 413, null, "Solemn Vow", null, TF_AMMO.NONE, -1, -1, null)

//-----------------------------------------------------------------------------
// Sniper
//-----------------------------------------------------------------------------
	TF_WEAPONS(2, 0, "sniperrifle", 14, 201, "Sniper Rifle", null, TF_AMMO.PRIMARY, 25, -1, null)
	TF_WEAPONS(2, 0, "compound_bow", 56, null, "Huntsman", null, TF_AMMO.PRIMARY, 1, 12, null)
	TF_WEAPONS(2, 0, "sniperrifle", 230, null, "Sydney Sleeper", null, TF_AMMO.PRIMARY, 25, -1, null)
	TF_WEAPONS(2, 0, "sniperrifle_decap", 402, null, "Bazaar Bargain", null, TF_AMMO.PRIMARY, 25, -1, null)
	TF_WEAPONS(2, 0, "sniperrifle", 526, null, "Machina", null, TF_AMMO.PRIMARY, 25, -1, null)
	TF_WEAPONS(2, 0, "sniperrifle", 752, null, "Hitman's Heatmaker", null, TF_AMMO.PRIMARY, 25, -1, null)
	TF_WEAPONS(2, 0, "sniperrifle", 851, null, "AWPer Hand", "AWP", TF_AMMO.PRIMARY, 25, -1, null)
	TF_WEAPONS(2, 0, "compound_bow", 1092, null, "Fortified Compound", null, TF_AMMO.PRIMARY, 1, 12, null)
	TF_WEAPONS(2, 0, "sniperrifle_classic", 1098, null, "Classic", null, TF_AMMO.PRIMARY, 25, -1, null)
	TF_WEAPONS(2, 0, "sniperrifle", 30665, null, "Shooting Star", null, TF_AMMO.PRIMARY, 25, -1, null)

	TF_WEAPONS(2, 1, "smg", 16, 203, "SMG", null, TF_AMMO.SECONDARY, 25, 75, null)
	TF_WEAPONS(2, 1, "razorback", 57, null, "Razorback", null, TF_AMMO.NONE, 1, -1, null)
	TF_WEAPONS(2, 1, "jar", 58, null, "Jarate", null, TF_AMMO.GRENADES1, 1, -1, null)
	TF_WEAPONS(2, 1, "tf_wearable", 231, null, "Darwin's Danger Shield", "DDS", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(2, 1, "tf_wearable", 642, null, "Cozy Camper", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(2, 1, "charged_smg", 751, null, "Cleaner's Carbine", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(2, 1, "jar", 1105, null, "Self-Aware Beauty Mark", "Bread Jarate", TF_AMMO.GRENADES1, 1, -1, null)

	TF_WEAPONS(2, 2, "club", 3, 193, "Kukri", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(2, 2, "club", 171, null, "Tribalman's Shiv", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(2, 2, "club", 232, null, "Bushwacka", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(2, 2, "club", 401, null, "Shahanshah", null, TF_AMMO.NONE, -1, -1, null)

//-----------------------------------------------------------------------------
// Spy
//-----------------------------------------------------------------------------
	TF_WEAPONS(8, 0, "revolver", 24, 210, "Revolver", null, TF_AMMO.PRIMARY, 6, 24, null)
	TF_WEAPONS(8, 0, "revolver", 61, null, "Ambassador", null, TF_AMMO.PRIMARY, 6, 24, null)
	TF_WEAPONS(8, 0, "revolver", 161, null, "Big Kill", null, TF_AMMO.PRIMARY, 6, 24, null)
	TF_WEAPONS(8, 0, "revolver", 224, null, "L'Etranger", null, TF_AMMO.PRIMARY, 6, 24, null)
	TF_WEAPONS(8, 0, "revolver", 460, null, "Enforcer", null, TF_AMMO.PRIMARY, 6, 24, null)
	TF_WEAPONS(8, 0, "revolver", 525, null, "Diamondback", null, TF_AMMO.PRIMARY, 6, 24, null)

	TF_WEAPONS(8, 1, "builder", 735, 736, "builder_spy", "Sapper", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 1, "sapper", 810, 831, "Red-Tape Recorder", "Red Tape", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 1, "sapper", 933, null, "Ap-Sap", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 1, "sapper", 1102, null, "Snack Attack", "Bread Sapper", TF_AMMO.NONE, -1, -1, null)

	TF_WEAPONS(8, 2, "knife", 4, 194, "Knife", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 2, "knife", 225, null, "Your Eternal Reward", "YER", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 2, "knife", 356, null, "Conniver's Kunai", "Kunai", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 2, "knife", 461, null, "Big Earner", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 2, "knife", 574, null, "Wanga Prick", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 2, "knife", 638, null, "Sharp Dresser", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 2, "knife", 649, null, "Spy-cicle", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 2, "knife", 727, null, "Black Rose", null, TF_AMMO.NONE, -1, -1, null)

	TF_WEAPONS(8, 3, "pda_spy", 27, null, "Disguise Kit PDA", "Disguise Kit", TF_AMMO.NONE, -1, -1, null)

	TF_WEAPONS(8, 4, "invis", 30, 212, "Invisibility Watch", "Invis Watch", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 4, "invis", 59, null, "Dead Ringer", "DR", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 4, "invis", 60, null, "Cloak and Dagger", "CAD", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 4, "invis", 297, null, "Enthusiast's Timepiece", "Timepiece", TF_AMMO.NONE, -1, -1, null)
	TF_WEAPONS(8, 4, "invis", 947, null, "Quackenbirdt", null, TF_AMMO.NONE, -1, -1, null)
]

::TF_WEAPONS_ALL_WARPAINTSnBOTKILLERS <- [
//Botkillers listed first, then warpaints
	TF_WEAPONS_RESKIN(0, 1, "shotgun", 15003, 15016, 15044, 15047, 15085, 15109, 15132, 15133, 15152, null, null, null, null, TF_AMMO.SECONDARY, 6, 32)
	TF_WEAPONS_RESKIN(0, 1, "pistol", 15013, 15018, 15035, 15041, 15046, 15056, 15060, 15061, 15100, 15101, 15102, 15126, 15148, TF_AMMO.SECONDARY, 12, 36)

	TF_WEAPONS_RESKIN(1, 0, "scattergun", 799, 808, 888, 897, 906, 915, 966, 973, null, null, null, null, 15157, TF_AMMO.PRIMARY, 6, 32)
	TF_WEAPONS_RESKIN(1, 0, "scattergun", 15002, 15015, 15021, 15029, 15036, 15053, 15065, 15069, 15106, 15107, 15108, 15131, 15151, TF_AMMO.PRIMARY, 6, 32)

	TF_WEAPONS_RESKIN(3, 0, "rocketlauncher", 800, 809, 889, 898, 907, 916, 965, 974, null, null, null, null, null, TF_AMMO.PRIMARY, 4, 20)
	TF_WEAPONS_RESKIN(3, 0, "rocketlauncher", 15006, 15014, 15028, 15043, 15052, 15057, 15081, 15104, 15105, 15129, 15130, 15150, null, TF_AMMO.PRIMARY, 4, 20)

	TF_WEAPONS_RESKIN(7, 0, "flamethrower", 798, 807, 887, 896, 905, 914, 963, 972, null, null, null, null, null, TF_AMMO.PRIMARY, 200, -1)
	TF_WEAPONS_RESKIN(7, 0, "flamethrower", 15005, 15017, 15030, 15034, 15049, 15054, 15066, 15067, 15068, 15089, 15090, 15115, 15141, TF_AMMO.PRIMARY, 200, -1)

	TF_WEAPONS_RESKIN(4, 0, "grenadelauncher", 15077, 15079, 15091, 15092, 15116, 15117, 15142, 15158, null, null, null, null, null, TF_AMMO.PRIMARY, 4, 16)
	TF_WEAPONS_RESKIN(4, 1, "pipebomblauncher", 797, 806, 886, 895, 904, 913, 962, 971, null, null, null, null, null, TF_AMMO.SECONDARY, 8, 24)
	TF_WEAPONS_RESKIN(4, 1, "pipebomblauncher", 15009, 15012, 15024, 15038, 15045, 15048, 15082, 15083, 15084, 15113, 15137, 15138, 15155, TF_AMMO.SECONDARY, 8, 24)

	TF_WEAPONS_RESKIN(6, 0, "minigun", 882, 891, 900, 909, 958, 967, null, null, null, null, null, 15125, 15147, TF_AMMO.PRIMARY, 200, -1)
	TF_WEAPONS_RESKIN(6, 0, "minigun", 15004, 15020, 15026, 15031, 15040, 15055, 15086, 15087, 15088, 15098, 15099, 15123, 15124, TF_AMMO.PRIMARY, 200, -1)

	TF_WEAPONS_RESKIN(9, 2, "wrench", 795, 804, 884, 893, 902, 911, 960, 969, null, null, null, null, null, TF_AMMO.METAL, -1, -1)
	TF_WEAPONS_RESKIN(9, 2, "wrench", 15073, 15074, 15075, 15139, 15140, 15114, 15156, 15158, null, null, null, null, null, TF_AMMO.METAL, -1, -1)

	TF_WEAPONS_RESKIN(5, 1, "medigun", 796, 805, 885, 894, 903, 912, 961, 970, null, null, null, null, null, TF_AMMO.NONE, -1, -1)
	TF_WEAPONS_RESKIN(5, 1, "medigun", 15008, 15010, 15025, 15039, 15050, 15078, 15097, 15121, 15122, 15123, 15145, 15146, null, TF_AMMO.NONE, -1, -1)

	TF_WEAPONS_RESKIN(2, 0, "sniperrifle", 792, 801, 851, 881, 890, 899, 908, 957, 966, null, null, null, 15154, TF_AMMO.PRIMARY, 25, -1)
	TF_WEAPONS_RESKIN(2, 0, "sniperrifle", 15000, 15007, 15019, 15023, 15033, 15059, 15070, 15071, 15072, 15111, 15112, 15135, 15136, TF_AMMO.PRIMARY, 25, -1)
	TF_WEAPONS_RESKIN(2, 1, "smg", 15001, 15022, 15032, 15037, 15058, 15076, 15110, 15134, 15153, null, null, null, null, TF_AMMO.SECONDARY, 25, 75)

	TF_WEAPONS_RESKIN(8, 0, "revolver", 15011, 15027, 15042, 15051, 15062, 15063, 15064, 15103, 15127, 15128, 15149, null, null, TF_AMMO.PRIMARY, 6, 24)
	TF_WEAPONS_RESKIN(8, 2, "knife", 794, 803, 883, 892, 901, 910, 959, 968, null, null, null, null, null, TF_AMMO.NONE, -1, -1)
	TF_WEAPONS_RESKIN(8, 2, "knife", 15062, 15094, 15095, 15096, 15118, 15119, 15143, 15144, null, null, null, null, null, TF_AMMO.NONE, -1, -1)

]

::TF_WEAPONS_ALL_FESTIVE <- [

	TF_WEP_FEST(0, 1, "shotgun", 1141, "Festive Shotgun", null, TF_AMMO.SECONDARY, 6, 32, null)

	TF_WEP_FEST(1, 0, "scattergun", 669, "Festive Scattergun", "Festive Scatter Gun", TF_AMMO.PRIMARY, 6, 32, null)
	TF_WEP_FEST(1, 0, "scattergun", 1078, "Festive Force-A-Nature", "Festive FAN", TF_AMMO.PRIMARY, 2, 32, null)
	TF_WEP_FEST(1, 1, "lunchbox_drink", 46, "Festive Bonk!", "Festive Bonk", TF_AMMO.GRENADES2, 1, -1, null)
	TF_WEP_FEST(1, 2, "bat", 660, "Festive Bat", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEP_FEST(1, 2, "bat_fish", 999, "Festive Holy Mackerel", "Festive Fish", TF_AMMO.NONE, -1, -1, null)

	TF_WEP_FEST(3, 0, "rocketlauncher", 669, "Festive Rocketlauncher", "Festive RL", TF_AMMO.PRIMARY, 4, 20, null)
	TF_WEP_FEST(3, 0, "rocketlauncher", 1085, "Festive Black Box", null, TF_AMMO.PRIMARY, 3, 20, null)
	TF_WEP_FEST(3, 1, "buff_item", 1001, "Festive Buff Banner", "Festive Buff", TF_AMMO.NONE, -1, -1, "models/weapons/c_models/c_buffpack/c_buffpack_xmas.mdl")

	TF_WEP_FEST(7, 0, "flamethrower", 669, "Festive Flame Thrower", "Festive Flamethrower", TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEP_FEST(7, 0, "flamethrower", 1146, "Festive Backburner", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEP_FEST(7, 1, "flaregun", 1081, "Festive Flare Gun", "Festive Flaregun", TF_AMMO.SECONDARY, 16, -1, null)
	TF_WEP_FEST(7, 2, "flaregun", 1000, "Festive Axtinguisher", null, TF_AMMO.NONE, -1, -1, null)

	TF_WEP_FEST(4, 2, "grenadelauncher", 1007, "Festive Grenade Launcher", null, TF_AMMO.PRIMARY, 4, 16, null)
	TF_WEP_FEST(4, 2, "pipebomblauncher", 661, "Festive Stickybomb Launcher", null, TF_AMMO.SECONDARY, 8, 24, null)
	TF_WEP_FEST(4, 2, "sword", 1082, "Festive Eyelander", null, TF_AMMO.NONE, -1, -1, null)

	TF_WEP_FEST(6, 0, "minigun", 654, "Festive Minigun", null, TF_AMMO.PRIMARY, 200, 200, null)
	TF_WEP_FEST(6, 1, "lunchbox", 1002, "Festive Sandvich", null, TF_AMMO.GRENADES1, 1, -1, null)
	TF_WEP_FEST(6, 2, "fists", 1084, "Festive Gloves of Running Urgently", "Festive GRU", TF_AMMO.NONE, -1, -1, null)

	TF_WEP_FEST(9, 0, "shotgun_primary", 1004, "Festive Frontier Justice", null, TF_AMMO.PRIMARY, 3, 32, null)
	TF_WEP_FEST(9, 1, "laser_pointer", 1086, "Festive Wrangler", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEP_FEST(9, 2, "wrench", 662, "Festive Wrench", null, TF_AMMO.METAL, -1, 200, null)

	TF_WEP_FEST(5, 0, "crossbow", 1079, "Festive Crusader's Crossbow", "Festive Crossbow", TF_AMMO.PRIMARY, 1, 38, null)
	TF_WEP_FEST(5, 1, "medigun", 663, "Festive Medigun", "Festive Medi Gun", TF_AMMO.NONE, -1, -1, null)
	TF_WEP_FEST(5, 2, "bonesaw", 1143, "Festive Bonesaw", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEP_FEST(5, 2, "bonesaw", 1003, "Festive Ubersaw", null, TF_AMMO.NONE, -1, -1, null)

	TF_WEP_FEST(2, 0, "sniperrifle", 664, "Festive Sniper Rifle", null, TF_AMMO.PRIMARY, 25, -1, null)
	TF_WEP_FEST(2, 0, "compound_bow", 1005, "Festive Huntsman", null, TF_AMMO.PRIMARY, 1, 12, null)
	TF_WEP_FEST(2, 1, "smg", 1083, "Festive SMG", null, TF_AMMO.SECONDARY, 25, 75, null)
	TF_WEP_FEST(2, 1, "jar", 1149, "Festive Jarate", null, TF_AMMO.GRENADES1, 1, -1, null)

	TF_WEP_FEST(8, 0, "revolver", 1142, "Festive Revolver", null, TF_AMMO.PRIMARY, 6, 24, null)
	TF_WEP_FEST(8, 0, "revolver", 1006, "Festive Ambassador", null, TF_AMMO.PRIMARY, 6, 24, null)
	TF_WEP_FEST(8, 1, "builder", 1080, "Festive Sapper", null, TF_AMMO.NONE, -1, -1, null)
	TF_WEP_FEST(8, 2, "knife", 665, "Festive Knife", null, TF_AMMO.NONE, -1, -1, null)
]


::SearchAllWeapons <-
[
	"tf_weapon_bat",
	"tf_weapon_bat_fish",
	"tf_weapon_bat_giftwrap",
	"tf_weapon_bat_wood",
	"tf_weapon_bonesaw",
	"tf_weapon_bottle",
	"tf_weapon_breakable_sign",
	"tf_weapon_buff_item",
	"tf_weapon_builder",
	"tf_weapon_cannon",
	"tf_weapon_charged_smg",
	"tf_weapon_cleaver",
	"tf_weapon_club",
	"tf_weapon_compound_bow",
	"tf_weapon_crossbow",
	"tf_weapon_drg_pomson",
	"tf_weapon_fireaxe",
	"tf_weapon_fists",
	"tf_weapon_flamethrower",
	"tf_weapon_flaregun",
	"tf_weapon_flaregun_revenge",
	"tf_weapon_grapplinghook",
	"tf_weapon_grenadelauncher",
	"tf_weapon_handgun_scout_primary",
	"tf_weapon_handgun_scout_secondary",
	"tf_weapon_invis",
	"tf_weapon_jar",
	"tf_weapon_jar_milk",
	"tf_weapon_jar_gas",
	"tf_weapon_katana",
	"tf_weapon_knife",
	"tf_weapon_laser_pointer",
	"tf_weapon_lunchbox",
	"tf_weapon_lunchbox_drink",
	"tf_weapon_mechanical_arm",
	"tf_weapon_medigun",
	"tf_weapon_minigun",
	"tf_weapon_parachute",
	"tf_weapon_parachute_primary",
	"tf_weapon_parachute_secondary",
	"tf_weapon_particle_cannon",
	"tf_weapon_passtime_gun",
	"tf_weapon_pda_engineer_build",
	"tf_weapon_pda_engineer_destroy",
	"tf_weapon_pda_spy",
	"tf_weapon_pep_brawler_blaster",
	"tf_weapon_pipebomblauncher",
	"tf_weapon_pistol",
	"tf_weapon_pistol_scout",
	"tf_weapon_raygun",
	"tf_weapon_revolver",
	"tf_weapon_robot_arm",
	"tf_weapon_rocketlauncher",
	"tf_weapon_rocketlauncher_airstrike",
	"tf_weapon_rocketlauncher_directhit",
	"tf_weapon_rocketlauncher_fireball",
	"tf_weapon_rocketpack",
	"tf_weapon_sapper",
	"tf_weapon_scattergun",
	"tf_weapon_sentry_revenge",
	"tf_weapon_shotgun_hwg",
	"tf_weapon_shotgun_primary",
	"tf_weapon_shotgun_pyro",
	"tf_weapon_shotgun_building_rescue",
	"tf_weapon_shotgun_soldier",
	"tf_weapon_shovel",
	"tf_weapon_slap",
	"tf_weapon_smg",
	"tf_weapon_sniperrifle",
	"tf_weapon_sniperrifle_classic",
	"tf_weapon_sniperrifle_decap",
	"tf_weapon_soda_popper",
	"tf_weapon_spellbook",
	"tf_weapon_stickbomb",
	"tf_weapon_sword",
	"tf_weapon_syringegun_medic",
	"tf_weapon_wrench",
]
::SearchPrimaryWeapons <-
[
	"tf_weapon_cannon",
	"tf_weapon_compound_bow",
	"tf_weapon_crossbow",
	"tf_weapon_drg_pomson",
	"tf_weapon_flamethrower",
	"tf_weapon_grenadelauncher",
	"tf_weapon_handgun_scout_primary",
	"tf_weapon_minigun",
	"tf_weapon_parachute",
	"tf_weapon_parachute_primary",
	"tf_weapon_particle_cannon",
	"tf_weapon_pep_brawler_blaster",
	"tf_weapon_revolver",
	"tf_weapon_rocketlauncher",
	"tf_weapon_rocketlauncher_airstrike",
	"tf_weapon_rocketlauncher_directhit",
	"tf_weapon_rocketlauncher_fireball",
	"tf_weapon_scattergun",
	"tf_weapon_sentry_revenge",
	"tf_weapon_shotgun_primary",
	"tf_weapon_sniperrifle",
	"tf_weapon_sniperrifle_classic",
	"tf_weapon_sniperrifle_decap",
	"tf_weapon_soda_popper",
	"tf_weapon_syringegun_medic",
]
::SearchSecondaryWeapons <-
[
	"tf_weapon_buff_item",
	"tf_weapon_charged_smg",
	"tf_weapon_cleaver",
	"tf_weapon_flaregun",
	"tf_weapon_flaregun_revenge",
	"tf_weapon_handgun_scout_secondary",
	"tf_weapon_jar",
	"tf_weapon_jar_milk",
	"tf_weapon_jar_gas",
	"tf_weapon_laser_pointer",
	"tf_weapon_lunchbox",
	"tf_weapon_lunchbox_drink",
	"tf_weapon_mechanical_arm",
	"tf_weapon_medigun",
	"tf_weapon_parachute",
	"tf_weapon_parachute_secondary",
	"tf_weapon_pipebomblauncher",
	"tf_weapon_pistol",
	"tf_weapon_pistol_scout",
	"tf_weapon_raygun",
	"tf_weapon_rocketpack",
	"tf_weapon_shotgun_hwg",
	"tf_weapon_shotgun_pyro",
	"tf_weapon_shotgun_soldier",
]
::SearchMeleeWeapons <-
[
	"tf_weapon_bat",
	"tf_weapon_bat_fish",
	"tf_weapon_bat_giftwrap",
	"tf_weapon_bat_wood",
	"tf_weapon_bonesaw",
	"tf_weapon_bottle",
	"tf_weapon_breakable_sign",
	"tf_weapon_club",
	"tf_weapon_fireaxe",
	"tf_weapon_fists",
	"tf_weapon_katana",
	"tf_weapon_knife",
	"tf_weapon_robot_arm",
	"tf_weapon_shovel",
	"tf_weapon_slap",
	"tf_weapon_stickbomb",
	"tf_weapon_sword",
	"tf_weapon_wrench",
]
::SearchMiscWeapons <-
[
	"tf_weapon_builder",
	"tf_weapon_grapplinghook",
	"tf_weapon_invis",
	"tf_weapon_passtime_gun",
	"tf_weapon_pda_engineer_build",
	"tf_weapon_pda_engineer_destroy",
	"tf_weapon_pda_spy",
	"tf_weapon_sapper",
	"tf_weapon_spellbook",
]
::SearchSlot3Weapons <-
[
	"tf_weapon_pda_spy",
	"tf_weapon_pda_engineer_build",
]
::SearchSlot4Weapons <-
[
	"tf_weapon_invis",
	"tf_weapon_pda_engineer_destroy",
]
::SearchSlot5Weapons <-
[
	"tf_weapon_builder",
	"tf_weapon_sapper",
]
::SearchSlot6Weapons <-
[
	"tf_weapon_grapplinghook",
	"tf_weapon_passtime_gun",
	"tf_weapon_spellbook",
]

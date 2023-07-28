//-----------------------------------------------------------------------------
// This file holds all custom weapon stuffs. Feel free to make your own.
//-----------------------------------------------------------------------------
/*	RegisterCustomWeapon Notes
		NOTE: Watch your map's ent count!
			It spawns 1 entity for the class_arms (tf_wearable_vm) if using a given weapon.
			It spawns 2 additional entities per weapon--one for the thirdperson model (tf_wearable), and another for firstperson (tf_wearable_vm)
			It also spawns 1 ent (tf_wearable) for managing ammo supply for given weapons, disabled weapons, and enabled weapons.
		NOTE: The player's viewmodel has a think script to fix the weapon appearing when needed, and being invisible when not

	Parameters Overview
	The two functions to register your custom weapon are as follows.
	NOTE: Everything is optional except item_name and baseitem. Pass `null` if using baseitem's parameters.

 ->	RegisterCustomWeapon(item_name, baseitem, stats_function, custom_weapon_model, custom_arms_model, custom_extra_wearable)
 ->	RegisterCustomWeaponEx(item_name, baseitem, stats_function, custom_weapon_worldmodel, custom_weapon_viewmodel, custom_arms_model, custom_extra_wearable, ammo_type, clip_size, reserve_ammo)
		item_name = Custom item's name. Use this name in GiveWeapon to equip!
		baseitem = Accepts handles, weapon classnames, weapons by slot, or weapon string name. Same parameters as GiveWeapon() and others.
		stats_function = Custom stats to be called by a function. (Examples described later in this file)
		custom_weapon_worldmodel = Your new weapon model over the old one. Appears in third person.
		(Ex only) custom_weapon_viewmodel = Same as above, but for first person. NOTE: If a model is set here and the other is null (and vice-versa), it will use the set model the same for both.
		custom_arms_model = Custom arms animations in first person.
		custom_extra_wearable = Custom wearable cosmetic on wearer.
		(Ex only) ammo_type = Which weapon slot the ammo is used from.
		(Ex only) clip_size = Max clip size
		(Ex only) reserve_ammo = Max reserve ammo
*/
//-----------------------------------------------------------------------------
// Template: How to Write the Stats Function
//-----------------------------------------------------------------------------
// The stats function is executed when the weapon is equipped by the player.
// It holds any stat buffs/nerfs/any code you want to inject into the weapon.
// It has two handles you can use: The weapon, and the player.

function CW_Stats_Example_Function(weapon, player) //The name of your function that calls stats. Must include `function` `(weapon, player)`!!
{
//Our stats on the weapon. A full list of stats found on the Official TF2Wiki.
	weapon.AddAttribute("damage bonus", 1.25, -1)	//increases our damage by 25%.
	weapon.AddAttribute("max health additive penalty", -25, -1)	//reduces our health by 25.

//Our stats on the player.
	player.AddCustomAttribute("move speed penalty", 0.9, -1) //reduces speed by 10%.
}
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// The following example are usable in-game.
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Example weapon #1. This one is the Scout's Medieval Crossbow.
// It is based off the Crusader's Crossbow. Main stat thing is it slows the player while reloading.
//-----------------------------------------------------------------------------
function CW_Stats_Example_Scout_Medieval_Crossbow(weapon, player)
{
	weapon.AddAttribute("override projectile type", 8, -1)	//shoots Huntsman arrows (that headshot!)
	weapon.AddAttribute("damage penalty", 0.67, -1)		//reduces damage dealt

//This is a think script. What it does is constantly runs in the background, checking for what ever we put in it.
	if( weapon.ValidateScriptScope() )
	{
		const THINK_SCOUTWEAPONRELOAD_DELAY = 0.25	//delay. Place at the end after `return` to change delay time. Default is 0.1.

		local entityscript = weapon.GetScriptScope()
		entityscript["think_SlowPlayerDuringReload"] <- function()	//Our script's name.
		{
			if ( GetPropInt(weapon, "m_iReloadMode") == 2)	//if we are reloading...
			{
				player.AddCustomAttribute("move speed penalty", 0.67, -1)	//Add attribute that reduces move speed.
			}
			else if ( GetPropInt(weapon, "m_iReloadMode") != 2)	//if -not- reloading...
			{
				player.RemoveCustomAttribute("move speed penalty")	//Remove move speed penalty.
			}
			return THINK_SCOUTWEAPONRELOAD_DELAY	//return to top after 0.25 ticks
		}
		AddThinkToEnt(weapon, "think_SlowPlayerDuringReload")	//Adds the think script to handle 'weapon' after it has been validated.
	}
}

//-----------------------------------------------------------------------------
// The following function registers this weapon as "Scout Crossbow".
// Use `hPlayer.GiveWeapon("Scout Crossbow")` to give yourself this weapon.
//-----------------------------------------------------------------------------
	RegisterCustomWeaponEx("Scout Crossbow", "Crusader's Crossbow", CW_Stats_Example_Scout_Medieval_Crossbow, null, null, GTFW_ARMS.MEDIC, null, TF_AMMO.PRIMARY, 3, 15)



//-----------------------------------------------------------------------------
// Example weapon #2. This one turns you into the Horseless Headless Horsemann.
// It is based off the Demo's Headtaker.
//-----------------------------------------------------------------------------
function CW_Stats_Example_Headless_Hatman(weapon, player)
{
// Setup
	player.SetCustomModelWithClassAnimations("models/player/demo.mdl")	//Needs to be here, else errors.
	SetPropInt(player, "m_PlayerClass.m_iClass", 4)			//Forcefully sets tfclass to DEMOMAN

//Our stats
	weapon.AddAttribute("hidden maxhealth non buffed", (player.GetMaxHealth()*10) + 75, -1)	//using this attribute because it can't be overhealed
	player.SetHealth(player.GetMaxHealth())				//set health to max after given maxhealth bonus
	weapon.AddAttribute("move speed bonus", 1.25, -1)	//move speed up
	weapon.AddAttribute("damage bonus", 99, -1)			//instant death
	weapon.AddAttribute("melee range multiplier", 2, -1)//longer melee range
	weapon.AddAttribute("melee bounds multiplier", 2, -1)//larger melee range

	player.DeleteWeapon(TF_WEAPONSLOTS.PRIMARY)		//deletes primary weapon
	player.DeleteWeapon(TF_WEAPONSLOTS.SECONDARY)		//deletes secondary weapon
	player.DeleteWeapon(TF_WEAPONSLOTS.MISC)		//deletes anything not primary, secondary, or melee

// Our effects
	player.SetForcedTauntCam(1)										//sets third person mode
	DoEntFire("!self", "SetModelScale", "1.3", 0, null, player)		//sets player scale
	Convars.SetValue("tf_item_based_forced_holiday", 2)				//Forces holiday to Halloween
	player.AddCustomAttribute("SPELL: set Halloween footstep type", 2, -1)	//enables Horseless Horseshoes spell walk flames
	player.AddCustomAttribute("set item tint RGB", 9109759, -1)		//sets tint for Horseless Horseshoes

// Deletes all cosmetics from the player
	for (local i = 0; i < 42; i++)
	{
		local wearable = Entities.FindByClassname(null, "tf_*")

		if ( wearable != null && wearable.GetOwner() == player && wearable.GetClassname() != "tf_weapon_sword" && wearable.GetClassname() != "tf_viewmodel" && wearable.Name() != "tf_wearable_vscript" )
		{
			wearable.Kill()
		}
		else
		{
			break
		}
	}
//
if( player.ValidateScriptScope() )
	{
		const DELAY_THINK_STOP = 999
		const DELAY_THINK = 1
		local truefalse = true
		local entityscript = player.GetScriptScope()
		entityscript["think_HHHH_Maker"] <- function()	//Our script's name.
		{
			if ( truefalse ) {
				truefalse = false
				player.Weapon_Switch(weapon)		//vscript built-in function. Forces switch to handle 'weapon'.
				player.AddCond(41)					//locks player in melee
				return DELAY_THINK
			}
			if ( player.GetActiveWeapon() != weapon ) {	//if we unequip this weapon, force us the shapeshift back to Demoman.
				player.SetForcedTauntCam(0)
				DoEntFire("!self", "SetModelScale", "1", 0, null, player)
				player.RemoveCustomAttribute("SPELL: set Halloween footstep type")
				player.RemoveCustomAttribute("set item tint RGB")
				player.Regenerate(false)
				return DELAY_THINK_STOP	//can't stop a think script within a think script, so we delay it until oblivion
			}
			return
		}
		AddThinkToEnt(player, "think_HHHH_Maker")	//Adds the think script to handle 'weapon' after it has been validated.
	}
}

//-----------------------------------------------------------------------------
// Using an enum for define model paths
//-----------------------------------------------------------------------------
/* Tip: You can use an enum like this to create shortcuts for your coding. */
enum GTFW_MODELS_CUSTOM_WEAPONS
{
	HHH_BIGAXE		= "models/weapons/c_models/c_bigaxe/c_bigaxe.mdl",	//Horsemann's REAL Headtaker
	HHH_BIGMALLET		= "models/weapons/c_models/c_big_mallet/c_big_mallet.mdl", //Horsemann's Mallet
}
//-----------------------------------------------------------------------------
// Precaching models
//-----------------------------------------------------------------------------
//PrecacheModel("models/weapons/c_models/c_bigaxe/c_bigaxe.mdl")
//PrecacheModel("models/weapons/c_models/c_big_mallet/c_big_mallet.mdl")

//Use this function to precache models, so the game preloads them and doesn't crash.
//Not needed if using SetModelSimple function (which precaches for you)

//-----------------------------------------------------------------------------
//Registers this weapon as "Horsemann's Hex"...
//-----------------------------------------------------------------------------
	RegisterCustomWeapon("Horsemann's Hex", "HHHH", CW_Stats_Example_Headless_Hatman, GTFW_MODELS_CUSTOM_WEAPONS.HHH_BIGMALLET, null, "models/bots/headless_hatman.mdl")




//-----------------------------------------------------------------------------
// Example weapon #3. A Hot Hand variant that lets you shoot fireballs by taunting!
// Hadouken!
//-----------------------------------------------------------------------------
function CW_Stats_Example_Hottest_Hand(weapon, player)
{
	weapon.AddAttribute("special taunt", 1, -1) //Makes sure that Halloween holiday can't make us not use the taunt kill+fireball.

//Function to create a fireball, but only usable from within CW_Stats_Example_Hottest_Hand
	CTFPlayer.ShootFireball <- function()
	{
		local fireball = Entities.CreateByClassname("tf_projectile_spellfireball")

		fireball.SetOwner(this)
		SetPropInt(fireball, "m_iTeamNum", this.GetTeam())
		fireball.SetLocalOrigin(this.EyePosition()+(this.EyeAngles().Forward()*32) + Vector(0,0,this.EyeAngles().z-16))
		fireball.SetLocalAngles(this.EyeAngles())
		fireball.SetAbsVelocity(this.EyeAngles().Forward()*800)

		Entities.DispatchSpawn(fireball)
	}

//Uses a think script to check for when the Pyro is 1) Has the HotHand and 2) Is taunting
	if( weapon.ValidateScriptScope() )
	{
		local wep = null
		local CAN_TAUNT_WITH_HOTHAND = false

		local entityscript = weapon.GetScriptScope()
		entityscript["think_PyroHottestHand"] <- function()	//Our script's name.
		{
			if ( player.InCond(7) && CAN_TAUNT_WITH_HOTHAND ) {	//IF taunting and while CAN_TAUNT_WITH_HOTHAND is True...
				CAN_TAUNT_WITH_HOTHAND = false
				wep = null

				DoEntFire("!self", "RunScriptCode", "self.ShootFireball()", 1.9, null, player)
			}
			else if ( !player.InCond(7) && player.GetActiveWeapon() != wep )	// if player switches weapons...
			{
				wep = player.GetActiveWeapon()	//...make it so they don't run this condition again!

				if ( player.GetActiveWeapon().GetClassname() == "tf_weapon_slap" ) {	//if player is holding the hothand...
					CAN_TAUNT_WITH_HOTHAND = true	//...set to true for checking taunting with Hot Hand
				}
			}
			if ( player.GetActiveWeapon().GetClassname() == "tf_weapon_slap" ) {
				player.AddCondEx(37, 0.15, player) //First-blood arena crit-boost. Constantly applies so if the weapon is gone the conditions don't stay.
			}
			else	//if not using Hot Hand
			{
				player.RemoveCond(37)
			}
			return	//uses default 0.1 delay
		}
		AddThinkToEnt(weapon, "think_PyroHottestHand")	//Adds the think script to handle 'weapon' after it has been validated.
	}
}

RegisterCustomWeapon("Hottest Hand", "Hot Hand", CW_Stats_Example_Hottest_Hand, null, null, null)
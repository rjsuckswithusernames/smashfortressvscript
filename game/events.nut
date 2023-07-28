

function Tick()
{
    FireListeners("tick_only_valid", 0.1);
    FireListeners("tick_always", 0.1);
    return 0.1;
}

function OnScriptHook_OnTakeDamage(params)
{
    if (params.const_entity.IsPlayer())
    {
        if (Started == false)
        {
            params.damage = 0
            return
        }
        params.damage = handleDamage(params)
        params.crit_type = handleCrit(params)
        local player = params.const_entity
        local damage = params.damage
        local attacker = params.attacker
        local damagecustom = params.damage_custom
        local damagetype = params.damage_type
        local crit_type = params.crit_type


        player.SetHealth(player.GetMaxHealth()-500) //prevent player death

        if (player.InCond(5) == false && player.InCond(52) == false && attacker != null)
        {
            addPercent(player,damage)
            if (attacker != null && attacker != player && player.InCond(28) == false && params.damage_type != 2056 && params.damage_custom != 34)
            {
                applyKnockback(player,damage,attacker,crit_type)

            }

        }

    }
    FireListeners("damage_hook", params);
    params.damage = 1
}

function OnGameEvent_player_hurt(params)
{

    local victim;
    if ((victim = GetPlayerFromParams(params)) == null)
        return;
    local attacker;
    if ((attacker = GetPlayerFromParams(params, "attacker")) == null)
        return;
    printl(GetFriction(attacker))
    FireListeners("player_hurt", [attacker, victim, params]);
}

function OnGameEvent_player_spawn(params)
{
    local id = params.userid
    local player = GetPlayerFromUserID(id)
    if ((player = GetPlayerFromParams(params)) == null)
        return;

    player.SetHealth(player.GetMaxHealth()-500) //prevent player death
    FireListeners("spawn", player);
}

function OnGameEvent_player_healed(params)
{
    local patient = params.patient
    local amount = params.amount
    local player = GetPlayerFromUserID(patient)
    if (patient in Knockback){
        Knockback[patient] <- clampFloor(0,Knockback[patient] - amount/5)
    }
    player.SetHealth(player.GetMaxHealth()-500)


}
function OnGameEvent_player_death(params)
{
    if (params.death_flags & TF_DEATHFLAG.DEAD_RINGER)
        return;
    local player = GetPlayerFromUserID(params.userid)
    if (player == null)
        return;

    FireListeners("death", params);
}

function OnGameEvent_arena_round_start(params)
{
    for (local i = 1; i <= Constants.Server.MAX_PLAYERS; i++)
    {
        local player = PlayerInstanceFromIndex(i)
        if (player == null) continue
        player.AddCondEx(52, 5, null)
        local id = GetPlayerUserID(player)
        Lives[id] <- 3
        Knockback[id] <- 0
    }
    Started <- true
}

function OnGameEvent_post_inventory_application(params)
{
    local id = params.userid
    Knockback[id] <- 0
}

function OnGameEvent_player_changeclass(params)
{
    local id = params.userid
    Lives[id] <- 3
    Knockback[id] <- 0
}

function loseLife()
{
    local id = GetPlayerUserID(activator)
    Lives[id] -= 1
    Knockback[id] <- 0
    if (Lives[id] > 0)
    {
        activator.ForceRespawn()
        activator.AddCondEx(52, 5, null)
        activator.AddCondEx(28, 5, null)
    }
    else
    {
        activator.SetMaxHealth(0)
        activator.SetHealth(0)
        activator.TakeDamage(100000, 0, null);
    }


}

function addPercent(player, damage)
{
    local uid = GetPlayerUserID(player);
    Knockback[uid] += damage

}

function applyKnockback(player, damage, attacker, crit_type)
{
    local uid = GetPlayerUserID(player)
    local eyeAngles = attacker.EyeAngles();
    local a = eyeAngles.x
    local vAngles = array(3)
    local vReturn = array(3)
    local trueDamage = damage
    vAngles[0] = 50.0
    vAngles[1] = eyeAngles.y
    vAngles[2] = eyeAngles.z
    vReturn[0] = cos(DegToRad(vAngles[1])) * trueDamage *0.15
    vReturn[1] = sin(DegToRad(vAngles[1])) * trueDamage *0.15
    if (crit_type == 2)
    {
        vReturn[2] = sin(DegToRad(vAngles[0])) * (trueDamage * 0.25)
    }
    else if (crit_type == 2)
    {
        vReturn[2] = sin(DegToRad(vAngles[0])) * (trueDamage * 0.25)
    }
    else
    {
        vReturn[2] = sin(DegToRad(vAngles[0])) * (trueDamage * 0.25)
    }


    //printl((Knockback[uid]))
    local playervel = player.GetAbsVelocity()
    local kbvalue = 1 + (damage/100)
    player.AddCondEx(115, (Knockback[uid]/100)*2, null)
    player.AddCondEx(127, (Knockback[uid]/100)*2, null)
    player.SetAbsVelocity(Vector(playervel.x,0,playervel.z) + (Vector(vReturn[0],vReturn[1],vReturn[2]) * ((Knockback[uid] + damage) * kbvalue))) // why did i do this
    //player.AddCondEx(52, 2, null)
}

function handleDamage(params)
{
    local victim = params.const_entity
    local damage = params.damage
    local attacker = params.attacker
    local weapon = params.weapon
    local newdmg = params.damage
    local type = params.damage_type
    if (type == Constants.FDmgType.DMG_FALL) {
        return 1
    }
    if (weapon == null){
        return newdmg
    }

    if (WeaponIs(weapon, "caber")
    || WeaponIs(weapon, "caber_sploded"))
        {
            if (params.damage_custom == Constants.ETFDmgCustom.TF_DMG_CUSTOM_STICKBOMB_EXPLOSION)
            {
                newdmg = params.damage * 5;
            }
            else
            {
                newdmg = params.damage / 5;
            }
        }
        if (params.damage_custom == Constants.ETFDmgCustom.TF_DMG_CUSTOM_BACKSTAB)
        {
            newdmg = 150;
        }
        if (attacker != null && attacker.InCond(Constants.ETFCond.TF_COND_BLASTJUMPING) && WeaponIs(weapon, "market_gardener"))
        {
            newdmg *= 3;
        }
        if (weapon.GetClassname() == "tf_weapon_rocketlauncher" || weapon.GetClassname() == "tf_weapon_particle_cannon" || "tf_weapon_rocketlauncher_airstrike")
        {
            newdmg *= 0.35
        }
        if (weapon.GetClassname() == "tf_weapon_rocketlauncher_directhit")
        {
            newdmg *= 0.25
        }
        if (weapon.GetClassname() == "tf_weapon_syringegun_medic")
        {
            newdmg *= 3
        }
        if (weapon.GetClassname() == "tf_weapon_flamethrower")
        {
            newdmg *= 2
        }
        if (weapon.GetClassname() == "tf_weapon_sniperrifle")
        {
            newdmg /= 2
        }
        //tf_weapon_crossbow
        if (victim.GetPlayerClass() == TF_CLASS.HEAVY)
        {
            newdmg *= 0.75
        }

    return newdmg
}

function handleCrit(params)
{
    if (params.damage_custom == Constants.ETFDmgCustom.TF_DMG_CUSTOM_HEADSHOT)
    {
        return 0
    }
    return params.crit_type
}

__CollectGameEventCallbacks(this)
__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
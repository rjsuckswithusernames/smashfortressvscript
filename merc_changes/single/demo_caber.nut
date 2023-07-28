// /TF_DMG_CUSTOM_STICKBOMB_EXPLOSION
class DemoCaberChange extends CharacterChange
{
    function CanApply()
    {
        return player.GetPlayerClass() == TF_CLASS.DEMO;
    }

    function OnDamageDealt(params)
    {
        local victim = params.const_entity
        local attacker = params.attacker
        local weapon = params.weapon;
        if (WeaponIs(weapon, "caber")
        || WeaponIs(weapon, "caber_sploded"))
            {
                if (params.damage_custom == Constants.ETFDmgCustom.TF_DMG_CUSTOM_STICKBOMB_EXPLOSION)
                {
                    params.damage = params.damage * 5;
                    if (victim != attacker)
                        Explode(victim)
                }
                else
                {
                    params.damage = params.damage / 5;
                }
            }
    }
    function Explode(player)
{
    local id = GetPlayerUserID(player)
    Lives[id] -= 1
    Knockback[id] <- 0
    if (Lives[id] > 0)
    {
        player.ForceRespawn()
        player.AddCondEx(52, 2, null)
        player.AddCondEx(28, 2, null)
    }
    else
    {
        player.SetMaxHealth(0)
        player.SetHealth(0)
        player.TakeDamage(100000, 0, null);
    }


}

}

characterChangesClasses.push(DemoCaberChange);
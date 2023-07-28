class SpyBackstabChange extends CharacterChange
{
    function CanApply()
    {
        return player.GetPlayerClass() == TF_CLASS.SPY;
    }

    function OnDamageDealt(params)
    {
        if (params.damage_custom == Constants.ETFDmgCustom.TF_DMG_CUSTOM_BACKSTAB)
        {


            if (WeaponIs(params.weapon, "kunai"))
            {
                local uid = GetPlayerUserID(player)
                Knockback[uid] <- clampFloor(0,Knockback[uid] - 200)
            }
            else if (WeaponIs(params.weapon, "big_earner"))
            {
                player.AddCondEx(Constants.ETFCond.TF_COND_SPEED_BOOST, 3, -1);
                player.SetSpyCloakMeter(clampFloor(100, player.GetSpyCloakMeter() + 30));
                //TODO: fix this shit
            }
        }
    }
}
characterChangesClasses.push(SpyBackstabChange);

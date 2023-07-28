class AxeSwitchChange extends CharacterChange
{
    function CanApply()
    {
        local playerClass = player.GetPlayerClass();
        return playerClass == TF_CLASS.PYRO;
    }
//if (WeaponIs(params.weapon, "half_zatoichi"))
    function OnApply()
    {
        for (local i = 0; i < GLOBAL_WEAPON_COUNT; i++)
		{
			local weapon = GetPropEntityArray(player, "m_hMyWeapons", i)

            if (weapon != null)
            {
                if (WeaponIs(weapon, "axetinguish")
                || WeaponIs(weapon, "axetinguish_xmas")
                || WeaponIs(weapon, "postal"))
                    weapon.RemoveAttribute("single wep holster time increased")
            }

        }
    }
}

characterChangesClasses.push(AxeSwitchChange);
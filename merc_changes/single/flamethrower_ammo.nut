class FlameAmmoChange extends CharacterChange
{
    function CanApply()
    {
        local playerClass = player.GetPlayerClass();
        return playerClass == TF_CLASS.PYRO;
    }
    function OnApply()
    {

        for (local i = 0; i < GLOBAL_WEAPON_COUNT; i++)
		{
			local weapon = GetPropEntityArray(player, "m_hMyWeapons", i)

            if (weapon != null)
            {
                if (weapon.GetClassname() == "tf_weapon_flamethrower")
                {
                    weapon.SetClip1(50)
                    weapon.SetClip2(50)
                    weapon.RemoveAttribute("ammo regen")
                    weapon.AddAttribute("ammo regen", 0.05, -1)
                }

            }

        }


    }
}

characterChangesClasses.push(FlameAmmoChange);
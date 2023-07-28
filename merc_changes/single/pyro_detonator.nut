//self dmg push force increased
class DetonatorChange extends CharacterChange
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
                    weapon.AddAttribute("self dmg push force increased", 0.2, -1)
                }

            }

        }
    }
}

characterChangesClasses.push(DetonatorChange);
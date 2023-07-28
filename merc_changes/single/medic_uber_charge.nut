class MedicUberRateChange extends CharacterChange
{
    function CanApply()
    {
        return player.GetPlayerClass() == TF_CLASS.MEDIC;
    }

    function OnApply()
    {
		for (local i = 0; i < GLOBAL_WEAPON_COUNT; i++)
		{
			local weapon = GetPropEntityArray(player, "m_hMyWeapons", i)
            if (weapon != null && weapon.GetClassname() == "tf_weapon_medigun")
                weapon.AddAttribute("ubercharge rate bonus", 2, -1);
        }
    }
}
characterChangesClasses.push(MedicUberRateChange);
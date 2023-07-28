//SetPropInt(building, "m_iHighestUpgradeLevel", 1)
class EngineerSentryChange extends CharacterChange
{
    sentryDamageAccumulated = 0;
    lastHitWasSentry = false;

    function CanApply()
    {
        return player.GetPlayerClass() == TF_CLASS.ENGINEER;
    }
//damage bonus bullet vs sentry target
    function OnApply()
    {
		for (local i = 0; i < GLOBAL_WEAPON_COUNT; i++)
		{
			local weapon = GetPropEntityArray(player, "m_hMyWeapons", i)

            if (weapon != null)
            {
                if (weapon.GetClassname() == "tf_weapon_shotgun_primary" || weapon.GetClassname() == "tf_weapon_sentry_revenge")
                {
                    weapon.AddAttribute("damage bonus bullet vs sentry target", 1.1, -1);
                }
                if (weapon.GetClassname() == "tf_weapon_wrench")
                {
                    weapon.AddAttribute("metal regen", 10.0, -1)
                    weapon.AddAttribute("building cost reduction", 0.5, -1)
                }
                if (weapon.GetClassname() == "tf_weapon_robot_arm")
                {
                    player.AddCustomAttribute("engy disposable sentries", 1.0, -1)
                    weapon.AddAttribute("engy disposable sentries", 1.0, -1)
                    weapon.AddAttribute("metal regen", 10.0, -1)
                    weapon.AddAttribute("building cost reduction", 0.5, -1)
                }
            }

        }
    }

}
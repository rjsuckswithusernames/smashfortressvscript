//weapon.AddAttribute("increased jump height from weapon", 5, -1)
class GeneralChange extends CharacterChange
{


    function OnApply()
    {

        for (local i = 0; i < GLOBAL_WEAPON_COUNT; i++)
        {
            local weapon = GetPropEntityArray(player, "m_hMyWeapons", i)
            if (weapon != null)
            {
                if (player.GetPlayerClass() == TF_CLASS.HEAVY)
                {
                    weapon.AddAttribute("increased jump height from weapon", 1.5, -1)
                }
                else
                {
                    weapon.AddAttribute("increased jump height from weapon", 2.5, -1)
                }
                player.AddCustomAttribute("max health additive bonus", 5000, -1)
                weapon.AddAttribute("ammo regen", 0.05, -1)
                weapon.AddAttribute("slow enemy on hit", 100, -1)
            }
        }
    }
    function OnTick(interval)
    {
        local uid = GetPlayerUserID(player)
        if (uid in Lives && Lives[uid] != 0)
        {
            player.SetMaxHealth(5000)
            player.SetHealth(player.GetMaxHealth()-500)
            player.RemoveCustomAttribute("max health additive bonus");
            player.AddCustomAttribute("max health additive bonus", 5000, -1);
        }
        else
        {
            player.RemoveCustomAttribute("max health additive bonus");
            player.TakeDamage(100000, 0, null);
        }

    }
}
characterChangesClasses.push(GeneralChange);
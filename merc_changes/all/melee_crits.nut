class MeleeCritsChange extends CharacterChange
{
    function CanApply()
    {
        return player.GetPlayerClass() != TF_CLASS.SPY;
    }

    function OnTick(interval)
    {
        local weapon = player.GetActiveWeapon();
        if (WeaponIs(weapon, "market_gardener"))
            return;
        if (GTFW_ReturnWeaponBySlotBool(weapon, TF_WEAPONSLOTS.MELEE))
            player.AddCondEx(Constants.ETFCond.TF_COND_CRITBOOSTED_ON_KILL, 0.2, null);
    }
}
characterChangesClasses.push(MeleeCritsChange);
class DemoSwordChange extends CharacterChange
{
    function CanApply()
    {
        return player.GetPlayerClass() == TF_CLASS.DEMO;
    }

    function OnDamageDealt(params)
    {
        local weapon = params.weapon;
        if (WeaponIs(weapon, "eyelander")
        || WeaponIs(weapon, "headtaker")
        || WeaponIs(weapon, "golf_club")
        || WeaponIs(weapon, "eyelander_xmas"))
            AddHead();
    }

    function AddHead()
    {
        AddPropInt(player, "m_Shared.m_iDecapitations", 1);
        player.AddCond(Constants.ETFCond.TF_COND_DEMO_BUFF);
        player.AddCondEx(Constants.ETFCond.TF_COND_SPEED_BOOST, 0.01, 0.01);
    }
}
characterChangesClasses.push(DemoSwordChange);
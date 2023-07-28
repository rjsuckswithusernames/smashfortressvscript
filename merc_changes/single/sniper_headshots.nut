class SniperHeadshotChange extends CharacterChange
{
    function CanApply()
    {
        return player.GetPlayerClass() == TF_CLASS.SNIPER;
    }

    function OnDamageDealt(params)
    {
        if (params.damage_custom == Constants.ETFDmgCustom.TF_DMG_CUSTOM_HEADSHOT)
        {
            AddPropInt(player, "m_Shared.m_iDecapitations", 1);
        }
    }
}
characterChangesClasses.push(SniperHeadshotChange);
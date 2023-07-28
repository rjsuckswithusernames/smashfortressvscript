class HeavyKGBCritChange extends CharacterChange
{
    function CanApply()
    {
        return player.GetPlayerClass() == TF_CLASS.HEAVY;
    }

    function OnDamageDealt(params)
    {
        if ((params.damage_type & 128) && GetPropInt(params.weapon, "m_AttributeManager.m_Item.m_iItemDefinitionIndex") == 43)
            player.AddCondEx(Constants.ETFCond.TF_COND_CRITBOOSTED_ON_KILL, 5, null);
    }
}
characterChangesClasses.push(HeavyKGBCritChange);
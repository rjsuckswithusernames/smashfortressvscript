class DemoKatanaChange extends CharacterChange
{
    function CanApply()
    {
        local playerClass = player.GetPlayerClass();
        return playerClass == TF_CLASS.SOLDIER || playerClass == TF_CLASS.DEMO;
    }

    function OnDamageDealt(params)
    {
        if (WeaponIs(params.weapon, "half_zatoichi"))
        {
            local playerClass = player.GetPlayerClass();
            local uid = GetPlayerUserID(player)
            if (playerClass == TF_CLASS.SOLDIER)
            {
                Knockback[uid] <- clampFloor(0,Knockback[uid] - 200)
            }
            else
            {
                Knockback[uid] <- clampFloor(0,Knockback[uid] - 100)
            }
			SetPropInt(params.weapon, "m_bIsBloody", 1);
			AddPropInt(player, "m_Shared.m_iKillCountSinceLastDeploy", 1);
        }
    }
}
characterChangesClasses.push(DemoKatanaChange);
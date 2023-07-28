class MedicRegenChange extends CharacterChange
{
    function CanApply()
    {
        return player.GetPlayerClass() == TF_CLASS.MEDIC;
    }

    function OnTick(interval)
    {
        local uid = GetPlayerUserID(player)
        if (uid in Knockback)
        {
            Knockback[uid] <- clampFloor(0,Knockback[uid] - 0.15)
        }
    }
}
characterChangesClasses.push(MedicRegenChange);
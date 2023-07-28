isRoundSetup <- true
isRoundOver <- false;
starterClass <- {}
isFeedbackRound <- false;
roundStartTime <- Time();

function StartNewRound(void)
{
    local forceRespawn = Entities.FindByClassname(null, "game_forcerespawn");
    EntFireByHandle(forceRespawn, "ForceRespawn", "", 0, null, null);

    for (local i = 1; i <= Constants.Server.MAX_PLAYERS; i++)
    {
        local player = PlayerInstanceFromIndex(i)
        if (player == null) continue
        player.ForceRegenerateAndRespawn();
        player.KeyValueFromString("targetname", "");
    }

}
AddListener("round_start", StartNewRound, 0);
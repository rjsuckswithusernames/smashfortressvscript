::clampCeiling <- function(valueA, valueB)
{
    if (valueA < valueB)
        return valueA;
    return valueB;
}

::clampFloor <- function(valueA, valueB)
{
    if (valueA > valueB)
        return valueA;
    return valueB;
}

::clamp <- function(value, min, max)
{
    if (value < min)
        return min;
    if (value > max)
        return max;
    return value;
}

::PlayerManager <- Entities.FindByClassname(null, "tf_player_manager");
::GetPlayerUserID <- function(player)
{
    return NetProps.GetPropIntArray(PlayerManager, "m_iUserID", player.entindex());
}
::IsValidPlayer <- function(player)
{
    try
    {
        return player != null && player.IsValid() && player.IsPlayer() && player.GetTeam() > 1;
    }
    catch(e)
    {
        return false;
    }
}
::IsPlayerAlive <- function(player)
{
    // lifeState corresponds to the following values:
    // 0 - alive
    // 1 - dying (probably unused)
    // 2 - dead
    // 3 - respawnable (spectating)
    return NetProps.GetPropInt(player, "m_lifeState") == 0;
}

::DegToRad <- function (deg) {
    return (deg * PI)/180;
}

::RunWithDelay <- function(func, activator, delay)
{
    EntFireByHandle(sb_vscript_entity, "RunScriptCode", func, delay, activator, activator);
}
function GetPlayerFromParams(params, key = "userid")
{
    if (!(key in params))
        return null;
    local player = GetPlayerFromUserID(params[key]);
    if (IsValidPlayer(player))
        return player;
    return null;
}

function GetAlivePlayers()
{
    for (local i = 1; i <= Constants.Server.MAX_PLAYERS; i++)
    {
        local player = PlayerInstanceFromIndex(i);
        if (IsPlayerAlive(player))
            yield player;
    }
    return null;
}
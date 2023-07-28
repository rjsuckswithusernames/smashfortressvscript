ClearGameEventCallbacks()

IncludeScript("smashbros/util/netprops.nut");
IncludeScript("smashbros/util/util.nut");
IncludeScript("smashbros/util/constants.nut");
IncludeScript("smashbros/util/listeners.nut");

IncludeScript("smashbros/util/weapons.nut");
IncludeScript("smashbros/give_tf_weapon/give_tf_weapon.nut");
IncludeScript("smashbros/merc_changes/merc.nut");
//IncludeScript("smashbros/merc_changes/merc_spawner.nut");
IncludeScript("smashbros/game/hud.nut");
IncludeScript("smashbros/game/round.nut");
IncludeScript("smashbros/game/gamerules.nut");
IncludeScript("smashbros/game/events.nut");


::sb_vscript <- this
if(self.GetName() == "")
    self.KeyValueFromString("targetname", "logic_script_sb");
::sb_vscript_name <- self.GetName()
::sb_vscript_entity <- self
::Lives <- {}
::Knockback <- {}
::Started <- false

function OnPostSpawn()
{
    for (local i = 1; i <= Constants.Server.MAX_PLAYERS; i++)
    {
        local player = PlayerInstanceFromIndex(i)
        if (player == null) continue
        player.AddCondEx(52, 12.0, null)
        player.AddCondEx(28, 12.0, null)
        local id = GetPlayerUserID(player)
        Started <- false
        Lives[id] <- 3
        Knockback[id] <- 0
    }
    FireListeners("round_start", null);
}

function IsRoundSetup()
{
    return !Started
}










//22, 25




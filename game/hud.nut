function SpawnTextEntities(void)
{

    SpawnEntityFromTable("game_text",
    {
        color = "236 227 203",
        color2 = "0 0 0",
        channel = 1,
        effect = 0,
        fadein = 0,
        fadeout = 0,
        fxtime = 0,
        holdtime = 250,
        message = "0",
        spawnflags = 0,
        x = 0.481,
        y = 0.638,
        targetname = "game_text_damage"
    });
    SpawnEntityFromTable("game_text",
    {
        color = "236 227 203",
        color2 = "0 0 0",
        channel = 4,
        effect = 0,
        fadein = 0,
        fadeout = 0,
        fxtime = 0,
        holdtime = 250,
        message = "0",
        spawnflags = 0,
        x = 0.231,
        y = 0.788,
        targetname = "game_text_lives"
    });
}
SpawnTextEntities(null);

function TickHUD(interval)
{
    //VGUI Update Waiting Room
    local tf_player_manager = PlayerManager
    for (local i = 1; i <= Constants.Server.MAX_PLAYERS; i++)
    {
        local player = PlayerInstanceFromIndex(i)
        if (IsValidPlayer(player))
        {
            local id = GetPlayerUserID(player)
            //Your Percent∶
            if (id in Knockback && id in Lives && Lives[id] > 0)
            {
                local number = Knockback[id];
                local number2 = Lives[id];
                local offset = number < 10 ? 0.498 : number < 100 ? 0.493 : number < 1000 ? 0.491 : 0.487;
                DoEntFire("game_text_damage", "AddOutput", "message " + number + "%", 0, player, player);
                DoEntFire("game_text_damage", "AddOutput", "x "+offset, 0, player, player);
                DoEntFire("game_text_damage", "Display", "", 0, player, player);
                DoEntFire("game_text_lives", "AddOutput", "message " + number2, 0, player, player);
                DoEntFire("game_text_lives", "Display", "", 0, player, player);
            }
        }
        else
        {
            DoEntFire("game_text_damage", "AddOutput", "message " + "", 0, player, player);
            DoEntFire("game_text_lives", "AddOutput", "message " + "", 0, player, player);
        }


    }

}
AddListener("tick_only_valid", TickHUD, 2);

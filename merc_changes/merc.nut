::characterChangesClasses <- [];
::characterChanges <- {};
class CharacterChange
{
    lastFireTime = 0;
    lastWeapon = null;
    player = null;

    function constructor()
    {
    }

    function TryApply(player)
    {
        if (!IsValidPlayer(player))
            return;
        this.player = player;
        if (!CanApply())
            return;
        if (!(player in characterChanges))
            characterChanges[player] <- [];
        characterChanges[player].push(this);
        OnApply();
    }

    function CanApply() { return true; }
    function CheckTeam() { return player; }
    function OnApply() { }
    function OnFrameTick() { }
    function OnTick(interval) { }
    function OnDamageDealt(params) { }
    function OnDamageTaken(params) { }
    function OnDeath(params) { }
    function OnHurtDealtEvent(victim, params) { }
}

IncludeScript("smashbros/merc_changes/single/spy_backstab.nut");
IncludeScript("smashbros/merc_changes/single/sniper_headshots.nut");
IncludeScript("smashbros/merc_changes/single/medic_uber_charge.nut");
IncludeScript("smashbros/merc_changes/single/medic_passive_regen.nut");
IncludeScript("smashbros/merc_changes/single/heavy_kgb.nut");
IncludeScript("smashbros/merc_changes/single/engie_sentry.nut");
IncludeScript("smashbros/merc_changes/single/demo_sword.nut");
IncludeScript("smashbros/merc_changes/single/demo_katana.nut");
IncludeScript("smashbros/merc_changes/single/demo_caber.nut");
IncludeScript("smashbros/merc_changes/single/axe_switch_speed.nut");

IncludeScript("smashbros/merc_changes/all/melee_crits.nut");
IncludeScript("smashbros/merc_changes/all/super_jump.nut");
IncludeScript("smashbros/merc_changes/all/general_changes.nut");

IncludeScript("smashbros/merc_changes/single/flamethrower_ammo.nut");


function CharacterChanges_Spawn(player)
{
    characterChanges[player] <- [];
    foreach (characterChange in characterChangesClasses)
        try
        {
            local newChange = characterChange();
            newChange.TryApply.call(newChange, player);
        }
        catch(e) { }
}
AddListener("spawn", CharacterChanges_Spawn, -1);

function CharacterChanges_Tick(interval)
{
    foreach (player in GetAlivePlayers())
        if (player in characterChanges)
            foreach (characterChange in characterChanges[player])
                try { characterChange.OnTick.call(characterChange, interval); }
                catch(e) { }
}
AddListener("tick_always", CharacterChanges_Tick, 2);

function CharacterChanges_FrameTick(void)
{
    foreach (player in GetAlivePlayers())
        if (player in characterChanges)
            foreach (characterChange in characterChanges[player])
                try { characterChange.OnFrameTick.call(characterChange); }
                catch(e) { }
}
AddListener("tick_frame", CharacterChanges_FrameTick, 2);

function CharacterChanges_Death(params)
{
    local player;
    if ((player = GetPlayerFromParams(params)) == null)
        return;
    foreach (characterChange in characterChanges[player])
        try { characterChange.OnDeath.call(characterChange, params); }
        catch(e) { }
}
AddListener("death", CharacterChanges_Death, 0);

function CharacterChanges_Damage(params)
{
    local victim = params.const_entity;
    local attacker = params.attacker;

    if (IsValidPlayer(attacker))
        foreach (characterChange in characterChanges[attacker])
            try { characterChange.OnDamageDealt.call(characterChange, params); }
            catch(e) { }

    if (IsValidPlayer(victim))
        foreach (characterChange in characterChanges[victim])
            try { characterChange.OnDamageTaken.call(characterChange, params); }
            catch(e) { }
}
AddListener("damage_hook", CharacterChanges_Damage, 0);

function CharacterChanges_Hurt(params)
{
    local attacker = params[0];
    local victim = params[1];
    local eventParams = params[2];

    if (IsValidPlayer(attacker))
        foreach (characterChange in characterChanges[attacker])
            try { characterChange.OnHurtDealtEvent.call(characterChange, victim, eventParams); }
            catch(e) { }
}
AddListener("player_hurt", CharacterChanges_Hurt, 0);
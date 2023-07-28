//=========================================================================
//Copyright LizardOfOz.
//This is still beta and things might and will change over time.
//
//Check the following links for updates:
//   https://tf2maps.net/members/lizardofoz.39426/#resources
//   https://twitter.com/LizardOfOz_
//   https://youtube.com/LizardOfOz
//
//Credits:
//  LizardOfOz - the original VSH Plugin. VSH Vscript recreation.
//  Maxxy - Saxton Hale's model imitating Jungle Inferno SFM; Custom animations and promotional material.
//  Velly - VFX, animations scripting, technical assistance
//  JPRAS - Mayann Hale body reference, model feedback.
//  MegapiemanPHD - Saxton Hale and Gray Mann voice acting.
//  Yakibomb - give_tf_weapon script bundle (used for Hale's first-person hands model).
//=========================================================================

function SetConvars()
{
    Convars.SetValue("tf_weapon_criticals", 1);
    Convars.SetValue("mp_disable_respawn_times", 0);
    Convars.SetValue("mp_respawnwavetime", 999999);
    Convars.SetValue("tf_classlimit", 0);
    Convars.SetValue("mp_forcecamera", 0);
    Convars.SetValue("sv_alltalk", 1);
    Convars.SetValue("tf_dropped_weapon_lifetime", 0);
    Convars.SetValue("mp_idledealmethod", 0);
    Convars.SetValue("mp_idlemaxtime", 9999);
    Convars.SetValue("mp_stalemate_timelimit", 9999999);
    Convars.SetValue("mp_winlimit", 0);
    Convars.SetValue("mp_maxrounds", 0);
    Convars.SetValue("tf_arena_use_queue", 0);
}
SetConvars();

function SpawnHelperEntities()
{
    local gamerules = Entities.FindByClassname(null, "tf_gamerules");

    local  feedbackRelay = SpawnEntityFromTable("logic_relay", {
        targetname = "TF2M_FeedbackRoundRelay",
        spawnflags = 0,
    });

    feedbackRelay.ValidateScriptScope();
    feedbackRelay.GetScriptScope().Tick <- function()
    {
        sb_vscript.FireListeners("tick_frame", null);
        return 0;
    }

}
SpawnHelperEntities();
AddThinkToEnt(self, "Tick")

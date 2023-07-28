::weaponModels <- {
    market_gardener = GetModelIndex("models/workshop/weapons/c_models/c_market_gardener/c_market_gardener.mdl"),
    holiday_punch = GetModelIndex("models/workshop/weapons/c_models/c_xms_gloves/c_xms_gloves.mdl"),
    eyelander = GetModelIndex("models/weapons/c_models/c_claymore/c_claymore.mdl"),
    headtaker = GetModelIndex("models/weapons/c_models/c_headtaker/c_headtaker.mdl"),
    golf_club = GetModelIndex("models/workshop/weapons/c_models/c_golfclub/c_golfclub.mdl"),
    eyelander_xmas = GetModelIndex("models/weapons/c_models/c_claymore/c_claymore_xmas.mdl"),
    natasha = GetModelIndex("models/weapons/c_models/c_minigun/c_minigun_natascha.mdl"),
    kunai = GetModelIndex("models/workshop_partner/weapons/c_models/c_shogun_kunai/c_shogun_kunai.mdl"),
    big_earner = GetModelIndex("models/workshop/weapons/c_models/c_switchblade/c_switchblade.mdl"),
    your_eternal_reward = GetModelIndex("models/workshop/weapons/c_models/c_eternal_reward/c_eternal_reward.mdl"),
    wanga_prick = GetModelIndex("models/workshop/weapons/c_models/c_voodoo_pin/c_voodoo_pin.mdl"),
    vaccinator = GetModelIndex("models/workshop/weapons/c_models/c_medigun_defense/c_medigun_defense.mdl"),
    caber = GetModelIndex("models/workshop/weapons/c_models/c_caber/c_caber.mdl"),
    caber_sploded = GetModelIndex("models/workshop/weapons/c_models/c_caber/c_caber_exploded.mdl"),
    atomizer = GetModelIndex("models/workshop/weapons/c_models/c_bonk_bat/c_bonk_bat.mdl"),
    axtinguish = GetModelIndex("models/workshop/weapons/c_models/c_axtinguisher/c_axtinguisher_pyro.mdl"),
    axtinguish_xmas = GetModelIndex("models/workshop/weapons/c_models/c_fireaxe_pyro/c_fireaxe_pyro_xmas.mdl"),
    postal = GetModelIndex("models/workshop/weapons/c_models/c_mailbox/c_mailbox.mdl"),

}

::WeaponIs <- function(weapon, name)
{
    if (weapon == null)
        return false;
    if (name == "airstrike")
        return weapon.GetClassname() == "tf_weapon_rocketlauncher_airstrike";
    if (name == "half_zatoichi")
        return weapon.GetClassname() == "tf_weapon_katana";
    if (name == "any_stickybomb_launcher")
        return weapon.GetClassname() == "tf_weapon_pipebomblauncher";
    return (name in weaponModels ? weaponModels[name] : null) == GetPropInt(weapon, "m_iWorldModelIndex");
}
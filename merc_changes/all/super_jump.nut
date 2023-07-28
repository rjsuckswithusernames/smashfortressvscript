enum  SUPER_JUMP_STATUS
{
    WALKING = 0,
    JUMP_STARTED = 1,
    CAN_DOUBLE_JUMP = 2,
    DOUBLE_JUMPED = 3,
    CAN_TRIPLE_JUMP = 4,
    TRIPLE_JUMPED = 5,
    CAN_QUAD_JUMP = 6,
    QUAD_JUMPED = 7
};

class SuperJumpChange extends CharacterChange
{

    jumpStatus = SUPER_JUMP_STATUS.WALKING;


    function OnTick(interval)
    {
        local buttons = GetPropInt(player, "m_nButtons");
        if (!(player.GetFlags() & Constants.FPlayer.FL_ONGROUND))
        {
            if (jumpStatus == SUPER_JUMP_STATUS.WALKING)
            {
                jumpStatus = SUPER_JUMP_STATUS.JUMP_STARTED;

            }
            else if (jumpStatus == SUPER_JUMP_STATUS.JUMP_STARTED && !(buttons & Constants.FButtons.IN_JUMP))
                jumpStatus = SUPER_JUMP_STATUS.CAN_DOUBLE_JUMP;
        }
        else
            jumpStatus = SUPER_JUMP_STATUS.WALKING;
            player.RemoveCond(115);
            player.RemoveCond(127);
        if (jumpStatus == SUPER_JUMP_STATUS.DOUBLE_JUMPED && !(buttons & Constants.FButtons.IN_JUMP) && player.GetPlayerClass() == TF_CLASS.SCOUT)
        {
            jumpStatus = SUPER_JUMP_STATUS.CAN_TRIPLE_JUMP;
        }
        for (local i = 0; i < GLOBAL_WEAPON_COUNT; i++)
        {
            local weapon = GetPropEntityArray(player, "m_hMyWeapons", i)
            if (weapon != null)
            {
                if (jumpStatus == SUPER_JUMP_STATUS.TRIPLE_JUMPED && !(buttons & Constants.FButtons.IN_JUMP) && WeaponIs(weapon, "atomizer"))
                {
                    jumpStatus = SUPER_JUMP_STATUS.CAN_QUAD_JUMP;
                }

            }
        }

        if (buttons & Constants.FButtons.IN_JUMP && jumpStatus == SUPER_JUMP_STATUS.CAN_QUAD_JUMP)
            {
                if (!sb_vscript.IsRoundSetup())
                {
                    jumpStatus = SUPER_JUMP_STATUS.QUAD_JUMPED;
                    Perform();
                }
            }
        else if (buttons & Constants.FButtons.IN_JUMP && jumpStatus == SUPER_JUMP_STATUS.CAN_TRIPLE_JUMP)
            {
                if (!sb_vscript.IsRoundSetup())
                {
                    jumpStatus = SUPER_JUMP_STATUS.TRIPLE_JUMPED;
                    Perform();
                }
            }
        else if (buttons & Constants.FButtons.IN_JUMP && jumpStatus == SUPER_JUMP_STATUS.CAN_DOUBLE_JUMP)
        {
            if (!sb_vscript.IsRoundSetup())
            {
                jumpStatus = SUPER_JUMP_STATUS.DOUBLE_JUMPED;
                Perform();
            }
        }
    }

    function Perform()
    {
        local buttons = GetPropInt(player, "m_nButtons");
        local eyeAngles = player.EyeAngles();
        local forward = eyeAngles.Forward();
        forward.z = 0;
        forward.Norm();
        local left = eyeAngles.Left();
        left.z = 0;
        left.Norm();

        local forwardmove = 0
        if (buttons & Constants.FButtons.IN_FORWARD)
            forwardmove = 1;
        else if (buttons & Constants.FButtons.IN_BACK)
            forwardmove = -1;
        local sidemove = 0
        if (buttons & Constants.FButtons.IN_MOVELEFT)
            sidemove = -1;
        else if (buttons & Constants.FButtons.IN_MOVERIGHT)
            sidemove = 1;

        local newVelocity = Vector(0,0,0);
        newVelocity.x = forward.x * forwardmove + left.x * sidemove;
        newVelocity.y = forward.y * forwardmove + left.y * sidemove;
        newVelocity.Norm();
        newVelocity *= 300;
        newVelocity.z = 700;
        if (player.GetPlayerClass() == TF_CLASS.HEAVY || jumpStatus == SUPER_JUMP_STATUS.QUAD_JUMPED){
            newVelocity.z *=0.75
        }


        local currentVelocity = player.GetAbsVelocity();
        if (currentVelocity.z < 300)
            currentVelocity.z = 0;

        SetPropEntity(player, "m_hGroundEntity", null);
        player.SetAbsVelocity(currentVelocity + newVelocity)
    }
}
characterChangesClasses.push(SuperJumpChange);
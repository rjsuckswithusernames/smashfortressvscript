enum TF_CLASS
{
    UNDEFINED = 0,
    SCOUT = 1,
    SNIPER = 2,
    SOLDIER = 3,
    DEMO = 4,
    DEMOMAN = 4,
    MEDIC = 5,
    HEAVY = 6,
    PYRO = 7,
    SPY = 8,
    ENGINEER = 9,
    CIVILIAN = 10
};

TF_CLASS_NAMES <- [
    "generic",
    "scout",
    "sniper",
    "soldier",
    "demo",
    "medic",
    "heavy",
    "pyro",
    "spy",
    "engineer"
];

enum TF_TEAM
{
    NONE = 0,
    UNASSIGNED = 0,
    SPECTATOR = 1,
    SPECTATORS = 1,
    RED = 2,
    MERC = 2,
    MERCS = 2,
    HALE = 3,
    BLU = 3,
    BLUE = 3,
};

enum TF_DEATHFLAG
{
    KILLER_DOMINATION = 1,
    ASSISTER_DOMINATION = 2,
    KILLER_REVENGE = 4
    ASSISTER_REVENGE = 8
    FIRST_BLOOD = 16
    DEAD_RINGER = 32
    INTERRUPTED = 64
    GIBBED = 128
    PURGATORY = 256
}

enum LIFE_STATE
{
    ALIVE = 0,
    DYING = 1,
    DEAD = 2,
    RESPAWNABLE = 3,
    DISCARDBODY = 4
}
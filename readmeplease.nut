//Credits:
//  spoon - The smash bros vscript adaptation
//  LizardOfOz - VSH vscript creator that inspired me and gave me some semblance of understanding vscript as theres a lot of stuff missing from vscript's documentation that i got very confused on until i studied his work
//  Yakibomb - give_tf_weapon library



//If you are reading this, you probably have 10-15x the hammer experience that i do with this plugin,
// so im writing this so that you can implement and tweak the code as you please.

//For your map, you need to add a logic script to your map that calls the smash.nut file.
//This is the primary file that contains all game logic.
//For the kill barriers, add trigger objects around your map that when touched, call the loseLife() part of the script.
//Thats all! No assets required!

//The game also has a bunch of balance changes that affect your gameplay, and they will be listed below:

//All Class:
//Every class jumps higher, with the heavy jumping less farther than the other classes.
//Every class also regenerates ammo and non-spy melees always crit.
//For recovery, all classes have a double jump, with heavy having a weaker double jump.

//Most on-kill effects activate on hit, and spy's effects activate on backstab.

//Scout:

//Has the ability to triple jump naturally, and quad jump with the atomizer equipped.
//hes annoying.

//Soldier:

//Rocket Launchers deal less damage so they wont send you to the stratosphere. This is a trend with a lot of weapons.
//Market gardener deals a fuck ton of damage now. use it its funny.
//Half-Zatoichi heals you for 200%

//Pyro:

//Flamethrower deals more damage so it will actually be useful.
//Axetinguisher didnt really get changed much but its really good so you should probably use it.
//Afterburn actually works in this mode.

//Demo:

//The caber instantly kills any enemy with it's explosion but sucks without it. Good luck getting in melee range though.
//The swords activate their on-kill effects, so go wild.
//Half-Zatoichi heals you for 100%

//Heavy

//Gains a natural damage resistance, taking 75% of all damage.
//His movement sucks, with the weakest jump and double jump.
//Killing gloves of boxing activate on hit, go nuts.

//Engineer
//You always deal more damage to your sentry's target.

//Medic
//You have natural knockback regeneration.
//You gain uber twice as fast.
//You are able to heal your team from knockback by 1/5.
//Syringe guns deal more damage.

//Sniper
//Sniper rifles are nerfed so they dont immidiately make your opponent want to cry themselves to sleep.
//Bazaar Bargain activates on headshot. Use it.

//Spy

//Kunai heals your percent and big earner gives you speed and cloak.
//Dead ringer actually functions.
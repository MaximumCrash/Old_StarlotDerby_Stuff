/// deltatime_step()
// Place this script in the step event of a persistent object.
// ALERT: If you are ussing TWEENLINE system in your game, you don't have to 
// use this script. The system implements this itself.

globalvar DELTATIME;
DELTATIME = delta_time/1000000;//seconds per frame
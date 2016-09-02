/// tween_set_useframes(index, use)
/*
Sets the value of useframes.
Set to true if you want to use frames (steps) as a measuring unit of time for the specified tween.
Set to false if you want to use seconds.
All values (playhead time, duration, delay, etc) will be converted to the desired measuring unit using the current room_speed as conversion factor.

Returns false in case of error. (the tween has a parent tweenline, in wich case you need to use tweenline_set_useframes())

NOTE: You can change the value of useframes only if the tween is not inside any tweenline. 
*/

if (!argument0[TLTWEEN.HASPARENT]) {
    if (argument0[TLTWEEN.USEFRAMES]!=argument1) { // If the value of the USE argument is different than the current value
        if (argument1) { // if use==true (seconds to frames)
            argument0[@ TLTWEEN.TIME]*=room_speed;
            argument0[@ TLTWEEN.DURATION]*=room_speed;
            argument0[@ TLTWEEN.DELAY]*=room_speed;
        } else { // if use==false (frame to seconds)
            argument0[@ TLTWEEN.TIME]/=room_speed;
            argument0[@ TLTWEEN.DURATION]/=room_speed;
            argument0[@ TLTWEEN.DELAY]/=room_speed;
        
        }
    }
    argument0[@ TLTWEEN.USEFRAMES] = argument1;
    return true;
} else {
    return false;
}

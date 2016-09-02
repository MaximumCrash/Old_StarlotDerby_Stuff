/// tween_set_progress(tween, progress)
/*
    Sets the progress as a value from 0 to 1. 
    This function is the same as tween_set_position, but the time is calculated as a coeficient respect to the duration 
    The progress is calculated as: (position / duration)
*/
return tween_set_time(argument0, argument1*argument0[TLTWEEN.DURATION]);

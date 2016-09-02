/// tween_set_duration(index,duration)
/*
Sets the total duration of the tween (THIS VALUE IT'S NOT AFFECTED BY THE TWEEN SPEED)
*/
argument0[@ TLTWEEN.TIME] = (argument0[TLTWEEN.TIME]/argument0[TLTWEEN.DURATION])*argument1;
argument0[@ TLTWEEN.DURATION] = argument1;

return argument1;

/// tween_set_direction(index,direction)
/* 
Sets the direction of the tween
Example: 
    direction = 1 means a normal playback
    direction = -1 means a reverse playback
    direction = 4 means a normal playback but 4 times faster
    direction = -4 means a reverse playback but 4 times faster
and so..
*/
var a;
a = abs(argument0[TLTWEEN.DIR])*argument1;
argument0[@ TLTWEEN.DIR] = a;
return a;

/// tween_set_speed(index,speed)
/* 
Sets the speed of the tween
Example: 
    speed = 1 means a normal speed
    speed = 2 means 2 times faster
    speed = 0.5 means 2 times slower
and so..
*/

var a;
a = sign(argument0[TLTWEEN.DIR]);
argument0[@ TLTWEEN.DIR] = argument1*a;
return a;

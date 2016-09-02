/// tweenline_set_speed(index, speed)
/*
 Sets the speed of the tweenline
 
     1 is a normal speed
     0.5 is half of the speed
     2 is double of the speed
     and so.
 
*/
var s = tweenline_get_size(argument0);
argument0[@ TLTIMELINE.DIR] = sign(argument0[TLTIMELINE.DIR])*argument1;
for (i=0; i<s; i+=1; ) {
    tw = tweenline_get_tween(argument0,i);
    if (tween_exists(tw)) {
        tween_set_speed(tw,argument1);
    }
}

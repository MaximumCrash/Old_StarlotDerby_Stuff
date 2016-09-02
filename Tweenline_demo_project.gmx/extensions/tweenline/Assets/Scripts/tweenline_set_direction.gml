/// tweenline_set_direction(index, persistent)
/*

    Sets the direction of all the tweens inside the tweenline
    Example: 
        direction = 1 means a normal playback
        direction = -1 means a reverse playback
        direction = 4 means a normal playback but 4 times faster
        direction = -4 means a reverse playback but 4 times faster
    and so..
    
*/
var s;
s = tweenline_get_size(argument0);
for (i=0; i<s; i+=1; ) {
    tw = tweenline_get_tween(argument0,i);
    tween_set_direction(tw,argument1);
}

/// tweenline_restart(tweenline)
/* 
Restarts all tweens in a tweenline. 

*/

if (!tweenline_exists(argument0)) {
    return false;
}
s = tweenline_get_size(argument0);
argument0[@ TLTIMELINE.PLAY] = true;
argument0[@ TLTIMELINE.TIME] = 0;
for (i=0; i<s; i+=1; ) {
    tw = tweenline_get_tween(argument0,i);
    if (tween_exists(tw)) {
        tween_restart(tw);
    }
}

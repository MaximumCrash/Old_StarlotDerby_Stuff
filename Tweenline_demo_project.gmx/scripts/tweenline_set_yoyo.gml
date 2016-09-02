/// tweenline_set_yoyo(index, active)
/*
set true if you want the yoyo mode active for this al the tweens 
inside this tweenline, of false otherwise.
*/
var s;
s = tweenline_get_size(argument0);
for (i=0; i<s; i+=1; ) {
    tw = tweenline_get_tween(argument0,i);
    tween_set_yoyo(tw,argument1);
}

/// tweenline_set_repeat(index, repeat)
/*
sets the current repeat count for the specified tweenline
This is the number of repetitions that left counting the current 
repeatition (or -1 if it will repeat indefinitely)

Note: please set this value AFTER all tweens has been created.

TODO: make posible to define this value BEFORE tweens has been created.
*/
var s;
s = tweenline_get_size(argument0);
for (i=0; i<s; i+=1; ) {
    tw = tweenline_get_tween(argument0,i);
    tween_set_repeat(tw,argument1);
}

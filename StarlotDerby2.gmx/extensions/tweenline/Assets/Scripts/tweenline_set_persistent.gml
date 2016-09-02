/// tweenline_set_persistent(index, persistent)
/*

    Sets all tweens inside a tweenline as persistent. By default a tween is not persistent. 
    It means that it is deleted when the rooms end, to prevent memory leaks. 
    But you can make a tween persistent with tween_set_persistent(tween, true);
    This means that the tween will be permament and you should manually destroy with 
    tween_destroy() when you don't need it anymore. It can be used to create effects between 
    diferent rooms, or to create transitions from one room to another.
    
*/
var s;
s = tweenline_get_size(argument0);
for (i=0; i<s; i+=1; ) {
    tw = tweenline_get_tween(argument0,i);
    tween_set_persistent(tw,argument1);
}

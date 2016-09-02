/// tween_set_persistent(tween, persistent)
/* 
    Sets a tween as persistent. By default a tween is not persistent. It means that it is deleted when the rooms end, to prevent memory leaks. 
    But you can make a tween persistent with tween_set_persistent(tween, true);
    This means that the tween will be permament and you should manually destroy with tween_destroy() when you don't need it anymore.
    It can be used to create effects between diferent rooms, or to create transitions from one room to another.
*/

return argument0[@ TLTWEEN.PERSISTENT] = argument1;

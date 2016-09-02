/// tween_set_position(index,time)
/*
Sets the playhead position of the tween.
Normally in seconds, but you can change the default measure unit 
from tween_system_init, or with the function tween_set_useframes
*/

var p;
p = argument0[TL.PARENT];
if (p!=-1){
    tweenline_set_position(p,argument1);
} else {
    argument0[@ TL.TIME] = argument1;
}
return argument1;
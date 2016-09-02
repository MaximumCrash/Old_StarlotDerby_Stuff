/// tweenline_set_position(tweenline, time);
/*
Sets the playhead position of all the tweens in the tweenline.
Normally in seconds, but you can change the default measure unit 
from tween_system_init, or with the function tween_set_useframes
*/

var s;
s = ds_list_size(argument0);
for (i=0; i<s; i+=1; ) {
    tw = ds_list_find_value(argument0,i+1);
    ds_map_replace(tw,"time",argument1);
}
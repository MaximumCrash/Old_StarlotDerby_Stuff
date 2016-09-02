/// tweenline_get_value(tweenline, index);
/*
Get the value of the tween with the position "index" in the tweenline staring from 0 (zero) in the order that has been added to the tweenline. 

Note: The tweens aren't sorted in any form. So, the first tween doesn't need to be te first chronologically.

*/

var tw, val;
val = argument1+1;
if (argument1<0) {
    val = ds_list_size(argument0)+argument1;
}
tw = ds_list_find_value(argument0, val);
return tween_get_value(tw);
/// tweenline_get_tween(tweenline, numb);
/* 
get the index of the tween number "numb" in the tweenline starting from number 0.

Note:   The are sorted in the order they has been added. So, the first tween doesn't 
        need to be te first chronologically. Use tweenline_get_list or 
        tweenline_get_priority for that purpose.
*/
var list = argument0[TLTIMELINE.TWEENS];
return ds_list_find_value(list, argument1);

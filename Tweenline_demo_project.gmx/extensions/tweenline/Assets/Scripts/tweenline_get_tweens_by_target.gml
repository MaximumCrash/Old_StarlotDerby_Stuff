/// tweenline_get_tweens_by_target( tweenline, target, includeOutside);
/*
    Note:   THIS IS AN ADVANCED FUNCTION (But do not delete it, as 
            it is used by the engine). Normally you do not need to use this function. 
    
    Return a ds_list with all tweens wich the specified target object inside the Tweeline. 
    The tweens in the list are sorted by they orders of start into the Tweenline.

*/


var list_tweens = ds_list_create(); // output list
var prior_start = tweenline_get_priority(argument0); 
while (!ds_priority_empty(prior_start)) { // foreach tween in order of starttime
    var tween = ds_priority_delete_min(prior_start); // get tween
    if (tween_get_target(tween) == argument1) {
        ds_list_add(list_tweens, tween);
    }    
}
ds_priority_destroy(prior_start);
return list_tweens;

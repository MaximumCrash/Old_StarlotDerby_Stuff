/// tweenline_get_tweens_at_time( tweenline, time, includeOutside);
/*
    Note:   THIS IS AN ADVANCED FUNCTION (But do not delete it, as it is used 
            by the engine). Normally you do not need to use this function. 
    
    Return a ds_list with all tweens wich timespan intersects the specified time 
    inside the specified tweenline. 
    
    If includeOutside is true, the tweens that are in the specified time and need to be rendered
    in this time are added to the ds_list too.
    
    ________ 
    
    TODO: optimize this script
    tip: ds_priority_delete_min could be replaced with ds_priority_delete_max [;)] 
*/

var tweenline = argument0, time=argument1, includeOutside = argument2;

var list_tweens = ds_list_create(); // output list
var map_targets = ds_map_create(); // This is a map with the tween targets: map_target( key: TLTWEN.TARGET, value: tween);
var list_of_targets = ds_list_create(); // This is a list with the targets: list_of_targets(value: TLTWEN.TARGET);

var prior_start = tweenline_get_priority(tweenline); 
while (!ds_priority_empty(prior_start)) { // foreach tween in order of starttime

    var tween = ds_priority_delete_min(prior_start); // get tween
    var target = tween_get_target(tween);    
    
    var starttime = tween_get_starttime(tween);
    var endtime = tween_get_endtime(tween);
    
    if (time >=starttime && time>=endtime ) { // if the time is inside the tween
        ds_list_add(list_tweens, tween); // add it directly to the output list
    } 
    
    else if (includeOutside) { // If also exterior tweens are allowed
        if (!ds_map_exists(map_targets, target)) { // if the target is not in the map_target,  
            ds_list_add(list_of_targets, target); // add it to the list of map_target's keys. 
            ds_map_add(map_targets, target,tween); // map_target( key: target, value: tween);
        } else if (time >= starttime) { // if it's in the map_target, and the starttime is posterior than the current time
            var t = ds_map_find_value(map_targets, target); // find tween (the map stores the tween with a big startime)
            var t_starttime = tween_get_starttime(t); // find tween starttime
            if (starttime > t_starttime) { // if my starttime is bigger than the biggest starttime
                ds_map_replace(map_targets, target,tween); // then replace the value!
            }
        }
    }
    
}
ds_priority_destroy(prior_start);

var size = ds_list_size(list_of_targets);
for (var i=0; i<size; i++) {
    var map_key = ds_list_find_value(list_of_targets, i); 
    var tween = ds_map_find_value(map_targets, map_key);
    ds_list_add(list_tweens, tween);
}


ds_list_destroy(list_of_targets);
ds_map_destroy(map_targets);

return list_tweens;

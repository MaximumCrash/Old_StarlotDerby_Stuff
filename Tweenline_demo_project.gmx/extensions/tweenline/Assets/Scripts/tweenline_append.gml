/// tweenline_append(index, tweens, ...);
// Appends one or more tweens to the end of the tweenline
var i, tweenline_duration, durcache, delta_duration, tween_delay, tween_duration, useframes;
tweenline_duration = ds_list_find_value(argument[0],0);
durcache = tweenline_duration;
for (i=1; i<argument_count; i+=1;) {
    ds_map_replace(argument[i], "parent", argument[0]); 
    ds_list_add(argument[0],argument[i]);
    
    
    useframes = ds_map_find_value(argument[i],"useframes");
    if (useframes != global._tw_default_useframes) {
        if (useframes) {
            tween_delay = ds_map_find_value(argument[i],"delay")/room_speed;
            tween_duration = ds_map_find_value(argument[i],"duration")/room_speed;
         } else {
            tween_delay = ds_map_find_value(argument[i],"delay")*room_speed;
            tween_duration = ds_map_find_value(argument[i],"duration")*room_speed;
            
         }
         ds_map_replace(argument[i], "useframes", global._tw_default_useframes); 
    }

    delta_duration = tween_delay + tween_duration;
    ds_map_replace(argument[i], "delay", tweenline_duration + tween_delay);
    tweenline_duration += delta_duration;
}
if (tweenline_duration!=durcache) {
    ds_list_replace(argument[0],0,tweenline_duration);
}
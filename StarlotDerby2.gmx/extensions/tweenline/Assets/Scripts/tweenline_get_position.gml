/// tweenline_get_position(tweenline [,index = 0]);

var index;
index =0;
if (argument_count>1) {
    index = argument[1];
}
var tween;
tween = ds_list_find_value(argument[0],index+1);
return ds_map_find_value(tween, "time");
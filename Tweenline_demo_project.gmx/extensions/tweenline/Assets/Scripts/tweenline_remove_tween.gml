/// tweenline_remove_tween(tweenline, tween [,destroyTween=false])
/*
Remove the specified tween from the tweenline
*/
var pos;
pos = ds_list_find_index(argument[0],argument[1]);
if (pos>=0) {
    ds_list_delete(argument[0],pos);
    ds_map_replace(argument[1],"parent",-1);
}
if (argument_count>2) {
    if (argument[2]) {
        tween_destroy(argument[1]);
    }
}
return argument[0];
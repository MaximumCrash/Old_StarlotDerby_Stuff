/// tweenline_get_list(tweenline);
/* 
Returns the index of a ds_list (ds_list_* functions) ordered by the start time of each tween in the tweenline.
You can use this priority to access to all tweens inside one tweenline ordered by the start time of each tween:

    var list = tweenline_get_list(tweenline);
    var size = ds_list_size(list);
    for (var i=0; i<size; i++) {
        var tween = ds_list_find_value(list, i);
        // do something with each tween
    }
    ds_list_destroy(list); //REMEMBER TO DESTROY THE LIST WHEN YOU DON'T NEED IT ANYMORE

NOTE:   This function is a bit slower than tweenline_get_priority, so If you don't really 
        need it, use tweenline_get_tween or tweenline_get_priority insted. 

NOTE:   As with all dynamic resources, data structures take up memory and so should always be destroyed when no 
        longer needed to prevent memory leaks which will slow down and eventually crash your game. 

*/

var p = ds_priority_create();
var l = ds_list_create();
ds_priority_copy(p, argument0[TLTIMELINE.PRIORITY]);
while(!ds_priority_empty(p)) {
    ds_list_add(l,ds_priority_delete_min(p));
}
ds_priority_destroy(p);
return l;






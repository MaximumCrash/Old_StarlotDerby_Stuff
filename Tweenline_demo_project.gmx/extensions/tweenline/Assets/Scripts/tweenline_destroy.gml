/// tweenline_destroy(tweenline)
/*
Destroys the current tweenline and the tweens attached. 
Use this to prevent a memory leak. 

Example: 
mytweenline = tweenline_destroy(mytweenline);

*/
var s,tw;
// if the tweenline exists
if (is_array(argument0)) {
    var _t = argument0;
    if (_t[TLTWEEN.TYPE]==TLTYPE.TWEEN) { //It is a tween (not a tweenline)
        tween_destroy(_t);
    } else if (_t[TLTWEEN.TYPE]==TLTYPE.TIMELINE) {
        // Destroy ds_list (child TWEENS)
        
        var t2 = global._tw_current_creation_tl;
        if (is_array(t2)) {
            if (_t[TLTWEEN.ID]==t2[TLTWEEN.ID]) {
                global._tw_current_creation_tl = -1;
            }
        }
        
        var tweens = _t[TLTIMELINE.TWEENS];
        if (ds_exists(tweens,ds_type_list)) {
            for (var i=ds_list_size(tweens); i>=0; i--; ) {
                tw = ds_list_find_value(tweens,i);
                tween_destroy(tw);
            }
            ds_list_destroy(tweens);
        }
        // Destroy ds_map (labels)
        var labels = _t[TLTIMELINE.LABELS];
        if (ds_exists(labels,ds_type_map)) {
            ds_map_destroy(labels);
        }
        // Destroy ds_prority (tweens ordered by starttime)
        var priority = _t[TLTIMELINE.PRIORITY];
        if (ds_exists(priority,ds_type_priority)) {
            ds_priority_destroy(priority);
        }
        
        // Delete from the global tweenlines list.
        var g = global._tw_tl_dslist, idd = _t[TLTWEEN.ID], size = ds_list_size(g);
        for (var i=0; i<size; i++) {
            var t = ds_list_find_value(g, i);
            if (t[TLTWEEN.ID] == idd) {
                ds_list_delete(g,i);
                global._tw_tweenlinecount--;
                break;
            }
        }
    }
}
return 0;

/// tweenline_remove(value [,destroyTween=false])
/*
    Removes a tween or label from the last created tweenline or the tweenline 
    that is currently in edit mode. See tweenline_edit for more info about edit mode.
    
    If you pass a tween as an argument, the script will find 
    the parent of the tween for you, so you don't need to worry to 
    call tweenline_edit. 
    
    If you pass a label (a string), you need to first call 
    tweenline_edit to tell Tweenline engine wich tweenline do you want to edit
    
    Parameters:
        value: 
            A tween or label to remove from the timeline
        destroyTween: 
            If a tween is passed, you can force the destruction of the tween passing true to this argument.
            By default, the tween will not be destroyed, only removed from the tweenline It is useful to 
            remove a tween from one tweenline and place it in another tweenline. In this way, the tween 
            will be not destroyed in the process.
            
    Example:
        // Remove the tween my_tween from his parent tweenline and destroy it
        tweenline_remove( my_tween, true);
        
        // Remove the tween my_tween from his parent tweenline but does not destroy it
        tweenline_remove( my_tween);
        
        // Removes the label "mylabel" from the tweenline my_tweenline
        tweenline_edit(my_tweenline);
        tweenline_remove("mylabel");
        
*/

var tweenline = global._tw_current_creation_tl, value = argument[0]; 
if (!is_array(tweenline)) {return false;}

if (is_string(value)) { //remove label
    var tweenline_labels = tweenline[TLTIMELINE.LABELS];
    ds_map_delete(tweenline_labels, value);
} 

else if (tween_exists(value)) { //remove tween
    var _t = value;
    var idd = _t[TLTWEEN.ID];
    
    if (_t[TLTWEEN.HASPARENT]) {
        tweenline = _t[TLTWEEN.PARENT];
        _t[@ TLTWEEN.PARENT] = -1;
    }

    // FIND ID into Tweens ds list of the tweenline and delete it
    var tweens = tweenline[TLTIMELINE.TWEENS];
    
    for (var i=0, size = ds_list_size(tweens); i<size; i++) { //for each tween in tweenline
        var v = ds_list_find_value(tweens,i);
        if (v[TLTWEEN.ID]==idd) { // if the tween ID is the same 
            ds_list_delete(tweens,i);
            _t[@ TLTWEEN.PARENT] = -1;
            _t[@ TLTWEEN.HASPARENT] = false;
            break;
        }
    }
    
    // You can't find and delete an array into a ds_priority, 
    // so, we are going to RECONSTRUCT from scratch the ds_priority of the tweenline
    // but omiting the current tween ID. 
    var p = tweenline[TLTIMELINE.PRIORITY], p2 =ds_priority_create();
    while(!ds_priority_empty(p)) {
        var t = ds_priority_delete_min(p);
        if (t[@ TLTWEEN.ID] != idd) {
            ds_priority_add(p2, t, t[TLTWEEN.INITIALDELAY]);
        }
    }
    tweenline[@ TLTIMELINE.PRIORITY] = p2;
    ds_priority_destroy(p);
    
    if (argument_count>2) {
        if (argument[2]) {
            tween_destroy(_t);
        }
    }
}
return tweenline;

/// tweenline_to(target_object, duration, vars [, position="+=0"])
/*
    Adds a tween_to() tween to the end (or elsewhere using the 
    "position" parameter) of the last created Tweenline or the Tweenline 
    that is currently in edit mode. See tweenline_edit for more info about edit mode. 
    
    > See tween_to for the reference for "target_object", "duration" and "vars" params.
    
    > See tweenline_add for the reference for the optional "position" parameter.
    
    Returns the index of the tween that has been created
*/

var tl = global._tw_current_creation_tl;

var tween = tween_to(argument[0], argument[1], argument[2]);
if (argument_count>3) {
    tweenline_add(tween,argument[3]);
} else {
    tweenline_add(tween);
}

return tween;

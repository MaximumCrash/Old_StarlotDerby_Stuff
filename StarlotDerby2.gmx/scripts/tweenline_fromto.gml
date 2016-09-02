/// tweenline_fromto(tweenline, target_object, duration, from_vars, to_vars [, position="+=0"])
/*
    Adds a tween_fromto() tween to the end (or elsewhere using the 
    "position" parameter) of the last created Tweenline or the Tweenline 
    that is currently in edit mode. See tweenline_edit for more info about edit mode. 
    
    > See tween_fromto for the reference for "target_object", "duration" and "vars" params.
    
    > See tweenline_add for the reference for the optional "position" parameter.
    
    Returns the index of the tween that has been created
*/


var tween = tween_fromto(argument[0], argument[1], argument[2],argument[3]);
if (argument_count>4) {
    tweenline_add( tween,argument[4]);
} else {
    tweenline_add( tween);
}

return tween;

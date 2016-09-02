/// tween_system_is_tweenline(tween_or_tweenline)
/*
    Return true if tween_or_tweenline is a tweenline, false otherwise.
*/
if (is_array(argument0)) { // if the argument passed is a tweenline object (an array, it can be a tween or a tweenline)
    if (argument0[TLTWEEN.TYPE]==TLTYPE.TIMELINE) { //if is a tweenline
        return true;
    }
}
return false;

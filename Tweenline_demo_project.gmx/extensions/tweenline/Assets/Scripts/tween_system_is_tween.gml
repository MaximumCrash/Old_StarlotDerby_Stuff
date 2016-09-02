/// tween_system_is_tween(tween_or_tweenline)
/*
    Return true if tween_or_tweenline is a tween, false otherwise.
*/
if (is_array(argument0)) { // if the argument passed is a tweenline object (an array, it can be a tween or a tweenline)
    if (argument0[TLTWEEN.TYPE]==TLTYPE.TWEEN) { //if is a tween
        return true;
    }
}
return false;

/// tween_exists(index)
/*
    Returns true if a tween exists and false otherwise.

    Example:
        var exists = tween_exists(mytween);
*/
if (is_array(argument0)){
    if (argument0[TLTWEEN.TYPE] == TLTYPE.TWEEN) {
        return true;
    }
}
return false;

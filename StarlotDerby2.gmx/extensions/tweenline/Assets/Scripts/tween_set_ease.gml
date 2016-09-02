/// tween_set_ease(index, ease)
/*
    Sets the ease type of the tween as a easing function (see tween_to() for more info)
    
    Example:
        tween_set_ease( mytween, ease_backout);

*/
argument0[@ TLTWEEN.EASE] = argument1;

var a = argument0[TLTWEEN.M];
if (is_array(a)) {
    a[@ 0] = argument1; // update the easing. 
}
return argument1;

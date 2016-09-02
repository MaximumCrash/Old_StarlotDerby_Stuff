/// tween_progress( tween_or_array_of_tweens, progress);
/*
    Seeks the the tween (or array of tweens) to a
    specified progress and play it from there. 
    (0 is the start of the tween and 1 is the end)
    
*/

var arr = argument0;
if (is_array(arr)) { 
    if (is_array(arr[0])) { //It's an array of tweens
        for (var i=0, size = array_length_1d(arr); i<size; i++) {
            tween_set_progress(arr[i], argument1);
        }
    } else { // It's a single tween
        tween_set_progress(arr, argument1);
    }
}
return false;

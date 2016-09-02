/// tween_seek( tween_or_array_of_tweens, time);
/*
    Seeks the the tween (or array of tweens) to a
    specified time and play it from there. 
    
*/

var arr = argument0;
if (is_array(arr)) { 
    if (is_array(arr[0])) { //It's an array of tweens
        for (var i=0, size = array_length_1d(arr); i<size; i++) {
            tween_set_time(arr[i], argument1);
        }
    } else { // It's a single tween
        tween_set_time(arr, argument1);
    }
}
return false;

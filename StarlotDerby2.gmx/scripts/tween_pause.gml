/// tween_pause(tween_or_array_of_tweens)
/*
Pause the tween with the index specified. (or array of tweens)

TODO: add support for array of tweens [DONE!! 21/12/2015]
*/
var arr = argument0;
if (is_array(arr)) { 
    if (is_array(arr[0])) { //It's an array of tweens
        for (var i=0, size = array_length_1d(arr); i<size; i++) {
            var tween = arr[i];
            tween[@ TLTWEEN.PLAY] = false;
        }
    } else { // It's a single tween
        arr[@ TLTWEEN.PLAY] = false;
    }
}
return false;

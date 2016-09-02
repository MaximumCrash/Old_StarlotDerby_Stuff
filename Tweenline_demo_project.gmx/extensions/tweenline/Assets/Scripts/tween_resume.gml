/// tween_resume( tween_or_array_of_tweens [, time])
/*
    Resume the tween with the index specified. (or array of tweens)
    You can specify a time to play it from the specified time. (optional)
    
*/
var arr = argument0;
if (is_array(arr)) { 
    if (is_array(arr[0])) { //It's an array of tweens
        for (var i=0, size = array_length_1d(arr); i<size; i++) {
            var tween = arr[i];
            tween[@ TLTWEEN.PLAY] = true;
            if (argument_count>1) {tween[@ TLTWEEN.TIME] = argument[1];}
        }
    } else { // It's a single tween
        arr[@ TLTWEEN.PLAY] = true;
        if (argument_count>1) {arr[@ TLTWEEN.TIME] = argument[1];}
    }
}
return false;

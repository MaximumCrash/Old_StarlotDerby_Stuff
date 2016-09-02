/// tween_reverse(tween_or_array_of_tweens [, time])
/*
    Play the tween (or array of tweens) in reverse from the current position.
    You can specify a time to play it from the specified time. (optional)
    
    TODO: Add support for array of tweens [DONE!! 23/12/2015]
*/


var arr = argument[0];
if (is_array(arr)) { 
    if (is_array(arr[0])) { //It's an array of tweens
        for (var i=0, size = array_length_1d(arr); i<size; i++) {
            var tween = arr[i];
            tween[@ TLTWEEN.DIR] = -abs(tween[TLTWEEN.DIR]);
            tween[@ TLTWEEN.PLAY] = true;
            if (argument_count>1) {tween[@ TLTWEEN.TIME] = argument[1];}
            __tl_private_tween_revive(tween);
        }
    } else { // It's a single tween
        arr[@ TLTWEEN.DIR] = -abs(arr[TLTWEEN.DIR]);
        arr[@ TLTWEEN.PLAY] = true;
        if (argument_count>1) {arr[@ TLTWEEN.TIME] = argument[1];}
        __tl_private_tween_revive(arr);
    }
}
return false;

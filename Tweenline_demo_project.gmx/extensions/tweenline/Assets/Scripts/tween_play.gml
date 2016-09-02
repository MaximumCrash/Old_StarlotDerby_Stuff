/// tween_play(tween_or_array_of_tweens [, time])
/*
    Plays the tween (or array of tweens). 
    You can specify a time to play it from the specified time. (optional)
    
    TODO: add support for array of tweens [DONE!! 21/12/2015]
    
    EXAMPLES: 
        tween_play(tween, 2);
        tween_play(array(tween1,tween2,tween3,tween4));
*/

var arr = argument[0];
if (is_array(arr)) { 
    if (is_array(arr[0])) { //It's an array of tweens
        for (var i=0, size = array_length_1d(arr); i<size; i++) {
            var tween = arr[i];
            tween[@ TLTWEEN.PLAY] = true;
            tween[@ TLTWEEN.DIR] = abs(tween[TLTWEEN.DIR]);
            if (argument_count>1) {tween[@ TLTWEEN.TIME] = argument[1];}
            __tl_private_tween_revive(tween);
        }
    } else { // It's a single tween
        arr[@ TLTWEEN.PLAY] = true;
        arr[@ TLTWEEN.DIR] = abs(arr[TLTWEEN.DIR]);
        if (argument_count>1) {arr[@ TLTWEEN.TIME] = argument[1];}
        __tl_private_tween_revive(arr);
    }
}
return false;

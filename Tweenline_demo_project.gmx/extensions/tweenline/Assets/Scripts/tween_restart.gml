/// tween_restart(tween_or_array_of_tweens)
/*
Restart the current tween (or array of tweens)

TODO: Add support for array of tweens [DONE!! 21/12/2015]
*/

var arr = argument0;
if (is_array(arr)) { 
    if (is_array(arr[0])) { //It's an array of tweens
        for (var i=0, size = array_length_1d(arr); i<size; i++) {
            var tween = arr[i];
            tween[@TLTWEEN.TIME] = 0;
            tween[@TLTWEEN.PLAY] = true;
            tween[@TLTWEEN.DELAY] = tween[TLTWEEN.INITIALDELAY];
            __tl_private_tween_revive(tween);
            tween_render(tween);
            
        }
    } else { // It's a single tween
        arr[@TLTWEEN.TIME] = 0;
        arr[@TLTWEEN.PLAY] = true;
        arr[@TLTWEEN.DELAY] = arr[TLTWEEN.INITIALDELAY];
        __tl_private_tween_revive(arr);
        tween_render(arr);
    }
}
return false;


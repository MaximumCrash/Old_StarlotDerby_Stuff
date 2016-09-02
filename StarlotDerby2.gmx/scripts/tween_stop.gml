/// tween_stop(tween_or_array_of_tweens)
/*
Stops the tween and revert all tween states to the init value. If you want to PAUSE the tween use tween_pause instaed.

You can pass to the function a tween or a array of tweens

TODO: reset ALL setters internal value [DONE!!]
TODO: Add support for array of tweens. [DONE!!]
Update 21/12/2015: added support for an array of tweens, and all the setters are resetted to the init value. 
*/

var arr = argument0;
if (is_array(arr)) { 
    if (is_array(arr[0])) { //It's an array of tweens
        for (var i=0, size = array_length_1d(arr); i<size; i++) {
            var tween = arr[i];
            tween_restart(tween);
            tween[@TLTWEEN.PLAY] = false;
             
        }
    } else { // It's a single tween
        tween_restart(arr);
        arr[@TLTWEEN.PLAY] = false;
    }
}
return false;






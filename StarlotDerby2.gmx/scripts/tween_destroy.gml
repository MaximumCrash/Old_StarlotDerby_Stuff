/// tween_destroy(tween_or_array_of_tweens)
/*
    Destroys the current tween. (or array of tweens)
    Use this to prevent memory leaks when you don't need a tween anymore. 
     
    Note:   The Tweenline Engine's Garbage Collector will remove the unused tweens for you (yay!)
            when the target game makers object does not exists anymore or when the room has
            changed. So, you only need to use this function when the tween is persistent or
            if you want to force the Tweenline Engine to free memory usage.
    
    Example:
        mytween = tween_destroy(mytween);

*/
if (is_array(argument0)) { // if the argument passed is a tweenline object (an array, it can be a tween or a tweenline)
    var _t = argument0;
    if (is_array(_t[0])) { //It's an array of tweens
        for (var i=0, size=array_length_1d(_t); i<size; i++) {
            tween_destroy(_t[i]); // Recursivity, baby :) 
        }
    } else {
        if (_t[TLTWEEN.TYPE]== TLTYPE.TWEEN ) { //if is a tween
            var i, p;
            _t[@TLTWEEN.KILLMEPLEASE] = true; //killmeplease: http://t.qkme.me/3sfg2y.jpg
            global._tw_tweencount--; // tween number counter -=1;
            if (_t[TLTWEEN.HASPARENT]) { //if the tween has a parent
                tweenline_remove(_t);
            }
            // Loose reference to parent tweenline ARRAY
            _t[@ TLTWEEN.PARENT] = -1;
            
            //Clean arrays
            /*_t[@ TLTWEEN.M] = undefined;
            _t[@ TLTWEEN.SETTERS] = undefined;
            _t[@ TLTWEEN.CUSTOM_VARS] = undefined;
            _t[@ TLTWEEN.DEBUGARGS] = undefined;
            
            _t[@ TLTWEEN.ONCOMPLETE_PARAMS] = undefined;
            _t[@ TLTWEEN.ONREVERSECOMPLETE_PARAMS] = undefined; 
            _t[@ TLTWEEN.ONSTART_PARAMS] = undefined; 
            _t[@ TLTWEEN.ONUPDATE_PARAMS] = undefined; 
            _t[@ TLTWEEN.ONREPEAT_PARAMS] = undefined;
            */
             
            return undefined;
        } else if (_t[TLTWEEN.TYPE]==TLTYPE.TIMELINE) { // If is a tweenline
            tweenline_destroy(_t);
        }
    }
}
return undefined;

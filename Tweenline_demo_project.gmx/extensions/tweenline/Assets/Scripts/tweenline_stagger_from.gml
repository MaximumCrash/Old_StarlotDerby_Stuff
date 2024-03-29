/// tweenline_stagger_from(targets_array, duration, vars , stagger [, position="+=0"])
/*
    Tweens an array of targets from a common set of destination values (using 
    the current values as the destination), but staggers their start times by 
    a specified amount of time, creating an evenly-spaced sequence with a surprisingly
    small amount of code.
    
    The parameter stagger is the amount of time in seconds (or frames if the 
    timeline is frames-based) to stagger the start time of each tween.
        
    The difference between tweeline_stagger_from and tween_stagger_from is that the first 
    adds the tweens to the current tweenline that is in edit mode. 
    
    > For more info about the edit mode, see tweenline_edit
    
    > For more info about the optional position parameter, see tweenline_add
    
    > For the other parameters, see tween_from
    
    Returns an array of the indexes of the tweens that has been created
*/
var stagger = argument[3];
var a = instance_select_array(argument[0]);
if (is_undefined(a)) { return false}
var size = array_length_1d(a);

var tweenline = global._tw_current_creation_tl;
if (tweenline==-1) {return false;}

if (argument_count>4) { // Parse the "position" argument. (and insert the new labels if requiered)
    var position_value = __tl_private_parse_position(tweenline, argument[4]);
} else {
    var position_value = tweenline[TLTIMELINE.DURATION];
}

var arr; // tweens indexes array
for (var i=0; i<size; i++) { // create and append the tweens
    var tween = tween_from(a[i], argument[1], argument[2]);
    tweenline_add( tween,position_value+(i*stagger));
    arr[i] = tween;
} 

return arr;

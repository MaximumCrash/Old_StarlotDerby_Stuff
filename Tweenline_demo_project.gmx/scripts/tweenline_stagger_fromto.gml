/// tweenline_stagger_fromto(targets_array, duration, from_vars, to_vars , stagger [, position="+=0" [,waves_amount=1]])
/*
    Tweens an array of targets from and to a common set of destination values, but 
    staggers their start times by a specified amount of time, creating an 
    evenly-spaced sequence with a surprisingly small amount of code.
    
    The parameter stagger is the amount of time in seconds (or frames if the 
    timeline is frames-based) to stagger the start time of each tween.
        
    The difference between tweeline_stagger_fromto and tween_stagger_fromto is that the first 
    adds the tweens to the current tweenline that is in edit mode. 
    
    > For more info about the edit mode, see tweenline_edit
    
    > For more info about the optional position parameter, see tweenline_add
    
    > For the optional parameter wave_amount, see tween_stagger_to
    
    > For the other parameters, see tween_fromto
    
    Returns an array of the indexes of the tweens that has been created
*/
var stagger = argument[4];
var a = instance_select_array(argument[0]);
if (is_undefined(a)) { return false}
var size = array_length_1d(a);

var tweenline = global._tw_current_creation_tl;
if (tweenline==-1) {return false;}

if (argument_count>5) { // Parse the "position" argument. (and insert the new labels if requiered)
    var position_value = __tl_private_parse_position(tweenline, argument[5]);
} else {
    var position_value = tweenline[TLTIMELINE.DURATION];
}

var arr, wave=0, wave_amount=1;
if (argument_count>6) {wave_amount = argument[6];}
for (var i=0; i<size; i++) { // create and append the tweens
    var tween = tween_fromto(a[i], argument[1], argument[2],argument[3]);
    tweenline_add( tween,position_value+(i*wave));
    arr[i] = tween;
    if (((i+1) mod wave_amount) == 0) {wave++;}
} 

return arr;

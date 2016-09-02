/// tween_stagger_from(targets_array, duration, vars , stagger [, wave_amount=1])
/*
    Tweens an array of targets from a common set of destination values (using 
    the current values as the end values), but staggers their start times by 
    a specified amount of time, creating an evenly-spaced sequence with a surprisingly
    small amount of code.
    
    The parameter stagger is the amount of time in seconds (or frames if the 
    timeline is frames-based) to stagger the start time of each tween.
    
    > For the other parameters, see tween_to
    
    > For the optional parameter wave_amount, see tween_stagger_to
    
    Returns an array of the indexes of the tweens that has been created
    
    EXAMPLE: 
    
    tweens_array = tween_stagger_from(array(obj_box1, obj_box2, obj_box3), 2.8,  array("x", 800,"angle",270, "ease", ease_backout), 0.4);
    
*/
var a = instance_select_array(argument[0]);
if (is_undefined(a)) { return false}
var size = array_length_1d(a);
var stagger = argument[3];
var arr, wave=0, wave_amount=1;
if (argument_count>4) {wave_amount = argument[4];}
for (var i=0; i<size; i++) { // create and append the tweens
    var tween = tween_from(a[i], argument[1], argument[2]);
    tween_set_delay(tween, wave*stagger,true);
    arr[i] = tween;
    if (((i+1) mod wave_amount) == 0) {wave++;}
} 
return arr;

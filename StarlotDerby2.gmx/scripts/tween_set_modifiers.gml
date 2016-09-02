/// tween_set_modifiers(index, array)
/*
    Sets the modifiers array for the tween. This array is passed as the arguments to the easing script.
    
    array argument is an array of modifiers. (Or undefined, if you wan't to reset the modifiers to default)
    
    
*/
var _a;
_a[0] = argument0[@ TLTWEEN.EASE];
argument0[@ TLTWEEN.M] = __tl_private_array_join(_a,argument1);
argument0[@ TLTWEEN.USEMODIFIERS] = (!is_undefined(argument1));

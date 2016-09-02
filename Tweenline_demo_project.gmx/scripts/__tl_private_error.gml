/// __tl_private_error( tween, error_string); 
/*

    PRIVATE FUNCTION - DO NOT USE
    
    Description: shows an error in the debug console.
    The parameter tween is optional. You can pass undefined if the error is not in a particular tween.
*/

if (is_array(argument0)) {
    show_debug_message("TWEENLINE: "+string(argument1));
    if (tween_exists(argument0)) {
        show_debug_message(">>>> At tween: "+string(tween_get_string(argument0)));
    }
} else {
    show_debug_message("TWEENLINE: "+string(argument1));
}
return false;



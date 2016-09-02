// tween_system_set_default_ease( easing_function );
/*
    Changes the default easing function. The default is ease_quadout
*/

if (script_exists(argument0)) {
    global._tw_default_ease = argument0;
}

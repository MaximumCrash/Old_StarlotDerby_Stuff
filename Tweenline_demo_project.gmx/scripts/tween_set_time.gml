/// tween_set_time(tween,time)
/*
    Sets the playhead position of the tween.
    Normally in seconds, but you can change the default measure unit 
    from tween_system_init, or with the function tween_set_useframes
*/

if (tween_system_is_tween(argument0)) {
    if (argument0[TLTWEEN.HASPARENT]){
        tweenline_set_time(argument0[TLTWEEN.PARENT],argument1);
    } else {
        var t = argument0[TLTWEEN.TIME];
        argument0[@ TLTWEEN.TIME] = argument1;
        if (!argument0[@ TLTWEEN.PLAY] && t!=argument1) {
            tween_render(argument0);
            __tl_private_tween_revive(argument0);
        }
    }
}
return argument1;

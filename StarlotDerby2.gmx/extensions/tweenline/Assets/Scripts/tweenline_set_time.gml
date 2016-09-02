/// tweenline_set_time(tweenline, time);
/*
    Sets the playhead position of all the tweens in the tweenline.
    Normally in seconds, but you can change the default measure unit 
    from tween_system_init
*/

if (tweenline_exists(argument0)) {
    __tl_private_timeline_back_to_the_future(argument0, argument0[TLTIMELINE.TIME], argument1);
}

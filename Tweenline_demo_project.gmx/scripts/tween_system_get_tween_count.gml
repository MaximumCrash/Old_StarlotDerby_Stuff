/// tween_system_get_tween_count()
/*
Gets the number of tweens active in the tween system
You can use it this function to detect memory leaks.

Example:
    draw_text( 20, 20, "Active tweens: "+string(tween_system_get_tween_count()) );
This will draw in the screen the number of active tweens

*/

return global._tw_tweencount;

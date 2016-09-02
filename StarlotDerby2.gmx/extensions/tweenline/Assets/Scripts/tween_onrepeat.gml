/// tween_onrepeat(tween)
/*
    Returns true in the single step when the tween performs 
    the "onrepeat" event. 
    
    Note:   The event must be defined as "lazy" and 
            tween_system_lazy_events( eneable ) must be eneabled to 
            get lazy events to work. (It is eneabled by default)
    
    Example: 
        //// Create event: 
        // define a tween and declare the "onrepeat" event as a "lazy" event.
        tween = tween_to(id, 2, array("x",x+200, "onrepeat","lazy"));
        
        //// Step event:
        // when the tween performs the "onrepeat" event
        if (tween_onrepeat(tween)) {
            //change the sprite colour to red
            image_blend = c_red;
            //and play a sound of a hit
            audio_play_sound( sound_hit, 1, false);
        }
*/


return argument0[TLTWEEN.ONREPEAT_LAZY];



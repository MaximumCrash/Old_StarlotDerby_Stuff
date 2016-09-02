///tweenline_create()
/*
    Creates a new tweenline and returns his index
    
    A tweenline is like a timeline with multiple tweens inside it. 
    You can create a tweenline and then append multiple tween inside this timeline. Then, you can play it 
    alltogether with a single function, and control it like a movie (tweenline_play, tweenline_pause, tweenline_reverse, etc). 
    This way, control multiple tweens to create complex animations is posible thanks to Tweenline Engine. 
    
    _________________________
    
    EXAMPLE 1:  
    You have all your menu objects (buttons, logo, etc), but you need to create a complex menu animation sequence.
    
        //create event obj_animation_controller
        tl = tweenline_create(); 
        tweenline_to ( obj_button_start, 1.2,  array("x", 140));
        tweenline_to ( obj_button_exit,  1.2,  array("x", 250), "-=1"); // note the last argument "-=1"
        tweenline_from ( obj_game_logo,  3.2,  array("x", room_width/2, "y",room_height/2, "scale",0));
            
    With this code, we are creating a tweenline, and appending three tweens. 
    Normally the tweens are appended one after another, but you can pass as a last argument, the
    position of the tween. See tweenline_add to see all the posibilities you have with the position parameter.
    
    Then, you can control this tweenline:
            
        tweenline_pause( tl );
        tweenline_stop( tl );
        tweenline_reverse( tl );
        tweenline_set_speed( tl );
        // etc
            
            
    
    __________________________________
    
    NOTE: 
        You cannot have a tweenline with some tweens measured in seconds and other tweens measured in frames (steps) because it's imposible to synchronize tweens with diferent measures of time.
        So, when you add a tween to a tweenline the meassure type setted as default in tween_system_init is ussed.
            - If you set seconds as default, and you append a tween that uses frames as measure type, the time is converted to seconds ussing the current room_speed.
            - If you set frames as default, and you append a tween that uses seconds as measure type, the time is converted to frames ussing the current room_speed.
        The original tween is moddified to use the default measure type, so be careful. 
    

*/

var a, _tl;
_tl[TLTWEEN.TYPE] = TLTYPE.TIMELINE;                // Type
_tl[TLTIMELINE.DURATION] = 0;                       // Duration
_tl[TLTIMELINE.TIME] = 0;                           // Playhead time
_tl[TLTIMELINE.PLAY] = true;                        // is playing?
_tl[TLTIMELINE.DIR] = 1;                            // play direction (sign), and speed (amount)
_tl[TLTIMELINE.TWEENS] = ds_list_create();          // List of tweens
_tl[TLTIMELINE.LABELS] = ds_map_create();           // map of labels (key: "labelName", value: time)
_tl[TLTIMELINE.LABELS_LIST] = ds_list_create();     // list of labels (value: "labelName")
_tl[TLTIMELINE.PRIORITY] = ds_priority_create();    // Priority queue (priority: starttime of each tween, value: tween)
_tl[TLTIMELINE.INMEDIATERENDER] = true;             // Sets inmediate render of the tweenline (useful for most cases)
_tl[TLTIMELINE.LASTTWEEN] = undefined;                   // Last edit time 
ds_list_add(global._tw_tl_dslist, _tl);             // add the tweenline to the list of tweenlines

global._tw_current_creation_tl = _tl;

return _tl;

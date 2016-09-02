/// tween_to( target_object, duration, vars);
/*

    Creates a new tween that animates the target_object variables to the specified 
    destination values (from the current values) and returns its index. 
  
    ____________________________________________________________
      
    target_object [Game Maker Object]
        Target object whose properties should be affected. The target can be any game maker object.
        
    duration [Real]
        Duration in seconds (or frames if "useframes" true is set in the vars parameter)
        
    vars [Array]
        An object defining the end value for each variable that should be tweened (SETTERS) as well as any 
        special properties like "yoyo", "repeat", "ease", etc. (special VARS).
        For example, to tween obj_enemy.x to 100 and obj_enemy.y to 200 with a bouncy easing 
        effect and a duration of 1 second, do this: 

            tweenline_to( obj_enemy, 1, array("x",100, "y",200, "ease", ease_bounceout)); 
          
        The vars array has the folowing syntax: 
        
            array( "SETTER_name",value,     "other_SETTER",value,   "etc_SETTER",value,     "special_VARS_name",value);
        
        (Tabs are only for visualization purposes) You can mix SETTERS names and special VARS names.
        Other example: tween obj_player's alpha to zero while stretching in both x and y. 
            tweenline_to( obj_player, 2.5, array("xscale",1.2, "yscale",2, "alpha", 0));
                
        
    ______________________________________
    =========== Default SETTERS ==========
    ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨        

    Tweenline has lots of common variables setters that are incorporated within the engine.
    But you can easily ADD your CUSTOM setters for your variables. 
    Please READ the script __tweenline_SETTERS to add your custom setters.
    
    Below you have a list of the default setters incorporated in the Tweenline engine.
    You can use both the setter string "name" or the script set_name. The default setters 
    included in the engine are:
      
        > "x" (set_x)
        > "y" (set_y)
        > "xround" (set_xround) It will do round(x)
        > "yround" (set_yround) It will do round(y)
        > "speed" (set_speed)
        > "hspeed" (set_hspeed)
        > "vspeed" (set_vspeed)
        > "direction" (set_direction)
        > "depth" (set_depth)
        > "friction" (set_friction)
        > "gravity" (set_gravity)
        > "gravity_direction" (set_gravity_direction)
        > "image_speed" (set_speed)
        > "image_index" or "index" (set_image_index)
        > "image_alpha" or "alpha" (set_image_alpha)
        > "image_angle" or "angle" (set_image_angle)
        > "image_scale" or "scale" (set_image_scale) BOTH image_xscale and image_yscale at the same time
        > "image_xscale" or "xscale" (set_image_xscale)
        > "image_yscale" or "yscale" (set_image_yscale)
        > "health" (set_health)
        > "score" (set_score)
        

    
    ______________________________________________________
    ============ Special VARS: TWEEN BEHAVIOR ============
    ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
    
    Below is a full list of special properties you can specify on vars argument: 
    For the special vars you can use both the string "name" or the script var_name.  
            

        
    > "ease" (var_ease) [script]
        You can choose from various eases to control the rate of change during the animation, giving it a 
        specific "feel". For example, ease_elasticout or ease_stronginout. 
        For best performance, use one of the Tweenline eases included in the "ease" folder with this extension.
        For linear animation, use the Tweenline ease_linear ease. 
        The default ease is ease_quadout. (You can always change the default easing script with 
        the tween_system_set_default_ease(ease) function)
    
    > "paused" (var_paused) [Boolean]
        If true, the tween will pause itself immediately upon creation.
    
    > "useframes" (var_useframes) [Boolean]
        If var_useframes is true, the tweens's timing will be based on frames instead of seconds. This causes both its 
        duration and delay to be based on frames. An animations's timing mode is always determined by its parent timeline.    
        
    > "repeat" (var_repeat) [Integer]
        Number of times that the animation should repeat after its first iteration. For example, if repeat is 1, the 
        animation will play a total of twice (the initial play plus 1 repeat). To repeat indefinitely, use -1. repeat 
        should always be an integer.
        
    > "repeatdelay" (var_repeatdelay) [Real] 
        Amount of time in seconds (or frames for frames-based tweens) between repeats. For example, if repeat is 2 and 
        var_repeatdelay is 1, the animation will play initially, then wait for 1 second before it repeats, then play 
        again, then wait 1 second again before doing its final repeat.
        
    > "yoyo" (var_yoyo) [Boolean]
        If true, every other repeat cycle will run in the opposite direction so that the tween appears to go back and 
        forth (forward then backward).
        So if repeat is 2 and yoyo isfalse, it will look like: 
            start - 1 - 2 - 3 - 1 - 2 - 3 - 1 - 2 - 3 - end. 
        But if yoyo is true, it will look like: 
            start - 1 - 2 - 3 - 3 - 2 - 1 - 1 - 2 - 3 - end.
            
    > "patrol" (var_patrol) [Boolean]
        Patrol it's a shorhand way of set var_repeat to -1 and var_yoyo to true. If true, every other repeat cycle
        will run in the opposite direction so that the tween appears to go back and 
        forth indefinitely (forward then backward). 
        
    > "loop" (var_loop) [Boolean] 
        If true, it has the same effect as set var_repeat to -1. The tween will loop indefinitely.

        
    ____________________________________________________
    ============ Special VARS: TWEEN EVENTS ============
    ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
    
    Below is a full list of special properties you can specify on vars argument: 
    For the special vars you can use both the string "oneventname" or the script var_oneventname.
    The following list are EVENTS. When you define an event the script passed will be called like:
    
        script_passed( script_params[0], script_params[1], script_params[2], ... etc); 
                           

    > "oncomplete" (var_oncomplete) [Callback Script]
        A script that should be called when the timeline has completed.
        
    > "oncompleteparams" (var_oncompleteparams) [Array for multiple arguments, other value type for only one argument]
        An Array of parameters to pass the "oncomplete" script. For example:
            tween_to(id,2,array("oncomplete", scr_myscript, "oncompleteparams",array("param1", "param2")));
        To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
            tween_to(id,2,array("oncomplete", scr_myscript, "oncompleteparams", array("_self", "param2")));
        If you pass a non array type of argument, the value will be passed as a single argument for the script:
            tween_to(id,2,array("oncomplete", scr_myscript, "oncompleteparams", my_only_argument ));
        
    
    > "onreversecomplete" (var_onreversecomplete) [Callback Script]
         A function that should be called when the Tween/Tweenline has reached its beginning 
         again from the reverse direction. For example, if tweeen_reverse()/tweenline_reverse() 
         is called, the Tween timeline will move back towards its beginning and when its time 
         reaches 0, the passed script to "onreversecomplete" will be called. This can also happen if 
         the timeline is placed in a Tweenline timeline that gets reversed and plays the 
         timeline backwards to (or past) the beginning.
        
    > "onreversecompleteparams" (var_onreversecompleteparams) [Array for multiple arguments, other value type for only one argument]
        An Array of parameters to pass the "onreversecomplete" script. For example:
            tween_to(id,2,array("onreversecomplete", scr_myscript, "onreversecompleteparams",array("param1", "param2"))); 
        To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
            tween_to(id,2,array("onreversecomplete", scr_myscript, "onreversecompleteparams", array("_self", "param2")));
        If you pass a non array type of argument, the value will be passed as a single argument for the script:
            tween_to(id,2,array("onreversecomplete", scr_myscript, "onreversecompleteparams", my_only_argument ));
       
       
    > "onupdate" (var_onupdate) [Callback Script]
        A script that should be called every time the Tween/Tweenline updates (on every 
        frame while the timeline is active)
    
    > "onupdateparams" (var_onupdateparams) [Array for multiple arguments, other value type for only one argument]
        An Array of parameters to pass the "onupdate" script. For example:
            tween_to(id,2,array("onupdate", scr_myscript, "onupdateparams",array("param1", "param2"))); 
        To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
            tween_to(id,2,array("onupdate", scr_myscript, "onupdateparams", array("_self", "param2")));
        If you pass a non array type of argument, the value will be passed as a single argument for the script:
            tween_to(id,2,array("onupdate", scr_myscript, "onupdateparams", my_only_argument ));
    
    > "onstart" (var_onstart) [Callback Script]
        A script that should be called when the Tween/Tweenline begins (when its time 
        changes from 0 to some other value which can happen more than once if 
        the timeline is restarted multiple times).
    
    > "onstartparms" (var_onstartparms) [Array for multiple arguments, other value type for only one argument]
        An Array of parameters to pass the "onstart" script. For example:
            tween_to(id,2,array("onstart", scr_myscript, "onstartparms",array("param1", "param2"))); 
        To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
            tween_to(id,2,array("onstart", scr_myscript, "onstartparms", array("_self", "param2")));
        If you pass a non array type of argument, the value will be passed as a single argument for the script:
            tween_to(id,2,array("onstart", scr_myscript, "onstartparms", my_only_argument ));
    
    > "onrepeat" (var_onrepeat) [Callback Script]
        A function that should be called each time the Tween/Tweenline repeats.
    
    > "onrepeatparms" (var_onrepeatparms) [Array for multiple arguments, other value type for only one argument]
        An Array of parameters to pass the "onrepeat" script. For example:
            tween_to(id,2,array("onrepeat", scr_myscript, "onrepeatparms",array("param1", "param2"))); 
        To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
            tween_to(id,2,array("onrepeat", scr_myscript, "onrepeatparms", array("_self", "param2")));
        If you pass a non array type of argument, the value will be passed as a single argument for the script:
            tween_to(id,2,array("onrepeat", scr_myscript, "onrepeatparms", my_only_argument ));        
        
        
________________________________________________________________________________


    END OF tween_to documentation.
    
    For questions/Bugs/support or to show me the game you are making with this engine please send me a mail:
        Mail: 
            jhm.ciberman@gmail.com
        Facebook: (please pm only, do not add me as a friend)
            https://www.facebook.com/javier.ciberman
        Twitter:
            @Ciberman96
        Web:
            http://www.ciberman.net/
            
    ENJOY!!!
    

*/ 

// If vars is not an array, then exit and return -1 (ERROR)
if (!is_array(argument2)) { return -1;}

var _t = __tl_private_new_tween(argument0, argument1);

var arr;
arr[0] = "tween_to";
arr[1] = object_get_name((argument0).id);
arr[2] = argument1;
arr[3] = argument2;
_t[@ TLTWEEN.DEBUGARGS] = arr;

__tl_private_prop_set(_t,argument2,false);
__tl_private_vars_apply(_t);
__tl_private_tween_creation_finish(_t);

global._tw_tweencount+=1;
ds_list_add(global._tw_dslist, _t);

return _t;

#define __tweenline_VARS
/// __tweenline_VARS()
/*
    This vars are used as arguments to the tweenline system to customize some parameters
    of the animation.
    As you can see, this scripts are empty, and are used only as a constant.
    
    You only need a reference to the name of the var, you can use this name as show in tween_to function.
    
    ___________________________________________________________
    |                                                         |
    |     WARNING: DO NOT CALL THIS SCRIPTS DIRECTYLY!!!!!    |
    |_________________________________________________________|
    
    
    => What is the utility of those var_* scripts ?
        You can pass the name of the scripts as arguments to the tweens creation functions. 
        For example, if you do:
        
            tween_to( obj_myobject, 2, array( "x", 30, "yoyo", true));
            
        This is the same as: (but in a more compact way)
        
            var tween = tween_to( obj_myobject, 2, array( set_x, 30));
            tween_set_yoyo( tween, true);
        
    
    
*/


/// DO NOT MODIFY THIS:

var count=0;
global._tw_VARS[? "ease"] = var_ease;
global._tw_VARS_arr[count++] = var_ease;
global._tw_VARS[? "delay"] = var_delay;
global._tw_VARS_arr[count++] = var_delay;
global._tw_VARS[? "paused"] = var_paused;
global._tw_VARS_arr[count++] = var_paused;
global._tw_VARS[? "useframes"] = var_useframes;
global._tw_VARS_arr[count++] = var_useframes;
global._tw_VARS[? "repeat"] = var_repeat;
global._tw_VARS_arr[count++] = var_repeat;
global._tw_VARS[? "repeatdelay"] = var_repeatdelay;
global._tw_VARS_arr[count++] = var_repeatdelay;
global._tw_VARS[? "persistent"] = var_persistent;
global._tw_VARS_arr[count++] = var_persistent;
global._tw_VARS[? "yoyo"] = var_yoyo;
global._tw_VARS_arr[count++] = var_yoyo;
global._tw_VARS[? "loop"] = var_loop;
global._tw_VARS_arr[count++] = var_loop;
global._tw_VARS[? "patrol"] = var_patrol;
global._tw_VARS_arr[count++] = var_patrol;


// EVENTS: 

global._tw_VARS[? "oncomplete"] = var_oncomplete;
global._tw_VARS_arr[count++] = var_oncomplete;
global._tw_VARS[? "oncompleteparams"] = var_oncompleteparams;
global._tw_VARS_arr[count++] = var_oncompleteparams;

global._tw_VARS[? "onreversecomplete"] = var_onreversecomplete;
global._tw_VARS_arr[count++] = var_onreversecomplete;
global._tw_VARS[? "onreversecompleteparams"] = var_onreversecompleteparams;
global._tw_VARS_arr[count++] = var_onreversecompleteparams;

global._tw_VARS[? "onupdate"] = var_onupdate;
global._tw_VARS_arr[count++] = var_onupdate;
global._tw_VARS[? "onupdateparams"] = var_onupdateparams;
global._tw_VARS_arr[count++] = var_onupdateparams;

global._tw_VARS[? "onstart"] = var_onstart;
global._tw_VARS_arr[count++] = var_onstart;
global._tw_VARS[? "onstartparams"] = var_onstartparams;
global._tw_VARS_arr[count++] = var_onstartparams;

global._tw_VARS[? "onrepeat"] = var_onrepeat;
global._tw_VARS_arr[count++] = var_onrepeat;
global._tw_VARS[? "onrepeateparams"] = var_onrepeatparams;
global._tw_VARS_arr[count++] = var_onrepeatparams


#define var_ease
/// var_ease
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "ease" (var_ease) [script]
    You can choose from various eases to control the rate of change during the animation, giving it a 
    specific "feel". For example, ease_elasticout or ease_stronginout. 
    For best performance, use one of the Tweenline eases included in the "ease" folder with this extension.
    For linear animation, use the Tweenline ease_linear ease. 
    The default ease is ease_quadout. (You can always change the default easing script editing tween_engine_init script)

    
*/

argument0[@ TLTWEEN.EASE] = argument1;


#define var_delay
/// var_delay
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "delay" (var_delay) [Real]
    Amount of delay in seconds (or frames for frames-based tweens) before the animation should begin.
    
    
*/

argument0[@ TLTWEEN.DELAY] = argument1; 
argument0[@ TLTWEEN.INITIALDELAY] = argument1; 



#define var_paused
/// var_paused
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "paused" (var_paused) [Boolean]
    If true, the tween will pause itself immediately upon creation.
    
*/

argument0[@ TLTWEEN.PLAY] =!argument1; 



#define var_useframes
/// var_useframes
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "useframes" (var_useframes) [Boolean]
    If var_useframes is true, the tweens's timing will be based on frames instead of seconds. This causes both its 
    duration and delay to be based on frames. An animations's timing mode is always determined by its parent timeline.    
    
*/

argument0[@ TLTWEEN.USEFRAMES] = argument1; 

#define var_repeat
/// var_repeat
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "repeat" (var_repeat) [Integer]
    Number of times that the animation should repeat after its first iteration. For example, if repeat is 1, the 
    animation will play a total of twice (the initial play plus 1 repeat). To repeat indefinitely, use -1. repeat 
    should always be an integer.
    

    
*/


argument0[@ TLTWEEN.REPEAT] = argument1;  

#define var_repeatdelay
/// var_repeats
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "repeatdelay" (var_repeatdelay) [Real] 
    Amount of time in seconds (or frames for frames-based tweens) between repeats. For example, if repeat is 2 and 
    var_repeatdelay is 1, the animation will play initially, then wait for 1 second before it repeats, then play 
    again, then wait 1 second again before doing its final repeat.
    
*/

argument0[@ TLTWEEN.REPEATDELAY] = argument1;  



#define var_persistent
/// var_persistent
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "persistent" (var_persistent) [Boolean]
    If true, the tween will be persistent, and it will not be 
    destroyed by the tweenline garbage collector. Check tween_set_persistent
    for more info about tweens persistent mode. 
    
*/

argument0[@ TLTWEEN.PERSISTENT] = argument1; 


#define var_yoyo
/// var_yoyo
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "yoyo" (var_yoyo) [Boolean]
    If true, every other repeat cycle will run in the opposite direction so that the tween appears to go back and 
    forth (forward then backward).
    So if repeat is 2 and yoyo isfalse, it will look like: 
        start - 1 - 2 - 3 - 1 - 2 - 3 - 1 - 2 - 3 - end. 
    But if yoyo is true, it will look like: 
        start - 1 - 2 - 3 - 3 - 2 - 1 - 1 - 2 - 3 - end.
    
*/


argument0[@ TLTWEEN.YOYO] = argument1;



#define var_loop
/// var_loop
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "loop" (var_loop) [Boolean] 
    If true, it has the same effect as set var_repeat to -1. The tween will loop indefinitely.
    
*/

if (argument1) {
    argument0[@ TLTWEEN.REPEAT] = -1;
}



#define var_patrol
/// var_patrol
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "patrol" (var_patrol) [Boolean]
    Patrol it's a shorhand way of set var_repeat to -1 and var_yoyo to true. If true, every other repeat cycle
    will run in the opposite direction so that the tween appears to go back and 
    forth indefinitely (forward then backward). 
    
*/

if (argument1) {
    argument0[@ TLTWEEN.REPEAT] = -1; 
    argument0[@ TLTWEEN.YOYO] = true; 
}


#define var_oncomplete
/// var_oncomplete
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "oncomplete" (var_oncomplete) [Callback Script]
    A script that should be called when the timeline has completed.
    
*/

__tl_private_callback_set(argument0, TLTWEEN.ONCOMPLETE, TLTWEEN.ONCOMPLETE_TYPE, argument1);




#define var_oncompleteparams
/// var_oncompleteparams
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "oncompleteparams" (var_oncompleteparams) [Array for multiple arguments, other value type for only one argument]
    An Array of parameters to pass the "oncomplete" script. For example:
    
        tween_to(id,2,array("oncomplete", scr_myscript, "oncompleteparams",array("param1", "param2"))); 
    
    To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
        
        tween_to(id,2,array("oncomplete", scr_myscript, "oncompleteparams", array("_self", "param2")));
        
    If you pass a non array type of argument, the value will be passed as a single argument for the script:
    
        tween_to(id,2,array("oncomplete", scr_myscript, "oncompleteparams", my_only_argument ));
    
*/

__tl_private_params_set(argument0, TLTWEEN.ONCOMPLETE_PARAMS, argument1);



#define var_onreversecomplete
/// var_onreversecomplete
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "onreversecomplete" (var_onreversecomplete) [Callback Script]
     A function that should be called when the Tween/Tweenline has reached its beginning 
     again from the reverse direction. For example, if tweeen_reverse()/tweenline_reverse() 
     is called, the Tween timeline will move back towards its beginning and when its time 
     reaches 0, the passed script to "onreversecomplete" will be called. This can also happen if 
     the timeline is placed in a Tweenline timeline that gets reversed and plays the 
     timeline backwards to (or past) the beginning.
    
*/

__tl_private_callback_set(argument0, TLTWEEN.ONREVERSECOMPLETE, TLTWEEN.ONREVERSECOMPLETE_TYPE, argument1);



#define var_onreversecompleteparams
/// var_onreversecompleteparams
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "onreversecompleteparams" (var_onreversecompleteparams) [Array for multiple arguments, other value type for only one argument]
    An Array of parameters to pass the "onreversecomplete" script. For example:
    
        tween_to(id,2,array("onreversecomplete", scr_myscript, "onreversecompleteparams",array("param1", "param2"))); 
    
    To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
        
        tween_to(id,2,array("onreversecomplete", scr_myscript, "onreversecompleteparams", array("_self", "param2")));
        
    If you pass a non array type of argument, the value will be passed as a single argument for the script:
    
        tween_to(id,2,array("onreversecomplete", scr_myscript, "onreversecompleteparams", my_only_argument ));
    
*/

__tl_private_params_set(argument0, TLTWEEN.ONREVERSECOMPLETE_PARAMS, argument1);

#define var_onupdate
/// var_onupdate
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "onupdate" (var_onupdate) [Callback Script]
    A script that should be called every time the Tween/Tweenline updates (on every 
    frame while the timeline is active)
    
*/

__tl_private_callback_set(argument0, TLTWEEN.ONUPDATE, TLTWEEN.ONUPDATE_TYPE, argument1);



#define var_onupdateparams
/// var_onupdateparms
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "onupdateparams" (var_onupdateparams) [Array for multiple arguments, other value type for only one argument]
    An Array of parameters to pass the "onupdate" script. For example:
    
        tween_to(id,2,array("onupdate", scr_myscript, "onupdateparams",array("param1", "param2"))); 
    
    To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
        
        tween_to(id,2,array("onupdate", scr_myscript, "onupdateparams", array("_self", "param2")));
        
    If you pass a non array type of argument, the value will be passed as a single argument for the script:
    
        tween_to(id,2,array("onupdate", scr_myscript, "onupdateparams", my_only_argument ));
    
*/

__tl_private_params_set(argument0, TLTWEEN.ONUPDATE_PARAMS, argument1);

#define var_onstart
/// var_onstart
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "onstart" (var_onstart) [Callback Script]
    A script that should be called when the Tween/Tweenline begins (when its time 
    changes from 0 to some other value which can happen more than once if 
    the timeline is restarted multiple times).
    
*/

__tl_private_callback_set(argument0, TLTWEEN.ONSTART, TLTWEEN.ONSTART_TYPE, argument1);


#define var_onstartparams
/// var_onstartparms
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "onstartparms" (var_onstartparms) [Array for multiple arguments, other value type for only one argument]
    An Array of parameters to pass the "onstart" script. For example:
    
        tween_to(id,2,array("onstart", scr_myscript, "onstartparms",array("param1", "param2"))); 
    
    To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
        
        tween_to(id,2,array("onstart", scr_myscript, "onstartparms", array("_self", "param2")));
        
    If you pass a non array type of argument, the value will be passed as a single argument for the script:
    
        tween_to(id,2,array("onstart", scr_myscript, "onstartparms", my_only_argument ));
    
*/

__tl_private_params_set(argument0, TLTWEEN.ONSTART_PARAMS, argument1);

#define var_onrepeat
/// var_onrepeat
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "onrepeat" (var_onrepeat) [Callback Script]
    A function that should be called each time the Tween/Tweenline repeats.
    
*/

__tl_private_callback_set(argument0, TLTWEEN.ONREPEAT, TLTWEEN.ONREPEAT_TYPE, argument1);


#define var_onrepeatparams
/// var_onrepeatparms
/*

DO NOT USE THIS SCRIPT!!!!!, read __tweenline_VARS for more info

> "onrepeatparms" (var_onrepeatparms) [Array for multiple arguments, other value type for only one argument]
    An Array of parameters to pass the "onrepeat" script. For example:
    
        tween_to(id,2,array("onrepeat", scr_myscript, "onrepeatparms",array("param1", "param2"))); 
    
    To self-reference the id of the tween instance itself in one of the parameters, use "_self", like: 
        
        tween_to(id,2,array("onrepeat", scr_myscript, "onrepeatparms", array("_self", "param2")));
        
    If you pass a non array type of argument, the value will be passed as a single argument for the script:
    
        tween_to(id,2,array("onrepeat", scr_myscript, "onrepeatparms", my_only_argument ));
    
*/

__tl_private_params_set(argument0, TLTWEEN.ONREPEAT_PARAMS, argument1);
/// tween_fromto(target_object, duration, from_vars, to_vars);
/*

    Allows you to define both the starting and ending values (as opposed to tween_to() and 
    tween_from() tweens which are based on the target's current values at one end or the other).

    Note:   For a complete description of the ARGUMENTS and the usage mode, please refer to tween_to().
    
    ____________________________
    
    
    target_object [Game Maker Object]
        Target object whose properties should be affected. The target can be any game maker object.
        
    duration [Real]
        Duration in seconds (or frames if "useframes" true is set in the vars parameter)
        
    from_vars/to_vars [Arrays]
        An arrays defining the start and end values for each variable that should be tweened (SETTERS) as well as any 
        special properties like "yoyo", "repeat", "ease", etc. (special VARS).
        For example, to tween obj_enemy.x from 100 to 150 and obj_enemy.y from 200 to 400 with a bouncy easing 
        effect and a duration of 1 second, do this: 

            tweenline_fromto( obj_enemy, 1, array("x",100, "y",200, "ease", ease_bounceout), array("x",150, "y",400, "ease", ease_bounceout)); 
          
        The vars array has the folowing syntax: 
        
            array( "SETTER_name",value,     "other_SETTER",value,   "etc_SETTER",value,     "special_VARS_name",value);
        
        (Tabs are only for visualization purposes) You can mix SETTERS names and special VARS names.
    
    
    Note:   For a COMPLETE description of the ARGUMENTS and the usage mode, please refer to tween_to().
    
    Note:   If you define some propietry in from_vars, but not in to_vars or viceversa, the values are captured automatically
            by the Tweenline engine. 
    
*/ 

// If vars is not an array, then exit and return -1 (ERROR)
if (!is_array(argument2) || !is_array(argument3)) { return -1;}
if (is_array(argument0)) { return tween_stagger_fromto(argument0,argument1,argument2,argument3,0);}

var _t = __tl_private_new_tween(argument0, argument1);

var arr;
arr[0] = "tween_fromto";
arr[1] = object_get_name((argument0).object_index);
arr[2] = argument1;
arr[3] = argument2;
arr[4] = argument3;
_t[@ TLTWEEN.DEBUGARGS] = arr;

__tl_private_prop_set(_t,argument2,true);
__tl_private_prop_set(_t,argument3,false);
__tl_private_vars_apply(_t);
__tl_private_tween_creation_finish(_t);


global._tw_tweencount+=1;
ds_list_add(global._tw_dslist, _t);

return _t;

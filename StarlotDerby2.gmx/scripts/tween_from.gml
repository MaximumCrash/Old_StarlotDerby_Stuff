/// tween_from(target_object, duration, vars);
/*
    Creates a new tween that animates the target_object variables FROM the specified 
    values (from the current values) and returns its index. 

    You define the BEGINNING values and the current values are used as the destination values 
    which is great for doing things like animating objects onto the screen because you can set
    them up initially the way you want them to look at the end of the tween and then animate in 
    from elsewhere.
    
    Note: For a COMPLETE description of the ARGUMENTS and the usage mode, please refer to tween_to().
    
    ____________________________
    
    
    target_object [Game Maker Object]
        Target object whose properties should be affected. The target can be any game maker object.
        
    duration [Real]
        Duration in seconds (or frames if "useframes" true is set in the vars parameter)
        
    vars [Array]
        An object defining the starting value for each variable that should be tweened (SETTERS) as well as any 
        special properties like "yoyo", "repeat", "ease", etc. (special VARS).
        For example, to tween obj_enemy.x from 100 and obj_enemy.y from 200 to the current values, 
        with a bouncy easing effect and a duration of 1 second, do this: 

            tweenline_from( obj_enemy, 1, array("x",100, "y",200, "ease", ease_bounceout)); 
          
        The vars array has the folowing syntax: 
        
            array( "SETTER_name",value,     "other_SETTER",value,   "etc_SETTER",value,     "special_VARS_name",value);
        
        (Tabs are only for visualization purposes) You can mix SETTERS names and special VARS names.
        Other example: tween obj_player's alpha to zero while stretching in both x and y. 
            tweenline_to( obj_player, 2.5, array("xscale",1.2, "yscale",2, "alpha", 0));
    
    
    Note: For a COMPLETE description of the ARGUMENTS and the usage mode, please refer to tween_to().
    
    
*/ 

// If vars is not an array, then exit and return -1 (ERROR)
if (!is_array(argument2)) { return -1;}
if (is_array(argument0)) { return tween_stagger_from(argument0,argument1,argument2,0);}

var _t = __tl_private_new_tween(argument0, argument1);

var arr;
arr[0] = "tween_from";
arr[1] = argument0;
arr[2] = argument1;
arr[3] = argument2;
_t[@ TLTWEEN.DEBUGARGS] = arr;

__tl_private_prop_set(_t,argument2,true);
__tl_private_vars_apply(_t);
__tl_private_tween_creation_finish(_t);




global._tw_tweencount+=1;
ds_list_add(global._tw_dslist, _t);

return _t;

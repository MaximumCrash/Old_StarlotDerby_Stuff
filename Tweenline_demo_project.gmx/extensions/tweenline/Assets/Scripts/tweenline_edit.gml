//// tweenline_edit( tweenline );
/*

    Sets the tweenline specified marked to be edited. All posterior calls 
    to tweenline_add, tweenline_to, tweenline_from, tweenline_fromto and
    tweenline_remove will be applied to the specified tweenline.
    
    You first call tweenline_begin passing it an already defined tweenline, and
    then you can make all the needed modifications.    
    
    Note:   This function is in BETA. Unexpected results can ocurr if you modify an 
            already defined tweenline.
    
    Note:   YOU DO NOT NEED TO USE THIS FUNCTION IF YOU ARE CREATING THE TWEENLINE FOR 
            THE FIRST TIME. Please refer to tweenline_create for more info about 
            creating tweenlines.
    
    
    Example:
        /// Create event
            twenline = tweenline_create();
            tweenline_to( ... ); //first define your tweenline as you usually do
            tweenline_to( ... );
            tweenline_to( ... );
        
        
        // mouse left click event
            tweenline_edit(tweenline); //when you have to edit your tweenline, call tweenline_edit
            tweenline_to( ... ); // then, you can alter the existing tweenline
            tweenline_add( ... );
            tweenline_from( ... );
            tweenline_remove( ... );
        
*/

// (Yes, a lot of documentation for this only line of code) 
if (tweenline_exists(argument0)) { global._tw_current_creation_tl = argument0;}

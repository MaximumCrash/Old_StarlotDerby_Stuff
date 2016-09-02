/// tween_set(target, vars)
/*
    Immediately sets properties of the target accordingly - essentially a 
    zero-duration tween_from() with a more intuitive name.
    
    NOTE:   This function is not optimized at all. So, do not use it in the 
    step event. Only use it when you want to set a lot of variables with less code. 
            
    NOTE:   For a COMPLETE description of the ARGUMENTS and the usage mode, please refer to tween_to().
    
    Example:          
        tween_set( obj_clown , array("x", 20, "y", mouse_y, "alpha", random(1), set_image_angle, 45, set_customvariable, 24.5));
        
    This code do the same as: (But only ONE LINE OF CODE!!!) 
        obj_clown.x = 20;
        obj_clown.y = mouse_y;
        obj_clown.alpha = random(1);
        obj_clown.image_angle = 45;
        obj_clown.customvariable = 24.5;
        
*/


var t = tween_from(argument0,0,argument1);
tween_render(t);
if (t[TLTWEEN.DELAY]==0){
    tween_destroy(t);
}

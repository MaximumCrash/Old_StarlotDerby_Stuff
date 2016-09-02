/// tween_system_setter_add( setter_name, setter_script);
/*
    Adds a custom SETTER:
    tween_system_setter_add("myvar", set_myvar);
    
    This is only requiered by the HTML5 Platform due to a bug with asset_get_name, 
    so, If you are targeting HTML5, you need to add manually your custom setters. If you 
    are not targeting HTML5, it is not necesary, but it's recomended to use it. 
    
    For more info about custom setters, see __tweenline_SETTERS script. 
    
    
*/
global._tw_SETTERS[? argument0] = argument1;

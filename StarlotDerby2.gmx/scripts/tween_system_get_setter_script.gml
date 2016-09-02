/// tween_system_get_setter_script(setter_name);
/*

WARNING: THIS IS AN ADVANCED FUNCTION. YOU NORMALLY DON'T NEED TO USE THIS.

Get the script asociated with that SETTER (setter_name is a string)

Example: 

scr = tween_system_get_setter_script("x");
// outputs script set_x
 
*/
return __tl_private_var_get_script("set", argument0);

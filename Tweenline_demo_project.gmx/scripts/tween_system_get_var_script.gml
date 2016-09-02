/// tween_system_get_var_script(var_name);
/*

WARNING: THIS IS AN ADVANCED FUNCTION. YOU NORMALLY DON'T NEED TO USE THIS.

Get the script asociated with that VAR script (var_name is a string)

Example: 

scr = tween_system_get_var_script("ease");
// outputs script var_ease
 
*/
return __tl_private_var_get_script("var", argument0);

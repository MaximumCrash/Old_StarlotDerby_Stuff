/// tween_get_value(index)
/*
Return the current value of the tween
This is the more important function (See tween_create for more info)
If the tween does not exists, the function will return ZERO.

WARNING: if you are having troubles with tween_get_value (it's returning zero allways)
replace the line 
    if (argument0) {
with:
    if (is_array(argument0)) {
this functions is using a hack to detect if a value it's an array that gains a 4% of speed


*/
//if (argument0>0) {
    return argument0[TL.VALUE]; 
//}
//return 0;
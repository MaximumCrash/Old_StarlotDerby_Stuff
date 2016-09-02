/// instance_select_filter_sort( obj_or_instance_or_array_of_them, setter_script, condition_string, condition_value, sort_setter_script [, ascending=true]);
/*
    Returns an array of instances that is the combination of perform:
        instance_select_filter and then instance_select_sort 

    For more info, please reffer to those functions.
    
*/

var arr = instance_select_filter(argument[0], argument[1], argument[2], argument[3]);
var asc = true;
if (argument_count>5) {
    asc = argument[5];
}
return instance_select_sort(arr, argument[4], asc);



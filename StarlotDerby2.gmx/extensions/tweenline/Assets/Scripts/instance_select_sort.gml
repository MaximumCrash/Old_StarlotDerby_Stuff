/// instance_select_sort( obj_or_instance_or_array_of_them, setter_script [, ascending=true ]);
/*
    Returns an array with all instances specified (check below) 
    sorted by the propietry of the setter_script specified.
    You can sort ascending or descending.
    
    For more info about setter script check __tweenline_SETTERS script. 
    
    For more info about obj_or_instance_or_array_of_them argument check instance_select_array();
    
    Example: 
        In the room you have 5 instances of obj_box placed at random locations.
        If you call:
            var arr = instance_select_sort( obj_box, set_y ); 
        It will return an array with the 5 instances of obj_box sorted from the top
        box to the bottom box on the room. (using the set_y setter script)
        This script is useful to use it in conjunction with 
        tween_stagger_to/from/fromto and tweenline_stagger_to/from/fromto functions like:
            var arr = instance_select_sort( obj_box, set_y );
            tween_stagger_from( arr, 1, array("alpha",0), .5); 
*/
var arr = instance_select_array(argument[0]);

var asc=true, o = argument[0], p = ds_priority_create();
var set = argument[1];
if (argument_count>2) {asc = argument[2];}
var s=array_length_1d(arr);

for (var i=0, ; i<s; i++) {
    var inst=arr[i], value = 0;
    with(inst) {
        value = script_execute(set);
    }
    ds_priority_add(p,inst,value);
}



var index=0;
if (asc) {
    while(!ds_priority_empty(p)) {
        arr[index++] = ds_priority_delete_min(p);
        
    }
} else {
    while(!ds_priority_empty(p)) {
        arr[index++] = ds_priority_delete_max(p);
    }
}

ds_priority_destroy(p);
return arr;

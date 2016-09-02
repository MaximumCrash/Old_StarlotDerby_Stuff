/// instance_select_array( obj_or_instance_or_array_of_them [, array_to_prepend] );
/*
    Returns an array of all the INSTANCES (not objects, INSTANCES) passed.
    
    obj_or_instance_or_array_of_them: This argument can be:
        1 - An object id (all instances of this object will be selected)
        2 - An instance id 
        3 - An array of objects (all instances of those objects will be selected)
        4 - An array of instances
        5 - An array with a mix of instances and objects
        
    If you pass an array in array_to_prepend, the array will be prepended to the normal output array. 
    This is useful to concatenate a series of instance_select_* functions. 
    
    Example:
        Suppose that you have in your room 6 boxes, 1 player and 3 trees, and 4 enemys.
        So you need to SELECT an ARRAY that contains:
            - ALL the instances of the obj_box.
            - ONE specific tree. The instance wich id is 100023.
            - ALL the instances of obj_player (only one will 
              be selected since there is only one instance in the room)
        So, you need to call: 
            var arr = instance_select_array( array(obj_box, 100023, obj_player));
        And the output will be an array like this:
            [100453, 100054, 100055, 100056, ... , 100455]  
        The first 6 will be ALL the instances of the boxes, the 7th item will be the 
        tree and the last will be the id of the player. 
        
        If no instance match the specified query, then undefined is returned. 
    
*/

// First, parse "obj_or_instance_or_array_of_them" and add ALL instances (not objects, instances)
// to the instance_array. 
var o=argument[0], instance_array = undefined;
if (is_array(o)) { // If it is an array
    
    for (var jj=0, ss=array_length_1d(o), index=0; jj<ss; jj++) { // for each element
        var obj_or_inst = o[jj];
        if (object_exists(obj_or_inst)) { // check if is an object
            for (var i=0, s=instance_number(obj_or_inst); i<s; i++) {
                instance_array[index++] = instance_find(obj_or_inst,i); // and add it to the array
            }
        } else if (instance_exists(obj_or_inst)) { // or if it is an instance
            instance_array[index++] = obj_or_inst; // and add it to the array
        }
    }
} else if (is_real(o)){ // if is not an array
    if (object_exists(o)) { // if is an object
        for (var i=0, s=instance_number(o); i<s; i++) {
            instance_array[i] = instance_find(o,i);
        }
    }  else if (instance_exists(o)) { // if is a instance
        instance_array[0] = o; // and add it to the array
    }
} else if (is_undefined(o)){
    show_debug_message("instance_select_array warning: undefined has been pased as obj_or_instance_or_array_of_them argument");
    return undefined;
} else {
    show_debug_message("instance_select_array warning: an unrecognized value has been pased as obj_or_instance_or_array_of_them argument");
    return undefined;
}

if (argument_count>1) {
    var arr1 = argument[1], arr2 = instance_array; 
    for (var i=0, size1 = array_length_1d(arr1), size2 = array_length_1d(arr2)-1; i<size2; i++;) {arr1[size1+i]=arr2[i];}
    instance_array = arr1;
}

return instance_array;

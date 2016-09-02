/// cv_delete([object = id,] var);
/*
    
    Deletes custom variable "var" from of the specified object. 
    If object is not defined, the actual object is used.
    
    cv_delete("myvariable");

*/
if (argument_count>1) {
    // cv_delete(object, var);
    var variable = argument[1], obj=argument[0];
} else {
    // cv_delete(var);
    var variable = argument[0], obj=id;
}

var objmap = global._cv_map;
if (ds_map_exists(objmap, obj)) {
    var map = ds_map_find_value(objmap, obj);
    ds_map_delete(map, variable);
    if (ds_map_size(map)==0) {
        cv_clear_object(obj);
    }
    return true;
}
return false; 

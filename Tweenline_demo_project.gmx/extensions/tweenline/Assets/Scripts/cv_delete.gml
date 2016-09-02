/// cv_delete([object = id,] var);
/*
    
    Deletes custom variable "var" from of the specified object. 
    If object is not defined, the actual object is used.
    
    cv_delete(id);

*/

var objmap = global._cv_map;
if (ds_map_exists(objmap, argument0)) {
    var map = ds_map_find_value(objmap, argument0);
    ds_map_delete(map, argument1);
    if (ds_map_size(map)==0) {
        cv_clear_object(argument0);
    }
    return true;
}
return false; 

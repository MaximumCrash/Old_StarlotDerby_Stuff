/// cv_clear_object(object);
/*
    
    Deletes ALL custom variables from the specified object. 
    
    cv_clear_object(id);

*/

var obj = argument0;
var objmap = global._cv_map;
// If the map for that object exists
if (ds_map_exists(objmap, obj)) {
    // Destroy the asociated map that contains all CVs for that instance
    var m = ds_map_find_value(objmap, obj);
    ds_map_destroy(m);

    // Delete the map from the objmap    
    ds_map_delete(objmap, obj);
    
    // Delete the instance id from the list with all the IDs that have Custom vars
    var list = global._cv_list;
    var index = ds_list_find_index(list, obj);
    if (index>=0) {
        ds_list_delete(global._cv_list, index);
    }
    
    // Return true
    return true;
}
// If the map instance cannot be cleared, return false
return false; 

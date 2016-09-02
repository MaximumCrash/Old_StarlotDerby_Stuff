/// cv_clear_object(object);
/*
    
    Deletes ALL custom variables from of the specified object. 
    
    cv_clear_object(id);

*/

var objmap = global._cv_map;
if (ds_map_exists(objmap, argument0)) {
    ds_map_delete(objmap, argument0);
    var list = global.cv_list;
    var index = ds_list_find_index(list, argument0);
    if (index>=0) {
        ds_list_delete(global.cv_list, index);
    }
    return true;
}
return false; 

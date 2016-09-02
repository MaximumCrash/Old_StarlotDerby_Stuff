/// cv_system_gc()
/*

    This script force the execution of the executes the garbage collector.
    
*/

var list = global._cv_list, size = ds_list_size(list);
for (var i=size-1; i>=0; i--) { //Reverse cleaning
    var idd = ds_list_find_value(list, i); 
    if (!instance_exists(idd)) { // If the instance does not exists
        ds_list_delete(list, i);
        ds_map_delete(global._cv_map, idd);
    }
}


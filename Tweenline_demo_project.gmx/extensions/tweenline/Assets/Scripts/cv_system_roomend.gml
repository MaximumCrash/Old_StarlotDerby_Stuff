/// cv_system_room_end()
/*

    Call this script in the ROOM END event. This script executes the garbage collector.
    
    Note: If you are uning it with tweenline_engine, call this 
    script is not necesary. Tweenline will call it for you.  
    
*/


var list = global._cv_list, size = ds_list_size(list);
for (var i=size-1; i>=0; i--) { //Reverse cleaning
    var idd = ds_list_find_value(list, i); 
    if (!instance_exists(idd)) {
        ds_list_delete(list, i);
        ds_map_delete(global._cv_map, idd);
    }
}





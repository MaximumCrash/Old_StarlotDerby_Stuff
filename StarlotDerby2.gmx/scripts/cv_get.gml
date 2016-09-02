/// cv_get([object = id,] var);
/*
    
    Gets the custom variable "var" of the specified object. 
    If the value does not exists the script returns undefined. 
    
    If object is not defined, the actual object is used.
    
    var myvariable = cv_get(id, "myvariable");

*/


if (argument_count>1) {
    // cv_get(object, var);
    var variable = argument[1], obj=argument[0];
} else {
    // cv_get(var);
    var variable = argument[0], obj=id;
}

var objmap = global._cv_map;
if (instance_exists(obj)) {
    with (obj) {
        //The use of ds_map_exists instaed of simply check ds_map_find_value with is_undefined is due to a HTML5 compiller bug. :) 
        // BUG: http://bugs.yoyogames.com/view.php?id=18390
        // When changed, please correct it to gain performance. 
        if (ds_map_exists(objmap, id)) {
            var map = ds_map_find_value(objmap, id);
            if (ds_map_exists(map, variable)) {
                return ds_map_find_value(map,variable);
            }
            return undefined;
        }
    } 
} else {
    cv_clear_object(obj);
}
return undefined; 

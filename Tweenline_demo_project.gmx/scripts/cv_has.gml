/// cv_has([object = id,] var);
/*
    
    Chacks if the custom variable "var" exists in object. 
    
    If object is not defined, the actual object is used.
    
    var variable_exists = cv_has(id, "myvariable");

*/
if (argument_count>1) {
    // cv_has(object, var);
    var variable = argument[1], obj=argument[0];
} else {
    // cv_has(var);
    var variable = argument[0], obj=id;
}


var objmap = global._cv_map;
with (obj) {
    if (ds_map_exists(objmap, id)) {
        var map = ds_map_find_value(objmap,id);
        return ds_map_exists(map,variable);
    }
    break;
}
return false;

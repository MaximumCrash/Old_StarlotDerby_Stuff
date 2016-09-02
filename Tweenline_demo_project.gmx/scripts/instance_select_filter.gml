/// instance_select_filter( obj_or_instance_or_array_of_them, setter_script, condition_string, condition_value);
/*
    This will return an array of instances filtered by the specified condition. 
    
    For more info about obj_or_instance_or_array_of_them argument check instance_select_array();
    
    - setter_script: must be a setter script (wich value will be used for testing)
    
    For more info about setter script check __tweenline_SETTERS script. 
    
    - condition_string: it will be the condition for testing. The posible values can be:
        ">"  "<"  ">="  "<="  "="  "=="  "!="  "<>" 
        
    - condition_value: must be the value compared to. See the example for more info.
    
    Example:
        if you want to select the all the obj_tree instances which 
        Y position is less than 180 you can do: 
            var arr = instance_select_filter( obj_tree, set_y, "<", 180); 
        This will return an array with ALL the ids of the instances of the 
        obj_tree wich y position is below 180.
        
        
    
*/

var o = argument0, setter = argument1, condition = argument2, val= argument3;

var arr = undefined, index=0;
var inst_arr = instance_select_array(o); 

for (var i=0, s=array_length_1d(inst_arr); i<s; i++) { // for each instance

    // get the value
    var v = undefined;
    with(inst_arr[i]) { v = script_execute(setter);}
    
    // test condition with refference value
    var a = false;
    switch(condition) {
        case ">": a = (v > val); break;
        case "<": a = (v < val); break;
        case ">=": a = (v >= val); break;
        case "<=": a = (v <= val); break;
        case "=": a = (v = val); break;
        case "==": a = (v == val); break;
        case "!=": a = (v != val); break;
        case "<>": a = (v <> val); break;
        default: a=false;
    }
    
    // check for the condition
    if (a) { 
        // and add it to the array
        arr[index++] = inst_arr[i];       
    }
}


return arr; 

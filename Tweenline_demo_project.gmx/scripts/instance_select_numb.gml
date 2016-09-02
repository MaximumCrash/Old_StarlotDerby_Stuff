/// instance_select_numb( obj_or_instance_or_array_of_them, condition_string, condition_value [, numb_add=0]);
/*
    This will return an array of instances filtered by the specified condition given by the number of the instance inside the array. 
    
    For more info about obj_or_instance_or_array_of_them argument check instance_select_array();
    
    - condition_string: it will be the condition for testing. The posible values can be:
        ">"  "<"  ">="  "<="  "="  "=="  "!="  "<>"  "mod"  "%"  "mod!"  "%!"  "!mod"  "!%"
        
    - condition_value: must be the value compared to. See the example for more info.
    
    
    The internal process of selection is the following:
        - First, all instances of obj_or_instance_or_array_of_them are 
          selected and numbered from (0) to (n-1) (n is the number of total instances)
        - Then, each instance number is compared using the condition_string and the condition_value
        - If the condition_string is "mod"  "%"  "mod!"  "%!"  "!mod" or "!%" then the numb_add is
          added to the number of the instance and then, compared using the condition and value.
        - Then, an array containing all the matched instances is returned.
        
        
    For example: [ FOR MORE INFO ABOUT THE mod OPERATOR, please reffer to the GM:S manual]
        If you want to select all odd instances of the obj_box in the room (numbered from the top to the bottom):
            var arr = instance_select_sort( obj_box, set_y);
            arr = instance_select_numb( arr, "!mod", 2);
        It is the same that saying all instances wich       (n mod 2) != 0
        You can also use "mod!"  "!%"  or  "%!" for the same result. 
        
        
    Another example:  [ FOR MORE INFO ABOUT THE mod OPERATOR, please reffer to the GM:S manual]
        Suppose that you want to select obj_box the instances wich 
        number (sorted from left to right in the room) is 1, 4, 7, 10, etc.  
        That is the same that all instances wich   (n mod 3)+1 == 0
        So, the formula will be:
            (n mod condition_value)+numb_add == 0
        Then, you need to call:
            var arr = instance_select_sort( obj_box, set_x);
            arr = instance_select_numb( arr, "mod", 3, 1);
    
            
    The last Example:
        if you want to select the firsts 16 obj_tree instances sorted from right to left
            var arr = instance_select_sort( obj_tree, set_x, false); 
            arr = instance_select_filter( arr, "<", 16); 
        This will return an array with ALL the ids of the instances of the 
        obj_tree wich number is below 16. (remember that the numbers starts from zero)
        
        
    
*/

var o = argument[0], condition = argument[1], val= argument[2], add=0;
if (argument_count>3) {
    add = argument[3];
}
var arr = undefined, index=0;
var inst_arr = instance_select_array(o); 

for (var i=0, s=array_length_1d(inst_arr); i<s; i++) { // for each instance

    // get the value
    var v = i;
    
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
        case "mod": a = (v mod val)+add == 0; break;
        case "%": a = (v % val)+add == 0; break;
        case "mod!": a = (v mod val)+add != 0; break;
        case "%!": a = (v % val)+add != 0; break;
        case "!mod": a = (v mod val)+add != 0; break;
        case "!%": a = (v % val)+add != 0; break;
        default: a=false;
    }
    
    // check for the condition
    if (a) { 
        // and add it to the array
        arr[index++] = inst_arr[i];       
    }
}


return arr; 

/// tween_get_string(tween)
/* 
    Generates a string with the aproximated contructor function of the tween.
    
    Example: 
        var tween = tween_to( obj_car, 2, array( "x", 300));
        var str = tween_get_string(tween);
        // output:
        // 'tween_to( obj_car, 2, array( "x", 300));' (as a string)
        
    WARNING: EXPERIMENTAL FUNCTION. NOT FULLY WORKING YET. USE ONLY FOR DEBUG PURPOSES.
    
    TODO: add easing string support. And literals script names recognition. 
        
*/

var _t = argument0;
var args = _t[TLTWEEN.DEBUGARGS], args_l = array_length_1d(args);

var str = string(args[0]);

var object = "<unknown_target>", target = _t[TLTWEEN.SETTERS_TARGET];
object=object_get_name((target).object_index);

var duration = string(args[2]);


var arr = "array( ";
var a = args[3], size = array_length_1d(a), name, name2;
for (var i=0; i<size; i++) {
    if (i!=0) {arr+=", ";}
    if (is_string(a[i])) {name='"'+string(a[i])+'"';} else {name = script_get_name(a[i]);}
    i++;
    if (i==size) {arr+=name;break;}
    if (name=='"ease"' || name=="var_ease") { name2 = script_get_name(a[i]);}
    else if (is_string(a[i])) {name2='"'+string(a[i])+'"';} else {name2 = string(a[i]);}
    arr+= name+","+name2;
}
arr+=" )";
if (args_l>4) {
    arr+= ", array( ";
    a = args[3];
    size = array_length_1d(a);
    for (var i=0; i<size; i++) {
        if (i!=0) {arr+=",";}
        if (is_string(a[i])) {name='"'+string(a[i])+'"';} else {name = script_get_name(a[i]);}
        i++;
        if (i==size) {arr+=name;break;}
        if (name=='"ease"' || name=="var_ease") { name2 = script_get_name(a[i]);}
        else if (is_string(a[i])) {name2='"'+string(a[i])+'"';} else {name2 = string(a[i]);}
        arr+= name+","+name2;
    }
    arr+=" )";
}


return str+"( "+object+", "+duration+", "+arr+");";

#define __tl_private_prop_set
/// __tl_private_prop_set(tween, vars, is_from)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 


______________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!! 

Description:
    This is the main function for parsing and interpreting the arguments passed in function like tween_to, tween_from, etc. 

Definitions:
    VAR: 
        properties of tweens, like "duration", "ease", "yoyo", "patrol",etc.
    SETTERS: 
        properties of the target instance, like "x", "y", "speed", "image_alpha", etc.    
    PROPS: 
        a var or a setter. But if I call prop it's because I don't know whether it is. 
    
    
Arguments: 

    tween: 
        Current tween
    vars:
        Array of vars
    is_from:
        Indicates if vars array is a from vars (true) or a to vars (false).
    
*/

var _t = argument0; // tween
var target = _t[TLTWEEN.SETTERS_TARGET]; // target
var varsarray = argument1; //vars
var is_from = argument2; // is a tween_from


for (var i=0, size = array_length_1d(varsarray)-1; i<size; i++) { //loop all the array indexes
    
    // If the passed array is: array("ease", ease_quadin, "x", 300)
    // odd values will be "prop" and even values will be "value"
    // in the first iteration prop="ease"; value=ease_quadin; 
    // in the second iteration prop="x"; value=300;
    var prop   = varsarray[i++];
    var value  = varsarray[i];
    
    // First we will parse all props names (vars & setters)
    var data   = __tl_private_var_classify(prop);
    var exists = data[0];
    var script = data[1];
    var type   = data[2];
    
    if (!exists) { 
        __tl_private_error(_t, "Unknown property "+string(prop)+". If it is a custom SETTER please follow the inscructions in __tweenline_SETTERS script. ");
        continue;
    }
    
    if (type == 3) { // If is a CUSTOMVAR
        if (!cv_has(target,script)) {
            cv_set(target,script,0);
        }
    }
    
    // Smart color recognition
    var is_color = __tl_private_var_is_color(prop);
    
    //Passing this point we will asume that the prop script is detected and parsed correctly, and it exists.
    //The next step is to push in the correspondient array (VARS or SETTERS)
    if (type == 1) { //if the prop is a VAR
        ds_list_add( _t[TLTWEEN.PARSEDVARS], script, value);
    } else if (type == 2 || type == 3) { //if the prop is a SETTER or a CUSTOMVAR
        __tl_private_construct_setters_array( _t, is_from, type, script, value, is_color);
    }
    
}

#define __tl_private_var_classify
/// __tl_private_var_classify(prop_name)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Clasify a prop as VAR, SETTER or CUSTOMVAR and return information about it:
        RETURN ARRAY INDEX
        0 - script exists (true/false)
        1 - script ID (real)/ custom var name (string) or undefined
        2 - script type (0 == UNKNOWN, 1 == VAR, 2 == SETTER, 3 = CUSTOMVAR)
        
*/




var return_array;
return_array[0] = false;
return_array[1] = undefined; 
return_array[2] = 0; 
        
var prop = argument0;

// if is a string, it's because it need to be replaced with the corresponding function
// we are going to find wtf is this prop!  
if (is_string(prop)) {

    // 1st - Check if is a SETTER
    var script = __tl_private_var_get_script("set",prop);
    if (!is_undefined(script)) { 
        return_array[0] = true; // EXISTS
        return_array[1] = script; 
        return_array[2] = 2; // 2 == SETTER
        return return_array;
    } 
    
    // 2nd - Check if is a VAR
    var script = __tl_private_var_get_script("var",prop);
    if (!is_undefined(script)) { //It's a VAR!!
        return_array[0] = true; // EXISTS
        return_array[1] = script; 
        return_array[2] = 1; // 1 == VAR
        return return_array;
    } 
    
    // 3rd - Check if is a CUSTOMVAR
    // If it's a custom var (All custom vars starts with "_". Example: "_mycustomvar"
    if (string_pos("_",prop)==1){ 
        return_array[0] = true; // EXISTS
        return_array[1] = prop;
        return_array[2] = 3; // 3 == CUSTOMVAR
        return return_array;
        
    }  
    
    // 4th - Check if is a Shorthand SETTER
    // This array is used in the process of recognizing if a PROP it's a VAR or a SETTER. More info in: __tweenline_SETTERS() scripts. 
    // The use of ds_map_exists instaed of simply check ds_map_find_value with is_undefined is due to an HTML5 compiller bug. :) 
    // BUG: http://bugs.yoyogames.com/view.php?id=18390
    // When changed, please correct it to gain performance. 
    if (ds_map_exists(global._tw_SETTERS,prop)) {
        return_array[0] = true; // EXISTS
        return_array[1] = ds_map_find_value(global._tw_SETTERS, prop); 
        return_array[2] = 2; // 2 == SETTER
        return return_array;
    }
}



// if it's not a string, it's a script index (I hope)
else if (script_exists(prop)) { //IT'S A SCRIPT!!! :D 
    var name = script_get_name(prop);
    if (string_pos("var_",name) == 1) {
        return_array[0] = true; // EXISTS
        return_array[1] = prop;
        return_array[2] = 1; // it's a VAR
        return return_array;
    } 
    if (string_pos("set_",name) == 1) {
        return_array[0] = true; // EXISTS
        return_array[1] = prop;
        return_array[2] = 2; // it's a SETTER
        return return_array;
    }
} 

// Is an unknown type
// Simply return the default array
return return_array;

#define __tl_private_var_get_script
/// __tl_private_var_get_script( type, script_name);
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        script_name (string) Ex: "x"
        type (string) Ex: "set"/"var"        
        
*/

//// WHEN THE HTML 5 BUG WITH asset_get_type HAS BEEN SOLVED PLEASE COMMENT FROM HERE:

if (os_browser != browser_not_a_browser) {
    if (!global._tw_html5_bug_solved) {
        if (argument0=="var") {
            var map = global._tw_VARS;
        } else {
            var map = global._tw_SETTERS; 
        }
        
        if (ds_map_exists(map,argument1)) {
            return ds_map_find_value(map,argument1);
        }
        return undefined;
    }
}
/// TO HERE. :) thanks. 

if (asset_get_type(argument0+"_"+argument1)==asset_script) {
    return asset_get_index(argument0+"_"+argument1);
}
return undefined;

#define __tl_private_var_is_color
/// __tl_private_var_is_color(var_name)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Detects if a VAR name is a colour. If the variable string name 
        has "color", "blend" or "colour" in it, then is a color.
        
*/

if (!is_string(argument0)) {return false;}

var var_name = string_lower(argument0);

if (string_pos("blend",var_name)==0) {
    if (string_pos("color",var_name)==0) {
        if (string_pos("colour",var_name)==0) {
            return false; // var is NOT a color var
        }
    }
}
return true;

#define __tl_private_construct_setters_array
///__tl_private_construct_setters_array( tween, is_from, type, script, value, is_color);
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Create the setters array for a specified tween
        
*/

var _t       = argument0;
var is_from  = argument1;
var type     = argument2;
var script   = argument3;
var value    = argument4;
var is_color = argument5; 


if (!is_real(value)) {  // And the value is NOT a real value
    return __tl_private_error(_t, "Alert. Cannot interpolate non real value: "+string(value));
} 

if (type == 2) { //If it is a SETTER 
    var map = _t[TLTWEEN.PARSEDSETTERS];
    var arrindex = TLTWEEN.SETTERS;
} else { // If it is a CUSTOM VAR
    var map = _t[TLTWEEN.PARSEDCV];
    var arrindex = TLTWEEN.CUSTOM_VARS;
}
var arr = _t[arrindex];

// The use of ds_map_exists instaed of simply check ds_map_find_value with is_undefined is due to a HTML5 compiller bug. :) 
// BUG: http://bugs.yoyogames.com/view.php?id=18390
// When changed, please correct it to gain performance. 
if (!ds_map_exists(map,script) ) {  
     //if the setter is not parsed yet, add it to the PARSED SETTERS
    var size = array_height_2d(arr);
    
    if (size == 0) { // if the PARSEDSETTERS or PARSEDCV maps are a zero length
        var arr; arr[0,0] = 0; // creates a new empty array
        _t[@ arrindex] = arr; //Init as an array
    }
    
    arr[size,TLSETTER.SETTER] = script;
    arr[size,TLSETTER.MIN] = undefined;
    arr[size,TLSETTER.MAX] = undefined;
    arr[size,TLSETTER.RELATIVE] = false; //TODO: support relative values
    arr[size,TLSETTER.IS_COLOR] = is_color;
    arr[size,TLSETTER.DELTA] = 0; //delta will be calculed in __tl_private_setters_capture
    ds_map_add(map, script, size);
} else { 
    //if the setter exists in the MAP with the already parsed setters
    //find the setter index inside the value of the parsed setter map
    var size = ds_map_find_value(map, script);
    
}
//If is this script is called from a tween_from method, then we need to change
// the TLSETTER.MIN atribute. If not, we need to change TLSETTER.MAX.
if (is_from) { 
    arr[size, TLSETTER.MIN] = value;
} else {
    arr[size, TLSETTER.MAX] = value;
}

// Save setter
_t[@ arrindex] = arr;
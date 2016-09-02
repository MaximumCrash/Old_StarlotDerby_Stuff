#define __tl_private
/********************


THESE ARE PRIVATE FUNCTIONS

SO, DO NOT USE IT!!! 



***************************************/

#define __tl_private_vars_apply
/// __tl_private_vars_apply(tween)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________
   
THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
SRSLY, DON'T USE THIS SCRIPT. YOU CAN HEAVILY BREAK YOUR CODE.

DO YOU EVEN LISTEN TO ME?? DO-NOT-USE-IT

_________________
   
   Description of the script: 
        LOL
   Arguments of the script:
        LOL x2
___________________        

I don't know where do you live... but I will FIND YOU, I will KILL YOU (if you call this script).
    
*/

var _t = argument0, list = _t[TLTWEEN.PARSEDVARS]; 
var size = ds_list_size(list); //cached global
for (var i=0; i<size; i++;) {
    var v1 = ds_list_find_value(list, i++);
    var v2 = ds_list_find_value(list, i);
    script_execute(v1,_t,v2);
}

#define __tl_private_new_tween
/// __tl_private_new_tween(target, duration) 
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

    
   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!! 
   
   Description: 
        Creates an empty tween. All the default values are stored here. 
        
        DO NOT CHANGE IT. 
        DO NOT USE IT TO CREATE A NEW TWEEN. 
        Use tween_* functions instaed.
        
            
*/

var _t;
_t[TLTWEEN.LASTVALUE-1] = 0; //INIT ALL THE ARRAY starting from the last index, to gain speed allocating memmory
_t[TLTWEEN.TYPE] = TLTYPE.TWEEN;

_t[TLTWEEN.ID] = ++global._tw_id;
_t[TLTWEEN.KILLMEPLEASE] = false; // http://t.qkme.me/3sfg2y.jpg
_t[TLTWEEN.AUTOCLEAN] = true;

_t[TLTWEEN.EASE] = global._tw_default_ease;
_t[TLTWEEN.DURATION] = argument1;
//_t[TLTWEEN.MIN] = 0;
//_t[TLTWEEN.MAX] = 0;
//_t[TLTWEEN.DELTA] = 0;
_t[TLTWEEN.TIME] = 0;
_t[TLTWEEN.PLAY] = true;
_t[TLTWEEN.DIR] = 1;
//_t[TLTWEEN.VALUE] = 0;
_t[TLTWEEN.DELAY] = 0;
_t[TLTWEEN.INITIALDELAY] = 0;
_t[TLTWEEN.PARENT] = 0;
_t[TLTWEEN.HASPARENT] = false;
_t[TLTWEEN.USEMODIFIERS] = false;
_t[TLTWEEN.M] = undefined; //Array
_t[TLTWEEN.REPEAT] = 1;
_t[TLTWEEN.YOYO] = false;
_t[TLTWEEN.USEFRAMES] = global._tw_default_useframes;
_t[TLTWEEN.PERSISTENT] = false;

_t[TLTWEEN.FIRSTRENDER] = true;

// ( undefinded is considered an array with 0 elements in array_get_length_1d() )
_t[TLTWEEN.SETTERS] = undefined; //Array
_t[TLTWEEN.SETTERS_NUMB] = 0;
_t[TLTWEEN.SETTERS_TARGET] = argument0;

_t[TLTWEEN.CUSTOM_VARS] = undefined; //Array
_t[TLTWEEN.CUSTOM_VARS_NUMB] = 0;


//an array of parsed vars. It will be applyed in __tl_private_vars_apply
_t[TLTWEEN.PARSEDVARS] = ds_list_create();  //used only by the parsing system
_t[TLTWEEN.PARSEDSETTERS] = ds_map_create(); //used only by the parsing system.
_t[TLTWEEN.PARSEDCV] = ds_map_create(); //used only by the parsing system.  
// all those ds_ will be destroyed in __tl_private_tween_creation_finish, so don't worry. :) 

_t[TLTWEEN.DEBUGARGS] = undefined; // used only by tween_get_string()

// events (oncomplete, onreversecomplete, onstart, onupdate, onrepeat)

_t[TLTWEEN.ONCOMPLETE] = undefined;
_t[TLTWEEN.ONCOMPLETE_PARAMS] = undefined; //Array
_t[TLTWEEN.ONCOMPLETE_TYPE] = -1;
_t[TLTWEEN.ONCOMPLETE_LAZY] = false;

_t[TLTWEEN.ONREVERSECOMPLETE] = undefined;
_t[TLTWEEN.ONREVERSECOMPLETE_PARAMS] = undefined; //Array
_t[TLTWEEN.ONREVERSECOMPLETE_TYPE] = -1;
_t[TLTWEEN.ONREVERSECOMPLETE_LAZY] = false;

_t[TLTWEEN.ONSTART] = undefined;
_t[TLTWEEN.ONSTART_PARAMS] = undefined; //Array
_t[TLTWEEN.ONSTART_TYPE] = -1;
_t[TLTWEEN.ONSTART_LAZY] = false;

_t[TLTWEEN.ONUPDATE] = undefined;
_t[TLTWEEN.ONUPDATE_PARAMS] = undefined; //Array
_t[TLTWEEN.ONUPDATE_TYPE] = -1;
_t[TLTWEEN.ONUPDATE_LAZY] = false;

_t[TLTWEEN.ONREPEAT] = undefined;
_t[TLTWEEN.ONREPEAT_PARAMS] = undefined; //Array
_t[TLTWEEN.ONREPEAT_TYPE] = -1;
_t[TLTWEEN.ONREPEAT_LAZY] = false;


tween_system_get_singleton(); //forces the creation of obj_tweenline controller

return _t;




#define __tl_private_setters_capture
/// __tl_private_setters_capture(tween)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
         
        
        
*/

var _t = argument0; //tween
var target = _t[TLTWEEN.SETTERS_TARGET];
// This is the main singleton of the obj_tweenline controller. 
// It's used to store certain temporal values. 
var tweenlineController = tween_system_get_singleton();


for (var captureNumber = 0; captureNumber<2; captureNumber++) {

    if (captureNumber ==0) { // Setters
        var array_of_setters = _t[TLTWEEN.SETTERS];
        var number_of_setters = _t[TLTWEEN.SETTERS_NUMB];
    } else { // Custom vars
        var array_of_setters = _t[TLTWEEN.CUSTOM_VARS];
        var number_of_setters = _t[TLTWEEN.CUSTOM_VARS_NUMB];
    }
    
    for (var i=0; i<number_of_setters;i++) {
        var capture = -1; //should capture value (can be -1 for nocapture, TLTWEEN.MIN or TLTWEEN.MAX)
    
        if (is_undefined(array_of_setters[i,TLSETTER.MIN])) {
            capture = TLSETTER.MIN;
        } else {
            if (is_undefined(array_of_setters[i,TLSETTER.MAX])) {
                capture = TLSETTER.MAX;
            }
        }
        
        //If some value needs to be captured
        if (capture!=-1) {        
            // Capture value:
            if (captureNumber ==0) { // SETTER CAPTURE
                tweenlineController.temp_getter_script = array_of_setters[i,TLSETTER.SETTER];
                with (target) { tweenlineController.temp_getter_value = script_execute(tweenlineController.temp_getter_script); }
                var othervalue = tweenlineController.temp_getter_value;
            } else { // CUSTOM VAR CAPTURE
                var othervalue = cv_get(target,array_of_setters[i,TLSETTER.SETTER]);
                if (is_undefined(othervalue)) {
                    othervalue = 0; 
                    cv_set(target,array_of_setters[i,TLSETTER.SETTER],0);
                }
            }
            
            // If the captured value is not a real, show alert
            if (!is_real(othervalue)) {
                __tl_private_error(_t, "Alert. Cannot interpolate non real value: "+string(othervalue));
                array_of_setters[@ i,capture] = 0;
                array_of_setters[@ i,TLSETTER.DELTA] = 0;
                continue;
            }
            
            //write value to array:
            array_of_setters[@ i,capture] = othervalue; 
        }
        
    
        
        // calculate delta
        array_of_setters[@ i,TLSETTER.DELTA] =  array_of_setters[i,TLSETTER.MAX] - array_of_setters[i,TLSETTER.MIN]; 
        
    }
}
_t[@ TLTWEEN.FIRSTRENDER] = false;

#define __tl_private_tween_creation_finish
/// __tl_private_tween_creation_finish(tween)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
         Give the finishing touches to the tween (?)
         (Free memory from the ds_map ussed by the parsing system and saves the number of setters)
        
        
*/
var _t = argument0;
_t[@ TLTWEEN.SETTERS_NUMB] = ds_map_size(_t[ TLTWEEN.PARSEDSETTERS]);
_t[@ TLTWEEN.CUSTOM_VARS_NUMB] = ds_map_size(_t[TLTWEEN.PARSEDCV]);

ds_list_destroy(_t[ TLTWEEN.PARSEDVARS]); 
_t[@ TLTWEEN.PARSEDVARS] = undefined;

ds_map_destroy(_t[ TLTWEEN.PARSEDSETTERS]); 
_t[@ TLTWEEN.PARSEDSETTERS] = undefined;

ds_map_destroy(_t[ TLTWEEN.PARSEDCV]); 
_t[@ TLTWEEN.PARSEDCV] = undefined;

#define __tl_private_array_find_value
/// __tl_private_array_find_value(array, key)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        It's like ds_map_find_value(list, key) but with arrays ussed 
        as maps. (Even indexes used as key and odd indexes used as values.)
        
        
*/

var size = array_length_1d(argument0)-1;
for (var i=0; i<size; i++;) {
    if (argument0[i++]==argument1){return argument0[i];}
}
return undefined;

#define __tl_private_tween_render
/// __tl_private_tween_render(tween, progress);
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Render the tween
        
        WARNING, this script do not check that (0 < progress < 1). YOU SHOULD MANUALLY CLAMP progress LIKE: clamp(progress, 0, 1); 
        It is like this for optimization purposes 
        
   TODO: replace merge_colour with a faster function. 
   
*/


//Comment this line if it gives you an error. This line is to give a SPEED BOOST of the main rendering loop of the tweenline engine. 
gml_pragma("forceinline");


var t = argument0[TLTWEEN.SETTERS_TARGET];
if (instance_exists(t)) {

    // If the values are not captured, capture it!
    if (argument0[TLTWEEN.FIRSTRENDER]) { __tl_private_setters_capture(argument0); }
    
    
    // RECALCULTE THE VALUE (THIS IS THE MOST IMPORTANT PART OF THE ENGINE) [!] 
    if (argument0[@ TLTWEEN.USEMODIFIERS]) {
        var value = script_execute_ext(argument0[TLTWEEN.EASE],argument0[TLTWEEN.M]);  // The M array is really array(EASE, M1, M2, M3... ); 
    } else {
        var value = script_execute(argument0[TLTWEEN.EASE],argument1);  
    }


    var s = argument0[TLTWEEN.SETTERS_NUMB];
    if(s>0) {
        var a = argument0[TLTWEEN.SETTERS];
        with(t) {
            for (var i=0; i<s; i++) { 
                if (a[i,TLSETTER.IS_COLOR]) {
                    script_execute(a[i,TLSETTER.SETTER],merge_colour(a[i,TLSETTER.MIN],a[i,TLSETTER.MAX],value)); 
                } else {
                    script_execute(a[i,TLSETTER.SETTER],a[i,TLSETTER.MIN]+value*a[i,TLSETTER.DELTA]); 
                }
                
            }
        }
        
    }
    
    var s = argument0[TLTWEEN.CUSTOM_VARS_NUMB];
    if(s>0) {
        var a = argument0[TLTWEEN.CUSTOM_VARS];
        for (var i=0; i<s; i++) {
            if (a[i,TLSETTER.IS_COLOR]) {
                cv_set(t, a[i,TLSETTER.SETTER],merge_colour(a[i,TLSETTER.MIN],a[i,TLSETTER.MAX],value)); 
            } else {
                cv_set(t, a[i,TLSETTER.SETTER],a[i,TLSETTER.MIN]+value*a[i,TLSETTER.DELTA]); 
            }
        }
    }

} else if (argument0[TLTWEEN.AUTOCLEAN]) {  // If the instance does not exists and the tween is setted as autoclean tween
    tween_destroy(argument0);
}

#define __tl_private_timeline_back_to_the_future
/// __tl_private_timeline_back_to_the_future(tweenline,fromtime, totime);
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Back to the future (the movie)
        
   TODO: optimize this script. :) 
   
*/

var tweenline = argument0, fromtime = argument1, totime = argument2;

if (fromtime==totime) {return false;}

// PHASE 1: SIMULATE FUTURE VALUES!! 
// We need to travel from "fromtime" to "totime". (fromtime < tottime)
if (fromtime<totime) {
    var size = tweenline_get_size(tweenline);
    var list = tweenline_get_list(tweenline);
    var prior_start = ds_priority_create(); //YEAH! Priority queues are usefull for something!! 
    var last_time_rendered = fromtime;
    var cache_tween, cache_target;
    for(var i=0; i<size; i++) { 
        var tween = ds_list_find_value(list, i); // get tween i
        cache_tween[i] = tween;
        cache_target[i] = tween_get_target(tween);

        //adds into those priority queues the start values of the tween which are (totime >= tween_get_starttime >= fromtime)
        // If the tween values are not captured yet

        if (tween[ TLTWEEN.FIRSTRENDER]) {
            var starttime= tween_get_starttime(tween);
            if (starttime>=fromtime && starttime<=totime) {
                ds_priority_add(prior_start, tween, starttime);
            }
        }
    }
    
    
    // For each tween that need to capture setters
    while (!ds_priority_empty(prior_start)) {
        var tween = ds_priority_delete_min(prior_start);
        
        
        //Process Tween:
        
        // if the values has not been captured, capture them (catch 'em all!)
        // https://www.youtube.com/watch?v=qyXTgqJtoGM
        // To capture tween values, we need to ensure that all the values corresponding to that target at that time are correct. 
        // So, we need to render the values of the tweens with the same target of our current tween.
        // First, we are going to check that the moment (time) we are going to render it's not the same that the last time rendered.
        var time_start= tween_get_starttime(tween);
        if (last_time_rendered != time_start) {
            last_time_rendered = time_start;
            
            //Then, for each tween in the tweenline, 
            var tween_to_process_target = tween_get_target(tween);
            for (var i=0; i<size; i++) {
                // we are going to check if the target is the same target of our current tween (And it's not the same tween)
                if (cache_target[i]==tween_to_process_target) {
                    var ttt = cache_tween[i];
                    if (ttt[TLTWEEN.ID]!=tween[TLTWEEN.ID] && ttt[TLTWEEN.INITIALDELAY]<=totime) {
                        //And then, render the tween in the current time
                        ttt[@ TLTWEEN.TIME]=time_start;
                        tween_render(ttt);
                    }
                }
            }
        }
        // If we pass this point, then the values are correctly setted. So It's safe to capture the values.
        __tl_private_setters_capture(tween);
            
    
    }
    
    ds_priority_destroy(prior_start);
}


/// PHASE 2!!!! RENDER ALL TWEENS between fromtime and totime in order of aparision
var list = tweenline_get_list(tweenline);
var size = ds_list_size(list); 
if (totime-fromtime>0) {
    for (var i=0; i<size; i++) {// foreach tween in order of starttime
        var tween = ds_list_find_value(list,i); // get tween 
        var starttime = tween_get_starttime(tween);
        var endtime = tween_get_endtime(tween);
        if (endtime<=totime && endtime>fromtime) {
            tween[@ TLTWEEN.TIME] = endtime;
            tween_render(tween); // RENDER The tween at the "totime" time
        }
    }
} else {
    for (var i=size-1; i>=0; i--) {// foreach tween in reverse order of starttime
        var tween = ds_list_find_value(list,i); // get tween 
        var starttime = tween_get_starttime(tween);
        var endtime = tween_get_endtime(tween);
        if (starttime<fromtime && starttime>totime) {
            tween[@ TLTWEEN.TIME] = starttime;
            tween_render(tween); // RENDER The tween at the "totime" time
        }
    }

}



// PHASE 3!!! RENDER THE TWEENS!! 
// Well, our objective now is to render those tweens in the final "totime" time.
var list2 = tweenline_get_tweens_at_time( tweenline, totime, true);
var size2 = ds_list_size(list2);

for (var i=0; i<size2; i++) {// foreach tween in order of starttime
    var tween = ds_list_find_value(list2,i); // get tween 
    tween[@ TLTWEEN.TIME] = totime;
    tween_render(tween); // RENDER The tween at the "totime" time
}
ds_list_destroy(list2);

for (var i=0; i<size; i++) {
    var tween = ds_list_find_value(list,i); // get tween 
    tween[@ TLTWEEN.TIME] = totime;
}
ds_list_destroy(list);

tweenline[@ TLTIMELINE.TIME] = totime;

#define __tl_private_array_join
/// __tl_private_array_join(array1, array2)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        It's like ds_map_find_value(list, key) but with arrays ussed 
        as maps. (Even indexes used as key and odd indexes used as values.)
        
        
*/

// Yeah! One line bitches! It's super portable... 
for (var i=0, size1 = array_length_1d(argument0), size2 = array_length_1d(argument1)-1; i<size2; i++;) {argument0[size1+i]=argument1[i];}return argument0;

#define __tl_private_callback_set
/// __tl_private_callback_set(tween, callback, callback_type,  callback_script)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        tween: the tween
        callback (enum): TLTWEEN.ONREPEAT, TLTWEEN.ONCOMPLETE, etc.
        callback_type (enum): TLTWEEN.ONREPEAT_TYPE, TLTWEEN.ONCOMPLETE_TYPE, etc.
        callback_script: (string or script) "user0", "user4", scr_myscript, etc.
        
        
        
*/
var tween = argument0;
var callback_enum = argument1;
var callback_type = argument2;
var callback_script = argument3;
if (is_string(callback_script)) {
    if (string_pos("user",callback_script)!=0) {
        var str = string_replace(callback_script,"user","");
        tween[@ callback_type] = TLEVENT.USER;
        tween[@ callback_enum] = real(str);
        return true;
    } else if (callback_script == "lazy") { 
        tween[@ callback_type] = TLEVENT.LAZY;
        tween[@ callback_enum] = -2;
        return true;
    }
} else if (script_exists(callback_script)) {
    tween[@ callback_type] = TLEVENT.SCRIPT;
    tween[@ callback_enum] = callback_script;
    return true;
}
__tl_private_error(tween, "Unknown callback "+string(callback_script));

#define __tl_private_params_set
/// __tl_private_params_set(tween, callback_type, params)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        
        
        
*/

var p = argument2;
if (is_array(p)) {
    for (var i=0, s=array_length_1d(p); i<s; i++) {
        if (p[i]=="_self") {
            p[@ i] = argument0;
        }
    }
    argument0[@ argument1] = p; 
} else {
    var a;
    if (p=="_self") {
        a[0] = argument0;
    } else {
        a[0] = argument2;
    }
    argument0[@ argument1] = a; 
}
#define __tl_private_parse_position
/// __tl_private_parse_position(tweenline[, position])
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Parses the position value (for tweenline_add function and similiars)
        Returns the position in seconds (or frames for frames based tweenlines)
        
        
*/




var tweenline = argument[0];
var tweenline_duration = tweenline[TLTIMELINE.DURATION];
var tweenline_tweens = tweenline[TLTIMELINE.TWEENS];
var tweenline_labels = tweenline[TLTIMELINE.LABELS];
var tweenline_labels_list = tweenline[TLTIMELINE.LABELS_LIST];


/////// BEGIN position PARAMETER PARSING
var position_value = tweenline_duration;

if (argument_count>1) {
    var str = argument[1];
    if (is_string(str)) { // if it's a string value
        var labeltofind = "";
        var pos = string_pos("=",str)-1; // example: "mylabel+=2" (var pos = 8, the "+" character position)
        if (pos>0) { //  relative position
            labeltofind = string_copy(str,1,pos-1); //mylabel+=2 (labeltofind=9)
            var str2=string_delete(str,1,pos+1); //deletes the first 2 characters ("+=","-=")
            if (string_char_at(str,pos)=="+") {
                position_value = +real(str2);
            } else if (string_char_at(str,pos)=="-") {
                position_value = -real(str2);
            }
        } 
        
        if (labeltofind=="") {
            position_value += tweenline_duration;
        } else {
            if (labeltofind=="_end") { // reserved word "_end"
            
                var ttt = tweenline[TLTIMELINE.LASTTWEEN];
                position_value += ttt[TLTWEEN.INITIALDELAY]+ttt[TLTWEEN.DURATION];
                
            } else if (labeltofind == "_start") {  // reserved word "_start"
                var ttt = tweenline[TLTIMELINE.LASTTWEEN];
                position_value += ttt[TLTWEEN.INITIALDELAY];
            } else { // labels
                if (ds_map_exists(tweenline_labels,labeltofind)) {
                    position_value += ds_map_find_value(tweenline_labels, labeltofind);
                } else { // If the label doesn't exists, add it
                    position_value += tweenline_duration;
                    ds_map_add(tweenline_labels,labeltofind,position_value);
                    ds_list_add(tweenline_labels_list, labeltofind);
                }
            }
            
        } 
    }else { // absolute position
        position_value = real(str);
        if (position_value<0) {
            position_value = tweenline_duration - position_value;
        }
    }
}

/////// END position PARAMETER PARSING
// position_value: the position to place the value
return position_value;

#define __tl_private_tween_revive
/// __tl_private_tween_revive(tween)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Revive a die tween :) 
        If the tween is revived, returns the tween index.
        If not, returns false.
        
*/


var _t = argument0;
if (_t[TLTWEEN.KILLMEPLEASE]) {
    _t[@TLTWEEN.KILLMEPLEASE] = false;
    global._tw_tweencount+=1;
    ds_list_add(global._tw_dslist, _t);
    return _t;
}
return false;


#define __tl_private_perform_event
/// __tl_private_perform_event( tween, enum_callback, enum_callback_type, enum_callback_params, enum_callback_lazy);
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        argument0 - ARRAY tween
        argument1 - ENUM callback
        argument2 - ENUM callback_type
        argument3 - ENUM callback_params
        argument4 - ENUM callback_lazy
        
        
*/


switch (argument0[argument2]) {
    case TLEVENT.SCRIPT:  {
        with(argument0[TLTWEEN.SETTERS_TARGET]) {
            var s = argument0[argument1], a = argument0[argument3];
            switch (array_length_1d(a)) {
                case 0: return script_execute(s); break;
                case 1: return script_execute(s,a[0]); break;
                case 2: return script_execute(s,a[0],a[1]); break;
                case 3: return script_execute(s,a[0],a[1],a[2]); break;
                case 4: return script_execute(s,a[0],a[1],a[2],a[3]); break;
                case 5: return script_execute(s,a[0],a[1],a[2],a[3],a[4]); break;
                case 6: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5]); break;
                case 7: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6]); break;
                case 8: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]); break;
                case 9: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]); break;
                case 10: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9]); break;
                case 11: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]); break;
                case 12: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11]); break;
                case 13: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12]); break;
                case 14: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13]); break;
                default: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14]); break;
            }
        } 
    } break;
    case TLEVENT.USER: {
        with(argument0[TLTWEEN.SETTERS_TARGET]) {
            event_user(argument0[argument1]);
        }
        return false;
    } break;
    case TLEVENT.LAZY: {
        if (global._tw_lazy_eneabled) {
            argument0[@ argument4] = true;
            ds_list_add(global._tw_lazy_todo_reset, argument4);
            ds_list_add(global._tw_lazy_todo_tweens, argument0);
        }
        return false;
    } break;
}

#define __tl_private_lazy_reset
/// __tl_private_lazy_reset();
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 

        
        
*/
var reset = global._tw_lazy_todo_reset, tweens = global._tw_lazy_todo_tweens;
var size = ds_list_size(reset);
for (var i=0; i<size; i++) {
    var _t = ds_list_find_value(tweens,i);
    _t[@ ds_list_find_value(reset,i)] = false;
}
ds_list_clear(reset);
ds_list_clear(tweens);
#define __tl_private_parse_object_to_instance
/// __tl_private_parse_object_to_instance( obj_or_inst); 
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 

        
        
*/


var a = argument0;
if (is_array(a)) {
    var size = array_length_1d(a); // arr is the tweens indexes array
} else if (is_real(a)){
    if (object_exists(a)) {
        for (var i=0, size=instance_number(a), obj=a; i<size; i++;) {
            a[i] = instance_find(obj, i);
        }
    } else {
        __tl_private_error(undefined, "Stagger error: target objects does not exists");
        return noone;
    }
} else {
    __tl_private_error(undefined, "stagger error: target object is non real: "+string(a));
    return noone;
}
return a;
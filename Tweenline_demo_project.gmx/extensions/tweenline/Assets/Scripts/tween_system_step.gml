/// tween_system_step()
/*
DO NOT CALL THIS SCRIPT MANUALLY. 
To set up Tweenline copy the obj_tweenline from the Extension into your project and ALL the TWEENLINE scripts.
You are ready to use tweenline. :) 


If you don't have the obj_tweenline you can create from scratch. Simply create a new object and name it obj_tweenline.
Then add the following codes:
    
    // Create event:
    if (singleton()) {exit;} depth = 1000000;
    
    // Step > Normal Step event
    tween_system_step();
    
    // Other > Room end event
    tween_system_roomend();

ENJOY!


________________________________________________

===== Technical overview of this core tween_system_step script =====
(Do not read this unless you are an optimization freak as me)

To make this script work as fast as posible, I first made a research to investigate the fastest ways to do some operations,
these are the results:

    > Multiplications are allways faster than division
    > Sum a value two times is allways faster than multiplying for two.
    > ds_* functions are the most of the times faster than accessors.
    > Accessing globals are slower than accessing local variables
    > In a for loop throught an array/list , it is faster if you cache the size of the array/list first. (for(var i=0, s=ds_list_size(list); i<s; i++) { do_stuf(i); } 
    > In order to optimize a script you need to minimize the number of times that a variable is read or writed. 
    > Write a variable value is faster than check an if comparison. So, if there is no real need to check an if, don't do it.
    > ds_lists are faster than ds_maps
    > ARRAYS are a LOT (When I say a LOT it's really a LOT) more FASTER than ds_lists
    > You can simulate ds_maps using enums. like: myarray[ MYENUM.NAME ] 
    > Try to cache all the results of mathematical operations that need to be done more than one time.
    > In game maker a call to a script is a bit slower than writing the script inline. (originally this script was splited in two scripts)
    > If there is no need to return a value, do not return it. :)
    > IMPORTANT:    if you modify an array direcly, game maker will create a copy of the array. This copy will slow down the execution process of the script. 
                    So, to modify the original array directly you need to use the Array accessor: array[@ index] instaed of array[index]. This will modify the array
                    directly, this is A LOT faster than copying all the array and then return it again. For more info, check this: (check the array accessor section)
                    http://docs.yoyogames.com/source/dadiospice/002_reference/001_gml%20language%20overview/accessors.html 
    > . . .
    
    
    
*/


globalvar DELTATIME;
DELTATIME = delta_time*0.000001*global._tw_speed;//seconds per frame (a multiplication is faster than a division)

// Resets the lazy events
if (global._tw_lazy_eneabled) {__tl_private_lazy_reset();}

var deltatime = DELTATIME; // CACHE in a local var for speed purposes
var g =global._tw_dslist; // Cache the global for speed
for (var iiii=0, size = ds_list_size(g); iiii<size; iiii++) {

    var _t = ds_list_find_value(g,iiii); //current tween
    
    if (_t[TLTWEEN.KILLMEPLEASE]) {
        ds_list_delete(g,iiii);
        iiii--; size--;
    } else {
        
        // Check if the tween is playing and the speed (direction)
        var dir =  _t[TLTWEEN.DIR];
        
        // If the animation is playing we need to update it
        if (_t[TLTWEEN.PLAY] && dir!=0) {
            
            if (_t[TLTWEEN.USEFRAMES]) { var factortime = dir;} 
            else { var factortime = deltatime * dir; }
        
        
            // Get basic data of the tween
            var hasparent = _t[TLTWEEN.HASPARENT];     
            var delay = _t[TLTWEEN.DELAY];
            
            if (hasparent){
                var parent =  _t[TLTWEEN.PARENT];
            } else {
                if (delay>0) {
                    _t[@ TLTWEEN.DELAY]-=abs(factortime);
                    continue;
                } else {
                    delay = 0;
                }
            }
            
            var duration = _t[TLTWEEN.DURATION];
            var time = _t[TLTWEEN.TIME];
            var timecache = time;
            // check if is out of timeline
            endofanimation = false; 
            var timeTweenEnd = duration+delay; // precalculate (cache) the time when the tween ends for speed
            time+=factortime;
            
            //onstart event
            if (_t[TLTWEEN.ONSTART_TYPE]!=-1 && timecache==0 && time!=0) {
                __tl_private_perform_event(_t, TLTWEEN.ONSTART, TLTWEEN.ONSTART_TYPE, TLTWEEN.ONSTART_PARAMS,TLTWEEN.ONSTART_LAZY);
            }
            
            if (dir>0) {
                
                if (hasparent) {
                    var totaltime = parent[TLTIMELINE.DURATION]; // Total duration of the parent timeline
                } else {
                    var totaltime = timeTweenEnd;
                }
                
                if (time>=totaltime) {
                    time=totaltime;
                    endofanimation = true;
                }
            } else { //if (dir<0)
                if (time<=0){
                    time=0;
                    endofanimation = true;
                }
            }
            
            // UPDATE THE PLAYHEAD TIME
            _t[@ TLTWEEN.TIME] = time;
            if (hasparent) { parent[@ TLTIMELINE.TIME]=time; }
            
            
            // If we have reached the end of the tween or parent tweenline.
            if (endofanimation) {
               
                var repeatcount = _t[TLTWEEN.REPEAT];
                // if the number of repetitions left are greather than zero, or the tween it's set to play infinitely (-1)
                if (repeatcount>0) { // Reduce the value of left repeats
                    _t[@TLTWEEN.REPEAT] = --repeatcount;
                }
                // If the tween has repetitions left, or is set to play indefinitely (-1) 
                if (repeatcount>0 || repeatcount==-1) {
                    if (_t[TLTWEEN.YOYO]) { //If the tween uses yoyo mode
                        _t[@TLTWEEN.DIR] = -dir;// reverse it
                    } else { // else, restart it
                        time = 0;
                        if (hasparent) {
                            var parent = _t[TLTWEEN.PARENT];
                            __tl_private_timeline_back_to_the_future(parent, parent[TLTIMELINE.TIME], 0);
                        } else {
                            _t[@TLTWEEN.TIME] = 0;
                        }
                    }
                    if (!hasparent){
                        _t[@ TLTWEEN.DELAY] = _t[TLTWEEN.REPEATDELAY];
                    }
                    //onrepeat event
                    if (_t[TLTWEEN.ONREPEAT_TYPE]!=-1) {
                        __tl_private_perform_event(_t, TLTWEEN.ONREPEAT, TLTWEEN.ONREPEAT_TYPE,TLTWEEN.ONREPEAT_PARAMS,TLTWEEN.ONREPEAT_LAZY);
                    }
                    
                } else { //if there is no repetitions left
                    _t[@TLTWEEN.PLAY] = false; //stop the tween
                    if(dir>0) {
                        //oncomplete event
                        if (_t[TLTWEEN.ONCOMPLETE_TYPE]!=-1) {
                            __tl_private_perform_event(_t, TLTWEEN.ONCOMPLETE, TLTWEEN.ONCOMPLETE_TYPE,TLTWEEN.ONCOMPLETE_PARAMS,TLTWEEN.ONCOMPLETE_LAZY);
                        }
                    } else {
                        //onreversecomplete event
                        if (_t[TLTWEEN.ONREVERSECOMPLETE_TYPE]!=-1) {
                            __tl_private_perform_event(_t, TLTWEEN.ONREVERSECOMPLETE, TLTWEEN.ONREVERSECOMPLETE_TYPE,TLTWEEN.ONREVERSECOMPLETE_PARAMS,TLTWEEN.ONREVERSECOMPLETE_LAZY);
                        }
                    }
                    if (!hasparent) { // if the tween doesn't have a parent tweenline
                        tween_destroy(_t); //Destroy the tween
                    }
                }
            } 
            
            
            //If the playhead is in the tween animation range 
            //(not in the initial delay nor the final waiting time)
            else if (time>=delay && time<=timeTweenEnd) {
                //Render the tween (WARNING: this function is compiled INLINE) 
                //That means, that all the code will be inserted at this point when compilled.
                __tl_private_tween_render(_t, (time-delay)/duration);
                
                //onupdate event
                if (_t[TLTWEEN.ONUPDATE_TYPE]!=-1) {
                    __tl_private_perform_event(_t, TLTWEEN.ONUPDATE, TLTWEEN.ONUPDATE_TYPE,TLTWEEN.ONUPDATE_PARAMS, TLTWEEN.ONUPDATE_LAZY);
                }
            }
            
        }
    }
}

/// tween_system_init()
/*
DO NOT CALL THIS SCRIPT MANUALLY. It will be called automatically by the extension. 

To set up Tweenline copy the obj_tweenline from the Extension into your project and ALL the TWEENLINE scripts.
You are ready to use tweenline. :) 


If you don't have the obj_tweenline you can create it from scratch. Simply create a new object and name it obj_tweenline.
Then add the following codes:
    
    // Create event:
    if (singleton()) {exit;} depth = 1000000;

    // Step > Normal Step event
    tween_system_step();
    
    // Other > Room End event
    tween_system_roomend();

ENJOY!

*/
//////////// PUBLIC CONFIGURATION /////// CHANGE THE VALUES IF YOU LIKE ///////////

// Set to true if you want to use frames (steps) instaed of seconds in your tweens as default
global._tw_default_useframes = false;
// Sets the default easing function
global._tw_default_ease = ease_quadout;

// Turn this to true when the bug with asset_get_type in the HTML5 target has been solved, and the Tweenline Engine will optimize itself!! 
global._tw_html5_bug_solved = false; 

/////////////// PRIVATE ////// DO NOT TOUCH, DO NOT MODIFY, DO NOT ACCESS IT /////////////

global._tw_speed = 1; // global timescale

global._tw_tweencount = 0; //total number of tweens
global._tw_tweenlinecount = 0; // total number of tweenlines

global._tw_current_creation_tl = -1; // current tweenline for tweenline_create and tweenline_end

global._tw_id =0; // I don't know wtf this global is. But it seems to be important, so I keep it here.

global._tw_dslist = ds_list_create(); // list of tweens
global._tw_tl_dslist = ds_list_create(); // list of tweenlines

globalvar DELTATIME;
DELTATIME = 0;//seconds per frame

if (!global._tw_html5_bug_solved) {
    //Define a map with all the posible VARS scripts and other with all posible SETTERS scripts. 
    global._tw_VARS = ds_map_create(); //ds_map (key: vars strings, value: vars scripts)
    global._tw_SETTERS = ds_map_create(); //ds_map (key: setters strings, value: setters scripts)
    //global._tw_VARS_arr is an array with the references to all var_ scripts. It's used to solve the lack of ds_map_find_key. It's defined inside __tweenline_VARS() script.
    
    __tweenline_VARS(); // not used in this version
    __tweenline_SETTERS(); //shorthand setters
}

// Eneable or disable the lazy events. you can eneable or disable it from 
// tween_system_lazy_events( eneable);
global._tw_lazy_eneabled = true;

//TODOLIST RESET. It contains the lazy events that has to be reseted in 
//the next step, example: ONREVERSECOMPLETE_LAZY, ONUPDATE_LAZY
global._tw_lazy_todo_reset = ds_list_create(); 
// The TODOLIST TWEENS contains the tween that must be reseted his lazy event
global._tw_lazy_todo_tweens = ds_list_create();



enum TLTWEEN{
    TYPE = 0, // This atribute is shared between TLTWEEN and TLTWEENLINE
    ID,
    KILLMEPLEASE,
    AUTOCLEAN,
    EASE,
    DURATION, 
//    MIN, //early versions of tweenline used this values. Now, the system eneable 
//    MAX, //programmers to define multiple setters for the same tween, so these values are stored in each setter
//    DELTA,
    TIME,
    PLAY,
    DIR,
//    VALUE,
    DELAY,
    INITIALDELAY,
    PARENT,
    HASPARENT,
    REPEAT,
    REPEATDELAY,
    YOYO,
    USEFRAMES,
    FIRSTRENDER,
    PERSISTENT,
    SETTERS_NUMB,
    SETTERS,
    SETTERS_TARGET,
    CUSTOM_VARS,
    CUSTOM_VARS_NUMB,
    USEMODIFIERS,
    M, // modifiers
    // Events: (oncomplete, onreversecomplete, onstart, onupdate, onrepeat)
    ONCOMPLETE, 
    ONCOMPLETE_TYPE,
    ONCOMPLETE_PARAMS,
    ONCOMPLETE_LAZY,
    
    ONREVERSECOMPLETE,
    ONREVERSECOMPLETE_TYPE,
    ONREVERSECOMPLETE_PARAMS,
    ONREVERSECOMPLETE_LAZY,
    
    ONSTART,
    ONSTART_TYPE,
    ONSTART_PARAMS,
    ONSTART_LAZY,
    
    ONUPDATE,
    ONUPDATE_TYPE,
    ONUPDATE_PARAMS,
    ONUPDATE_LAZY,
    
    ONREPEAT,
    ONREPEAT_TYPE,
    ONREPEAT_PARAMS,
    ONREPEAT_LAZY,
    
    PARSEDVARS, //Used by the parsing system
    PARSEDSETTERS, //Used by the parsing system 
    PARSEDCV, //Used by the parsing system
    DEBUGARGS, //Used by tween_get_string
    LASTVALUE 
    //LASTVALUE: this enum index is used to init the array starting from the last index and gain speed. 
    //Like myarray[TLTWEEN.LASTVALUE-1]=0; will init all the array.
}

enum TLEVENT {
    SCRIPT=0,
    USER,
    LAZY
}

enum TLSETTER {
    SETTER=0,
    MIN,
    MAX,
    DELTA,
    IS_COLOR,
    RELATIVE,
    
}

enum TLTYPE {
    TWEEN = 0,
    TIMELINE
    
}

enum TLTIMELINE {
    DURATION = 1, // Start in 1, for the reason that TLTWEEN.TYPE is the number 0.
    TWEENS,
    TIME,
    PLAY,
    DIR,
    LABELS,
    LABELS_LIST,
    PRIORITY,
    INMEDIATERENDER,
    LASTTWEEN
}

cv_system_init();


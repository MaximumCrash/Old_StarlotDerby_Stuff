/// tween_system_roomend()
/*
DO NOT CALL THIS SCRIPT MANUALLY. 
To set up Tweenline copy the obj_tweenline from the Extension into your project and all the TWEENLINE scripts.
You are ready to use tweenline. :) 


If you don't have the obj_tweenline you can create from scratch. Simply create a new object and name it obj_tweenline.
Then add the following codes:

    // Create Event:
    if (singleton()) {exit;} depth = 1000000;

    // Step > Normal Step event
    tween_system_step();
    
    // Other > Room end event
    tween_system_roomend();

ENJOY!
*/
cv_system_roomend();
/// Clean tweens: (Reverse cleaning)
var g = global._tw_dslist; // cache for speed
for (var i=ds_list_size(g)-1; i>=0; i--) {
    var tween = ds_list_find_value(g,i);
    if (tween_exists(tween)) {
        if (!tween_get_persistent(tween)) {
            tween_destroy(tween);
        }
    }
}
// END clean tweens

// clean tweenlines: (Reverse cleaning)
g = global._tw_tl_dslist; // cache for speed
for (var i=ds_list_size(g)-1; i>=0; i--) {
    var tweenline =ds_list_find_value(g,i);
    var tweennumber = tweenline_get_size(tweenline);
    if (tweennumber==0) {
        tweenline_destroy(tweenline);
    }
}
// END clean tweenlines

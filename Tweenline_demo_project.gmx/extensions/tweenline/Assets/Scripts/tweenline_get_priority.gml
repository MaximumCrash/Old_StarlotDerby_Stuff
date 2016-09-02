/// tweenline_get_priority(tweenline);
/* 
Returns the index of a ds priority queue (ds_priority_* functions) ordered by the start time of each tween in the tweenline.
The priority is asigned as follows:
    Priority:   The start time of each tween inside the tweenline.
    Value:      The tween in the tweenline.
You can use this priority to access to all tweens inside one tweenline ordered by the start time of each tween:

    var priority = tweenline_get_priority(tweenline);
    while ( !ds_priority_empty(priority) ){
        var tween = ds_priority_delete_min(priority);
        // Do something with each tween
    }
    ds_priority_destroy(priority); // REMEMBER TO DESTROY THE PRIORITY QUEUE WHEN YOU DON'T NEED IT ANYMORE!
    
    
NOTE: As with all dynamic resources, data structures take up memory and so should always be destroyed when no 
longer needed to prevent memory leaks which will slow down and eventually crash your game.     
    
*/
if (tweenline_exists(argument0)) {
    var p = ds_priority_create();
    ds_priority_copy(p, argument0[TLTIMELINE.PRIORITY]);
    return p;
} 
return undefined;






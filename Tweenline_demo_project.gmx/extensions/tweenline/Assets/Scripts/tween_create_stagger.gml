/// tween_create_stagger(tweenIndex, staggerNumbers, staggerDeltaTime);
// RETURN: tweenline index.
/*

Creates a STAGGER starting from tweenIndex.
A stagger is a tweenline (see tweenline_create for more info), 
that holds a number of tween delayed one to another. So, you can tween multiple values
of the same type, but with a delay between each tween starts.

tweenIndex: [INT tween index] 
    The refference tween
staggerNumbers: [INT] 
    The number of tweens that the stagger will contain
staggerDeltaTime: [REAL] 
    The delay between each tween in the stagger

NOTE: STAGGERS ARE NORMAL TWEENLINES, SO IT CAN BE HANDLED WITH THE tweenline_* FUNCTIONS

NOTE 2: If the refference tween has an initial delay, this delay is conserved and added to the delay of the stagger for each tween. 
_________________________________________
        
Extended example:

Imagine that you need to animate 5 balls to travel from the position x=50 to the right of the 
room with a tween of 1 second, and a delay of 0.2 seconds between each time. 
So the stagger will start and the first item will start moving. Then 0.2 seconds after, the second 
object will start moving. 0.2 after, the third object will start moving, and so.

    // Create
    // Creates the basic tween, that is the tween for the first ball
    var mytween = tween_create("quadinout", 1, 50, room_width);
    // Next, we create the rest of the tweens in the tweenline.
    twenstagger_tweenline = tween_create_stagger( mytween, 5, .2 );
    
    
    //draw event
    var size= tweenline_get_size(twenstagger_tweenline);
    for (var i=0; i<size; i++) {
        //gets the value of the "i" tween in the tweenline
        var value_x = tweenline_get_value(twenstagger_tweenline, i);
        var value_y = y + 50*i;
        // draw each ball
        draw_sprite(spr_ball, 0, value_x, value_y);
    }
    
    
    //destroy event
    //Finally we need to remember DESTROY the tweenline when we don't need anymore.
    tweenline_destroy(twenstagger_tweenline);





*/



var staggerTime, stw, ds, tw, i, delay, maxtime, duration;
staggerTime = 0;
stw = argument0;
ds = tweenline_create();

delay = argument0[TL.DELAY];
duration = argument0[TL.DURATION];
maxtime = delay+(argument2*argument1)+duration;
argument0[@TL.PARENT] = ds;
ds_list_add(ds,argument0);
ds_list_replace(ds,0,maxtime);

for (i=1; i< argument1; i+=1; ) {
    tw = tween_duplicate(argument0);
    staggerTime+=argument2;
    tw[TL.DELAY] = delay +staggerTime;
    ds_list_add(ds,tw);
}


return ds;
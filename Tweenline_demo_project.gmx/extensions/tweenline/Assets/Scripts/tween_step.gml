/// tween_step(index)
// ----------------
// WARNING: DO NOT EXECUTE THIS SCRIPT MANUALLY UNLESS YOU ARE SURE WHAT ARE YOU DOING.
// ----------------
// This script simulate ONE step in the tween with the index passed in argument0.
// Use it only if you want to manually update the tweens you are ussing or if you want
// to skip frames in one animation and you can't use the SPEED system. 


// If the tween does not exists, do nothing
if (!ds_exists(argument0,ds_type_map)) {
    return 0;
}

var type, delay, duration, vmin, vmax, time,play,dir,parent, totaltime, endofanimation;

// Check if the tween is playing and the speed (direction)
play = ds_map_find_value(argument0,"play");
dir =  ds_map_find_value(argument0,"dir");

// If the animation is playing we need to update it
if (play && dir!=0) {
    
    // Get basic data of the tween
    delay = ds_map_find_value(argument0,"delay");
    duration = ds_map_find_value(argument0,"duration");
    time = ds_map_find_value(argument0,"time");
    type = ds_map_find_value(argument0,"tween");

    var factortime;
    if (ds_map_find_value(argument0,"useframes")) {
        factortime = 1;
    } else {
        factortime = DELTATIME;
    }
    
    
    // check if is out of timeline (optimized)
    // unoptimized way:
    // var endofanimation = (dir>0 && time>=totaltime)||(dir<0 && time<=0);
    endofanimation = false; 
    if (dir>0) {
        parent =  ds_map_find_value(argument0,"parent");
        if (parent!=-1 && ds_exists(parent,ds_type_list)) {
            totaltime = ds_list_find_value(parent,0); // Totaltime
        } else {
            totaltime = duration+delay;
        }
        time=min(totaltime, time+(dir*factortime));
        if (time>=totaltime) {
            endofanimation = true;
        }
    } else if (dir<0) {
        time=max(0, time+(dir*factortime));
        if (time<=0){
            endofanimation = true;
        }
    }
    // UPDATE THE PLAYHEAD TIME
    ds_map_replace(argument0,"time",time);
   

    //If the playhead is in the tween animation range 
    //(not in the initial delay nor the final waiting time)
    if (time>delay && time<duration+delay) {
        // get the min and max values of the tween
        vmax = ds_map_find_value(argument0,"max");
        vmin = ds_map_find_value(argument0,"min");
    
        // Get the data of the modifiers
        var m1,m2,m3;
        m1 =  ds_map_find_value(argument0,"m1");
        m2 =  ds_map_find_value(argument0,"m2");
        m3 =  ds_map_find_value(argument0,"m3");
        
        // RECALCULTE THE VALUE (THIS IS THE MOST IMPORTANT PART OF THE ENGINE) [!]
        value = tween_core(type,time-delay,vmin,vmax-vmin,duration,m1,m2,m3);
        
        //cache value to gain speed when the tween stops
        ds_map_replace(argument0,"value",value);
    }
    
    
    

     
    // If we have reached the end of the tween or parent tweenline.
    if (endofanimation) {
        var repeatcount;
        repeatcount = ds_map_find_value(argument0,"repeat");
        // if the number of left repetitions are greather than zero, or the tween it's set to play infinitely (-1)
        if (repeatcount>0) { // Reduce the value of left repeats
            repeatcount-=1;
            ds_map_replace(argument0,"repeat",repeatcount);
        }
        if (repeatcount>0 || repeatcount==-1) {
            var yoyomode;
            yoyomode = ds_map_find_value(argument0,"yoyo");
            if (yoyomode) { //If the tween uses yoyo mode
                var a; // reverse it
                a = -ds_map_find_value(argument0,"dir");
                ds_map_replace(argument0,"dir",a);
            } else { // else, restart it
                ds_map_replace(argument0,"time", 0);
            }
        } else {
            //Stop the tween
            ds_map_replace(argument0,"play",false);
        }
    }
    if (time>=duration+delay){ // if the playhead is after the duration of the tween
        // Set the value to the end value of the tween
        vmax = ds_map_find_value(argument0,"max");
        ds_map_replace(argument0,"value",vmax);
        return vmax;
    } else if (time<=delay) { // if the playhead is before the start of the tween
        // Set the value to the starting value of the tween
        vmin = ds_map_find_value(argument0,"min");
        ds_map_replace(argument0,"value",vmin);
        return vmin;
    }
    
} else { // If the animtion is in pause or stopped
    value = ds_map_find_value(argument0,"value"); // read value from cache
}

return value;
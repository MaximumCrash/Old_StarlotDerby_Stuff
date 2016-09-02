/// tweenline_add( value [, position="+=0"]);
/*
    
    Adds a tween or label to the last tweenline created or the tweenline 
    that is currently in edit mode. See tweenline_edit for more info about edit mode.
    
    
    Parameters: 
        value: 
            The tween or label (string) to add to the tweenline
        position: [optional]
            The position parameter gives you complete control over the insertion point. By default, it's at the end 
            of the timeline. 
            Use a number to indicate an absolute time in terms of seconds (or frames for frames-based 
            timelines), or you can use a string with a "+=" or "-=" prefix to offset the insertion point relative 
            to the END of the timeline. For example, "+=2" would place the object 2 seconds after the end, leaving 
            a 2-second gap. "-=2" would create a 2-second overlap. 
            You may also use a label like "mylabel" to have the object inserted exactly at the label or combine a 
            label and a relative offset like "mylabel+=2" to insert the object 2 seconds after "myLabel" or "myLabel-=3" 
            to insert it 3 seconds before "myLabel". 
            If you define a label that doesn't exist yet, it will automatically be added to the end of the timeline 
            before inserting the tween which can be quite convenient.
            You can also use the special strings "_end" and "_start" (or "_end+=3" or "_start-=1.4") to 
            reference to the end time and start time of the last tween added to the tweenline (wich not allways is 
            the same as the total duration of the tweenline).
            
    
            
            
    Examples:
        Adds the tween at 3 seconds in absolute position of the tweenline
            tweenline_add(tween, 3);
            
        Adds the tween 2 seconds after the end of the tweenline
            tweenline_add(tween, "+=2");
            
        Adds the tween 0.3 seconds before the end of the tweenline
            tweenline_add(tween, "-=.3");
            
        Adds the tween at the position of "myLabel" (if it doesn't exists, it will be automatically created at the end of the timeline, in the same position of the tween)
            tweenline_add(tween, "myLabel");
            
        Adds the tween half second after "myLabel"
            tweenline_add(tween, "myLabel+=.5");
            
        Adds the label named "otherlabel" 1.5 seconds before "myLabel"
            tweenline_add("otherlabel", "myLabel-=1.5");
            
        Adds the tween a half second before the end of the last tween added on the current tweenline ("_end-=0.5" is also valid)
            tweenline_add(tween, "_end-=.5");
        
        Adds the tween four seconds after the start of the last tween added on the current tweenline
            tweenline_add(tween, "_start-=4");    
            
*/      


var i, dur, durcache, dur2, useframes;
var tweenline = global._tw_current_creation_tl;
if (!is_array(tweenline)) {
    __tl_private_error(undefined, 'tweenline_add. You are not editing a tweenline. You need to create first a tweenline with tweenline_create() or edit a existing tweenline with tweenline_edit(tl)');
    return false;
}

var tween = argument[0];


var tweenline_duration = tweenline[TLTIMELINE.DURATION];
var tweenline_tweens = tweenline[TLTIMELINE.TWEENS];
var tweenline_labels = tweenline[TLTIMELINE.LABELS];
var tweenline_labels_list = tweenline[TLTIMELINE.LABELS_LIST];


var position_value = tweenline_duration;
if (argument_count>1) { // Parse the "position" argument. (and insert the new labels if requiered)
    position_value = __tl_private_parse_position(tweenline, argument[1]);
}

if (is_array(tween)) { //If it's a tween or a tweenline (nested tweenlines not implemented)

    if (tween[TLTWEEN.TYPE] == TLTYPE.TWEEN) { //If it's a tween
        /// ADD IT to the tweenline
        tween[@ TLTWEEN.INITIALDELAY]+=position_value;
        tween[@ TLTWEEN.DELAY]=tween[TLTWEEN.INITIALDELAY];
        tweenline_duration = max(tweenline_duration,  tween[TLTWEEN.INITIALDELAY]+tween[TLTWEEN.DURATION]);
        tweenline[@ TLTIMELINE.DURATION] = tweenline_duration;
        tween[@ TLTWEEN.PARENT] = tweenline;
        tween[@ TLTWEEN.HASPARENT] = true;
        tween[@ TLTWEEN.PLAY] = tweenline[TLTIMELINE.PLAY];
        tween[@ TLTWEEN.DIR] = tweenline[TLTIMELINE.DIR];
        // FIXME: what if you try to add a tween that already is in a tweenline to another tweenline? (ds_list bug?)
        
        
        
        
        var list = tweenline[TLTIMELINE.TWEENS];
        var size = ds_list_size(list), idd = tween[TLTWEEN.ID]; 
        for (var i=0; i<size; i++) { // If the tween already exists in the tweenline
            var ttt = ds_list_find_value(list,i);
            if (ttt[TLTWEEN.ID] == idd) { //Delete it
                ds_list_delete(list,i);
                ds_priority_delete_value(tweenline[TLTIMELINE.PRIORITY],tween);
            }
        }
        
        tweenline[@ TLTIMELINE.LASTTWEEN] = tween;
        
        ds_list_add(list, tween);
        ds_priority_add(tweenline[TLTIMELINE.PRIORITY], tween, tween[TLTWEEN.INITIALDELAY]);
        
        
        

        if (tweenline[TLTIMELINE.INMEDIATERENDER]) {
            var list = tweenline_get_tweens_by_target(tweenline, tween[TLTWEEN.SETTERS_TARGET]);
            var mintween = ds_list_find_value(list,0);
            ds_list_destroy(list); 
            if (mintween[TLTWEEN.ID] == tween[TLTWEEN.ID]) {
                tween_render(tween);
            }
        }
    } else if (tween[TLTWEEN.TYPE] == TLTYPE.TIMELINE) { // If it's a tweenline (not implemented)
    
        // Nested tweenlines not implemented        D: <-- sad face
        __tl_private_error(undefined, 'tweenline_add. Nested tweenlines are not implemented. Sorry. I will make a cake for you in compensation.');
    }
    
} else if(is_string(tween)) { //If it is a string (a label)
    //Add the new label
    if (tween!="_end" && tween!="_start") {
        ds_map_add(tweenline_labels,tween,position_value);
        ds_list_add(tweenline_labels_list, tween);
    } else {
        __tl_private_error(undefined, 'tweenline_add. You cannot add a label named "_end" or "_start".');
    }
} else {

    // unknown type
    // wtf is this?
    __tl_private_error(undefined, 'tweenline_add. Invalid "value" argument.');
}



return tween;

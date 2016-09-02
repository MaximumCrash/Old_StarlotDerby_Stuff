/// tweenline_combine_tweenline(tweenlinedest, tweenlineSource [,append=true [, deleteSource=true]]);
/*
Copies the tweenlineSource to tweenlineDest. 

If "append" is true (the default value) the tweenlineSource is 
copied at the end of tweenlineDest. 
If not, the tweenlineSource will conserve his position in the time.

If "deleteSource" is true (the default value) the tweenline2 will be deleted. So you don't need to worry to erase manually.
If not, tweenlineSource is conserved. You can conserve tweenlineSource if you want a fast reference to use in staggers, but REMEMBER YOU NEED TO DELETE MANUALLY THE TWEENLINE LATER.

NOTE that all tweens contained in tweenlineSource are copied to tweenlineDest. So the father of the tween will be now the main tweenlineDest, NOT tweenlineSource. 

*/

var i,size,time, tw, erase, append, tl1, tl2;
append = true;
if (argument_count>2) {
    append = argument[2];
}
erase = true;
if (argument_count>3) {
    erase = argument[3];
}
to = argument[0];
from = argument[1];
size = tweenline_get_size(from);
time = tweenline_get_duration(to);
for(i=0; i<size; i+=1) {
    tw = ds_list_find_value(from,i+1);
    if (append) {
        tween_set_delay(tw,time,true);
    }
    tweenline_add(to, tw);
}
if (erase) {
    tweenline_destroy(from);
    return size;
}
return from;
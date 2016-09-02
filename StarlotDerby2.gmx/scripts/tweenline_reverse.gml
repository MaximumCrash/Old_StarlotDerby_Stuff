/// tweenline_reverse(tweenline)
/* 
Play the tweenline in reverse. 

NOTE: the tweens position will not change, only the playhead direction.
*/

if (!tweenline_exists(argument[0])) {
    return false;
}
var s,tw;
var tweenline = argument0;
tweenline[@ TLTWEEN.DIR] = -abs(tweenline[TLTWEEN.DIR]);
tweenline[@ TLTIMELINE.PLAY] = true;

s = tweenline_get_size(argument[0]);
for (i=0; i<s; i+=1; ) {
    tw = tweenline_get_tween(argument[0],i);
    if (tween_exists(tw)) {
        tween_reverse(tw);
    }
}

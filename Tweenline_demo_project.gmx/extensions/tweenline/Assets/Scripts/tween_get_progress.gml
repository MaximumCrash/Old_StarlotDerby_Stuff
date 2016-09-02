/// tween_get_progress(tween)
/*
    Gets the progress as a value from 0 to 1. 
    The progress is calculated as: (position / duration)
*/

var _t = argument0;
if (_t[TLTWEEN.HASPARENT]) {
    return clamp((_t[TLTWEEN.TIME]-_t[TLTWEEN.INITIALDELAY])/_t[TLTWEEN.DURATION],0,1);
} else {
    return _t[TLTWEEN.TIME]/_t[TLTWEEN.DURATION];
}

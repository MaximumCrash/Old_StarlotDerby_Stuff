/// tween_get_endtime(tween)
/* 
    Gets the time at which the animation end on its parent tweenline (after any delay that was defined).
    If the tween has no parent tweenline, then the duration is returned.
*/

if (argument0[TLTWEEN.HASPARENT]) {
    return argument0[TLTWEEN.DURATION]+argument0[TLTWEEN.INITIALDELAY];
}
return argument0[TLTWEEN.DURATION];

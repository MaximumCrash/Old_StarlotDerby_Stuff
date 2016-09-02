/// tween_get_starttime(tween)
/* 
    Gets the time at which the animation begins on its parent tweenline (after any delay that was defined).
    If the tween has no parent tweenline, then zero is returned.
*/

var _t = argument0;
if (_t[TLTWEEN.HASPARENT]) {
    return _t[TLTWEEN.DELAY];
}
return 0;

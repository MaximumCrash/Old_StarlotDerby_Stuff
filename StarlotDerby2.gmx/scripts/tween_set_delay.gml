/// tween_set_delay(index,delay [, add?])
/*
    Set the initial delay of the tween in steps
    The optional parameter "Add", if true, add the current delay to the preexisting delay
*/
var t;
t=0;
if (argument_count>2) {
    if (argument[2]) {
        t=tween_get_delay(argument[0]);
    }
}
t+=argument[1]
var _t = argument[0];
_t[@ TLTWEEN.DELAY] = t;
_t[@ TLTWEEN.INITIALDELAY] = t;

return t;

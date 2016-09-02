/// tweenline_exists(tweenline)
/*
Returns true if a tweenline exists and false otherwise.

EXAMPLE: 
if (tweenline_exists(tweenline)) {
    tweenline_play(tweenline);
}


*/
if (is_array(argument0)){
    if (argument0[TLTWEEN.TYPE] == TLTYPE.TIMELINE) {
        return true;
    }
}
return false;

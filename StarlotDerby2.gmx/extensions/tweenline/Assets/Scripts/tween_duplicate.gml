/// tween_duplicate(tween);
/*

    Create a duplicate of the tween specified and return the new index.

    Example:
        mytween2 = tween_duplicate(mytween1);
    
*/

// creates a new tween by copying it (It's faster than the previous method)
var m = argument0;
m[TLTWEEN.ID] = global._tw_id++; 
return m;

/*
// Previous method: 
var _t, m;
m = argument0;
_t[TLTWEEN.ID] = global._tw_id++;
_t[TLTWEEN.EASE] = m[TLTWEEN.EASE];
_t[TLTWEEN.DURATION] = m[TLTWEEN.DURATION];
_t[TLTWEEN.MIN] = m[TLTWEEN.MIN];
_t[TLTWEEN.MAX] = m[TLTWEEN.MAX];
_t[TLTWEEN.TIME] = m[TLTWEEN.TIME];
_t[TLTWEEN.PLAY] = m[TLTWEEN.PLAY];
_t[TLTWEEN.DIR] = m[TLTWEEN.DIR];
_t[TLTWEEN.VALUE] = m[TLTWEEN.VALUE];
_t[TLTWEEN.DELAY] = m[TLTWEEN.DELAY];
_t[TLTWEEN.PARENT] = m[TLTWEEN.PARENT];
_t[TLTWEEN.M1] = m[TLTWEEN.M1];
_t[TLTWEEN.M2] = m[TLTWEEN.M2];
_t[TLTWEEN.M3] = m[TLTWEEN.M3];
_t[TLTWEEN.REPEAT] = m[TLTWEEN.REPEAT];
_t[TLTWEEN.YOYO] = m[TLTWEEN.YOYO];
_t[TLTWEEN.USEFRAMES] = m[TLTWEEN.USEFRAMES];
_t[TLTWEEN.PERSISTENT] = m[TLTWEEN.PERSISTENT];
ds_list_add(global._tw_dslist, _t);
return _t;
*/

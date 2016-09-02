/// tween_create(ease, duration, minValue, maxValue [,delay=0 [, play=true, [yoyo=false, [repeatcount=1]]]]);
/*
Creates a new tween and returns his ID.

A tween is basically a interpolation between two values that can be used to create animations of any numeric value. 

ease: [STRING] 
    A string with the ease type. See the script tween_core to see the list of aviliable eases. 
duration: [REAL] 
    The duration time of the tween. 
    (Normally, this value is measured in secconds. You can also use steps instaed, check tween_set_useframes for more info)
minValue: [REAL] 
    The start value of the tween
maxValue: [REAL] 
    The end value of the tween
delay: [optional, REAL] 
    This value is optional. The start time of the tween. Use this argument to specify a time before the interpolation starts. 
play: [optional, BOOLEAN] 
    This value is optional. If you pass FALSE to this argument, the tween will start in pause. So, you can resume it later.
yoyo: [optional, BOOLEAN] 
    This value is optional. If you pass TRUE to this argument, the tween will repeat backends when it finish. 
    NOTE: if you set yoyo mode to true and you do not set a value for repeatcount, the value for repeatcount will be -1 (it will play the animation in yoyo mode indefinitely)
    If you set yoyo mode to false and you do not set a value for repeatcount, the value for repeatcount will be 1. (The tween will be played only one time)
repeatcount: [optional, INT] 
    This value is optional. The number of repetitions of the tweens. If you pass -1 the tween will repeat indefinitely. You can combine the repeatcount with the yoyo mode to create a 
_________________________

EXAMPLE: 
Think we need to create an animation where a object travel from the current position in x to x=140 in 2 seconds. 
But we want our object to start slowly, acelerate in the middle of the path and then desacelerathe in the
end to reach the position x=140. It will be dificult to create this animation ussing only GML, 
so, we need to use tweens to create that effect.

First, create the tween in the create event. Pass as arguments the type of easing, 
the number of steps that will last the tween, and the start value and end value of the tween.

        //create event
        mytween = tween_create("quadinout", 2*room_speed, x, 140);

Then, in the step event (or draw, if we draw the sprite manually) we can GET the current value of the tween.

        //step event
        x = tween_get_value(mytween);

Finally we need to remember DESTROY the tween when we don't need anymore.

        //destroy event
        tween_destroy(mytween);

Remember to destroy a twen when you don't need it. Each tween is internally a ds_map, so, if you don't delete it you can easly create memory leaks. 



*/

var del, play, yoyo, playcount;
del = 0;
play = true;
yoyo = false;
playcount = 1;
if (argument_count>=5) {
    del = argument[4];
}
if (argument_count>=6) {
    play = argument[5];
}
if (argument_count>=7) {
    yoyo = argument[6];
    if (yoyo) {
        playcount = -1;
    }
}
if (argument_count>=8) {
    playcount = argument[7];
}
var _t;
var idd = global._tw_id++;
_t[TL.ID] = idd;
_t[TL.EASE] = argument[0];
_t[TL.DURATION] = argument[1];
_t[TL.MIN] = argument[2];
_t[TL.MAX] = argument[3];
_t[TL.DELTA] = argument[3]-argument[2];
_t[TL.TIME] = 0;
_t[TL.PLAY] = play;
_t[TL.DIR] = 1;
_t[TL.VALUE] = argument[2];
_t[TL.DELAY] = del;
_t[TL.PARENT] = -1;
_t[TL.M1] = "";
_t[TL.M2] = "";
_t[TL.M3] = "";
_t[TL.REPEAT] = playcount;
_t[TL.YOYO] = yoyo;
_t[TL.USEFRAMES] = global._tw_default_useframes;
_t[TL.PERSISTENT] = false;
_t[TL.KILLMEPLEASE] = false; // http://t.qkme.me/3sfg2y.jpg

_t[TL.SETTERS_TARGET] = noone; // setters target instance
_t[TL.SETTERS_NUMB] = 0; // numberOfSetters
_t[TL.SETTERS] = -1;
/*  setters array structure:
        a[setterN,TLSETTER.SETTER] = setter function  
        a[setterN,TLSETTER.MIN] = min   
        a[setterN,TLSETTER.MAX] = max
        a[setterN,TLSETTER.DELTA] = delta (for speed cache)   
*/
global._tw_tweencount+=1;

ds_list_add(global._tw_dslist, _t);

return _t;
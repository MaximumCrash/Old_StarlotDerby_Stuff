/// tweenline_add_tween(tweenline, ease, duration, minValue, maxValue [,delay [, play]]); 
/*
Adds a tween to the start of the tweenline. See tween_create for further information about the arguments.

*/
var tw, del, play;
del = 0;
play = true;
if (argument_count>=6) {
    del += argument[5];
}
if (argument_count>=7) {
    play = argument[6];
}

tw = tween_create(argument[1], argument[2], argument[3], argument[4], del, play);
tweenline_add(argument[0],tw);

return tw;
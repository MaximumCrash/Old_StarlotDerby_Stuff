/// tweenline_play(tweenline [, timeOrLabel ])
/* 
    Plays all the tweens in a tweenline. 
    You can pass also a time or a label string in the timeOrLabel 
    parameter, in wich case, the tweenline will jump to these time or label.
*/
var tweenline = argument[0];
if (!tweenline_exists(tweenline)) {return false;}

if (argument_count>1) {
    if (is_string(argument[1])) {
        tweenline[@ TLTIMELINE.TIME] = tweenline_label_find_time(tweenline,argument[1]);
    } else {
        tweenline[@ TLTIMELINE.TIME] = argument[1];
    }
}

s = tweenline_get_size(tweenline);
tweenline[@ TLTIMELINE.PLAY] = true;
tweenline[@ TLTIMELINE.DIR] = abs(tweenline[TLTIMELINE.DIR]);
for (i=0; i<s; i+=1; ) {
    tw = tweenline_get_tween(tweenline,i);
    if (tween_exists(tw)) {
        tween_play(tw);
    }
}

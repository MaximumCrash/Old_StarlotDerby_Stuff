/// tl_draw_tweenline( tweenline, x, y, width, tween_height);
/*
    Draws a graph showing all the nested tweens inside a tweenline.
*/

var tweenline = argument0;
var xx = argument1;
var yy = argument2; 
var ww = argument3;
var tween_height = argument4;

var size = tweenline_get_size(tweenline);
var totaltime = tweenline_get_duration(tweenline);
for (var i=0; i<size; i++) {
    var tween = tweenline_get_tween(tweenline, i);
    var starttime = tween_get_starttime(tween);
    var duration = tween_get_duration(tween);
    
    tl_draw_tween_graph(tween, xx + ww*(starttime/totaltime), yy + tween_height*i, ww*(duration/totaltime), tween_height, tween_height/4);
}

/// tl_draw_tween_timeline(tween, x1, x2, y1, y2 , draw_delay, draw_extra, include_delay, include_extra, draw_easing);
var _t = argument[0]
var x1 = argument[1], y1 = argument[2];
var x2 = argument[3], y2 = argument[4];
var draw_delay=argument[5], draw_extra=argument[6];
var include_delay=argument[7], include_extra=argument[8];
var draw_ease=argument[9];


var duration = _t[TL.DURATION];
var delay = _t[TL.DELAY];
var totaltime = duration;
var col = draw_get_color();
if (include_extra) {
    if (include_delay) { var totaltime = delay+duration;}
} else {
    if (_t[TL.PARENT]==-1){
        if (include_delay) { var totaltime = delay+duration;}
        var extra = 0;
    } else {
        var totaltime = ds_list_find_value(_t[TL.PARENT],0); // Totaltime
        var extra = totaltime-(duration-delay);
    }
}



var delayprogress = delay/totaltime;
var durationprogress = duration/totaltime;
var extraprogress = extra/totaltime;

var width = x2-x1;
var delta = width*delayprogress;
if (draw_delay) {
    draw_set_color($ba9a1d); // BGR (Blue - green - red) (f u game maker )
    draw_rectangle(x1, y1, x1+delta, y2,false);
}
x1 +=delta;
var delta = width*durationprogress;
draw_set_color($4fba32);
draw_rectangle(x1, y1, x1+delta, y2,false);

if (draw_ease) {
    draw_set_color(c_black);
    tl_draw_graph_line(_t[TL.EASE],x1,y1,x1+delta,y2);
}
x1 +=delta;
var delta = width*extraprogress;
if (draw_extra) {
    draw_set_color($bcbcbc);
    draw_rectangle(x1, y1, x1+delta, y2,false);
}

draw_set_color(col);

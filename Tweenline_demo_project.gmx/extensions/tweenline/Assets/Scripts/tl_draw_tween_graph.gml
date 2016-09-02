/// tl_draw_tween_graph(tween, x, y, width, height, border_radius);
/*
    Draws a complete graph that shows the progress and the easing of the tween.
*/


// Draw graph

var tween = argument0, xx=argument1,yy=argument2,ww=argument3, hh=argument4, r=argument5;
var c_orange1 = make_color_rgb(255,127,0);
var c_gray1 = make_color_rgb(80,80,80);
var c_gray2 = make_color_rgb(102,102,102);

draw_set_color(c_gray1);
draw_set_alpha(.3);
// draws the background
draw_roundrect_ext(xx,yy,xx+ww,yy+hh,r,r,false);

var p = clamp(tween_get_progress(tween),0,1);
// Draw tween progress
draw_roundrect_ext(xx,yy,xx+ww*p,yy+hh,r,r,false);  

draw_set_color(c_orange1);
draw_set_alpha(1);
// DRAWS THE EASING LINE
tl_draw_easing_graph( tween,xx,yy,xx+ww,yy+hh,max(1,hh/50));


draw_set_color(c_gray2);
draw_set_alpha(.5);
// Draws the border line
draw_roundrect_ext(xx,yy,xx+ww,yy+hh,r,r,true);    

draw_set_alpha(1);

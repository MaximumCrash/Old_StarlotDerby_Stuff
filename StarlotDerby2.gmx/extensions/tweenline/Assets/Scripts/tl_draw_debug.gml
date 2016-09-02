/// tl_draw_debug(x, y);
/*
    Draw standard debug info about the tween system.
    It shows: Total tweens, Total tweenlines, FPS, FPSreal.
*/
var xxx, yyy, t, r, col;
xxx = argument0;
yyy = argument1;
r =1;
col = draw_get_color();
var a =-1;
if (webgl_enabled) {a=0;}
draw_set_font(a);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

t = "Total tweens: "+string(ds_list_size(global._tw_dslist))+"#";
t+= "Total tweenlines: "+string(ds_list_size(global._tw_tl_dslist))+"#";
t+= "FPS: "+string(fps)+"#";
t+= "FPSreal: "+string(fps_real)+"#";
draw_set_color(c_black);
draw_text(xxx-r,yyy-r,t);
draw_text(xxx-r,yyy+r,t);
draw_text(xxx+r,yyy-r,t);
draw_text(xxx+r,yyy+r,t);
draw_set_color(c_white);
draw_text(xxx,yyy,t);

draw_set_color(col);

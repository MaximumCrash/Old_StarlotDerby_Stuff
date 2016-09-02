/// tween_system_debug_draw(x, y);
/*
    Draw standard debug info about the tween system
*/
var xxx, yyy, t, r, col;
xxx = argument0;
yyy = argument1;
r =1;
col = draw_get_color();
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
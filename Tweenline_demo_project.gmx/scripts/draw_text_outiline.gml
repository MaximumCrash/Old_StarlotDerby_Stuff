/// draw_text_outiline(x, y, string);
var xxx, yyy, t=argument2, r, col;
xxx = argument0;
yyy = argument1;
r =1; // outline
col = draw_get_color();
draw_set_color(c_black);
draw_text(xxx-r,yyy-r,t);
draw_text(xxx-r,yyy+r,t);
draw_text(xxx+r,yyy-r,t);
draw_text(xxx+r,yyy+r,t);
draw_set_color(c_white);
draw_text(xxx,yyy,t);

draw_set_color(col);

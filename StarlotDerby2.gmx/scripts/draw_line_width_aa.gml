/// draw_line_width_aa(x1,y1,x2,y2,width)
/*
draw_line_width_aa(x1,y1,x2,y2,width) - Draws an anti-aliased line using linear interpolation.
Warning: Call draw_aa_init before ussing this script. :) 

x1,y1 - Starting point
x2,y2 - Ending point
width - Width of the line (Use 1 for a normal line)

Script by Fede-lasse
____

source: http://gmc.yoyogames.com/index.php?showtopic=376776
Adapted by: Ciberman.

*/

if (!surface_exists(global._AA_SPRITE_LINE)) {
    var surf = surface_create(64,3);
    surface_set_target(surf);
    draw_clear_alpha(c_black,0);
    draw_line_colour(-1,1,65,1,c_white,c_white);
    surface_reset_target();
    global._AA_SPRITE_LINE = surf;
}
var dist,sprwidth,dir,width,xx,yy;
dist = (1/63)*point_distance(argument0,argument1,argument2,argument3);
sprwidth = (argument4+2)/3;
dir = point_direction(argument0,argument1,argument2,argument3);
width = (argument4/2)/3;
xx = argument0+lengthdir_x(width,dir+90);
yy = argument1+lengthdir_y(width,dir+90);

texture_set_interpolation(true);
draw_surface_ext(global._AA_SPRITE_LINE,xx,yy,dist,sprwidth,dir,draw_get_color(),draw_get_alpha());

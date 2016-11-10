///draw_shadow(shadow length, shadow direction, shadow color, shadow alpha); 
//@tehwave

/*  ARGUMENT            DESCRIPTION
0   shadow length       The distance in pixels between sprite and shadow. 
1   shadow direction    The direction the shadow is facing.
2   shadow color        The color of the shadow.
3   shadow alpha        The alpha of the shadow.
*/

//init & assign variables
var sh_len = argument0, sh_dir = argument1;

//draw the shadow
draw_sprite_ext(sprite_index, image_index, x+lengthdir_x(sh_len, sh_dir), y+lengthdir_y(sh_len, sh_dir), image_xscale, image_yscale, image_angle, argument2, argument3);

//Find the latest version of draw_shadow at:
//https://marketplace.yoyogames.com/assets/365/draw-sprite-shadow

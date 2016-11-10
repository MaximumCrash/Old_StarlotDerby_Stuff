///draw_shadow_ext(shadow length, shadow direction, shadow xscale, shadow yscale, shadow angle, shadow color,  shadow alpha); 
//@tehwave

/*  ARGUMENT            DESCRIPTION
0   shadow length       The distance in pixels between sprite and shadow. 
1   shadow direction    The direction the shadow is facing.
2   shadow xscale       The horizontal scaling of the shadow.
3   shadow yscale       The vertical scaling of the shadow.
4   shadow angle        The rotation of the shadow.
5   shadow color        The color of the shadow.
6   shadow alpha        The alpha of the shadow.
*/

//init & assign variables
var sh_len = argument0, sh_dir = argument1;

//draw the shadow
draw_sprite_ext(sprite_index, image_index, x+lengthdir_x(sh_len, sh_dir), y+lengthdir_y(sh_len, sh_dir), argument2, argument3, argument4, argument5, argument6);

//Find the latest version of draw_shadow_ext at:
//https://marketplace.yoyogames.com/assets/365/draw-sprite-shadow

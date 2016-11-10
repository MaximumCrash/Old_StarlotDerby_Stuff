///draw_sprite_shadow(sprite, subimg, x, y, shadow length, shadow direction, shadow color, shadow alpha);
//@tehwave

/*  ARGUMENT            DESCRIPTION
0   sprite              The index of the sprite to draw.
1   img                 The subimg (frame) of the sprite to draw.
2   x                   The x coordinate of the drawn sprite. 
3   y                   The y coordinate of the drawn sprite.          

4   shadow length       The distance in pixels between sprite and shadow. 
5   shadow direction    The direction the shadow is facing.
6   shadow color        The color of the shadow.
7   shadow alpha        The alpha of the shadow.
*/

//init & assign variables
var spr = argument0, img = argument1, xx = argument2,
    yy = argument3, sh_len = argument4, sh_dir = argument5,
    sh_col = argument6, sh_alpha = argument7;

//draw the shadow
draw_sprite_ext(spr, img, xx+lengthdir_x(sh_len, sh_dir), yy+lengthdir_y(sh_len, sh_dir), image_xscale, image_yscale, image_angle, sh_col, sh_alpha);

//draw the sprite
draw_sprite(spr, img, xx, yy);

//Find the latest version of draw_sprite_shadow at:
//https://marketplace.yoyogames.com/assets/365/draw-sprite-shadow

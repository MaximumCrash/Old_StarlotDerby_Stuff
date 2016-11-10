///draw_sprite_ext_shadow(sprite, subimg, x, y, xscale, yscale, rot, color, alpha, shadow length, shadow direction, shadow color, shadow alpha);
//@tehwave

/*  ARGUMENT            DESCRIPTION
0   sprite              The index of the sprite to draw.
1   img                 The subimg (frame) of the sprite to draw.
2   x                   The x coordinate of the drawn sprite. 
3   y                   The y coordinate of the drawn sprite.          
4   xscale              The horizontal scaling of the sprite. 
5   yscale              The vertical scaling of the sprite. 
6   rot                 The rotation of the sprite.         
7   color               The color with which to blend the sprite. 
8   alpha               The alpha of the sprite.

9   shadow length       The distance in pixels between sprite and shadow. 
10  shadow direction    The direction the shadow is facing.
11  shadow color        The color of the shadow.
12  shadow alpha        The alpha of the shadow.
*/

//init & assign variables
var spr = argument0, img = argument1, xx = argument2,
    yy = argument3, xscale = argument4, yscale = argument5,
    angle = argument6, sh_len = argument9, sh_dir = argument10,
    sh_col = argument11, sh_alpha = argument12;

//draw the shadow
draw_sprite_ext(spr, img, xx+lengthdir_x(sh_len, sh_dir), yy+lengthdir_y(sh_len, sh_dir), xscale, yscale, angle, sh_col, sh_alpha);

//draw the sprite
draw_sprite_ext(spr, img, xx, yy, xscale, yscale, angle, argument7, argument8);

//Find the latest version of draw_sprite_ext_shadow at:
//https://marketplace.yoyogames.com/assets/365/draw-sprite-shadow

#define __bb_private
/// __bb_private();
/*

    THESE ARE PRIVATE FUNCTIONS.
    
    DO NOT USE IT!! 
    
    
*/

#define __bb_private_draw_sprite_rectangle
/// __bb_private_draw_sprite_rectangle(sprite,subimg,x1,y1,x2,y2,left,top,right,bottom)
/*
    Draws a rectangle using a sprite sliced into 9 sections.
    The 3x3 sections are used to draw the four corners, the
    four edges, and the center of the rectangle. The center
    and edge sections are stretched to fill the respective
    areas of the rectangle.
    
        sprite  sprite index
        subimg  sprite subimage
        x1,y1   top-left corner of rectangle
        x2,y2   bottom-right corner of rectangle
        left    left edge width in pixels
        top     top edge width in pixels
        right   right edge width in pixels
        bottom  bottom edge width in pixels
    
    GMLscripts.com/license
*/ 
{
    var spr = argument0,
        img = argument1,
        x1  = argument2,
        y1  = argument3,
        x2  = argument4,
        y2  = argument5,
        l   = argument6,
        t   = argument7,
        r   = argument8,
        b   = argument9;

    var x3 = x1 + l;
    var y3 = y1 + t;
    var x4 = x2 - r + 1;
    var y4 = y2 - b + 1;
    var x5 = sprite_get_width(spr) - r;
    var y5 = sprite_get_height(spr) - b;
    var w = max(1,x5 - l);
    var h = max(1,y5 - t);
    var xs = (x4 - x3) / w;
    var ys = (y4 - y3) / h;
    var al = draw_get_alpha();
    draw_sprite_part_ext(spr, img, 0,  0,  l, t, x1, y1, 1.0, 1.0, c_white, al);
    draw_sprite_part_ext(spr, img, l,  0,  w, t, x3, y1, xs,  1.0, c_white, al);
    draw_sprite_part_ext(spr, img, x5, 0,  r, t, x4, y1, 1.0, 1.0, c_white, al);
    draw_sprite_part_ext(spr, img, 0,  t,  l, h, x1, y3, 1.0, ys,  c_white, al);
    draw_sprite_part_ext(spr, img, l,  t,  w, h, x3, y3, xs,  ys,  c_white, al);
    draw_sprite_part_ext(spr, img, x5, t,  r, h, x4, y3, 1.0, ys,  c_white, al);
    draw_sprite_part_ext(spr, img, 0,  y5, l, b, x1, y4, 1.0, 1.0, c_white, al);
    draw_sprite_part_ext(spr, img, l,  y5, w, b, x3, y4, xs,  1.0, c_white, al);
    draw_sprite_part_ext(spr, img, x5, y5, r, b, x4, y4, 1.0, 1.0, c_white, al);

    return 0;
}

#define __bb_private_draw_text_shadow_transformed
/// __bb_private_draw_text_shadow_transformed(x,y,str,color,shadow,intensity,distance,direction,scale)
/*
    ADAPTED FROM: GMLscripts.com
    (added scale argument) 
    
    Draws a given string with a simple shadow effect applied to it.
    
        x,y         position of text, real
        str         text, string
        color       text color, real
        shadow      shadow color, real
        intensity   shadow intensity [0..1], real
        distance    shadow distance in pixels, real
        direction   shadow direction in degrees, real
        scale       scale of the text
        
        
    GMLscripts.com/license
*/
{
    var c,a,i,j,sc;
    sc = argument8;
    c = draw_get_color();
    if (argument5!=0) {
        a = draw_get_alpha();
        i = lengthdir_x(argument6, argument7);
        j = lengthdir_y(argument6, argument7);
        draw_set_color(argument4);
        draw_set_alpha(argument5);
        draw_text_transformed(argument0 + i, argument1 + j, argument2,sc,sc,0);
        draw_set_alpha(a);
    }
    draw_set_color(argument3);
    draw_text_transformed(argument0, argument1, argument2,sc,sc,0);
    draw_set_color(c);
    return 0;
}
#define tl_playhead
/// tl_playhead()
/*
Creates a interactive visual playhead to control a tween or tweenline.

USAGE: 
    // create
    p = tl_playhead_create( my_tween_or_tweenline );
    
    // step
    tl_playhead_step( p );
    
    // draw
    tl_playhead_draw( p );





*/

#define tl_playhead_create
/// tl_playhead_create( tweenline_or_tween );
/*
    tweenline_or_tween:
        You can pass a tweenline or a tween.
        
    Returns the index of the playhead

*/


enum _playhead{
    tweenline,
    width,
    height,
    x,
    y,
    handle_width,
    handle_height,
    back_radius,
    back_color,
    back_alpha,
    back_border_color,
    back_border_alpha,
    handle_radius,
    handle_area,
    handle_color,
    handle_alpha,
    handle_border_color,
    handle_border_alpha,
    handle_hover_color,
    handle_hover_alpha,
    handle_hover_border_color,
    handle_hover_border_alpha,
    ___hover,
    ___drag,
    ___progress,
    ___istween,
    ___was_playing
}


var _t;
_t[_playhead.tweenline] = argument0;

_t[_playhead.width] = room_width*.7;
_t[_playhead.height] = 12;
_t[_playhead.x] = (room_width-_t[_playhead.width])*.5;
_t[_playhead.y] = room_height*.8;
_t[_playhead.handle_width] = _t[_playhead.height]*1.5;
_t[_playhead.handle_height] = _t[_playhead.height]*1.5;


_t[_playhead.back_radius] = 4;
_t[_playhead.back_color] = make_color_rgb(80,80,80);
_t[_playhead.back_alpha] = 0.3;
_t[_playhead.back_border_color] = make_color_rgb(102,102,102);
_t[_playhead.back_border_alpha] = 0.5;

_t[_playhead.handle_radius] = 4;
_t[_playhead.handle_area] = 2; //1 is the default. (2 is twice as bigger, 0.5 is half of the size)
_t[_playhead.handle_color] = make_color_rgb(230, 230, 230);
_t[_playhead.handle_alpha] = 1;
_t[_playhead.handle_border_color] = make_color_rgb(211, 211, 211);
_t[_playhead.handle_border_alpha] = 1;

_t[_playhead.handle_hover_color] = make_color_rgb(218, 218, 218);
_t[_playhead.handle_hover_alpha] = 1;
_t[_playhead.handle_hover_border_color] = make_color_rgb(120, 120, 120);
_t[_playhead.handle_hover_border_alpha] = 1;


////////// PRIVATE //////////////

_t[_playhead.___hover] = false;
_t[_playhead.___drag] = false;
_t[_playhead.___progress] = 0;
_t[_playhead.___istween] = false;
_t[_playhead.___was_playing] = false;

if (tween_exists(_t[_playhead.tweenline])) {
    _t[_playhead.___istween] = true;
}

return _t;





#define tl_playhead_step
/// tl_playhead_step( playhead );
/*
    Place this script in step.
    Playhead is the index of the playhead
    
    

*/


var _t = argument0
var ww = _t[_playhead.handle_width]*.5*_t[_playhead.handle_area], hh = _t[_playhead.handle_height]*.5*_t[_playhead.handle_area];

if (_t[_playhead.___istween]) {
    _t[@ _playhead.___progress] = tween_get_progress(_t[_playhead.tweenline]);
} else {
    _t[@ _playhead.___progress] = tweenline_get_progress(_t[_playhead.tweenline]);
}
var p = _t[_playhead.___progress];

var posx = _t[_playhead.x] + _t[_playhead.width]*p;
var posy = _t[_playhead.y] + _t[_playhead.height]*.5;

var x1 = posx-ww, x2 = posx+ww, y1 = posy-hh, y2 = posy+hh;
var x1bar = _t[_playhead.x], y1bar = _t[_playhead.y], x2bar = x1bar + _t[_playhead.width], y2bar = y1bar + _t[_playhead.height];
_t[@ _playhead.___hover] = false;

if (_t[_playhead.___drag]) {
    if (mouse_check_button_released(mb_left)) {
        _t[@ _playhead.___drag] = false;
        if (_t[_playhead.___was_playing]) {
            if (_t[_playhead.___istween]) {
                tween_play(_t[_playhead.tweenline]);
            } else {
                tweenline_play(_t[_playhead.tweenline]);
            }
        }
    }
    var p = clamp((mouse_x - _t[_playhead.x])/_t[_playhead.width],0,1);
    _t[@ _playhead.___progress] = p;
    if (_t[_playhead.___istween]) {
        tween_set_progress(_t[_playhead.tweenline], p);
    } else {
        tweenline_set_progress(_t[_playhead.tweenline], p);
    }
} 

else if (mouse_x >= x1 && mouse_x < x2 && mouse_y >= y1 && mouse_y < y2) {
    _t[@ _playhead.___hover] = true;
    if (mouse_check_button_pressed(mb_left)) {
        _t[@ _playhead.___drag] = true;
        
        if (_t[_playhead.___istween]) {
            _t[@_playhead.___was_playing] = tween_is_playing(_t[_playhead.tweenline]);
            tween_pause(_t[_playhead.tweenline]);
        } else {
            _t[@_playhead.___was_playing] = tweenline_is_playing(_t[_playhead.tweenline]);
            tweenline_pause(_t[_playhead.tweenline]);
        }
    }
} 

else if (mouse_x >= x1bar && mouse_x < x2bar && mouse_y >= y1bar && mouse_y < y2bar) {
    if (mouse_check_button_pressed(mb_left)) {
        _t[@ _playhead.___drag] = true;
        if (_t[_playhead.___istween]) {
            tween_pause(_t[_playhead.tweenline]);
        } else {
            tweenline_pause(_t[_playhead.tweenline]);
        }
    }
}











#define tl_playhead_draw
/// tl_playhead_draw( playhead );
/*
    Call this functions in the draw event
    playhead is the index of the playhead.
    

*/


////// BACKGROUND BAR
var _t = argument0;
var x1 = _t[_playhead.x], y1 = _t[_playhead.y], 
    x2 = x1 + _t[_playhead.width], y2 = y1 + _t[_playhead.height];
    
var radius = _t[_playhead.back_radius];

draw_set_color(_t[_playhead.back_color]);
draw_set_alpha(_t[_playhead.back_alpha]);
draw_roundrect_ext(x1,y1,x2,y2,radius,radius,false);

draw_set_color(_t[_playhead.back_border_color]);
draw_set_alpha(_t[_playhead.back_border_alpha]);
draw_roundrect_ext(x1,y1,x2,y2,radius,radius,true);


////// HANDLE 
var p = _t[_playhead.___progress];
var ww = _t[_playhead.handle_width]*.5, hh = _t[_playhead.handle_height]*.5;
var posx = _t[_playhead.x] + _t[_playhead.width]*p;
var posy = _t[_playhead.y] + _t[_playhead.height]*.5;
var x1 = posx-ww, x2 = posx+ww, y1 = posy-hh, y2 = posy+hh;
var radius = _t[_playhead.handle_radius];


if (_t[_playhead.___hover]) {
    draw_set_color(_t[_playhead.handle_hover_color]);
    draw_set_alpha(_t[_playhead.handle_hover_alpha]);
} else {
    draw_set_color(_t[_playhead.handle_color]);
    draw_set_alpha(_t[_playhead.handle_alpha]);
}
draw_roundrect_ext(x1,y1,x2,y2,radius,radius,false);


if (_t[_playhead.___hover]) {
    draw_set_color(_t[_playhead.handle_hover_border_color]);
    draw_set_alpha(_t[_playhead.handle_hover_border_alpha]);
} else {
    draw_set_color(_t[_playhead.handle_border_color]);
    draw_set_alpha(_t[_playhead.handle_border_alpha]);
}
draw_roundrect_ext(x1,y1,x2,y2,radius,radius,true);

#define tl_playhead_set_background
/// tl_playhead_set_background(playhead, color, alpha, border_color, border_alpha, border_radius);
/*

    Change atributes about the playhead background.
    
    playhead: the index of the playhead
    color: background color (default is make_color_rgb(80,80,80))
    alpha: background alpha (default is 0.3 )
    border_color: background color (default is make_color_rgb(102,102,102))
    border_alpha: background alpha (default is 0.5 )
    border_radius: the radius of the corners of the background, in pixels (default is 4)
    
    Note: All arguments are needed. 
*/

var _t = argument0;

_t[@ _playhead.back_color] = argument1;
_t[@ _playhead.back_alpha] = argument2;
_t[@ _playhead.back_border_color] = argument3;
_t[@ _playhead.back_border_alpha] = argument4;
_t[@ _playhead.back_radius] = argument5;

#define tl_playhead_set_handle
/// tl_playhead_set_background(playhead, color, alpha, border_color, border_alpha, hover_color, hover_alpha, hover_border_color, hover_border_alpha, border_radius);
/*

    Change atributes about the playhead handle.
    
    playhead: the index of the playhead
    color: background color (default is make_color_rgb(230, 230, 230))
    alpha: background alpha (default is 1 )
    border_color: background color (default is make_color_rgb(211, 211, 211))
    border_alpha: background alpha (default is 1 )
    hover_color: background color (default is make_color_rgb(218, 218, 218))
    hover_alpha: background alpha (default is 1 )
    hover_border_color: background color (default is make_color_rgb(120, 120, 120))
    hover_border_alpha: background alpha (default is 1 )
    border_radius: the radius of the corners of the background, in pixels (default is 4)
    
    Note: All arguments are needed. 
*/




var _t = argument0;
_t[@ _playhead.handle_color] = argument1;
_t[@ _playhead.handle_alpha] = argument2;
_t[@ _playhead.handle_border_color] = argument3;
_t[@ _playhead.handle_border_alpha] = argument4;

_t[@ _playhead.handle_hover_color] = argument5;
_t[@ _playhead.handle_hover_alpha] = argument6;
_t[@ _playhead.handle_hover_border_color] = argument7;
_t[@ _playhead.handle_hover_border_alpha] = argument8;

_t[@ _playhead.handle_radius] = argument9;


#define tl_playhead_set_mask_area
/// tl_playhead_set_mask_area( playhead, area_scale);
/*
    playhead:   
        The index of the playhead
    area_scale: 
        The scale of the interactive area. The interactive area is 
        the non visible area in wich the user will place the mouse or finger to 
        interact with the playhead handle. If you pass 1 in area_scale, the interactive
        area will fit the visual area of the handle. If you pass 2, it will be twice as bigger 
        as the visible area. 2.5 is 250% of the size of the visual 
        area, and so. (2 is the default.)

*/
var _t = argument0;
_t[@ _playhead.handle_area] = argument1; 

#define tl_playhead_set_size
/// tl_playhead_set_size(playhead, width, height, x, y, handle_width, handle_height);
/*

    playhead: the index of the playhead
    width: the width of the playhead
        Default is: room_width*.7
    height: the height of the playhead
        Default is: 12
    x: the x of the playhead
        Default is: (room_width- playhead_width)*.5
    y: the y of the playhead
        Default is: room_height*.8
    handle_width: the width of the handle 
        Default is: playhead_height*1.5
    handle_height: the height of the handle
        Default is: playhead_height*1.5

*/
var _t = argument0;
_t[@ _playhead.width] = argument1;
_t[@ _playhead.height] = argument2;
_t[@ _playhead.x] = argument3;
_t[@ _playhead.y] = argument4;
_t[@ _playhead.handle_width] = argument5;
_t[@ _playhead.handle_height] = argument6;
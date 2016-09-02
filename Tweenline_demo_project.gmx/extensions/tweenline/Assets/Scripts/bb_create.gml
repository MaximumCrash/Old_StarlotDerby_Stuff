#define bb_create
/// bb_create(x, y, text, size, font, sprite, is_9gird);
/*
    Creates a basic button (BB) in the specified position
    with the text "text" and with the sprite specified as background.
    
    If the sprite has:
        - 1 frame, 
            this unique frame will be used in all states
        - 2 frames, 
            first frame will be used in normal state, 
            second frame will be used in pressed state
        - 3 frames,
            first frame will be used in normal state, 
            second frame will be used in pressed state,
            third frame will be used in hover state,
        - 6 frames, (ONLY FOR TOGGLE BUTTONS, see bb_set_toggle for more info)
            first frame will be used in non-active/normal state, 
            second frame will be used in pressed state (when the button is not active),
            third frame will be used in hover state (when the button is not active),
            fourth frame will be used in active state
            fifth frame will be used in hover state (when the button is active)
            sixth frame will be used in pressed state (when the button is active)
            
    x: the x position of the button
    y: the y position of the button
    text: the text string
    size: the size of the text, in pixels
    font: the font used to draw the text
    sprite: the sprite ussed as background of the button
    is_9grid: if true, the background sprite will be treated as a 9grid.
        More info about 9grid technique: http://yannickloriot.com/2013/03/9-patch-technique-in-cocos2d/
        
    Basic usage example:
        // Create Event:
        my_button = bb_create(x, y, "Press Me", 20, font0, spr_button, true);
        
        //Step event:
        bb_step(my_button);
        if (bb_on_pressed(my_button)) {
            show_message_async("The button has beeen pressed");
        }
        
        // Draw Event: 
        bb_draw(my_button);
        
    
*/

enum _bb {
    x,
    y,
    w,
    h,
    sprite,
    text,
    is9grid,
    grid_top,
    grid_left,
    autosize_w,
    autosize_h,
    istoggle, 
    text_color,
    text_alpha,
    text_shadow_color,
    text_shadow_alpha,
    text_size,
    text_font,
    text_shadow_dis,
    text_shadow_dir,
    _frames,
    _spr_w,
    _spr_h,
    _state_hover,
    _state_pressed,
    _state_active,
    _font_size,
    _font_scale,
    _fire_ev_pressed,
    _fire_ev_enter,
    _fire_ev_leave
}


var _t, spr = argument5, str = string(argument2);
draw_set_font(argument4);

_t[_bb.text_size] = argument3;
_t[_bb.text_font] = argument4;
_t[_bb._font_size] = string_height("W");
var sc = argument3/_t[_bb._font_size];
_t[_bb._font_scale] = sc;

_t[_bb._frames] = sprite_get_number(spr);
_t[_bb._spr_w] = sprite_get_width(spr);
_t[_bb._spr_h] = sprite_get_height(spr);
_t[_bb.grid_left] = _t[_bb._spr_w]/3;
_t[_bb.grid_top] = _t[_bb._spr_h]/3;
_t[_bb.is9grid] = argument6;

if (_t[_bb.is9grid]) {
    _t[_bb.w] = string_width(str)*sc + _t[_bb.grid_left]*2;
    _t[_bb.h] = string_height(str)*sc+ _t[_bb.grid_top]*2;
} else {
    _t[_bb.w] = _t[_bb._spr_w];
    _t[_bb.h] = _t[_bb._spr_h];
}


_t[_bb.x] = argument0;
_t[_bb.y] = argument1;

_t[_bb.sprite] = spr;
_t[_bb.text] = str;
_t[_bb.autosize_w] = true;
_t[_bb.autosize_h] = true;
_t[_bb.istoggle] = false;



_t[_bb._state_hover] = false;
_t[_bb._state_pressed] = false;
_t[_bb._state_active] = false;
_t[_bb._fire_ev_pressed] = false;
_t[_bb._fire_ev_enter] = false;
_t[_bb._fire_ev_leave] = false;




_t[_bb.text_color] = c_black;
_t[_bb.text_alpha] = .78;

_t[_bb.text_shadow_color] = c_white;
_t[_bb.text_shadow_alpha] = .6;
_t[_bb.text_shadow_dis] = argument3/10;
_t[_bb.text_shadow_dir] = 270;


return _t;


#define bb_draw
/// bb_draw (bb);
/*
    Place it in the draw event
    bb is the index of the basic button
    
    Note: you can use draw_set_alpha() to change the alpha of the button. 
    
*/

var _t = argument0, subimg = 0, f =_t[_bb._frames];

if (_t[_bb._state_active]) {
    subimg = 3;
    if (_t[_bb._state_pressed]) {
        subimg = 4
    } else if (_t[_bb._state_hover]) {
        subimg = 5;
    }
} else {
    subimg = 0;
    if (_t[_bb._state_pressed]) {
        subimg = 1;
    } else if (_t[_bb._state_hover]) {
        subimg = 2;
    }
}

var x1 = _t[_bb.x], y1= _t[_bb.y];
if (_t[_bb.is9grid]) {
    var partLeft = _t[_bb.grid_left], partTop =_t[_bb.grid_top];
    var partRight = _t[_bb._spr_w] - partLeft, partBottom = _t[_bb._spr_h] - partTop;
    var ww = _t[_bb.w], hh= _t[_bb.h];
    __bb_private_draw_sprite_rectangle(_t[_bb.sprite], subimg,x1,y1,x1+ww,y1+hh, partLeft, partTop, partRight, partBottom);
    
} else {
    var ww = _t[_bb._spr_w], hh= _t[_bb._spr_h];
    draw_sprite(_t[_bb.sprite], subimg, x1, y1);
    
}

var textx = x1+ww/2, texty = y1+hh/2;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(_t[_bb.text_font]);
var str = _t[_bb.text];
__bb_private_draw_text_shadow_transformed(textx,texty, 
    str, _t[_bb.text_color], _t[_bb.text_shadow_color], _t[_bb.text_shadow_alpha], 
    _t[_bb.text_shadow_dis], _t[_bb.text_shadow_dir], _t[_bb._font_scale]);


#define bb_step
/// bb_step(bb);
/*
    Call this script in the step event BEFORE anything ELSE!! 
    BB is the index of the basic button
*/

var _t = argument0;

// Reset event dispatchers
_t[@ _bb._fire_ev_pressed] = false;
_t[@ _bb._fire_ev_enter] = false;
_t[@ _bb._fire_ev_leave] = false;

var x1 = _t[_bb.x], y1= _t[_bb.y];
var ww = _t[_bb.w], hh= _t[_bb.h];
var mx = mouse_x, my = mouse_y;

if (mx >= x1 && mx<=x1+ww && my>=y1 && my<=y1+hh) {
    if (!_t[_bb._state_hover]) {
        _t[@ _bb._state_hover] = true;
        _t[@ _bb._fire_ev_enter] = true;
    }
    if (mouse_check_button_pressed(mb_left)) {
        if (_t[_bb.istoggle]) {
            _t[@ _bb._state_active] = !_t[_bb._state_active];
        } 
        _t[@ _bb._state_pressed] = true;
        _t[@ _bb._fire_ev_pressed] = true;
    }
} else {
    if (_t[_bb._state_hover]) {
        _t[@ _bb._state_hover] = false;
        _t[@ _bb._fire_ev_leave] = true;
    }

}
if (mouse_check_button_released(mb_left)) {
    _t[@ _bb._state_pressed] = false;
}






#define bb_on_pressed
/// bb_on_pressed(bb)
/*
    returns true for ONLY ONE STEP if the basic button is pressed. 
    It is like checking for pressed event
*/

return argument0[_bb._fire_ev_pressed];

#define bb_on_enter
/// bb_on_enter(bb)
/*
    returns true for ONLY ONE STEP if the mouse enters the basic button. 
    It is like checking for Mouse Enter Event
*/

return argument0[_bb._fire_ev_enter];

#define bb_on_leave
/// bb_on_leave(bb)
/*
    returns true for ONLY ONE STEP if the mouse leaves the basic button. 
    It is like checking for Mouse Leave Event
*/

return argument0[_bb._fire_ev_leave];

#define bb_is_hover
/// bb_is_hover(bb)
/*
    returns true if the mouse is hover the basic button
*/

return argument0[_bb._state_hover];

#define bb_is_pressed
/// bb_is_pressed(bb)
/*
    returns true if the bassic button is pressed
*/

return argument0[_bb._state_pressed];

#define bb_get_active
/// bb_get_active(bb)
/*
    Return true if a basic button that is a toggle button (setted with bb_set_toggle) is down.
    Return false if it is up, or if the bb is not a toggle button. 
*/

if (argument0[_bb.istoggle] && argument0[_bb._state_active]) {
    return true;
}
return false;

#define bb_set_active
/// bb_set_active(bb, active)
/*
    Sets the active state of a basic button that is a toggle button (setted with bb_set_toggle).
    If active is true, the button will be down. If active is false, the button will be up.
*/

if (argument0[_bb.istoggle]) {
    argument0[@ _bb._state_active] =argument1;
}

#define bb_set_toggle
/// bb_set_toggle( bb, is_toggle )
/*
    Set a basic button as a toggle button (is_toggle = true) 
    or as a normal button (is_toggle = false)
*/

argument0[@ _bb.istoggle] = argument1;

#define bb_set_width
/// bb_set_width(bb[, width=autosize]);
/*
    Sets the width of the button. If you don't pass a width, the 
    width is setted to autosize mode, in wich case, it is 
    autocalculated in base of the text of the button.
    
    Example: 
        // Sets the button yes to 200 pixels width
        bb_set_width( button_yes, 200, 40); 
        // Eneable the width autosize feature in the button no
        bb_set_width( button_yes); 
        
    Note: the size only applies when the button is an 9grid button.
*/

var _t = argument[0];
if (argument_count==1) { // Autosize
    _t[@ _bb.autosize_w] = true;
} else { // manual size
    _t[@ _bb.autosize_w] = false;
    _t[@ _bb.w] = argument[1];
}


#define bb_set_height
/// bb_set_height(bb[, height=autosize]);
/*
    Sets the height of the button. If you don't pass a height, the 
    height is setted to autosize mode, in wich case, it is 
    autocalculated in base of the text of the button.
    
    Example: 
        // Sets the button yes to 40 pixels height
        bb_set_height( button_yes,  40); 
        // Eneable the height autosize feature in the button no
        bb_set_height( button_yes); 
        
    Note: the size only applies when the button is an 9grid button.
*/

var _t = argument[0];
if (argument_count==1) { // Autosize
    _t[@ _bb.autosize_h] = true;
} else { // manual size
    _t[@ _bb.autosize_h] = false;
    _t[@ _bb.h] = argument[1];
}


#define bb_get_width
/// bb_get_width(bb)
/*
    Gets the width of the bb
*/

return argument0[_bb.w]; 

#define bb_get_height
/// bb_get_height(bb)
/*
    Gets the height of the bb
*/

return argument0[_bb.h]; 

#define bb_get_x
/// bb_get_x(bb)
/*
    Gets the x of the bb
*/

return argument0[_bb.x]; 

#define bb_get_y
/// bb_get_y(bb)
/*
    Gets the y of the bb
*/

return argument0[_bb.y]; 

#define bb_set_position
/// bb_set_position(bb,x,y)
/*
    Sets the x and y of the bb
*/

argument0[@ _bb.x]=argument1; 
argument0[@ _bb.y]=argument2; 

#define bb_set_9grid
/// bb_set_9grid(bb[,grid_left=auto,grid_top=auto])
/*
    For a 9grid sprite, sets the left position of the grid and the top position. 
    Please reffer to this post: http://yannickloriot.com/2013/03/9-patch-technique-in-cocos2d/
    
    If you don't specify grid_left and grid_top, the size of the grid is autocalculated.
*/

var _t = argument0;
if (argument_count==1) { //auto
    _t[@ _bb.grid_left] = _t[_bb._spr_w]/3;
    _t[@ _bb.grid_top] = _t[_bb._spr_h]/3;
} else { //manual
    _t[@ _bb.grid_left]=argument[1]; 
    _t[@ _bb.grid_top]=argument[2]; 
}

#define bb_set_color
/// bb_set_color( bb, text_color, text_alpha[, shadow_color, shadow_alpha, shadow_dist, shadow_dir]);
/*
    Changes the text and shaddow colour
    
    bb: the basic button index
    text_color: the text colour
    text_alpha: the text alpha
    shadow_color: the drop shadow color (optional, default=no shadow)
    shadow_alpha: the drop shadow alpha (optional, default=no shadow)
    shadow_dist: the drop shadow distance in pixels (optional, default=no shadow)
    shadow_dir: the direction of the drop shadow  (optional, default=no shadow)
*/

var _t = argument[0];

_t[@ _bb.text_color] = argument[1];
_t[@ _bb.text_alpha] = argument[2];
if (argument_count > 3) { // shadow
    _t[@ _bb.text_shadow_color] = argument[3];
    _t[@ _bb.text_shadow_alpha] = argument[4];
    _t[@ _bb.text_shadow_dis] = argument[5];
    _t[@ _bb.text_shadow_dir] = argument[6];
} else {    // no shadow
    _t[@ _bb.text_shadow_alpha] = 0;
}
#define __Default_Property_Setters_new
/// Default_Property_Setters()
/*
    To create your own property setter, simply create a new script and write: 
    
        variable = argument0;
    
    It is advised to add custom property setters outside of Default_Property_Setters
*/

#define set_x
if (argument_count==0) {return x;}
x = argument[0];

#define set_y
if (argument_count==0) {return y;}
y = argument[0];

#define set_xround
if (argument_count==0) {return x;}
x = round(argument[0]);

#define set_yround
if (argument_count==0) {return y;}
y = round(argument[0]);

#define set_speed
if (argument_count==0) {return speed;}
speed = argument[0];

#define set_hspeed
if (argument_count==0) {return hspeed;}
hspeed = argument[0];

#define set_vspeed
if (argument_count==0) {return vspeed;}
vspeed = argument[0];

#define set_direction
if (argument_count==0) {return direction;}
direction = argument[0];

#define set_depth
if (argument_count==0) {return depth;}
depth = argument[0];

#define set_friction
if (argument_count==0) {return friction;}
friction = argument[0];

#define set_gravity
if (argument_count==0) {return gravity;}
gravity = argument[0];

#define set_gravity_direction
if (argument_count==0) {return gravity_direction;}
gravity_direction = argument[0];

#define set_image_speed
if (argument_count==0) {return image_speed;}
image_speed = argument[0];

#define set_image_index
if (argument_count==0) {return image_index;}
image_index = argument[0];

#define set_image_alpha
if (argument_count==0) {return image_alpha;}
image_alpha = argument[0];

#define set_image_angle
if (argument_count==0) {return image_angle;}
image_angle = argument[0];

#define set_image_scale
if (argument_count==0) {return image_xscale;}
image_xscale = argument[0];
image_yscale = argument[0];

#define set_image_xscale
if (argument_count==0) {return image_xscale;}
image_xscale = argument[0];

#define set_image_yscale
if (argument_count==0) {return image_yscale;}
image_yscale = argument[0];

#define set_health
if (argument_count==0) {return health;}
health = argument[0];

#define set_score
if (argument_count==0) {return score;}
score = argument[0];
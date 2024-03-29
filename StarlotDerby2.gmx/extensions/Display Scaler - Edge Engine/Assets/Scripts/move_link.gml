///move_link(child, pos link, scale link);

/* 
Links an object to relatively follow the running object's position
and optionally also scale. Can be used to keep objects from separating
as a result of regular scaling operations (e.g. edgeds_draw_sprite
with 'notme' set to 'false').

argument0 = the child object or instance to link (object)
argument1 = enables or disables linking position (boolean) (true/false)
argument2 = enables or disables linking scale (boolean) (true/false)

Example usage: move_link(obj_child, true, true);
*/

/*
INITIALIZE
*/

//Set the running object as the child object's parent
argument0.parent = id;

/*
MOVEMENT LINKING
*/

//Link position, if enabled
if argument1 == true {
   //If the parent has moved...
   if x != xprevious or y != yprevious {
      //...get the distance in pixels...
      argument0.xoffset = x - xprevious;
      argument0.yoffset = y - yprevious;

      //...and apply it to each child
      with(argument0) {
         x += xoffset;
         y += yoffset;
      }
   }
}

/*
SCALE LINKING
*/

//Link scale, if enabled
if argument2 == true {
   //Get the scale offset...
   argument0.scale_xoffset = sprite_width/sprite_get_width(sprite_index);
   argument0.scale_yoffset = sprite_height/sprite_get_height(sprite_index);
   
   //...and apply it to each child
   with(argument0) {
      //Also get the position offset....
      xoffset = scale_xoffset/image_xscale;
      yoffset = scale_yoffset/image_yscale;
   
      //...apply the new scale...
      image_xscale = scale_xoffset;
      image_yscale = scale_yoffset;
   
      //...and compensate position for changes in scale
      x = parent.x + ((x - parent.x)*xoffset);
      y = parent.y + ((y - parent.y)*yoffset);
   }
}

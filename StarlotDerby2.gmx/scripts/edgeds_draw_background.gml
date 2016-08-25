///edgeds_draw_background(background, x, y, index, foreground, tile, scale mode);

/*
Sets and scales a background to one of 8 available background slots, using one 
of three types of scaling: x-y scaling, x-only scaling, or y-only scaling. Can
also optionally draw as a foreground rather than a background.

argument0 = the background to draw (background)
argument1 = the x position to draw the background (real)
argument2 = the y position to draw the background (real)
argument3 = the background index to assign the background to (integer) (0-7)
argument4 = enables or disables drawing as a foreground (boolean) (true/false)
argument5 = enables or disables tiling the background (boolean) (true/false)
argument6 = sets whether to use x-y scaling (0), x-only scaling (1), or y-only scaling (2)

Example usage: edgeds_draw_background(my_bg, view_xview[0], view_yview[0], 0, false, false, 0);
*/

/*
INITIALIZE
*/

var display_width = view_wview[global.display_view];
var display_height = view_hview[global.display_view];

/*
SET AND SCALE BACKGROUND
*/

//Set the background
if background_index[argument3] != argument0 {
   background_index[argument3] = argument0;
   background_foreground[argument3] = argument4;
   background_htiled[argument3] = argument5;
   background_vtiled[argument3] = argument5;
   background_visible[argument3] = true;
   
   //Apply background scaling across rooms
   if global.display_scale_time == 0 {
      global.display_scale_time = 1;
   }
}

//Position the background
background_x[argument3] = argument1;
background_y[argument3] = argument2;

//Scale the background
if global.display_scale_time > 0 {   
   if global.display_xscale != 0 and global.display_yscale != 0 {
      //X-Y and X-only scaling
      if argument6 == 0 or argument6 == 1 {
         //Scale width
         background_xscale[argument3] = background_yscale[argument3]*(display_width/(background_width[argument3]*background_xscale[argument3]));
         background_yscale[argument3] = background_xscale[argument3];
      }
         
      //X-Y scaling
      if argument6 == 0 {
         //Scale height
         if background_height[argument3]*background_yscale[argument3] < display_height {
            background_yscale[argument3] = background_xscale[argument3]*(display_height/(background_height[argument3]*background_yscale[argument3]));
            background_xscale[argument3] = background_yscale[argument3];
         }   
      }
         
      //Y-only scaling
      if argument6 == 2 {
         //Scale height
         background_yscale[argument3] = background_xscale[argument3]*(display_height/(background_height[argument3]*background_yscale[argument3]));
         background_xscale[argument3] = background_yscale[argument3];
      }         
   }
}

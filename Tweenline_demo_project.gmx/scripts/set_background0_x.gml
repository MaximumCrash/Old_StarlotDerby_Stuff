/// set_background0_x

// This is the SETTER script needed for the custom Background Animation example.
// With your custom setter script you can tween any variable you want. 
// In this case, we use this custom setter to animate te X position of the background 0.
// For more info, check the __tweenline_SETTERS script or the official tweenline docs
// At: http://ciberman.net/tweenline


if (argument_count==0) {return background_x[0];}
background_x[0] = argument[0];


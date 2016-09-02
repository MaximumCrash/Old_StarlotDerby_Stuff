/// scr_demo_event_repeat()
/*
    This script is used as a callback of the "repeat" 
    event in the obj_events_scripts of the events exaple.
*/

// set the colour of the sprite to a random colour
image_blend = make_colour_hsv(random(255),255, .57*255);

//increment the counter by 1
counter+=1;


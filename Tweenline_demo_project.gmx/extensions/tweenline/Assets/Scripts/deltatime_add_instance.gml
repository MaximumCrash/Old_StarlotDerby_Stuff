/// deltatime_add_instance();

if (!instance_exists(obj_deltatime)) {
    instance_create(-10000,-10000,obj_deltatime);
}

ds_list_add(global._deltatime_dslist, id); // add self to track list



_hspeed = 0;
_gravity = 0;
_vspeed = 0;
_speed = 0;
_image_speed = 0;



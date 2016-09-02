/// deltatime_system_step()
/*
Place this script in the STEP event of a persistent object.
ALERT: If you are ussing TWEENLINE system in your game, you don't have to 
use this script. The system implements this itself.

*/

var deltatime;
deltatime = delta_time/1000000;//seconds per frame
deltatime2 = BASE_TIME*deltatime;
var size = ds_list_size(global._deltatime_dslist);
show_debug_message(size);
for (var i=0; i<size; i++) {
    var obj = ds_list_find_value(global._deltatime_dslist, i);
    if (!instance_exists(obj)) {
        //ds_list_delete(list, i);
        i--; size--;
    } else { 
        with(obj) {
            x+=lengthdir_x(_gravity,gravity_direction)*_hspeed*other.deltatime2;
            y+=lengthdir_y(_gravity,gravity_direction)*_vspeed*other.deltatime2;
        }
    }
}

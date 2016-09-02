/// deltatime_system_create()
/*
Place this script in the create event of a persistent object.


*/

BASE_TIME = 30; //If you made your game from scratch set it BASE_TIME to 1.
// If not, set BASE_TIME to your current room_speed. Then, set your room speed to a high number (like 60)


global._deltatime_dslist = ds_list_create(); // list of deltatime track instances
depth=-10000000; // executes AFTER anything else



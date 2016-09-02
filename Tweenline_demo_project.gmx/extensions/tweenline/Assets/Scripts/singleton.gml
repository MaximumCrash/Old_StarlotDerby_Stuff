/// singleton()
/*

    Use this script to create a singleton persistent instance. 
    You can find more information about singleton in google. But basically, 
    the singleton model, let you have a single instance of an object that is persistent an can
    be used to control the game. (The singleton model is a lot more complex, but I adapted it to 
    be compatible to game maker studio)
    
    USAGE:
        1- call the script at the FIRST LINE OF CODE of the creation event of your obj_control or the 
        instance you want to be a singleton. In this way:
            if (singleton()) {exit;}
        2- Place this object in the first room of your game. Now, you don't need to worry for the number
         of obj_control you have. This script will permits ONLY ONE INSTANCE at time of this object. 
         
    Note: This script is used by the Tweenline Engine. Please do not delete it.
         
*/

if (instance_number(object_index)>1) {
    instance_destroy();
    return true;
}
persistent = true;
return false;

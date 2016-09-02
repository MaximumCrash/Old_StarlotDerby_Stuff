/// cv_system_init()
/*

    Inits the custom vars system. Call it once at the begining of the 
    game, before any other cv_ script.
    
    Note: If you are uning it with tweenline_engine, this call this 
    script is not necesary. Tweenline will init custom vars system 
    automatically.  
    
*/
/// =========================================================================
/*

> What are custom vars? 
    Custom vars are variables for your game maker objects, that can be created or destroyed dinamically at runtime.
    
    Custom vars are a bit slower than normal variables, so use only when you need a lazy way to create a variable.
    The principal adventages of custom vars are:
    
        => You can use cv_has([object=id,] var) to check if the specified object has the customvar "var" defined. 
        
        => You can use cv_get([object=id,] var) to get the customvar of an object, and if it does not exists, the 
        function will return undefined. If you use normal variables, you probably get a compiller error. 
        
        => Other functions you can use are cv_set, cv_delete and cv_clear_object.
    
> How do I define a custom var?
    Simply do:
    cv_set("_mycustomvar", 300);
    This will define _mycustomvar inside the current instance and set its value to 300.
    
    You can also do this to define _mycustomvar in a diferent object:
    cv_set(obj_box1, "_mycustomvar", 300);
    This will define _mycustomvar inside all the obj_box1 instances and set their value to 300.

> How do I change the value of a custom var?
    In the same way, you can use cv_set to override the value of that custom var. If the custom var does not exists 
    in the object, it will be created; if not, the value will be changed.
    
> How do I get the value of a customvar?
    // This will get the value of _mycustomvar inside the current instance:
    var myvalue1 = cv_get("_mycustomvar"); 
    // This will get the value of _mycustomvar inside obj_box1:
    var myvalue2 = cv_set(obj_box1, "_mycustomvar"); 
    
        
> But what is the relation of this with the Tweenline Engine?
    Tweenline integrates the use of custom vars. You can pass a string starting with "_" (underscore) to tell the
    system that the following value in the array will correspond with the custom var specified. 
    For Example:
    
        tween_to( id, 3, array("_mycustomvar",x+600));
        
    This, will tween the custom var "_mycustomvar" inside the current instance, from the current value to x+600.
    If the custom var "_mycustomvar" is not defined in the current instance, the It's defined and the value is set to zero.
    

ENJOY!! 

    
*/


// This map will contain:
// -- key: id of the instance
// -- value: the id of another ds_map wich contains
// ---------- key: a string with the name of the custom var
// ---------- value: the value of the custom var
global._cv_map = ds_map_create(); 

// This lis will contain the ids of the instances that has custom vars
// This is used in the garbage collector
global._cv_list = ds_list_create(); 




/// tween_system_lazy_events( eneable )
/*
    Eneable or disable the lazy events.
    The lazy events are a easy way to detect events without
    ussing extra scripts or extra events. 
    For an example of use of the lazy events check the functions tween_oncomplete, tween_onrepeat, etc. 
    
    The lazy events can cause a bit of overhead. So, if you are not using it in your game, 
    disable it at the start of your game to gain a little bost.
    
*/


global._tw_lazy_eneabled = argument0;

if (argument0 == false) {
    __tl_private_lazy_reset();
}

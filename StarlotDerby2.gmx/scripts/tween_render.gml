/// tween_render(index)
/*
    Force the rendering of the tween. 
    Normaly you don't need to use this function. The tweenline 
    engine will manage all automaticaly for you. 
    
    
*/



if (argument0[TLTWEEN.DURATION]==0) {
    var p=0;
} else {
    var p = clamp((argument0[TLTWEEN.TIME]-argument0[TLTWEEN.DELAY])/argument0[TLTWEEN.DURATION],0,1);
}
// Developers Warning: this function (__tl_private_tween_render) is compilled INLINE. 
__tl_private_tween_render(argument0,p);

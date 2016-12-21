
var t = current_time + argument0; 
if (mvc.overrideSleepHack) {

t = 0; 
mvc.overrideSleepHack = false;

exit; 

}

if (t > 0) {
mvc.currentState = speedState.ultraslowmo;
t--; 
}
else {
mvc.currentState = speedState.normal;
}



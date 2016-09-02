#define ease_quadin
///ease_quadin(progress)

return argument0*argument0;
#define ease_quadout
///ease_quadout(progress)

return -argument0*(argument0-2);


#define ease_quadinout
/// ease_quadinout(progress)

argument0+=argument0;
if (argument0 < 1) {return (argument0*argument0)*.5;}
argument0--;
return -(argument0*(argument0-2)-1)*.5;
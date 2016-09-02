#define ease_cubicin
///ease_cubicin(progress)

return (argument0*argument0*argument0);

#define ease_cubicout
///ease_cubicout(progress)
argument0=1-argument0;
return 1-(argument0*argument0*argument0);

#define ease_cubicinout
/// ease_cubicinout(progress)

argument0+=argument0;
if (argument0 < 1) {return (argument0*argument0*argument0)*.5;}
argument0=2-argument0;
return (2-(argument0*argument0*argument0))*.5;
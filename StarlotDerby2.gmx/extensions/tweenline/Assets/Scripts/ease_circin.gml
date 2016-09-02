#define ease_circin
///ease_circin(progress)

return -(sqrt(max(0,1 - argument0*argument0)) - 1);

#define ease_circout
///ease_circout(progress)

argument0--;
return sqrt(1 - argument0*argument0);

#define ease_circinout
/// ease_circinout(progress)

argument0+=argument0;
if (argument0 < 1) return -.5 * (sqrt(1 - argument0*argument0) - 1);
argument0 -= 2;
return .5 * (sqrt(1 - argument0*argument0) + 1);
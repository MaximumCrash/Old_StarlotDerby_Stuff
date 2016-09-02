#define ease_sinein
///ease_sinein(progress)

return 1-cos(argument0 * (pi/2));


#define ease_sineout
///ease_sineout(progress)

return sin(argument0 * (pi/2));

#define ease_sineinout
/// ease_sineinout(progress)

return -.5*(cos(pi*argument0) - 1);
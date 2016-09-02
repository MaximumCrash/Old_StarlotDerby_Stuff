#define ease_expoin
///ease_expoin(progress)

return power( 2, 10 * (argument0 - 1) );


#define ease_expoout
///ease_expoout(progress)

return  -power( 2, -10 * argument0 ) + 1 ;

#define ease_expoinout
/// ease_expoinout(progress)

argument0+=argument0;
if (argument0 < 1) return .5 * power( 2, 10 * (argument0 - 1) );
argument0--;
return .5 * ( -power( 2, -10 * argument0) + 2 );
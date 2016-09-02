#define ease_powin
/// ease_powin(progress, power)
var pow = 6;
if (argument_count>1) {
    if (is_real(argument[1])) {
        pow = argument[1];
    }
}
return power(argument[0],pow);

#define ease_powout
/// ease_powout(progress, power)
var pow = 6;
if (argument_count>1) {
    if (is_real(argument[1])) {
        pow = argument[1];
    }
}
return 1-power(1-argument[0],pow);

#define ease_powinout
/// ease_powinout(progress, power)
var pow = 6;
if (argument_count>1) {
    if (is_real(argument[1])) {
        pow = argument[1];
    }
}
argument[0]+=argument[0];
if (argument[0] < 1) {return (power(argument[0],pow))*.5;}
argument[0]=2-argument[0];
return 1-abs(power(argument[0],pow))*.5;
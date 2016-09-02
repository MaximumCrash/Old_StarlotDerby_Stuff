/// tween_core(type, currentTime, startValue, deltaValue, duration [, param1 [, param2 [, param3]]])
/* 
    Author: Javier Mora (Ciberman)
    
    Adapted from Sources:
        http://gizma.com/easing/
        http://greensock.com/gsap-as (download GSAP and go to "com/greensock/easing" inside the source code)
    From ActionScript 3.0 to Game Maker Lenguaje by Javier Mora (Ciberman) 
    
    
__________________________________
   
CURRENT Supported "type" aruments: 
COUNT: 27 DIFFERENT EASES!!! 

== IN ==    == OUT ==   == IN/OUT ==                        
quadin      quadout     quadinout        (CLASIC)
cubicin     cubicout    cubicinout       
quartin     quartout    quartinout
quintin     quintout    quintinou
sinein      sineout     sineinout
expoin      expoout     expoinout
circin      circout     circinout
bouncein    bounceout   bounceinout
backin      backout     backinout

== OTHER ==
linear      slowmotion  
___________________________________
    
   ///////////////////////////////////////////////
  ////////// SPECIFIC CONFIGURATION /////////////
 ///////////////////////////////////////////////

If you pass a NON REAL argument, the default value is used instaed. 
 
==== back (in/out/inout) configuration ====

param1: 
    _overshot: Overshoot affects the degree or strength of the overshoot.
    The default is 1.70158.

param2: 
    Not used.
    
param3:
    Not used.
        
    
==== slowmotion configuration ====

param1:
    _linearRatio: The proportion of the ease during which the rate of change will be linear (steady pace). 
     This should be a number between 0 and 1. For example, 0.5 would be half, so the first 25% of the ease 
     would be easing out (decelerating), then 50% would be linear, then the final 25% would be easing in 
     (accelerating). If you choose 0.8, that would mean 80% of the ease would be linear, leaving 10% on each
     end to ease. 
     The default is 0.7.
     
param2:       
    _power: The strength of the ease at each end. If you define a value above 1, it will actually reverse 
     the linear portion in the middle which can create interesting effects. 
     The default is 0.7  
     
param3:
    _yoyoMode If true, the ease will reach its destination value mid-tween and maintain it during the 
     entire linear mode and then go back to the original value at the end (like a yoyo of sorts). This
     can be very useful if, for example, you want the alpha (or some other property) of some text to
     fade at the front end of a SlowMo positional ease and then back down again at the end of that 
     positional SlowMo tween. Otherwise you would need to create separate tweens for the beginning 
     and ending fades that match up with that positional tween. 
     The default is false.
     
     

*/

var t, b, c, d, p, v;
t=argument[1];
b=argument[2];
c=argument[3];
d=argument[4];

switch (string_lower(string(argument[0]))) {
    // linear interpolation
    case "linear": {
        return c*t/d + b;
    }
    
    // quadratic easing in - accelerating from zero velocity
    case "quadin": {
        t /= d;
        return c*t*t + b;
    }
    
    // quadratic easing out - decelerating to zero velocity
    case "quadout": {
        t /= d;
        return -c * t*(t-2) + b;
    }
    
    // quadratic easing in/out - acceleration until halfway, then deceleration
    case "quadinout": {
        t /= d/2;
        if (t < 1) return c/2*t*t + b;
        t--;
       return -c/2 * (t*(t-2) - 1) + b;
    }
    
    // cubic easing in - accelerating from zero velocity
    case "cubicin":{
        t /= d;
        return c*t*t*t + b;
    }
    
    // cubic easing out - decelerating to zero velocity
    case "cubicout": {
        t /= d;
        t--;
        return c*(t*t*t + 1) + b;
    }
    
    // cubic easing in/out - acceleration until halfway, then deceleration
    case "cubicinout": {
        t /= d/2;
        if (t < 1) return c/2*t*t*t + b;
        t -= 2;
        return c/2*(t*t*t + 2) + b;
    }
    
    // quartic easing in - accelerating from zero velocity
    case "quartin": {
        t /= d;
        return c*t*t*t*t + b;
    }
    
    // quartic easing out - decelerating to zero velocity
    case "quartout": {
        t /= d;
        t--;
        return -c * (t*t*t*t - 1) + b;
    }
    
    // quartic easing in/out - acceleration until halfway, then deceleration
    case "quartinout": {
        t /= d/2;
        if (t < 1) return c/2*t*t*t*t + b;
        t -= 2;
        return -c/2 * (t*t*t*t - 2) + b;
    }
    
    // quintic easing in - accelerating from zero velocity
    case "quintin": {
        t /= d;
        return c*t*t*t*t*t + b;
    }
    
    // quintic easing out - decelerating to zero velocity
    case "quintout": {
        t /= d;
        t--;
        return c*(t*t*t*t*t + 1) + b;
    }
    
    // quintic easing in/out - acceleration until halfway, then deceleration
    case "quintinout": {
        t /= d/2;
        if (t < 1) return c/2*t*t*t*t*t + b;
        t -= 2;
        return c/2*(t*t*t*t*t + 2) + b;
    }
    
    // sinusoidal easing in - accelerating from zero velocity
    case "sinein": {
        return -c * cos(t/d * (pi/2)) + c + b;
    }
    
    // sinusoidal easing out - decelerating to zero velocity
    case "sineout": {
        return c * sin(t/d * (pi/2)) + b;
    }
    
    // sinusoidal easing in/out - accelerating until halfway, then decelerating
    case "sineinout": {
        return -c/2 * (cos(pi*t/d) - 1) + b;
    }
    
    // exponential easing in - accelerating from zero velocity
    case "expoin": {
        return c * power( 2, 10 * (t/d - 1) ) + b;
    }
    
    // exponential easing out - decelerating to zero velocity
    case "expoout": {
        return c * ( -power( 2, -10 * t/d ) + 1 ) + b;
    }
    
    // exponential easing in/out - accelerating until halfway, then decelerating
    case "expoinout": {
        t /= d/2;
        if (t < 1) return c/2 * power( 2, 10 * (t - 1) ) + b;
        t--;
        return c/2 * ( -power( 2, -10 * t) + 2 ) + b;
    }
    
    // circular easing in - accelerating from zero velocity
    case "circin": {
        t /= d;
        return -c * (sqrt(1 - t*t) - 1) + b;
    }
    
    // circular easing out - decelerating to zero velocity
    case "circout": {
        t /= d;
        t--;
        return c * sqrt(1 - t*t) + b;
    }
    
    // circular easing in/out - acceleration until halfway, then deceleration
    case "circinout": {
        t /= d/2;
        if (t < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b;
        t -= 2;
        return c/2 * (sqrt(1 - t*t) + 1) + b;
    }
    
    // bounce easing in - accelerating from zero velocity
    case "bouncein": {
        p = 1- (t/d);
        if (p < 1 / 2.75) {
            v = 1 - (7.5625 * p * p);
        } else if (p < 2 / 2.75) {
            p -= 1.5/ 2.75;
            v =  1 - (7.5625 * (p ) * p + .75);
        } else if (p < 2.5 / 2.75) {
            p -= 2.25/ 2.75;
            v =  1 - (7.5625 * (p) * p + .9375);
        } else {
            p -= 2.625/ 2.75;
            v =  1 - (7.5625 * (p) * p + .984375);
        }
        return v*c + b;
    }
    
    
    // bounce easing out - decelerating to zero velocity
    case "bounceout": {
        p = t/d;
        if (p < 1 / 2.75) {
            v = 7.5625 * p * p;
        } else if (p < 2 / 2.75) {
            p -= 1.5/ 2.75;
            v =  7.5625 * (p) * p + .75;
        } else if (p < 2.5 / 2.75) {
            p -= 2.25/ 2.75;
            v =  7.5625 * (p) * p + .9375;
        } else {
            p -= 2.625/ 2.75;
            v =  7.5625 * (p) * p + .984375;
        }
        return v*c + b;
    }
    
    // bounce easing in/out - acceleration until halfway, then deceleration
    case "bounceinout": {
        p = t/d;
        var invert;
        invert = false;
        if (p < 0.5) {
            invert = true;
            p = 1 - (p * 2);
        } else {
            p = (p * 2) - 1;
        }
        if (p < 1 / 2.75) {
            p = 7.5625 * p * p;
        } else if (p < 2 / 2.75) {
            p -= 1.5/ 2.75;
            p = 7.5625 * (p) * p + .75;
        } else if (p < 2.5 / 2.75) {
            p -= 2.25/ 2.75;
            p = 7.5625 * (p) * p + .9375;
        } else {
            p -= 2.625/ 2.75;
            p = 7.5625 * (p) * p + .984375;
        }
        if (invert) {
            v = (1 - p) * 0.5;
        } else {
            v = p * 0.5 + 0.5;
        }
        return v*c + b;
    }
    
    // back easing in - accelerating from zero velocity
    case "backin": {
        var OVERSHOT;
        OVERSHOT = 1.70158; // CHANCGE THIS TO CUSTOM (overshoot affects the degree or strength of the overshoot)
        if (argument_count>=6) {
            if (is_real(argument[5])) {
                OVERSHOT = argument[5];
            }
        }
        p = t/d;
        return (p * p * ((OVERSHOT + 1) * p - OVERSHOT))*c + b;
    }
    
    // back easing out - decelerating to zero velocity
    case "backout": {
        var OVERSHOT;
        OVERSHOT = 1.70158; // CHANCGE THIS TO CUSTOM (overshoot affects the degree or strength of the overshoot)
        if (argument_count>=6) {
            if (is_real(argument[5])) {
                OVERSHOT = argument[5];
            }
        }
        p = (t/d) - 1;
        return (p * p * ((OVERSHOT + 1) * p + OVERSHOT) + 1)*c + b;
    }
    
    // back easing in/out - acceleration until halfway, then deceleration
    case "backinout": {
        var OVERSHOT,_p2;
        OVERSHOT = 1.70158; // CHANCGE THIS TO CUSTOM (overshoot affects the degree or strength of the overshoot)
        if (argument_count>=6) {
            if (is_real(argument[5])) {
                OVERSHOT = argument[5];
            }
        }
        _p2 = OVERSHOT * 1.525;
        p = t/d;
        p*=2;
        if (p < 1) {
            v= 0.5 * p * p * ((_p2 + 1) * p - _p2);
        } else {
            p -= 2;
            v = 0.5 * (p * p * ((_p2 + 1) * p + _p2) + 2);
        }
        return v*c + b;
    }
    
    
    // back easing in - accelerating from zero velocity
    case "slowmotion": {
        // CONFIGURATION
        var _linearRatio, _power, _yoyoMode, _p, _p1, _p2, _p3, _calcEnd, r;
        _linearRatio = 0.7;       
        _power = 0.7; 
        _yoyoMode = false;
            
        if (argument_count>=6) {
            if (is_real(argument[5])) {
                _linearRatio = argument[5];
            }
        }
        if (argument_count>=7) {
            if (is_real(argument[5])) {
                _power = argument[6];
            }
        }
        if (argument_count>=8) {
            if (is_real(argument[5])) {
                _yoyoMode = argument[7];
            }
        }
    
        // SETUP
        p = t/d;
        if (_linearRatio > 1) {
            _linearRatio = 1;
        }
        _p = 0;
        if (_linearRatio != 1) {
            _p = _power;
        }
        _p1 = (1 - _linearRatio) / 2;
        _p2 = _linearRatio;
        _p3 = _p1 + _p2;
        _calcEnd = _yoyoMode;
        /// Maths
        r = p + (0.5 - p) * _p;
        if (p < _p1) {
            if (_calcEnd) {
                p = 1 - (p / _p1);
                v = 1 - (p * p);
            } else {
                p = 1 - (p / _p1);
                v = r - (p * p * p * p * r);
            }
        } else if (p > _p3) {
            if (_calcEnd) {
                p = (p - _p3) / _p1;
                v = 1 - p * p;
            } else {
                p = (p - _p3) / _p1;
                v = r + ((p - r) * p * p * p * p);
            }
        } else {
            if (_calcEnd) {
                v = 1;
            } else {
                v = r;
            }
        }
        return v*c + b;
    }


    
    
    // default: quadratic easing quad in/out - acceleration until halfway, then deceleration
    default: { 
        t /= d/2;
        if (t < 1) return c/2*t*t + b;
        t--;
       return -c/2 * (t*(t-2) - 1) + b;
    }
}
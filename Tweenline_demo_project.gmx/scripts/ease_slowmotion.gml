/// ease_slowmotion(progress [, linearRatio=0.7 [, power=0.7 [, yoyoMode=false]]])

// CONFIGURATION
var p,_linearRatio, _power, _yoyoMode, _p, _p1, _p2, _p3, _calcEnd, r;
_linearRatio = 0.7;       
_power = 0.7; 
_yoyoMode = false;
    
if (argument_count>1) {
    if (is_real(argument[1])) {
        _linearRatio = argument[1];
    }
}
if (argument_count>2) {
    if (is_real(argument[2])) {
        _power = argument[2];
    }
}
if (argument_count>3) {
    if (is_real(argument[3])) {
        _yoyoMode = argument[3];
    }
}

// SETUP
p = argument[0];
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
        return 1 - (p * p);
    } else {
        p = 1 - (p / _p1);
        return r - (p * p * p * p * r);
    }
} else if (p > _p3) {
    if (_calcEnd) {
        p = (p - _p3) / _p1;
        return 1 - p * p;
    } else {
        p = (p - _p3) / _p1;
        return r + ((p - r) * p * p * p * p);
    }
} else {
    if (_calcEnd) {
        return 1;
    } else {
        return r;
    }
}

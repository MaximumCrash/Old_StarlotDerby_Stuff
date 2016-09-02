#define ease_elasticin
/// ease_elasticin(progress)
var t = argument[0], ts=t*t, tc=ts*t;
return (33*tc*ts -106*ts*ts + 126*tc -67*ts + 15*t);

#define ease_elasticout
/// ease_elasticout(progress)
var t = 1-argument[0], ts=t*t, tc=ts*t;
return 1-(33*tc*ts - 106*ts*ts + 126*tc - 67*ts + 15*t);



#define ease_elasticinout
/// ease_elasticinout(progress)
var t = argument[0]+argument[0];
if (t<1) { 
    t=1-t;
    var ts=t*t, tc=ts*t;
    return 0.5-.5*(33*tc*ts -106*ts*ts + 126*tc -67*ts + 15*t); 
}
t--;
var ts=t*t, tc=ts*t;
return .5+.5*(33*tc*ts + -106*ts*ts + 126*tc + -67*ts + 15*t);

/*
argument0+=argument0;
if (argument0 < 1) {return (argument0*argument0)*.5;}
argument0--;
return -(argument0*(argument0-2)-1)*.5;

*/
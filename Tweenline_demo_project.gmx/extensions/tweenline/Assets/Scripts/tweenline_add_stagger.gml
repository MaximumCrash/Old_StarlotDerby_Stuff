/// tweenline_add_stagger(tweenline, tweenIndex, staggerNumbers, staggerTime);
// creates an stagger and add its to the end of the tweenline
//   (see tween_create_stagger for more info about staggers tweenlines)
//   (see tweenline_create for more info about timeline tweenlines)


var st, i,size;
st = tween_create_stagger(argument1, argument2, argument3);
return tweenline_combine_tweenline(argument0, st,false,false);
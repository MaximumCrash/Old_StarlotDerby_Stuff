/// array(value1, value2, value_n...)
/*
    Use this method to create an array with up to 16 elements.
    ___________________________________
    
    Example:
    
    // this:
    var a = array(123, "fox", 4.5 , "ciberman", false);
    
    // is the same as: (but shorter)
    var a;
    a[0] = 123;
    a[1] = "fox";
    a[2] = 4.5;
    a[3] = "ciberman";
    a[4] = false;
    
    
    _______________________
    
    Note:   This script is not used directly by the Tweenline system. But can be useful 
            to create arrays in one line of code. check tween_to for more details.

*/
var a;
for (var i=0;i<argument_count;i++){
    a[i] =argument[i];
}
return a;

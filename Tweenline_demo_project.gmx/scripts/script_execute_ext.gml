//// script_execute_ext(script, argumentsArray)
/*
    Executes a script, and use an array as argument
    
    Example:
    if you want to call my_script(1,2,4); in a dynamic way, you can use:
        script_execute_ext(my_script, array(1,2,4));

    Note: this script is used by Tweenline Engine's event system. Do not delete it. 
    
*/

if (!is_undefined(argument0)) { 
    var s = argument0, a = argument1;
    switch (array_length_1d(a)) {
        case 0: return script_execute(s); break;
        case 1: return script_execute(s,a[0]); break;
        case 2: return script_execute(s,a[0],a[1]); break;
        case 3: return script_execute(s,a[0],a[1],a[2]); break;
        case 4: return script_execute(s,a[0],a[1],a[2],a[3]); break;
        case 5: return script_execute(s,a[0],a[1],a[2],a[3],a[4]); break;
        case 6: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5]); break;
        case 7: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6]); break;
        case 8: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]); break;
        case 9: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]); break;
        case 10: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9]); break;
        case 11: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]); break;
        case 12: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11]); break;
        case 13: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12]); break;
        case 14: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13]); break;
        default: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14]); break;
    }
}
return undefined;

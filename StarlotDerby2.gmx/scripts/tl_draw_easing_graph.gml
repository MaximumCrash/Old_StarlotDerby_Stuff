/// tl_draw_easing_graph(ecuation_formula_or_tween, x1, y2, x2, y2 [, linewidth=1 [, pixelPrecision=5]]);
/*
Draws an easing ecuation or the easing ecuation of a tween, in the rectangle specified.
You can also change the line width and the pixel precision. If the pixel precision is a very low value,
it means that It will need more time to render the desired function. 
Use this function for debug purposes only. 

You need to call draw_aa_init at the beginin of your game to use the antialised line.

TODO: Optimize this function
UPDATE: 08/12/2015 - OPTIMIZED :) . Added pixelPrecision argument.

UPDATE: 19/12/2015 - Added support to use antialised lines. If you don't want AA lines, 
        remove the call to draw_line_width_aa and replace it by draw_line_width
*/
var ease = argument[0];
if (tween_exists(ease)) {
    ease = tween_get_ease(ease);
}
if (script_exists(ease)) {
    
    var xpos = argument[1]; //The X coordinate of the top left corner of the graph
    var ypos = argument[2]; //The Y coordinate of the top left corner of the graph
    var width = argument[3]-xpos; //The width of the graph
    var height = argument[4]-ypos; //The height of the graph
    if (argument_count>5) {
        linewidth = argument[5];
    } else {
        linewidth = 1;
    }
    if (argument_count>6) {
        var dif = argument[6]/width;
    } else {
        var dif = 5/width;
    }
    
    
    var arrx, arry, count=0;
    for(var i=0; i<1; i+= dif) {
        arrx[count] = i;
        arry[count++] = 1-script_execute(ease,i);
    }
    arrx[count]=1;
    arry[count]=1-script_execute(ease,1);

    for (var i=0, j=0;i<count;i++) {
        j++;
        draw_line_width_aa(
            xpos+ arrx[i]*width, 
            ypos+ arry[i]*height, 
            xpos+ arrx[j]*width, 
            ypos+ arry[j]*height,
            linewidth
        );
    }
}

/// tl_draw_graph_line(ecuation_formula, x1, y2, x2, y2 [, linewidth=1 [, pixelPrecision=5]]);
/*
By Javier H. Mora (Ciberman)

OPTIMIZED
*/

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
    arry[count++] = 1-script_execute(argument[0],i);
}
arrx[count]=1;
arry[count]=1-script_execute(argument[0],i);


var j=0;
for (var i=0;i<count;i+=1) {
    j++;
    draw_line_width(
        xpos+ arrx[i]*width, 
        ypos+ arry[i]*height, 
        xpos+ arrx[j]*width, 
        ypos+ arry[j]*height,
        linewidth
    );
}
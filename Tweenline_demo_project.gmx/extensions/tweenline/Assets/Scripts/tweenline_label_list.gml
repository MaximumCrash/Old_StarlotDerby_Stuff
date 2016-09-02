/// tweenline_label_list( tweenline );
/*
    Returns a ds_list with all the labels inside the tweenline
*/

var d = ds_list_create();
ds_list_copy(d, argument0[TLTIMELINE.LABELS_LIST]);
return d;


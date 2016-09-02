/// array_join( arr1, arr2);
/*
    Joins two arrays and returns it.

*/


// Yeah! One line bitches! It's super portable... 
for (var i=0, size1 = array_length_1d(argument0), size2 = array_length_1d(argument1)-1; i<size2; i++;) {argument0[size1+i]=argument1[i];}return argument0;

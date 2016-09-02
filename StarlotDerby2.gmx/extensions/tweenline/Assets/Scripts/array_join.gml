/// array_join( arr1, arr2);
/*
    Joins two arrays and returns a new array.
    Example: 
        var array1 = array( 1, 2, 3);
        var array2 = array( 4, 5); 
        var array3 = array_join( array1, array2);
        // array3 is {1, 2, 3, 4, 5}
*/


// Yeah! One line bitches! It's super portable... 
for (var i=0, size1 = array_length_1d(argument0), size2 = array_length_1d(argument1)-1; i<size2; i++;) {argument0[size1+i]=argument1[i];}return argument0;

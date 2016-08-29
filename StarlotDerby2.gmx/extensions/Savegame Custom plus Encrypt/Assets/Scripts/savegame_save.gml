var list, path;

list = ds_list_create();

// PLACE YOUR VARIABLES HERE

list[| 0] = name;
list[| 1] = level;
list[| 2] = hp;
list[| 3] = mp;
list[| 4] = ep;
for (var i=0; i<10; i++) {
  list[| 5+i] = item[i];
}

// file save and encryption

path = working_directory+'savegame'; // file path
if (file_exists(path)) { // check file in directory
  file_delete(path); // delete old file
}
str = ds_list_write(list); // write your variables in string
string_save_encrypted(str, path); // encrypt string and save to file

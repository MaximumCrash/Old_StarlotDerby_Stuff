var path, list;

// file load and decryption

path = working_directory+'savegame'; // file path, please don't change, may not work 

if (file_exists(path)) { // check file in directory
  str = string_load_encrypted(path);
  list = ds_list_create(); // create list for vars
  ds_list_read(list, str); // add vars from string
  
  // PLACE YOUR VARIABLES HERE IN THE SAME ORDER AS IN THE SAVEGAME_SAVE SCRIPT
  
  name = list[| 0];
  level = list[| 1];
  hp = list[| 2];
  mp = list[| 3];
  ep = list[| 4];
  for (var i=0; i<10; i++) {
    item[i] = list[| 5+i];
  }  
}

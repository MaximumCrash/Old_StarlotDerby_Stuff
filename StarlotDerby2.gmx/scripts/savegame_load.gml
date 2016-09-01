var path, list;

// file load and decryption

path = working_directory+'savegame'; // file path, please don't change, may not work 

if (file_exists(path)) { // check file in directory
  str = string_load_encrypted(path);
  list = ds_list_create(); // create list for vars
  ds_list_read(list, str); // add vars from string
  
  // PLACE YOUR VARIABLES HERE IN THE SAME ORDER AS IN THE SAVEGAME_SAVE SCRIPT
manager.stats[0] = list[| 0];
manager.stats[1] = list[| 1];
manager.stats[2] = list[| 2];
manager.stats[3] = list[| 3];
manager.stats[4] = list[| 4];
manager.stats[5] = list[| 5];
manager.stats[6] = list[| 6];
manager.equip[0] = list[| 7];
manager.setting[0] = list[| 8];
manager.setting[1] = list[| 9];
manager.setting[2] = list[| 10];
manager.setting[3] = list[| 11];
manager.player[0] = list[| 12];
manager.player[1] = list[| 13];
manager.player[2] = list[| 14];
manager.player[3] = list[| 15];
manager.gifts = list[| 16];

for (var i=0; i<ds_list_size(manager.gems); i++) {
  manager.gems[| i] = list[| 17+i];
}

}
else {
new_game(); 
}

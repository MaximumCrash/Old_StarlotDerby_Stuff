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
manager.equip[3] = list[| 8];
manager.equip[4] = list[| 9];
manager.equip[5] = list[| 10];
manager.setting[0] = list[| 11];
manager.setting[1] = list[| 12];
manager.setting[2] = list[| 13];
manager.setting[3] = list[| 14];
manager.player[0] = list[| 15];
manager.player[1] = list[| 16];
manager.player[2] = list[| 17];
manager.player[3] = list[| 18];
manager.gifts = list[| 19];

ds_list_add(manager.savelist, "STAT 0: " + string(manager.stats[0]));
ds_list_add(manager.savelist, "STAT 1: " + string(manager.stats[1]));
ds_list_add(manager.savelist, "STAT 2: " + string(manager.stats[2]));
ds_list_add(manager.savelist, "STAT 3: " + string(manager.stats[3]));
ds_list_add(manager.savelist, "STAT 4: " + string(manager.stats[4]));
ds_list_add(manager.savelist, "STAT 5: " + string(manager.stats[5]));
ds_list_add(manager.savelist, "STAT 6: " + string(manager.stats[6]));
ds_list_add(manager.savelist, "Bat Equipped: " + string(manager.equip[0]));
ds_list_add(manager.savelist, "Gem 0 Equipped: " + string(manager.equip[3]));
ds_list_add(manager.savelist, "Gem 1 Equipped: " + string(manager.equip[4]));
ds_list_add(manager.savelist, "Gem 2 Equipped: " + string(manager.equip[5]));
ds_list_add(manager.savelist, "SETTING 0: " + string(manager.setting[0]));
ds_list_add(manager.savelist, "SETTING 1: " + string(manager.setting[1]));
ds_list_add(manager.savelist, "SETTING 2: " + string(manager.setting[2]));
ds_list_add(manager.savelist, "SETTING 3: " + string(manager.setting[3]));
ds_list_add(manager.savelist, "Current EXP: " + string(manager.player[0]));
ds_list_add(manager.savelist, "Highest Batting Score: " + string(manager.player[1]));
ds_list_add(manager.savelist, "Highest Pitching Score: " + string(manager.player[2]));
ds_list_add(manager.savelist, "Current Coins: " + string(manager.player[3]));
ds_list_add(manager.savelist, "Gift Storage: " + string(manager.gifts));
ds_list_add(manager.savelist, "GEM LIST SIZE: " + string(ds_list_size(manager.gems)));

for (var i=0; i<ds_list_size(manager.gems); i++) {
  manager.gems[| i] = list[| 20+i];
  ds_list_add(manager.savelist, "Gem " + string(i) + ": "+ string(manager.gems[| i]));
}



}
else {
new_game(); 
}

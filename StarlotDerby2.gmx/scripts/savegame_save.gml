var list, path;

list = ds_list_create();
ds_list_add(manager.list, "Saving Game Data...");
csv_save("ilist",manager.itemList,",");

// PLACE YOUR VARIABLES HERE

list[| 0] = manager.stats[0];
list[| 1] = manager.stats[1];
list[| 2] = manager.stats[2];
list[| 3] = manager.stats[3];
list[| 4] = manager.stats[4];
list[| 5] = manager.stats[5];
list[| 6] = manager.stats[6];
list[| 7] = manager.equip[0];
list[| 8] = manager.equip[3];
list[| 9] = manager.equip[4];
list[| 10] = manager.equip[5];
list[| 11] = manager.setting[0];
list[| 12] = manager.setting[1];
list[| 13] = manager.setting[2];
list[| 14] = manager.setting[3];
list[| 15] = manager.player[0];
list[| 16] = manager.player[1];
list[| 17] = manager.player[2];
list[| 18] = manager.player[3];
list[| 19] = manager.gifts;

var postUnlockCount = 20;

for (var b=0; b<array_height_2d(manager.unlocked); b++) {
    list[| 20+b] = manager.unlocked[b];
    postUnlockCount++;
}

for (var i=0; i<ds_list_size(manager.gems); i++) {
    list[| postUnlockCount+i] = manager.gems[| i];
}

// file save and encryption

path = working_directory+'savegame'; // file path
if (file_exists(path)) { // check file in directory
  file_delete(path); // delete old file
}
str = ds_list_write(list); // write your variables in string
string_save_encrypted(str, path); // encrypt string and save to file

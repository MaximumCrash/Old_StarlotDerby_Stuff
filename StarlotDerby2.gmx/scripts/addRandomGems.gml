/***************************************************
  addRandomGems() - Last Edited 9/23/2016
  
  -This script is not necessary and is only good
    for testing the capabilities of DS List saving.
    
  See savegame_save() and savegame_load() for DS List saving. 
 ***************************************************/
var temp = irandom_range(0, array_height_2d(gemList) - 1)
ds_list_add(manager.gems, temp);
ds_list_add(manager.list, "Added Gem: " + "#" + string(temp) + " " + string(gemList[tempGem, 0]));

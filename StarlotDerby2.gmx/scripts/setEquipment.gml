/***************************************************
  setEquipment - Last Edited 9/23/2016
  
  -First we build our Curse by checking what Gems 
    we have set inside of our equip[#] variables.
  -Then we set our Stats depending on what Bat and
    Gems we have equiped. 
    
  See buildCurse(); for more on Gems. 
 ***************************************************/
ds_list_add(manager.list, "Building Equipment...");

//Set GEMS
buildCurse();

//Set STATS
manager.equip[1] = real(manager.itemList[argument0, 1]) + manager.powerCurseExtra;
manager.equip[2] = real(manager.itemList[argument0, 2]) + manager.speedCurseExtra;

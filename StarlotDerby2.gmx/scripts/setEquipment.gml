ds_list_add(manager.list, "Building Equipment...");
//RESET Curse Effected Values
manager.powerCurseExtra = 0;
manager.speedCurseExtra = 0;
manager.feverSafety = 0;
manager.futureChance = 0;
manager.snipeChance = 0;
manager.foggyWindows = false;
manager.earthquake = false;
manager.wavy = false;
manager.wizKid = false;
manager.multiplier = 1;


//Set GEMS
manager.itemList[argument0,4] = manager.equip[3];
manager.itemList[argument0,5] = manager.equip[4];
manager.itemList[argument0,6] = manager.equip[5];
buildCurse(); 

//Set STATS
manager.equip[1] = real(manager.itemList[argument0,1]) + manager.powerCurseExtra;
manager.equip[2] = real(manager.itemList[argument0,2]) + manager.speedCurseExtra;





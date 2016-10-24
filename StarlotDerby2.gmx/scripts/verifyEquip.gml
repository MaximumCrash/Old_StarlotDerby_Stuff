/***************************************************
  verifyEquip() - Last Edited 10/13/16
  
  This script is our second security measure for our
  unlockable bats. 
  
  It verifies that what we currently have equipped 
  exists in our unlocked array. 
  
  If everything is not ok, we will assume we have a 
  hacker on our hands. 
 ***************************************************/
ds_list_add(manager.list, "Verifying");
for (var b=0; b < array_height_2d(manager.unlocked); b++) {
    if (manager.unlocked[b] == manager.equip[0]) {
    
    //EVERYTHING IS OK
    ds_list_add(manager.list, "Everything is ok!");
    return 0; 
    }   
    else if (b == array_height_2d(manager.unlocked)) {
    //IF we are at the end of our loop, there's a problem!
    //It seems to be what we currently have equipped, we don't have unlocked! 
    //So we will assume that our player is a master hacker coding expert.
    ds_list_add(manager.list, "Cheater!");
    manager.equip[0] = 6464; //<-- 6464 is the code number for cheating! 
    return 1; 
    }
}

manager.equip[1] = real(manager.itemList[argument0,1]) + manager.powerCurseExtra;
manager.equip[2] = real(manager.itemList[argument0,2]) + manager.speedCurseExtra;
manager.equip[3] = manager.itemList[argument0,4];
manager.equip[4] = manager.itemList[argument0,5];
manager.equip[5] = manager.itemList[argument0,6];

manager.itemList[argument0,4] = manager.equip[3];
manager.itemList[argument0,5] = manager.equip[4];
manager.itemList[argument0,6] = manager.equip[5];


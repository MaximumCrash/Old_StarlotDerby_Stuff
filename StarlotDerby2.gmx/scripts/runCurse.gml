//This script only runs curses that are passive and not reactive

if (batShapeShift) {
//Run Shape Shift Code
currentBat = unlocked[irandom_range(array_length_1d(unlocked)-1,0)];
ds_list_add(manager.list, "Current Bat: " + manager.itemList[manager.currentBat,0]);
}

if (batOverHeat) {
//Bat over heat
chargeCount = 1.64; 
}

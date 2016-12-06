//This script only runs curses that are passive and not reactive

if (manager.batShapeShift) {
//Run Shape Shift Code
manager.currentBat = manager.unlocked[irandom_range(array_length_1d(manager.unlocked)-1,0)];
ds_list_add(manager.list, "Current Bat: " + manager.itemList[manager.currentBat,0]);
}

if (manager.batOverHeat) {
//Bat over heat
manager.chargeCount = 1.64; 
}

//Earthquake 
if (manager.earthquake) 
{
    if (random(12) >= 11) 
    {
        if (!manager.earthquakeRunning) 
        {      
            runQuake();  
        }
    } 
}


/***************************************************
  NEW_GAME -    Last Edited 10/8/2016
  
  This script is only run whenever no save file exists. 
  We set our first unlocked to be the Standard bat. 
  
  Then we call setEquipment() to initialize all of our
  equipment, which then applies the proper values. 
  
  **See setEquipment(); for more information.
  **See iList.csv for more information. 
 ***************************************************/
manager.unlocked[| 0] = 0; 
setEquipment(0); 

/***************************************************
  addFever() - Last Edited 9/23/2016
  
  -Increments our Fever by 1. 
  -If we have enough for Fever mode, startup Fever mode. 
  -NOTE: Initializing Fever mode in this script might be 
            scary, but this script only runs when we hit a ball
                soo. 
                
    See initFever() for more info. 
 ***************************************************/
if (manager.fever < manager.maxFever) {
    manager.fever++;
} else if (manager.fever == manager.maxFever) {
    initFever();
}

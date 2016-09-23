/***************************************************
  getLevel() - Last Edited 9/23/2016
  
  -First we initialize so variables for tracking.
  -Based on this formula -> (NeededXP = Level^2 + (Level-1)^2)
  
  -To get our Level we take the current player Experience from
    manager.player[0].
  -While our totalXP is less than our currentXP we'll add up the 
    totalXP based on our formula.
        -If our currentXP is greater than our totalXP we'll increment
            our current level by 1. 
        ++NOTE: We use a sudo level to check for Prestige.
        
    returns our Level. 
    
 ***************************************************/
var totalXP = 0,
    level = 0,
    sudoLevel = 0;
    

while (manager.player[0] > totalXP) {
    if (power(level, 2) + power(level - 1, 2) >= 3112)
        totalXP += 3112;
    else
        totalXP += power(level, 2) + power(level - 1, 2);

    if (manager.player[0] > totalXP) {
        level++;
        sudoLevel++; 
    }
         
    if (sudoLevel == 100) {
        manager.prestige++;
        sudoLevel = 0; 
    }
}

ds_list_add(manager.list, "CURRENT PLAYER LEVEL: " + string(level));
manager.xpRequired = totalXP;
return level;

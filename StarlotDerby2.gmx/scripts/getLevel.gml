var totalXP = 0, level = 0;

while(manager.player[0] > totalXP) 
{
    if (power(level, 2) + power(level-1,2) >= 3112) 
      totalXP += 3112;
    else 
      totalXP += power(level,2) + power(level-1,2);
    
    if (manager.player[0] > totalXP)  
        level++;
}

ds_list_add(manager.list, "CURRENT PLAYER LEVEL: " + string(level));
manager.xpRequired = totalXP;
return level; 


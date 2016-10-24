/***************************************************
  givePoint() - Last Edited 9/23/2016
  
  -Gives our player a point based on what we take in 
    for our first argument. 
  -Updates the current difficulty and adjusts it properly. 
  
  See setDifficulty() and adjustDifficulty for more info. 
 ***************************************************/
pointsToGive = argument0; 
manager.score += pointsToGive; 
//READJUST DIFFICULTY
setDifficulty(); 
adjustDifficulty();

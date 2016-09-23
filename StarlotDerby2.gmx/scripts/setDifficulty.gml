/***************************************************
  setDifficulty() - Last Edited 9/23/2016
  
  -Updates our currentDifficulty number based on
    this formula: log[100-currentLevel](score^3);
   -This formula dictates all of the ingame stuff. (See adjustDifficulty()); 
   
   -NOTE: We use sudoLevel to make sure we never go past Log of 50, 
            things get weird past this number.
   
    see adjustDifficulty() for more info. 
 ***************************************************/
var sudoLevel = manager.currentLevel;

if (sudoLevel > 50) { //This makes sure our difficulty doesn't get STOOPID high. 
    sudoLevel = 50;
}

manager.difficulty = logn(100 - sudoLevel, power(manager.score, 3));

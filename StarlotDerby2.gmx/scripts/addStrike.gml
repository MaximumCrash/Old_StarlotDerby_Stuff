/***************************************************
  addStrike() - Last Edited 9/23/2016
  
  -Adds a strike. 
  -Lowers our difficulty by 23%
  -Adjusts the difficulty appropriately. 
  -If we have 3 strikes end the game. (Run gameOver());
  -Subtracts our fever. 
 ***************************************************/
manager.strikes++;
manager.dirMulti = 1; 
if (manager.strikes == 3) {
    gameOver();
    exit;
}

//Lower Difficulty by 23%
manager.difficulty -= manager.difficultySubtract;
adjustDifficulty();
subtractFever(false);

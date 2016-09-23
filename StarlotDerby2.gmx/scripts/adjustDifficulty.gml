/***************************************************
  adjustDifficulty() - Last Edited 9/23/2016
  
  -Everything we need effected by our Difficulty changing
    needs to be in this script. 
  -The more things we add here the smarter the AI gets with
    adjusting the difficulty of the game. 
    
    see setDifficulty() for more info. 
 ***************************************************/
manager.ballSpeed = manager.minBallSpeed + floor((manager.difficulty*8)/3);
manager.pitchRange = floor(((manager.difficulty*10)/3)-2);

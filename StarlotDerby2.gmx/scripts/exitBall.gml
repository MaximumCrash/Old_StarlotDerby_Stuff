/***************************************************
  exitBall() - Last Edited 9/23/2016
  
  -First we take in a couple of arguments:
    -X coordinate of final position,
    -Y coordinate of final position,
    -If it was a foul.
    -The last direction a ball was hit. (For the multiplier)
    
  -If it was a foul
    -We check for the curse.
        -If Curse is a Go. Add a Strike.
        -No Curse? No Problem, just subtract Fever appropriately. 
  -If it's not a foul
    -Check if it was the same direction as the last.
        -If it was, up the multiplier.
        -IF not, reset the multiplier. 
    -Give us a Point and some Fever!
        
    -Then we send our ball off into the stars. 
        -We also set exitDistance so the ball can shrink
            appropriately as it leaves the atmosphere at the 
                speed of light. 
    
    See addStrike(), subtractFever(), addFever(), adjustDifficulty(),and addPoint() for more info on those. 
 ***************************************************/
exitA = argument0;
exitB = argument1;
foul = argument2;
dir = argument3;

if (foul) {
    if (manager.batRiskyBusiness) {
        if (manager.strikes < 2)
            addStrike();
    } else {
        subtractFever(true);
    }

    //Lower Difficulty by 11.5%
    manager.difficulty -= manager.difficultySubtract * .25;
    adjustDifficulty(); 
    manager.dirMulti = 1;
} else {
    if (manager.lastDirection == dir) {
        if (manager.dirMulti < manager.dirMultiMax) {
            manager.dirMulti++;
        }
    } else {
        manager.lastDirection = dir;
        manager.dirMulti = 1;
    }

    addFever();
    givePoint(floor((manager.swingCharge / (manager.swingChargeMax / 3) + 1) * manager.dirMulti));
}

exitDistance = point_distance(hitPositionX, hitPositionY, exitA, exitB);
move_towards_point(exitA, exitB, (manager.equip[1] * (manager.swingCharge / manager.swingChargeMax + 0.25)) + (manager.ballSpeed * 1.25));

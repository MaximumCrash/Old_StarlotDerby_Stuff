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
    
    if (instance_number(ballExtra) > 0) {
       with (ballExtra) 
       {
            instance_destroy(); 
       }
    }
     
    //Lower Difficulty by 11.5%
    manager.difficulty -= manager.difficultySubtract * .25;
    adjustDifficulty(); 
    manager.dirMulti = 1;
} else {
     
    
    
    
    addFever();
    givePoint(floor((manager.swingCharge / (manager.swingChargeMax / 3) + 1) * (manager.dirMulti + manager.multiplier)));
    manager.shake1 += 5;
    
    switch (floor((manager.swingCharge / (manager.swingChargeMax / 3) + 1))) {
           case 1: {
           drawTail = false; 
           manager.shake1 += 7; 
           break;
           }
           case 2: {
           drawTail = true; 
            manager.shake1 += 10.5;
           break;
           }
           case 3: {
            tailShiftHue = true; 
        screenFX.flash = true; 
        manager.shake1 += 14; 
        sleep_hack(200); 
           break;
           }
    }
     if (manager.lastDirection == dir) {
        if (manager.dirMulti < manager.dirMultiMax) {
            manager.dirMulti += 1;
        }
    } else {
        manager.lastDirection = dir;
        manager.dirMulti = 1;
    }
}
exitPositionX = exitA;
exitPositionY = exitB; 
exitDistance = point_distance(hitPositionX, hitPositionY, exitA, exitB);

//Steering 
//direction = 90;
//motion_set(direction, exitSpeed); 


if (manager.snipeChance > 0) {
if (random(manager.snipeChance) >= manager.snipeChance - 1) {
    nearestBirdX = instance_nearest(exitA,exitB,bird).x;
    nearestBirdY = instance_nearest(exitA,exitB,bird).y;
    move_towards_point(nearestBirdX,nearestBirdY,(manager.equip[1] * (manager.swingCharge / manager.swingChargeMax + 0.25)) + (manager.ballSpeed * 1.25)); 
}
}
else {
move_towards_point(exitA, exitB, (manager.equip[1] * (manager.swingCharge / manager.swingChargeMax + 0.25)) + (manager.ballSpeed * 1.25));
}

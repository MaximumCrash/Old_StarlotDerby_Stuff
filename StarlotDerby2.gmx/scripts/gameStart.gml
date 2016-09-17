//Load Field
//Load Pitch
pitcher.pitch = queuePitch();
pitcher.nextPitch = queuePitch();
//Load Game 
//Set Game Start Variables
manager.gameState = 2; 
manager.strikes = 0;
manager.canSwing = true; 
manager.swingLong = false;
manager.swingCount = 0;
manager.swingArc = 0;
manager.ballExitSpeed = 0;
manager.ballState = 0;
manager.score = 10;
manager.difficulty = 0; 
manager.dirMulti = 1;
manager.birdMulti = 1;
manager.fever = 0;
manager.maxFever = 3;

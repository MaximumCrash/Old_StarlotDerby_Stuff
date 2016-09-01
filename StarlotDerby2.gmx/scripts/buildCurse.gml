var powerUp, speedUp, extraUp, tempCurseArray, simple, simpleType, tempCheckArray;

for (var g = 0; g < array_length_1d(manager.equip)+2; g++) 
{
    if (equip[g] < 999) 
    {
        tempCurseArray = string_split(gemList[equip[g],5], "/");
        
        for (var c = 0; c < array_length_1d(tempCurseArray);c++)
        {
            tempCheckArray = string_split(tempCurseArray[c],"~");
         
            if (array_length_1d(tempCheckArray) > 1) 
            {
               //ITS A POWER 
               switch (tempCheckArray[0]) {
                    case "SUP" : {
                        manager.powerCurseExtra += tempCheckArray[1];
                        break;
                    }
                    case "SUS" : {
                        manager.speedCurseExtra += tempCheckArray[1];
                        break;
                    }
                    case "FB" : {
                        manager.feverSaftey = tempCheckArray[1];
                        break;
                    }
                    case "FS" : {
                        manager.futureChance = tempCheckArray[1]/100;
                        break;
                    }
                    case "AS" : {
                        manager.futureChance = tempCheckArray[1]/100;
                        break;
                    }
               }   
            }
            else 
            {
                if (tempCheckArray[0] == curseCount) {
                    tempCheckArray[0] = irandom_range(0, curseCound - 1);
                }
                //ITS A CURSE  
                switch (tempCheckArray[0]) 
                {
                    case 0: {
                        batShapeShift = true;
                        break;
                    }
                    case 1: {
                        batOverHeat = true;
                        break;
                    }
                    case 2: {
                        birdHappyBirthday = true;
                        break;
                    }
                    case 3: {
                        pitcherSeeingDouble = true;
                        break;
                    }
                    case 4: {
                        batRiskyBusiness = true;
                        break;
                    }
                    case 5: {
                        ballMaxSpeed = true;
                        break;
                    }
                    case 6: {
                        batSlugBat = true;
                        break;
                    }
                    case 7: {
                        batLefty = true;
                        break;
                    }
                    case 8: {
                        manager.foggyWindows = true;
                        break;
                    }
                    case 9: {
                        manager.earthquake = true;
                        break;
                    }
                    case 10: {
                        manager.wavy = true;
                        break;
                    }
                    case 11: {
                        pitcherUltraMan = true;
                        break;
                    }
                    case 12: {
                        ballGhost = true;
                        break;
                    }
                    case 13: {
                        manager.wizKid = true;
                        break;
                    }
                    case 14: {
                        manager.multiplier = 2;
                        break;
                    }
                }   
            }    
        }
        
    }
}  



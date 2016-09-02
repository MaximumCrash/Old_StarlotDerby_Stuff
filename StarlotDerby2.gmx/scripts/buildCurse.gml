var powerUp, speedUp, extraUp, tempCurseArray, simple, simpleType, tempCheckArray, maxCurses, tempCurrentStack, randoCurse;
ds_list_add(manager.list, "Building Curse...");
for (var g =3; g < array_length_1d(manager.equip); g++) 
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
                   switch (tempCheckArray[0])
                    {
                    case "16":{
                        manager.powerCurseExtra += real(tempCheckArray[1]); 
                        break;
                    }
                    case "17":{
                        manager.speedCurseExtra += real(tempCheckArray[1]);
                        break;
                    }
                    case "18":{
                        manager.feverSafety += real(tempCheckArray[1]);
                        break;
                    }
                    case "19":{
                        manager.futureChance += real(tempCheckArray[1])/100;
                        break;
                    }
                    case "20":{
                        manager.snipeChance += real(tempCheckArray[1])/100;
                        break;
                    }
                    }
            }
            else 
            {       
                if (real(tempCheckArray[0]) == curseCount-2) {
                ds_list_add(manager.list, "RANDOM!")
                    tempCheckArray[0] = irandom_range(0, curseCount - 2);
                    ds_list_add(manager.list, tempCheckArray[0]);
                }
                //ITS A CURSE  
                switch (tempCheckArray[0]) 
                {
                    case "0": {
                        batShapeShift = true;
                        break;
                    }
                    case "1": {
                        batOverHeat = true;
                        break;
                    }
                    case "2": {
                        birdHappyBirthday = true;
                        break;
                    }
                    case "3": {
                        pitcherSeeingDouble = true;
                        break;
                    }
                    case "4": {
                        batRiskyBusiness = true;
                        break;
                    }
                    case "5": {
                        ballMaxSpeed = true;
                        break;
                    }
                    case "6": {
                        batSlugBat = true;
                        break;
                    }
                    case "7": {
                        batLefty = true;
                        break;
                    }
                    case "8": {
                        manager.foggyWindows = true;
                        break;
                    }
                    case "9": {
                        manager.earthquake = true;
                        break;
                    }
                    case "10": {
                        manager.wavy = true;
                        break;
                    }
                    case "11": {
                        pitcherUltraMan = true;
                        break;
                    }
                    case "12": {
                        ballGhost = true;
                        break;
                    }
                    case "13": {
                        manager.wizKid = true;
                        break;
                    }
                    case "14": {
                        manager.multiplier = 2;
                        break;
                    }
                }   
            }    
        }
        
    }
}  



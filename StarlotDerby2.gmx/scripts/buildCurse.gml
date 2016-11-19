/***************************************************
  buildCurse() - Last Edited 9/23/2016
  
  -First we reset all curse effected Variables.
  -Then we run a loop through each of our Gem Slots. 
    -Split apart the curses associated with the specific Gem. (see gList.csv)
        -Then we run a loop through each curse of our split string. 
            -First we check if the Curse is a Power UP or an Real Curse.
                -If it's a Power, Apply results and break out of this loop. 
                -IF it's a Curse, set that Curse Variable to True, break out.\
  
                
    See gList.csv for all possible Gems.
    See cList.csv for all possible Curses and Powers. 
 ***************************************************/
var powerUp, speedUp, extraUp, tempCurseArray, simple, simpleType, tempCheckArray, maxCurses, tempCurrentStack, randoCurse;
ds_list_add(manager.list, "Building Curse...");

//REINIT Curse Effected Values
manager.powerCurseExtra = 0;
manager.speedCurseExtra = 0;
manager.feverSafety = 0;
manager.futureChance = 0;
manager.snipeChance = 0;
manager.foggyWindows = false;
manager.earthquake = false;
manager.wavy = false;
manager.wizKid = false;
manager.multiplier = 0;
manager.lastBuiltCurse = 999;


for (var g = 3; g < array_length_1d(manager.equip); g++) 
{
    if (equip[g] < 999) 
    {

        tempCurseArray = string_split(gemList[equip[g], 5], "/");

        for (var c = 0; c < array_length_1d(tempCurseArray); c++) 
        {
            tempCheckArray = string_split(tempCurseArray[c], "~");

            if (array_length_1d(tempCheckArray) > 1) 
            {

                //ITS A POWER 
                switch (tempCheckArray[0]) 
                {
                    case "16":
                        {
                            manager.powerCurseExtra += real(tempCheckArray[1]);
                            break;
                        }
                    case "17":
                        {
                            manager.speedCurseExtra += real(tempCheckArray[1]);
                            break;
                        }
                    case "18":
                        {
                            manager.feverSafety += real(tempCheckArray[1]);
                            break;
                        }
                    case "19":
                        {
                            manager.futureChance += real(tempCheckArray[1]) / 100;
                            break;
                        }
                    case "20":
                        {
                            manager.snipeChance += real(tempCheckArray[1]) / 100;
                            break;
                        }
                }
            } 
            else 
            {
                if (real(tempCheckArray[0]) == curseCount - 2) 
                {
                    tempCheckArray[0] = irandom_range(0, curseCount - 3);
                    if (manager.lastBuiltCurse != 999) 
                    {
                        if (tempCheckArray[0] == manager.lastBuiltCurse) 
                        {
                            tempCheckArray[0] = irandom_range(0, curseCount - 3);
                        }
                    } 
                    else 
                    {
                        lastBuiltCurse = tempCheckArray[0];
                    }
                    ds_list_add(manager.list, string(tempCheckArray[0]));
                }
                //ITS A CURSE  
                switch (string(tempCheckArray[0])) 
                {
                    case "0":
                        {
                            batShapeShift = true;
                            ds_list_add(manager.list, "CURSE ADDED: Bat ShapeShift");
                            break;
                        }
                    case "1":
                        {
                            batOverHeat = true;
                            ds_list_add(manager.list, "CURSE ADDED: Bat Overheating");
                            break;
                        }
                    case "2":
                        {
                            birdHappyBirthday = true;
                            ds_list_add(manager.list, "CURSE ADDED: Bird Happy Birthday");
                            break;
                        }
                    case "3":
                        {
                            pitcherSeeingDouble = true;
                            ds_list_add(manager.list, "CURSE ADDED: Pitch Seeing Double");
                            break;
                        }
                    case "4":
                        {
                            batRiskyBusiness = true;
                            ds_list_add(manager.list, "CURSE ADDED: Bat Risky Business");
                            break;
                        }
                    case "5":
                        {
                            ballMaxSpeed = true;
                            ds_list_add(manager.list, "CURSE ADDED: Ball Max Speed");
                            break;
                        }
                    case "6":
                        {
                            batSlugBat = true;
                            ds_list_add(manager.list, "CURSE ADDED: Bat Slug Bat");
                            break;
                        }
                    case "7":
                        {
                            batLefty = true;
                            ds_list_add(manager.list, "CURSE ADDED: Bat Lefty");
                            break;
                        }
                    case "8":
                        {
                            manager.foggyWindows = true;
                            ds_list_add(manager.list, "CURSE ADDED: Screen Foggy Windows");
                            break;
                        }
                    case "9":
                        {
                            manager.earthquake = true;
                            ds_list_add(manager.list, "CURSE ADDED: Screen Earthquake");
                            break;
                        }
                    case "10":
                        {
                            manager.wavy = true;
                            ds_list_add(manager.list, "CURSE ADDED: Screen Wavy");
                            break;
                        }
                    case "11":
                        {
                            pitcherUltraMan = true;
                            ds_list_add(manager.list, "CURSE ADDED: Pitch UltraMan");
                            break;
                        }
                    case "12":
                        {
                            ballGhost = true;
                            ds_list_add(manager.list, "CURSE ADDED: Ball Ghost");
                            break;
                        }
                    case "13":
                        {
                            manager.wizKid = true;
                            ds_list_add(manager.list, "CURSE ADDED: Fever Wiz Kid");
                            break;
                        }
                    case "14":
                        {
                            manager.multiplier++;
                            ds_list_add(manager.list, "CURSE ADDED: Score Multiplier");
                            break;
                        }
                }
            }
        }
    }
}

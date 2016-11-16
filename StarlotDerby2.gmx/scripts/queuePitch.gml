/***************************************************
  queuePitch() - Last Edited 9/23/2016
  
        TLDR: This script creates a pitch and outputs an array.
  
    -NOT TO BE CONFUSED WITH loadPitch()
    -First we determine if the pitch is going to 
        be thrown with the left or right hand. (50/50 Chance)
        
    -pitchRange is vital for this script to Work. (Please see the formula in adjustDifficulty). 
    
    -We want to do a safety check against our formula and make sure
        it doesn't go outside the bounds of existing pitches. (pList.csv)
    -Then if our difficulty is < 3 we initialize a single consistent pitch. 
    -We run a for loop for each of our pitches
        -If we're in a 3-3.5 difficulty range we'll "roulette" the first 2 sections of the pitch
        -If difficulty > 3.5 we'll roulette all 3 sections of the pitch. 
        
    -SAFETY CHECK: If we throw a Straight Pitch, there's no need for it to be Right or Left.
     
    -Then we set up our "PitchString" which is just the Names of our pitches randomly picked from
        pList.csv and applied with "" or "R" depending on the hand. 
        
    -Then we set our "start", "mid", and "end" pitches into an array that'll search and store the 
        path based on it's name. 
        -SAFETY CHECK: If It's a Warp pitch set the last 2 sections to "endWarp". 
            We destroy the ball at the end of this path specifically. 
            
    -return an array of Paths. 
    
    See percent_chance() and pList.csv for more info.
 ***************************************************/
var pitchArray, pitchType;
//Depending on Difficulty Parameters setup the next pitch.
dirString = "";
finalDir = "";
if (percent_chance(50)) 
{
    //Left Or RIght
    dirString = "R";
    finalDir = "R";
}

if (manager.pitchRange < 0) 
{
    manager.pitchRange = 0;
} 
else if (manager.pitchRange > array_height_2d(manager.pitchList) - 1) 
{
    manager.pitchRange = array_height_2d(manager.pitchList) - 1;
}

if (manager.difficulty < 3) 
{
    pitchType = irandom_range(0, manager.pitchRange); // <- Difficulty Pitch Mod Goes Here 
    if (manager.lastPitch = "") 
    {
        pitchType = irandom_range(0, manager.pitchRange); // <- Difficulty Pitch Mod Goes Here 
    } 
    else if (manager.lastPitch = pitchType) 
    {
        pitchType = irandom_range(0, manager.pitchRange); // <- Difficulty Pitch Mod Goes Here 
    }
}


for (i = 0; i < 3; i++) 
{
    if (manager.difficulty >= 3 && manager.difficulty < 3.5) 
    {
        if (i < 2) 
        {
            pitchType = irandom_range(0, manager.pitchRange); // <- Difficulty Pitch Mod Goes Here 
        }
    } 
    else if (manager.difficulty >= 3.5) 
    {
        pitchType = irandom_range(0, manager.pitchRange); // <- Difficulty Pitch Mod Goes Here 
    }

    dirString = finalDir;
    if (pitchType == 0) 
    { //Path is Straight no need for "R"
        dirString = "";
    }

    pitchString[i] = manager.pitchList[pitchType, 0] + dirString;
}

pitchArray[0] = asset_get_index("start" + pitchString[0]); //START
pitchArray[1] = asset_get_index("mid" + pitchString[1]); //MID
pitchArray[2] = asset_get_index("end" + pitchString[2]); //END

if (pitchString[0] == "Warp") 
{
    pitchArray[1] = asset_get_index("endWarp");
    pitchArray[2] = asset_get_index("endWarp");

} 
else if (pitchString[0] == "WarpR") 
{
    pitchArray[1] = asset_get_index("endWarpR");
    pitchArray[2] = asset_get_index("endWarpR");
}


return pitchArray;

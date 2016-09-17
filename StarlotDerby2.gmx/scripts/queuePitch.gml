var pitchArray, pitchType;
//Depending on Difficulty Parameters setup the next pitch.
pitchType = irandom_range(0,0); // <- Difficulty Pitch Mod Goes Here 
//for (i = 0; i < 3; i++) 
//{
    
    pitchString[0] = manager.pitchList[pitchType,0];  
//}



pitchArray[0] = asset_get_index("start" + pitchString[0]); //START
pitchArray[1] = asset_get_index("mid" + pitchString[0]);//MID
pitchArray[2] = asset_get_index("end" + pitchString[0]); //END
if (pitchString[0] == "Warp") 
{
    pitchArray[1] = asset_get_index("endWarp");
    pitchArray[2] = asset_get_index("endWarp");
}
return pitchArray; 

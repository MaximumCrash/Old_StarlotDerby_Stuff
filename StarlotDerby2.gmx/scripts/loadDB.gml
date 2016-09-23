/***************************************************
  loadDB() - Last Edited 9/23/2016
  
  -This script Loads all csv files and makes them 
    accessible via a 2D array corresponding their names.
    
  -I called it Load Database cause it sounded cool 
    and that's what it does. Ya know? 
  
    See csv_load() for more info on how it loads. 
 ***************************************************/
itemList = csv_load("ilist");
gemList = csv_load("glist");
fieldList = csv_load("flist");
curseList = csv_load("clist");
pitchList = csv_load("plist");
//manager.dictionary = csv_load("dictionary");

for (var c = 0; c < array_height_2d(curseList); c++) {
    if (string_char_at(curseList[c, 1], 0) == "C") {
        curseCount++;
    } else {
        powerCount++;
    }
}

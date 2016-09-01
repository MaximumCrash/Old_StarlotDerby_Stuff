itemList = csv_load("ilist"); 
gemList = csv_load("glist");
fieldList = csv_load("flist");
curseList = csv_load("clist"); 
//manager.dictionary = csv_load("dictionary");

for (var c = 0; c < array_height_2d(curseList);c++) 
{
    if (string_char_at(curseList[c,1],0) == "C") 
    {
         curseCount++;
    }
    else 
    {
         powerCount++;
    }
}

if (debug)
ds_list_add(manager.list, "Database Loaded...");



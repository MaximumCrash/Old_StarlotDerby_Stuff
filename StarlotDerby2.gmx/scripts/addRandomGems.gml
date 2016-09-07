var temp = irandom_range(0, array_height_2d(gemList)-1)
ds_list_add(manager.gems, temp);

ds_list_add(manager.list, "Added Gem: " + "#"+ string(temp)+ " " + string(gemList[tempGem,0]));

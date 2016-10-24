for (var a = 0; a < array_height_2d(manager.itemList) - 5; a++) {
    manager.unlocked[a] = a;
}
ds_list_add(manager.list, string(array_length_1d(manager.unlocked)));

/***************************************************
  subtractFever() - Last Edited 9/23/2016
  
  -This script will subtract fever based on the current
    Max Fever. 
  -It subtracts less if it's a foul hit. 
  -Subtracts more if it's a strike. 
 ***************************************************/
var foul = argument0;

if (manager.fever > 0) {
    if (foul) {
        manager.fever -= ceil(ceil(manager.maxFever * .3) * .25);
        ds_list_add(manager.list, "Subtract Fever: " + string(ceil(ceil(manager.maxFever * .3) * .25)));
    } else {
        manager.fever -= ceil(manager.maxFever * .3);
        ds_list_add(manager.list, "Subtract Fever: " + string(ceil(manager.maxFever * .6)));
    }

}

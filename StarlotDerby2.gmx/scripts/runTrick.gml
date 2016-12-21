/*manager.currentBat = manager.equip[0]; 
manager.chargeCount = 1; */
switch (argument0) {
                case 1:
                    {
                         path_speed = 0; 
                       //mvc.currentState = speedState.stop; 
                        alarm[1] = hardTimer;
                        ds_list_add(manager.list, "+Trick Run: Hard Stop");
                        break;
                    }

                case 2:
                    {
                        /*if (manager.ballSpeed < 13) {
                            //path_speed = lerp(path_speed,(manager.ballSpeed * random_range(1.75, 2.35))*mvc.timeMulti,0.4);
                            
                        }*/
                        mvc.currentState = speedState.fastforward; 
                        alarm[1] = hardTimer;
                            ds_list_add(manager.list, "+Trick Run: Speed Up");
                        break;
                    }

                case 3:
                    {
                        /*if (manager.ballSpeed > 10) {
                            //path_speed = lerp(path_speed,(manager.ballSpeed * random_range(.1, .25))*mvc.timeMulti,0.4);
                            
                        }*/
                        mvc.currentState = choose(speedState.slowmo,speedState.ultraslowmo);
                        alarm[1] = hardTimer;
                        ds_list_add(manager.list, "+Trick Run: Slow Down");
                        break;
                    }
            }

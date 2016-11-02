view_xview = smooth_approach(view_xview,0,0.1);
view_yview = smooth_approach(view_yview,0,0.1);
manager.shake0 = smooth_approach(manager.shake0,0,0.1); 
manager.shake1 = smooth_approach(manager.shake1,0,0.1); 
manager.earthquakeRunning = false;

screenFX.quakeCycleCurrent = 0; 
screenFX.quakeScaleUp = true; 

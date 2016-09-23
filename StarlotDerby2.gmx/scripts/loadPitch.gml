/***************************************************
  loadPitch() - Last Edited 9/23/2016
  
  -NOT TO BE CONFUSED WITH queuePITCH().
  -This sets up a stack for our currentPitch and 
    our nextPitch. That way we don't queue up a pitch  
        when we need it the most. 
        
  See queuePitch() for more info.
 ***************************************************/
pitcher.pitch = pitcher.nextPitch; 
pitcher.nextPitch = queuePitch(); 

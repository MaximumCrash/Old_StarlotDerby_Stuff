if (manager.easyMode && manager.fever == manager.maxFever) 
{
    subtractFever(false); 
    instance_destroy(); 
}
else 
{
    manager.strikes++;
    subtractFever(false); 
    instance_destroy(); 
}

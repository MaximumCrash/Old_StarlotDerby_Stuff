var foul = argument0;

if (foul) {
manager.fever -= ceil(manager.feverDown*.25);
}
else {
manager.fever -= manager.feverDown; 
}

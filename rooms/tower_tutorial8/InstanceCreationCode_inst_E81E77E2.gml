targetRoom = tower_tutorial9;
if check_char("S") or check_char("V") or check_char("SN")
{
	instance_destroy(obj_doorB);
	targetDoor = "C";
	targetRoom = tower_tutorial10;
}

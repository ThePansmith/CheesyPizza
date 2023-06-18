if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();

// vigi protection, cant shoot down
if check_char("V")
{
	if place_meeting(x - 1, y, obj_solid) && place_meeting(x + 1, y, obj_solid)
		instance_destroy(id, false);
}

if (!in_saveroom())
{
	instance_create(500, 154, obj_alienbyebye);
	add_saveroom();
	ds_list_add(global.escaperoom, id);
}

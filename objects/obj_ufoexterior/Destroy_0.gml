if (!in_saveroom())
{
	instance_create(500, 154, obj_alienbyebye);
	ds_list_add(global.saveroom, id);
	ds_list_add(global.escaperoom, id);
}

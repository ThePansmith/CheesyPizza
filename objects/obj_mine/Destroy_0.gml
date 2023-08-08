if (!in_saveroom())
{
	instance_create(x, y, obj_canonexplosion);
	ds_list_add(global.saveroom, id);
}

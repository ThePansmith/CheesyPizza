if (!in_saveroom())
{
	instance_destroy();
	instance_create(x, y, content);
	ds_list_add(global.saveroom, id);
}

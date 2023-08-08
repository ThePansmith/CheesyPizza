if (in_saveroom())
	instance_destroy();
if (global.level_minutes > timer)
{
	ds_list_add(global.saveroom, id);
	instance_destroy();
}

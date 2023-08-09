if (!in_baddieroom())
{
	ds_list_add(global.baddieroom, id);
	instance_create(x, y, obj_bombexplosion);
	instance_destroy();
}
